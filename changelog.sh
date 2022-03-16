current_tag=${CURRENT/refs\/tags\//}
last_tag=`git describe --tags --abbrev=0 "$current_tag"^ 2>/dev/null || echo`
if [ $last_tag ]; then
changelog=`git log --pretty="format:%H: %s" ${last_tag}..$current_tag`
else
changelog=`git log --pretty="format:%H: %s"`
fi
changelog="${changelog//'%'/'%25'}"
changelog="${changelog//$'\n'/'  %0A'}"
echo "::set-output name=value::Change set since ${last_tag:-the beginning}:  %0A%0A$changelog"