role Like-a-word {
    token like-a-word { \H+ }
}

grammar Span does Like-a-word {
    regex TOP { <like-a-word>[(\s+) <like-a-word>]* } 
}
