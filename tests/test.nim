import std/strutils, rng

assert randstr(length = 20).len() == 20
assert randstr(length = 10).len() != 20
assert randstr(length = 10).len() == 10
assert randstr(length = 10).len() == randstr(length = 10).len()

assert randch() is char

assert sample("abc") in ['a','b','c']
var r = randstr(30)
assert sample(r) in r
assert sample(r) in r
assert sample(r) in r

var s = @[1,10,20,38,392,2,3023,432,432,4,132,3,34,63,532,]
assert sample(s) in s
assert sample(s) in s
assert sample(s) in s
assert sample(s) in s
assert sample(s) in s
assert sample(s) in s
assert sample(s) in s
assert sample(s) in s


var s2 = [1,21,2,12,12,12,1,21,21,21,21,21,2,12,1]
assert sample(s2) in s2
assert sample(s2) in s2
assert sample(s2) in s2
assert sample(s2) in s2
assert sample(s2) in s2
assert sample(s2) in s2
assert sample(s2) in s2
assert sample(s2) in s2
assert sample(s2) in s2

assert rand(10) in {0..10}
assert rand(10) in {0..10}
assert rand(10) in {0..10}
assert rand(10) in {0..10}
assert rand(10) in {0..10}
assert rand(10) in {0..10}
assert rand(15) in {0..15}
assert rand(15) in {0..15}
assert rand(15) in {0..15}
assert rand(1) == 1

assert randint(1) in {0..9}
assert len($randint(2)) == 2

var
  uuid = uuidv4()
  stuff = uuid.split('-')

assert stuff.len() == 5
assert stuff[0].len() == 8
assert stuff[1].len() == 4
assert stuff[2].len() == 4
assert stuff[3].len() == 4
assert stuff[4].len() == 12

assert uuidv4() != uuidv4()