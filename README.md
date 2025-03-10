# ansible-pull-testbed

- Clients will checkout a branch, see branches.

## Notes to self:

```
git config commit.gpgsign true
git config user.signingKey 1949CE6E01C3C6A5FAD9620079F95F49DF236BA4
```

- [x] Use dedicated GNUPGHOME
- [ ] Maybe use form-multipart instead of encoding things into filename (good enough for Webdav prototype)
- [ ] Actual deployments may want to have the submission role packaged and deployed with the ansible-pull wrapper

## Obstacles

- No public readable git in target environment
- Will need to have gitlab token packaged
- Gitlab token decay

## ansible-pull.sh

```
#!/usr/bin/env bash

me_path="$(readlink -f "$0")"
me_dir="$(dirname "${me_path}")"

GNUPGHOME="${me_dir}"/gnupghome/
export GNUPGHOME
gpg --import "${me_dir}"/trustedkeys/*
source "${me_dir}"/ansible-pull.cfg

# - Uses implicit ansible.cfg from the checkout
# - upload_user/upload_url hidden for demonstration on public repository
rm -f /tmp/ansible-pull.txt
ansible-pull \
        --url https://github.com/mschmitt/ansible-pull-testbed \
        --checkout deb12-dev \
        --verify-commit \
        --limit localhost \
        --extra-vars upload_user="${upload_user}" \
        --extra-vars upload_url="${upload_url}" \
        --only-if-changed \
        play-local.yml lib/play-upload-results.yml
```
