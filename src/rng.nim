import std/[sysrand, strutils, strformat]

proc randint*(limit: int): int =
  ## A function that generates an integer, limit is how many digits should be
  ## in the final string. ie. 10 generates a string that is 10 digits long.
  runnableExamples:
    assert randint(1) < 10 # The number return is at least 1 digit long, so its lower than 10.
  var tmp: string; # This string stores the int so that we get literal digits.
  for bit in urandom(limit):
    tmp.add($int(bit))
      
  return parseInt(tmp[0..limit - 1])

proc rand*(dig: int): int =
  ## A function that generates an integer 
  ## A replacement function for rand() that is actually cryptographically secure.
  ## The final integer will always be between 1 to X (where X is the argument to the number)
  runnableExamples:
    echo "The dice returns... ", $rand(6) 
    assert rand(5) < 6; # This is true since rand(5) returns a number between 1 and 5.
  var num = randint(len($dig))
  if num > dig: num = dig
  if num < 0: num = 0
  return num

proc sample*[T](a: openArray[T]): T =
  ## Returns a random element from an array.
  runnableExamples:
    let array = @["Jack", "Kate", "Adam", "Julie"]
    echo "Your magic name is ", sample(array), "!"
    assert sample(array) in array
  return a[rand(high(a))]

proc sample*(a: string): char =
  ## Returns a random character from a string
  runnableExamples:
    let magicalString = "Magic!"
    echo "Your magical character from the magical string is ", sample(magicalString)
    assert sample(magicalString) in magicalString
  return a[rand(high(a))]

const defaultAsciiTable = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0']
proc randch*(letters: openArray[char] = defaultAsciiTable): char = 
  ## Returns a random character
  return letters[rand(letters.high)]

proc randstr*(length: int = 16, table:openArray[char] = defaultAsciiTable): string = 
  ## Returns a random string, 
  ## A function to generate a safe random string.
  runnableExamples:
    echo "Your magical string is the following: ", randstr()
    assert randstr(length = 20).len() == 20
  for i in 1..length:
    result.add(randch(table))
  return result

proc uuidv4*(): string =
  ## Generates a UUID (version 4).
  ## This type of UUID is completely random.
  ## 
  ## This implementation is based on nim-uuid4 by Matt Cooper (@vtbassmatt on GitHub)
  runnableExamples:
    echo uuidv4()
    
    # Statistically unlikely to fail
    assert uuidv4() != uuidv4()
  var bytes = urandom(16)
  bytes[6] = (bytes[6] and 0x0F) or 0x40 # version 4
  bytes[8] = (bytes[8] and 0x3F) or 0x80 # variant 1

  proc toHex(bytes: seq[byte]): string =
    for b in bytes:
      result = result & fmt"{b:02x}"

  return toHex(bytes[0..3]) & '-' &
         toHex(bytes[4..5]) & '-' &
         toHex(bytes[6..7]) & '-' &
         toHex(bytes[8..9]) & '-' &
         toHex(bytes[10..^1])