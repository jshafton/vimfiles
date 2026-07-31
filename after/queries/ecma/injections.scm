;; extends

; node-postgres: client.query(`...`) / pool.query(`...`)
(call_expression
  function: (member_expression
    property: (property_identifier) @_prop)
  arguments: [
    (arguments (template_string) @injection.content)
    (template_string) @injection.content
  ]
  (#any-of? @_prop "query" "queryOne" "queryRow")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "sql"))

(call_expression
  function: (member_expression
    property: (property_identifier) @_prop)
  arguments: (arguments (string (string_fragment) @injection.content))
  (#any-of? @_prop "query" "queryOne" "queryRow")
  (#set! injection.language "sql"))

; Prisma: prisma.$queryRaw`...` / $executeRaw`...` / $queryRawUnsafe(...) / $executeRawUnsafe(...)
(call_expression
  function: (member_expression
    property: (property_identifier) @_prop)
  arguments: [
    (arguments (template_string) @injection.content)
    (template_string) @injection.content
  ]
  (#any-of? @_prop "$queryRaw" "$executeRaw" "$queryRawUnsafe" "$executeRawUnsafe")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "sql"))

(call_expression
  function: (member_expression
    property: (property_identifier) @_prop)
  arguments: (arguments (string (string_fragment) @injection.content))
  (#any-of? @_prop "$queryRaw" "$executeRaw" "$queryRawUnsafe" "$executeRawUnsafe")
  (#set! injection.language "sql"))

; Prisma.raw('...') fragment helper — scoped to the `Prisma` namespace so it
; doesn't collide with unrelated .raw(...) methods elsewhere (e.g. knex)
(call_expression
  function: (member_expression
    object: (identifier) @_ns
    property: (property_identifier) @_prop)
  arguments: [
    (arguments (template_string) @injection.content)
    (template_string) @injection.content
  ]
  (#eq? @_ns "Prisma")
  (#eq? @_prop "raw")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "sql"))

(call_expression
  function: (member_expression
    object: (identifier) @_ns
    property: (property_identifier) @_prop)
  arguments: (arguments (string (string_fragment) @injection.content))
  (#eq? @_ns "Prisma")
  (#eq? @_prop "raw")
  (#set! injection.language "sql"))

; Fallback: any template literal that itself starts with a SQL keyword,
; regardless of how it's passed (e.g. pg-copy-streams' copyFrom(`COPY ...`))
((template_string) @injection.content
  (#match? @injection.content "^`[ \t\r\n]*(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|WITH|COPY|DROP|TRUNCATE|BEGIN)>")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "sql"))
