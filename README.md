# ansible-pull-testbed

## Notes to self:

```
git config commit.gpgsign true
git config user.signingKey 1949CE6E01C3C6A5FAD9620079F95F49DF236BA4
```

```
cat '/tmp/ansible_pull,host=delta,serial=NA,commit=f0d3d76efbe17faee4c30637cd7f6a928729c740' | jq -r .stdout
```

## ansible-pull.sh

```
#!/usr/bin/env bash

# Uses implicit ansible.cfg from the checkout

ansible-pull \
        --verify-commit \
        --url https://github.com/mschmitt/ansible-pull-testbed \
        --limit localhost \
        --extra-vars upload_user=xxx \
        --extra-vars upload_url=https://nextcloud.example.com/public.php/webdav \
        --only-if-changed
```
