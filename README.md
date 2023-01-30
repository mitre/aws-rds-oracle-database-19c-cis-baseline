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
#### Execute a single control in the profile 
```bash
inspec exec <path to profile on runner> --input-file=inputs.yml --controls=oracle19c-1.1 -t <target>
```
#### Execute a single control in the profile and save results as JSON
```bash
inspec exec <path to profile on runner> --input-file=inputs.yml --controls=<control id> -t <target> --reporter cli json:results.json
```
#### Execute all controls in the profile 
```bash
inspec exec <path to profile on runner> --input-file=inputs.yml -t <target>
```
#### Execute all controls in the profile and save results as JSON
```bash
inspec exec <path to profile on runner> --input-file=inputs.yml -t <target> --reporter cli json:results.json
```
#### Execute the profile directly on the Oracle database host
```bash
inspec exec <path to profile on the host> --input-file=inputs.yml --reporter cli json:results.json
```
