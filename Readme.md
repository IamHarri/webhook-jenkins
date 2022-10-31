# introduce jenkins dashboard
## demo1
``` step
1. create a free style job ( compare sh with bash command)
    echo " current date is $(date)"

```
## demo2

```groovy
NAME=harry
echo "hello $NAME , current date and time is $(date)"
echo "hello $NAME , current date and time is $(date)" > /tmp/info
```
## demo3
``` sh
#run a script
#!/bin/bash
NAME=$1
LASTNAME=$2
echo "hello $NAME $LASTNAME"

# run this script  ./tmp/script.sh long ly
```
## demo 4
```
introduce parameters ( name and lastname) string
choice paramters
# fist param is name
# second is lastname choice
#third is show 
/tmp/script.sh $FIRST_NAME $LAST_NAME $SHOW
```
## demo 4 
```
ssh plugin
echo "hello $NAME , current date and time is $(date)" > /tmp/info
```
## demo5 webhook