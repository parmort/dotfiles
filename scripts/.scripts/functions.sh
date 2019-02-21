gbr() {
  # br=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')
  # return $br || ""
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

dir() {
  print -P $(echo $(dirs))
}

curl_get() {
  curl -v --progress-bar $1
}

curl_post() {
  curl -v --progress-bar -d $3 -H "Content-Type: application/$2" $1
}

format_json() {
  python -m json.tool
}
