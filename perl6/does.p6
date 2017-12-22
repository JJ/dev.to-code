use Grammar::Tracer;

# Non-horizontal whitespace
role like-a-word {
    token like-a-word { «\H+» }
}

role span does like-a-word {
    token span { <like-a-word>(\s+ <like-a-word>)* } 
}

grammar better-paragraph does span {
    token TOP { <chunk>[ (\s+) <chunk>]* }
    regex chunk {  <super-span> | <span> }
    regex super-span { \* ~ \* <span> }
}

say better-paragraph.parse("Simple");
say better-paragraph.parse("Simple thing");
say better-paragraph.parse("Simple *thing*");
say better-paragraph.parse("This is *a simple* paragraph");


