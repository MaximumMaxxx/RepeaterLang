<h1>This project is not even close to finished so most of this information is not currently valid</h1>

<h2>Repeater</h2>

Repeater is a language to simplify and extend Minecraft datapacks.

<h3>Why Repeater?</h3>

Repeater is a superset of Mcfunction so all datapack code is already valid, however Repeater also supports extra syntax to make writing datapacks faster and easier

Example

``` mcfunction
# for.mcfunction

tellraw @a {"text": "While loop incremented"}
scoreboard players operation count counter += 1 numberstorage
execute if score count counter < 5 numberstorage run function test:for

# load.mcfunction

scoreboard objectives add counter dummy
scoreboard players set count counter 0

scoreboard objectives add numberstorage dummy

scoreboard players set 5 numberstorage 5
scoreboard players set 1 numberstorage 1
```
This is just way too much work for a simple for loop. so then what is it like in repeater?

``` javascript
var counter  = 0
while (couter < 5) {
  tellrawf(@a,"While loop incremented")
  couter += 1
}
```


<h2>Contributing/Building it yourself</h2>

As of right now there is no prebuilt version of the parser/compiler.

Step 1.) Make sure you have nodejs and java installed

Step 2.) Clone, extract, and cd into the Folder

Step 3.) Download the ANTLR jar and put it into the current folder.
Linux
```bash
wget https://www.antlr.org/download/antlr-4.9.2-complete.jar
```

Mac
```bash
sudo curl -O https://www.antlr.org/download/antlr-4.9.2-complete.jar
```

Windows
[Donwload](https://www.antlr.org/download/antlr-4.9.2-complete.jar)

Step 4.) Still in the project directory use nodejs to run the build command
```bash
npm run antlr
```
A new directory should be created call AntlrOut

Step 5.) Currently you can only compile the code in ```test.rptr``` so change that to whatever you want to test

Step 6.) Use ```node .``` to parse and compile your code
