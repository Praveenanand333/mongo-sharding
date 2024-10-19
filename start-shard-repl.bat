@echo off

REM Start Config Server Replica Set
start cmd /k "mongod --configsvr --port 28041 --bind_ip localhost --replSet config_repl --dbpath C:\Mongoshard_repl\configsrv"
start cmd /k "mongod --configsvr --port 28042 --bind_ip localhost --replSet config_repl --dbpath C:\Mongoshard_repl\configsrv1"
start cmd /k "mongod --configsvr --port 28043 --bind_ip localhost --replSet config_repl --dbpath C:\Mongoshard_repl\configsrv2"

REM Start the First Shard as a Replica Set
start cmd /k "mongod --shardsvr --port 28081 --bind_ip localhost --replSet shard_repl --dbpath C:\Mongoshard_repl\shardrep1"
start cmd /k "mongod --shardsvr --port 28082 --bind_ip localhost --replSet shard_repl --dbpath C:\Mongoshard_repl\shardrep2"
start cmd /k "mongod --shardsvr --port 28083 --bind_ip localhost --replSet shard_repl --dbpath C:\Mongoshard_repl\shardrep3"

REM Start the Second Shard as a Replica Set
start cmd /k "mongod --shardsvr --port 29081 --bind_ip localhost --replSet shard2_repl --dbpath C:\Mongoshard_repl\shard2rep1"
start cmd /k "mongod --shardsvr --port 29082 --bind_ip localhost --replSet shard2_repl --dbpath C:\Mongoshard_repl\shard2rep2"
start cmd /k "mongod --shardsvr --port 29083 --bind_ip localhost --replSet shard2_repl --dbpath C:\Mongoshard_repl\shard2rep3"

REM Start the `mongos` Router
start cmd /k "mongos --configdb config_repl/localhost:28041,localhost:28042,localhost:28043 --bind_ip localhost --port 6000"

REM Start the Mongo Shell
start cmd /k "mongosh --host localhost --port 6001"
