import std/monotimes
import times

type
  RC4 = object
    s: array[256, uint16]
    i: uint16
    j: uint16

proc init(rc4: var RC4, key: string) =
  var
    data: array[256, uint16]
    j: uint16

  for i in 0..<256:
    data[i] = uint16(i)

  for i in 0..<256:
    let keybyte = uint16(ord(key[i mod key.len]))
    j = (j + data[i] + keybyte) mod 256

    var tmp = data[i]
    data[i] = data[j]
    data[j] = tmp

    rc4.s = data

proc get_byte(rc4: var RC4): uint16 =
  rc4.i = (rc4.i + 1) mod 256
  rc4.j = (rc4.j + rc4.s[rc4.i]) mod 256

  let tmp = rc4.s[rc4.i]
  rc4.s[rc4.i] = rc4.s[rc4.j]
  rc4.s[rc4.j] = tmp

  let idx = (rc4.s[rc4.i] + rc4.s[rc4.j]) mod 256
  return rc4.s[idx]

proc bench() =
  let start = getMonoTime()
  const
    key = "Keyfobsrulethebestofall"

  var
    rc4: RC4
    sum: uint64

  rc4.init(key)

  for i in 0..<250000000:
    let byte: uint16 = rc4.get_byte()
    sum += uint64(byte)

  let delta = (getMonoTime() - start).inMilliseconds()

  echo "|nim|rc4|", $sum, "|", delta, "|"

when isMainModule:
  bench()
