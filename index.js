import antlr4 from 'antlr4';
import RepeaterLexer from './AntlrOut/RepeaterLexer.js';
import RepeaterParser from './AntlrOut/RepeaterParser.js';
import RepeaterListener from './AntlrOut/RepeaterListener.js';
import fs from 'fs';


function fileread(filename) {
    var contents = fs.readFileSync(filename, 'utf8');
    return contents
}
let input = fileread("test.rptr")


const chars = new antlr4.InputStream(input)
const lexer = new RepeaterLexer(chars);
const tokens = new antlr4.CommonTokenStream(lexer);
const parser = new RepeaterParser(tokens);
parser.buildParseTrees = true;
const tree = parser.operation();

class Visitor {
visitChildren(ctx) {
    if (!ctx) {
        return;
    }
    if (ctx.children) {
        return ctx.children.map(child => {
            if (child.children && child.children.length != 0) {
                return child.accept(this);
            } else {
                return child.getText();
            }
        });
    }
    }
}

tree.accept(new Visitor());
console.log(tree.toStringTree(parser.ruleNames));