role Like-a-word {
    regex like-a-word { \S+ }
}

role Span does Like-a-word {
    regex span { <like-a-word>[\s+ <like-a-word>]* } 
}
