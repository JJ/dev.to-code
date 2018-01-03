role Like-a-word {
    token like-a-word { \H+ }
}

role Span does Like-a-word {
    regex span { <like-a-word>[(\s+) <like-a-word>]* } 
}
