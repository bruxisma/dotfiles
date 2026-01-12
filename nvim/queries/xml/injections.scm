((element
  (STag
    (Name) @name)
  (content
   (CharData)
   (CDSect
     (CDStart)
     (CData) @injection.content)
     (CharData)))
  (#eq? @name "program")
  (#set! injection.combined)
  (#set! injection.include-children)
  (#set! injection.language "glsl"))
