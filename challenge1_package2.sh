PKG_NAME=challenge1_package
PKG_DIR=/tmp/${PKG_NAME}
mkdir -p ${PKG_DIR}

cat << __EOF__ > ${PKG_DIR}/challenge.c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <limits.h>
#include <iostream>
#include <fstream>
using namespace std;

int main(){
  printf("Checking Date and time and hostname.\n");
  char hostname[HOST_NAME_MAX + 1];
  gethostname(hostname, HOST_NAME_MAX + 1);

    ofstream myfile;
    myfile.open ("challenge.txt"); 
    myfile << "hostname: %sn", hostname ;

  printf("hostname: %sn", hostname);  
    myfile.close();
  return 0;
}
__EOF__

pushd ${PKG_DIR}/..
tar czvf ${PKG_NAME}.tar.gz ${PKG_NAME}
popd
