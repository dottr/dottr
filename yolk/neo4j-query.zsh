# query the local neo4j database
# example: neo4j-query "match n return n"
#
# replace the json formatter with your preferred one. For example:
# NEO4J_QUERY_JSON_FORMATTER="underscore print --color --outfmt json"
# NEO4J_QUERY_JSON_FORMATTER="json_pp"

NEO4J_QUERY_JSON_FORMATTER="cat"

neo4j-query() {
    JSON=$(curl --silent -H "Content-Type: application/json" \
        -d "{\"statements\":[{\"statement\":\"$*\",\"resultDataContents\":[\"graph\",\"row\"]}]}" \
        http://localhost:7474/db/data/transaction/commit)

    eval "echo '$JSON' | $NEO4J_QUERY_JSON_FORMATTER"
}

neo4j-clear() {
    neo4j-query "MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r"
}

neo4j-all() {
    neo4j-query "MATCH (n) OPTIONAL MATCH (n)-[r]-() return n,r"
}
