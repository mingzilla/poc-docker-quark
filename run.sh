#!/bin/bash
# https://stackoverflow.com/questions/255414/why-doesnt-cd-work-in-a-shell-script

# restore db: /apps/db/restore_database.sh 'kirona.sql' # restore db in dev
# academy data: https://gitlab.panintelligence.cloud/panintelligence/aws-group/try-pi/-/blob/master/rds/academy_data.sql

# reset password: UPDATE users SET use_secure_password = 'pZWxhhjqHyqQAqD4AZBx' WHERE serial = 0;
# db password: BfGWi8T0uSVBkc5OZQ3DhhdR

# code freeze: under configuration-new/scripts -- git pull
# under configuration-new/scripts/bash
# ./create_merge_requests.sh --from-branch="2021_10_28" --to-branch=master --token="4naVb3LzRfcfSimDpzs6" --browser=chromium
# ./create_release_branches.sh --from-branch=master --new-branch="2021_11_25" --token="4naVb3LzRfcfSimDpzs6"

echo "1 - angular-app - run, build"
echo "2 - angular-app - run, build"
echo "3 - ResponsiveDashboard - hg addremove"
echo "4 - pi - git - branch, pull, push, merge"
echo "5 - renderer - nvm run 10.16.0 ./server.js"
echo "6 - start database"
echo "7 - start hsqldb - ./dbup-repos.sh"
echo "8 - migrations-jar"
echo "9 - ~/go/src path"
echo "10 - run sqlserver, check ~/dev/docker/ms-sql-server/docker-compose.yml for details"

if [ $1 == 1 ]
then
	echo "top left - run angular"
	echo "export NODE_OPTIONS=--max_old_space_size=4096"
	cd ~/dev/dev/html5/ResponsiveDashboard/angular-app
fi

if [ $1 == 2 ]
then
        # https://stackoverflow.com/questions/38558989/node-js-heap-out-of-memory
	echo "export NODE_OPTIONS=--max_old_space_size=4096"
	cd ~/dev/dev/html5/ResponsiveDashboard/angular-app
fi

if [ $1 == 3 ]
then
	echo "middle left - ResponsiveDashboard dev"
	echo "./gradlew test or integrationTest"
	cd ~/dev/dev/html5/ResponsiveDashboard
fi

if [ $1 == 4 ]
then
	echo "middle right - git pi"
	cd ~/dev/head/pi
fi

if [ $1 == 5 ]
then
	echo "bottom left - renderer: "
        #docker container rm pi_renderer
        #docker run --expose=9915 -dti --name pi_renderer --network panintelligence_dashboard --network-alias=renderer panintelligence/renderer:2020_10_29

        cd ~/dev/head/renderer
        echo "cd ~/dev/head/renderer    nvm run 14.5.0 ./app/server.js"
        echo "If not working, switch npm (nvm use version) and do npm update, then switch back"
	nvm run 14.5.0 ./app/server.js
fi

if [ $1 == 6 ]
then
	# /apps/db/restore_database.sh 'kirona.sql' # restore db in dev
	# ./dashboard.sh database stop
	# ./dashboard.sh database start
	echo "bottom right - run ./dashboard.sh for help"
	echo "this 1) starts db, 2) pulls migration to update"
	echo "password is in ~/apps/db/run_migrations.sh"
	echo "run ./dashboard.sh database <start|stop>"
	cd ~/dev/head/configuration/dev/scripts/linux/utilities
	./dashboard.sh database start
fi

if [ $1 == 7 ]
then
	echo "start hsqldb - ./dbup-repos.sh"
	cd ~/apps/data
	./dbup-repos.sh
fi

if [ $1 == 8 ]
then
	echo "migrations-jar"
	cd ~/dev/head/migrations-jar
fi

if [ $1 == 9 ]
then
	echo "~/go/src (GOPATH=/home/ming/go) (GOROOT=/usr/lib/go)"
	cd ~/go/src
fi

if [ $1 == 10 ]
then
        echo "cd to directory, then: docker-compose up -d"
        echo "D@shboard1"
        echo "to stop, do: docker-compose stop"
        echo "open the file to check connection details, no db name or instance are needed to connect to this db"
        cd ~/dev/docker/ms-sql-server
        docker-compose up -d
fi


