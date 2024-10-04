%{
#include <stdio.h>
%}

/* 定義正則表達式 */
letter      [A-Za-z]
digit       [0-9]
underscore  _
underscore_tail {underscore}({letter}|{digit})+
opt_exponent  [eE][+-]?{digit}+
id          {letter}({letter}|{digit})*{underscore_tail}*
fraction    \.{digit}+
integer     {digit}+
float       {digit}*{fraction}{opt_exponent}

/* 定義 token 類型 */
%%
"int"       { printf("KEYWORD: int\n"); }
"float"     { printf("KEYWORD: float\n"); }
"bool"      { printf("KEYWORD: bool\n"); }
"void"      { printf("KEYWORD: void\n"); }
"while"     { printf("KEYWORD: while\n"); }
"if"        { printf("KEYWORD: if\n"); }
"else"      { printf("KEYWORD: else\n"); }
"for"       { printf("KEYWORD: for\n"); }
"return"    { printf("KEYWORD: return\n"); }

"+"         { printf("BINARY OPERATOR: +\n"); }
"-"         { printf("BINARY OPERATOR: -\n"); }
"*"         { printf("BINARY OPERATOR: *\n"); }
"/"         { printf("BINARY OPERATOR: /\n"); }
"<="        { printf("BINARY OPERATOR: <=\n"); }
">="        { printf("BINARY OPERATOR: >=\n"); }
"<>"        { printf("BINARY OPERATOR: <>\n"); }
"<"         { printf("BINARY OPERATOR: <\n"); }
">"         { printf("BINARY OPERATOR: >\n"); }
"="         { printf("BINARY OPERATOR: =\n"); }
"=="        { printf("BINARY OPERATOR: ==\n"); }

";"         { printf("SEPARATOR: ;\n"); }
"("         { printf("SEPARATOR: (\n"); }
")"         { printf("SEPARATOR: )\n"); }
"["         { printf("SEPARATOR: [\n"); }
"]"         { printf("SEPARATOR: ]\n"); }
"{"         { printf("SEPARATOR: {\n"); }
"}"         { printf("SEPARATOR: }\n"); }

{integer}   { printf("INTEGER: %s\n", yytext); }
{float}     { printf("FLOAT: %s\n", yytext); }
{id}        { printf("IDENTIFIER: %s\n", yytext); }

"/*"([^*]*"*"[^/])*"*/" { printf("COMMENT\n"); }

[ \t\n\r]+  ; /* 忽略布局符號 */

.           { printf("UNKNOWN CHARACTER: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

