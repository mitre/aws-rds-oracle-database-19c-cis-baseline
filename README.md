## AWS RDS Oracle 19c CIS Automated Compliance Validation Profile

InSpec profile to validate the secure configuration of Oracle Database 19c against an AWS RDS instance of the Oracle Database 19c Benchmark version 1.0.0 [CIS](https://www.cisecurity.org/cis-benchmarks/)

## Oracle 19c CIS Benchmark Overview

The <b>CIS Oracle Database 19c Benchmark</b>(https://www.cisecurity.org/cis-benchmarks/) is intended to address the recommended security settings for Oracle Database 19c. Future Oracle Database 19c critical patch updates (CPUs) may impact the recommendations included in this document.

For more information see [CIS Benchmarks FAQ](https://www.cisecurity.org/cis-benchmarks/cis-benchmarks-faq)

This InSpec profile automates the validation of Oracle Database 19c against the equivalent CIS Benchmark.

## Getting Started

### Requirements

#### Oracle 19c  
- AWS RDS instance of the Oracle 19c Database
- An account with at least SYSTEM-level role access to run SQL commands

#### Required software on InSpec Runner
- [InSpec](https://www.inspec.io/downloads/)
  - Ensure InSpec version is most recent ( > 4.23.X ) by using `inspec --version`
- [SQL\*Plus](https://docs.oracle.com/cd/B19306_01/server.102/b14357/qstart.htm)
  - Release 19c

#### Required Inputs
You must specify inputs in an `inputs.yml` file. See `example_inputs.yml` in the profile root folder for a sample. Each input is required for proper execution of the profile.
```yaml
user: 'admin'
password: 'xvIA7zonxGM=1'
host: '<AWS_RDS_Endpoint>.rds.amazonaws.com'
service: 'ORCL'
sqlplus_bin: '/opt/oracle/product/12.2.0.1/dbhome_1/bin/sqlplus'
multitenant: false
version: '19.0.0.0.0'
```
Some default values have been added to `inspec.yml`, but can be overridden by defining new values in `inputs.yml`. No default values have been given for database-specific connection variables like the password or the service name; these must be specified in the input file.
##### Note
Environment variables will not be interpreted correctly in `inputs.yml` or `inspec.yml`.
Example:
```
sqlplus_bin: $ORACLE_HOME/bin/sqlplus # $ORACLE_HOME will not be expanded out correctly!
```

# Running This Baseline Directly from Github

```
# How to run
inspec exec https://github.com/mitre/aws-rds-oracle-database-19c-cis-baseline/archive/main.tar.gz --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_store_your_output_file/name_of_your_output_file.json>
```

### Different Run Options

  [Full exec options](https://docs.chef.io/inspec/cli/#options-3)

## Running This Baseline from a local Archive copy 

If your runner is not always expected to have direct access to GitHub, use the following steps to create an archive bundle of this baseline and all of its dependent tests:

(Git is required to clone the InSpec profile using the instructions below. Git can be downloaded from the [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) site.)

When the __"runner"__ host uses this profile baseline for the first time, follow these steps: 

```
mkdir profiles
cd profiles
git clone https://github.com/mitre/aws-rds-oracle-database-19c-cis-baseline
inspec archive aws-rds-oracle-database-19c-cis-baseline
inspec exec <name of generated archive> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_store_your_output_file/name_of_your_output_file.json>
```
For every successive run, follow these steps to always have the latest version of this baseline:

```
cd aws-rds-oracle-database-19c-cis-baseline
git pull
cd ..
inspec archive aws-rds-oracle-database-19c-cis-baseline --overwrite
inspec exec <name of generated archive> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_store_your_output_file/name_of_your_output_file.json>
```

## Using Heimdall for Viewing the JSON Results

The JSON results output file can be loaded into __[heimdall-lite](https://heimdall-lite.cms.gov/)__ for a user-interactive, graphical view of the InSpec results. 

The JSON InSpec results file may also be loaded into a __[full heimdall server](https://github.com/mitre/heimdall2)__, allowing for additional functionality such as to store and compare multiple profile runs.

## Authors
* Will Dower - [wdower](https://github.com/wdower)

## Special Thanks 
* Eugene Aronne - [ejaronne](https://github.com/ejaronne)
* Shivani Karikar - [karikarshivani](https://github.com/karikarshivani)

## Contributing and Getting Help
To report a bug or feature request, please open an [issue](https://github.com/mitre/aws-rds-oracle-database-19c-cis-baseline/issues/new).

### NOTICE  

© 2018-2022 The MITRE Corporation.

Approved for Public Release; Distribution Unlimited. Case Number 18-3678.

## NOTICE  

MITRE hereby grants express written permission to use, reproduce, distribute, modify, and otherwise leverage this software to the extent permitted by the licensed terms provided in the [LICENSE.md](../LICENSE.md) file included with this project.

### NOTICE  

This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.  

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation. 

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA  22102-7539, (703) 983-6000.  

## NOTICE  

CIS Benchmarks are published by the Center for Internet Security (CIS), see: https://www.cisecurity.org/cis-benchmarks/.