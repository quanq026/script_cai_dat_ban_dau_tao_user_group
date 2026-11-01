#!/bin/bash
set -e

echo "=== Cap nhat he thong ==="
apt-get update && apt-get upgrade -y

echo "=== Cai dat Java 17, Git, Curl ==="
apt-get install -y openjdk-17-jdk git curl

echo "=== Kiem tra va tao group quickbite ==="
if ! getent group quickbite >/dev/null; then
    groupadd quickbite
    echo "Group quickbite da duoc tao."
else
    echo "Group quickbite da ton tai."
fi

echo "=== Kiem tra va tao user quickbite ==="
if ! id -u quickbite >/dev/null 2>&1; then
    useradd -r -g quickbite -s /bin/false quickbite
    echo "User quickbite da duoc tao thanh cong (-r, /bin/false)."
else
    echo "User quickbite da ton tai."
fi

echo "=== Hoan tat cau hinh ==="
id quickbite
getent passwd | grep quickbite
