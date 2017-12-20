use Grammar::Tracer;

# Non-horizontal whitespace
role like-a-word {
    token like-a-word { \S+ }
}

grammar simple-paragraph does like-a-word {
    token TOP {^ <like-a-word> (\h+ <like-a-word>)+ $ }
}

grammar better-paragraph does like-a-word {
    token TOP { <superword>[ (\h+) <superword>]+ }
    token superword { <like-a-word> | <enhanced-word> }
    token enhanced-word { \* <like-a-word> \* }
}

say simple-paragraph.parse("This is a simple paragraph");
say better-paragraph.parse("This is *better* paragraph");

