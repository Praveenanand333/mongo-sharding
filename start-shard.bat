@echo off

rem Start config servers
start cmd /k "mongod --configsvr --port 28041 --bind_ip localhost --replSet config_repl --dbpath C:\MongoSharding\configsrv"
start cmd /k "mongod --configsvr --port 28042 --bind_ip localhost --replSet config_repl --dbpath C:\MongoSharding\configsrv1"
start cmd /k "mongod --configsvr --port 28043 --bind_ip localhost --replSet config_repl --dbpath C:\MongoSharding\configsrv2"

rem Start shard servers
start cmd /k "mongod --shardsvr --port 28081 --bind_ip localhost --replSet shard_repl --dbpath C:\MongoSharding\shardrep1"
start cmd /k "mongod --shardsvr --port 28082 --bind_ip localhost --replSet shard_repl --dbpath C:\MongoSharding\shardrep2"
start cmd /k "mongod --shardsvr --port 28083 --bind_ip localhost --replSet shard_repl --dbpath C:\MongoSharding\shardrep3"

start cmd /k "mongod --shardsvr --port 29081 --bind_ip localhost --replSet shard2_repl --dbpath C:\MongoSharding\shard2rep1"
start cmd /k "mongod --shardsvr --port 29082 --bind_ip localhost --replSet shard2_repl --dbpath C:\MongoSharding\shard2rep2"
start cmd /k "mongod --shardsvr --port 29083 --bind_ip localhost --replSet shard2_repl --dbpath C:\MongoSharding\shard2rep3"

rem Start the mongos router
start cmd /k "mongos --configdb config_repl/localhost:28041,localhost:28042,localhost:28043 --bind_ip localhost --port 6000"

rem Start the Mongo shell
start cmd /k "mongosh --host localhost --port 6000"

echo All MongoDB instances started in new command prompt tabs.
