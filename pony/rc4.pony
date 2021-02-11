use "time"
use "collections"
use "itertools"

class RC4
  embed s: Array[U8] = s.init(0, 256)
  var j: U32 = 0
  var i: U32 = 0

  new create(key: Array[U8] val) =>
    keyschedule(key)

  fun ref keyschedule(key: Array[U8] val) =>
    try
      for x in Range[USize](0, 256) do
        s(x)? = x.u8()
      end
    end
    var k_j: USize = 0
    try
      for k_i in Range(0, 256) do
        let key_byte = key(k_i %% key.size())?.usize()
        k_j = (k_j + s(k_i)?.usize() + key_byte) %% 256
        s(k_i)? = s(k_j)? = s(k_i)?
        //s.swap_elements(k_i, k_j)?
      end
    end

  fun ref get_byte(env: Env): U8? =>
    i = (i +~ 1) %%~ 256
    let i' = i.usize()

    j = (j +~ s(i')?.u32()) %%~ 256
    let j' = j.usize()

    s(i')? = s(j')? = s(i')?
    //s.swap_elements(i', j')?

    // FIXME: Ponyc is broken - the modulus operation does not work here.
    let idx = (s(i')? +~ s(j')?).usize() %%~ 256
    s(idx)?.u8()

actor Main
  new create(env: Env) =>
    let now = Time.millis()
    let key = "Keyfobsrulethebestofall"
    let rc4: RC4 = rc4.create(key.array())
    var sum: U64 = 0
    try
      for i in Range(0, 7) do
        let byte = rc4.get_byte(env)?.u64()
        env.out.print(byte.string())
        sum = sum +~ byte
      end
    else
      env.out.print("error")
    end
    let delta = Time.millis() - now
    env.out.print("|pony|rc4|" + sum.string() + "|" + delta.string()+ "|")

