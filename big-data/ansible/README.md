# Ansible

## Install Ansible Python in virtualenv

Certain apps like Ansible could be installed using homebrew but then those have dependencies on python versions... First install above then using pyenv base install the following

```console
pyenv virtualenv 3.8.3 ansible
pyenv activate ansible
pip install ansible
pip install boto
pip install boto3
pip install redis
pip install paramiko
pip install argcomplete
pip install awscli
pyenv deactivate
```

Log into aws console create a new user ansible-user and store the credentials in a private location.
Configure your aws credentials for ansible use.

```console
aws configure
cat ~/.aws/credentials
```

input credentials from above

```console
AWS Access Key ID [None]: ***
AWS Secret Access Key [None]: ***
Default region name [None]: us-east-1
Default output format [None]:
```

verify aws commands

```console
aws s3 ls
```

```console
ansible --version
```

```console
ansible-playbook -i inventory/local -vvv create-bucket-playbook.yml
```

```console
ansible-playbook 2.9.11
  config file = $USER/Developer/personal/dotfiles/big-data/ansible/ansible.cfg
  configured module search path = ['$USER/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = $USER/.pyenv/versions/3.8.3/envs/ansible/lib/python3.8/site-packages/ansible
  executable location = $USER/.pyenv/versions/ansible/bin/ansible-playbook
  python version = 3.8.3 (default, Jul 17 2020, 20:50:40) [Clang 11.0.3 (clang-1103.0.32.62)]
Using $USER/Developer/personal/dotfiles/big-data/ansible/ansible.cfg as config file
host_list declined parsing $USER/Developer/personal/dotfiles/big-data/ansible/inventory/local as it did not pass its verify_file() method
script declined parsing $USER/Developer/personal/dotfiles/big-data/ansible/inventory/local as it did not pass its verify_file() method
auto declined parsing $USER/Developer/personal/dotfiles/big-data/ansible/inventory/local as it did not pass its verify_file() method
Parsed $USER/Developer/personal/dotfiles/big-data/ansible/inventory/local inventory source with ini plugin
[WARNING]: Found both group and host with same name: localhost

PLAYBOOK: create-bucket-playbook.yml ***********************************************************************************************************************************
1 plays in create-bucket-playbook.yml

PLAY [Test s3] *********************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
task path: $USER/Developer/personal/dotfiles/big-data/ansible/create-bucket-playbook.yml:2
<localhost> ESTABLISH LOCAL CONNECTION FOR USER: $USER
<localhost> EXEC /bin/sh -c 'echo ~$USER && sleep 0'
<localhost> EXEC /bin/sh -c '( umask 77 && mkdir -p "` echo $USER/.ansible/tmp `"&& mkdir $USER/.ansible/tmp/ansible-tmp-1595759960.773309-75323-28300953720401 && echo ansible-tmp-1595759960.773309-75323-28300953720401="` echo $USER/.ansible/tmp/ansible-tmp-1595759960.773309-75323-28300953720401 `" ) && sleep 0'
Using module file $USER/.pyenv/versions/3.8.3/envs/ansible/lib/python3.8/site-packages/ansible/modules/system/setup.py
<localhost> PUT $USER/.ansible/tmp/ansible-local-75310ugnkufdv/tmpkbh4q8ou TO $USER/.ansible/tmp/ansible-tmp-1595759960.773309-75323-28300953720401/AnsiballZ_setup.py
<localhost> EXEC /bin/sh -c 'chmod u+x $USER/.ansible/tmp/ansible-tmp-1595759960.773309-75323-28300953720401/ $USER/.ansible/tmp/ansible-tmp-1595759960.773309-75323-28300953720401/AnsiballZ_setup.py && sleep 0'
<localhost> EXEC /bin/sh -c '~/.pyenv/versions/ansible/bin/python $USER/.ansible/tmp/ansible-tmp-1595759960.773309-75323-28300953720401/AnsiballZ_setup.py && sleep 0'
<localhost> EXEC /bin/sh -c 'rm -f -r $USER/.ansible/tmp/ansible-tmp-1595759960.773309-75323-28300953720401/ > /dev/null 2>&1 && sleep 0'
ok: [localhost]
META: ran handlers

TASK [Create new bucket] ***********************************************************************************************************************************************
task path: $USER/Developer/personal/dotfiles/big-data/ansible/create-bucket-playbook.yml:7
<localhost> ESTABLISH LOCAL CONNECTION FOR USER: $USER
<localhost> EXEC /bin/sh -c 'echo ~$USER && sleep 0'
<localhost> EXEC /bin/sh -c '( umask 77 && mkdir -p "` echo $USER/.ansible/tmp `"&& mkdir $USER/.ansible/tmp/ansible-tmp-1595759961.57452-75355-68774172649618 && echo ansible-tmp-1595759961.57452-75355-68774172649618="` echo $USER/.ansible/tmp/ansible-tmp-1595759961.57452-75355-68774172649618 `" ) && sleep 0'
Using module file $USER/.pyenv/versions/3.8.3/envs/ansible/lib/python3.8/site-packages/ansible/modules/cloud/amazon/aws_s3.py
<localhost> PUT $USER/.ansible/tmp/ansible-local-75310ugnkufdv/tmpk3__qehd TO $USER/.ansible/tmp/ansible-tmp-1595759961.57452-75355-68774172649618/AnsiballZ_aws_s3.py
<localhost> EXEC /bin/sh -c 'chmod u+x $USER/.ansible/tmp/ansible-tmp-1595759961.57452-75355-68774172649618/ $USER/.ansible/tmp/ansible-tmp-1595759961.57452-75355-68774172649618/AnsiballZ_aws_s3.py && sleep 0'
<localhost> EXEC /bin/sh -c '~/.pyenv/versions/ansible/bin/python $USER/.ansible/tmp/ansible-tmp-1595759961.57452-75355-68774172649618/AnsiballZ_aws_s3.py && sleep 0'
<localhost> EXEC /bin/sh -c 'rm -f -r $USER/.ansible/tmp/ansible-tmp-1595759961.57452-75355-68774172649618/ > /dev/null 2>&1 && sleep 0'
changed: [localhost] => {
    "changed": true,
    "invocation": {
        "module_args": {
            "aws_access_key": null,
            "aws_secret_key": null,
            "bucket": "new-buck-will-be-deletedzzz",
            "debug_botocore_endpoint_logs": false,
            "dest": null,
            "dualstack": false,
            "ec2_url": null,
            "encrypt": true,
            "encryption_kms_key_id": null,
            "encryption_mode": "AES256",
            "expiry": 600,
            "headers": null,
            "ignore_nonexistent_bucket": false,
            "marker": "",
            "max_keys": 1000,
            "metadata": null,
            "mode": "create",
            "object": null,
            "overwrite": "always",
            "permission": [
                "private"
            ],
            "prefix": "",
            "profile": null,
            "region": "us-east-1",
            "retries": 0,
            "rgw": false,
            "s3_url": null,
            "security_token": null,
            "src": null,
            "validate_certs": true,
            "version": null
        }
    },
    "msg": "Bucket created successfully"
}
META: ran handlers
META: ran handlers

PLAY RECAP *************************************************************************************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

While passing in the interpreter works in this case if there were 2 plays one local and one remote in a playbook the remote would fail. Local plays run aws. Remote plays use ssh, since remoted know nothing of ~/virtualenv... the remote would fail. For a better solution read this very good explanation:
<https://maciej.lasyk.info/2016/Jun/27/working-with-virtualenv-and-ansible/>

On a side note ec2.py inventory has been updated with a plugin read here for more info
<https://aaronoellis.com/articles/replacing-ansibles-aws-ec2py-script-with-the-aws-ec2-plugin>

OR I think you can still use the script according to official documentation
<https://docs.ansible.com/ansible/latest/user_guide/intro_dynamic_inventory.html#inventory-script-example-aws-ec2>

Above document contains this link
<https://raw.githubusercontent.com/ansible/ansible/stable-2.9/contrib/inventory/ec2.py>

To enable argcomplete for ansible. Then type ansible and hit tab.

```console
ansible_complete
```
