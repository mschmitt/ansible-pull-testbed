# ansible-pull-testbed

## Notes to self:

```
git config commit.gpgsign true
git config user.signingKey 1949CE6E01C3C6A5FAD9620079F95F49DF236BA4
```

- [x] Use dedicated GNUPGHOME
- [ ] Maybe use form-multipart instead of encoding things into filename (good enough for Webdav prototype)

## ansible-pull.sh

```
#!/usr/bin/env bash

me_path="$(readlink -f "$0")"
me_dir="$(dirname "${me_path}")"

GNUPGHOME="${me_dir}"/gnupghome/
export GNUPGHOME
gpg --import "${me_dir}"/trustedkeys/*
source "${me_dir}"/config

# - Uses implicit ansible.cfg from the checkout
# - upload_user/upload_url hidden for demonstration on public repository
ansible-pull \
        --verify-commit \
        --url https://github.com/mschmitt/ansible-pull-testbed \
        --limit localhost \
        --extra-vars upload_user="${upload_user}" \
        --extra-vars upload_url="${upload_url}" \
        --only-if-changed
```
