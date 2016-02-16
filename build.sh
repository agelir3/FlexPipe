#!/bin/bash

patcher_commit=`git rev-parse --short HEAD`

cd BungeeCord

origin_commit=`git rev-parse --short origin/master`

echo ""
echo "======= Building FlexPipe from origin commit $origin_commit with patcher commit $patcher_commit"
echo ""

mvn clean install -Dorigin_commit=$origin_commit -Dpatcher_commit=$patcher_commit -Dbuild.number=$BUILD_NUMBER

cd ../

echo ""
echo "======= FlexPipe build finished"
echo "======= Copy final jars"
echo ""

mkdir -p target/modules/ || true

cp BungeeCord/bootstrap/target/FlexPipe.jar ./target/

cp BungeeCord/module/*/target/*.jar ./target/modules/

echo ""
echo "======= FlexPipe and module jars copied to ./target/"
