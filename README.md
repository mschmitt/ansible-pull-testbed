# ansible-pull-testbed

## Notes to self:

```
git config commit.gpgsign true
git config user.signingKey 1949CE6E01C3C6A5FAD9620079F95F49DF236BA4
```

## ansible-pull.sh

```
#!/usr/bin/env bash

# Uses implicit ansible.cfg from the checkout

ANSIBLE_STDOUT_CALLBACK='json'
export ANSIBLE_STDOUT_CALLBACK

# Random output file
ANSIBLE_LOG_PATH="$(mktemp)"
export ANSIBLE_LOG_PATH

ansible-pull \
        --verify-commit \
        --url https://github.com/mschmitt/ansible-pull-testbed \
        --limit localhost \
        --purge \
        --verbose

cat "${ANSIBLE_LOG_PATH}"
echo "${ANSIBLE_LOG_PATH}"
```
