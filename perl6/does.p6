use Grammar::Tracer;

# Non-horizontal whitespace
role like-a-word {
    token like-a-word { \V+ }
}

grammar simple-paragraph does like-a-word {
    token TOP { (<like-a-word>\v*)+ }
}


say simple-paragraph.parse("This is a simple paragraph");

