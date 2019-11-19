source deployees

@test "should handle refresh api error" {
  run refresh "123" "123" "123"
  [ $status -eq 1 ]
  [ "$output" = "refresh: encountered google api error: invalid_client:The OAuth client was not found." ]
}

@test "should return refreshed bearer token" {
  [ -z $OAUTH_ID ] && skip "missing OAUTH_ID"
  [ -z $OAUTH_S8 ] && skip "missing OAUTH_S8"
  [ -z $REFRESH_TOKEN ] && skip "missing REFRESH_TOKEN"

  run refresh $OAUTH_ID $OAUTH_S8 $REFRESH_TOKEN
  [ $status -eq 0 ]
  [ -n "$output" ] && echo "# $output" >&3
}
