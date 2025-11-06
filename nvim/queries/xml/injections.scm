((element
  (STag
    (Name) @name)
  (content
   (CDSect
     (CData) @injection.content)))
  (#eq? @name "program")
  (#set! injection.combined)
  (#set! injection.include-children)
  (#set! injection.language "glsl"))
