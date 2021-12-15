# Chuzzle Deluxe mindbenders.txt format
The Mindbender puzzles in Chuzzle Deluxe are loaded from a file called mindbenders.txt in the `data/` folder of the main game directory.

It is a file formatted as basic text with alphanumeric characters and 0x20 spaces. It also contains CRLF line endings although I am not sure if these are necessary for the parsing of the file. (They are)

## Structure
The mind bender level data is stored in one continuous stream of text with seemingly no separator between levels. Each level consists of several parts which are separated with spaces. (0x20)

* **Part 1**: Level header. RNG seed? Mind benders are scrambled randomly with a predefined seed. Is either 3 digits or 4 digits.
* **Part 2**: Unknown. Always 2 digits.
* **Part 3-9**: 6x6 matrix of Chuzzle positions stored per row.

### Chuzzle IDs
In the 6x6 matrix, each Chuzzle color and type is given an ID which is some alphanumeric character.

Specifying an ID that doesn't exist will crash the game.

#### Normal Chuzzles
* **`0`** Red Chuzzle
* **`1`** Green Chuzzle
* **`2`** Blue Chuzzle
* **`3`** Orange Chuzzle
* **`4`** Yellow Chuzzle
* **`5`** Pink Chuzzle
* **`6`** White Chuzzle
* **`7`** Cyan Chuzzle

#### Fat Chuzzles
Since Fat Chuzzles take up more than one space, they span across more than one value on the level matrix. They work by having one top-left ID to create the Fat Chuzzle, and then a filler ID on the 3 spaces right next to it to the right and underneath.

Here are the IDs for the top-left respective filler IDs:

* **`A & I`** Red Fat Chuzzle
* **`B & J`** Green Fat Chuzzle
* **`C & K`** Blue Fat Chuzzle
* **`D & L`** Orange Fat Chuzzle
* **`E & M`** Yellow Fat Chuzzle
* **`F & N`** Pink Fat Chuzzle
* **`G & O`** White Fat Chuzzle
* **`H & P`** Cyan Fat Chuzzle

So if you e.g. would want to put a Green Fat Chuzzle into a level, you would do the following combination:

```
EM
MM
```






