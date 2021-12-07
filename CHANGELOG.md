## 2.3.2 2021-12-07 <dave at tiredofit dot ca>

   ### Added
      - Add Zabbix autoregister support for templates


## 2.3.1 2020-12-01 <dave at tiredofit dot ca>

   ### Added
      - Add ability to execute custom scripts when mounted from /assets/custom-scripts


## 2.3.0 2020-06-09 <dave at tiredofit dot ca>

   ### Added
      - Update to support new tiredofit/debian 5.0.0 base image


## 2.2.0 2020-01-12 <dave at tiredofit dot ca>

   ### Added
      - Update to support new tiredofit/debian base image


## 2.1.0 2019-10-21 <dave at tiredofit dot ca>

* Debian Buster

## 2.0.7 2019-10-21 <samburney@github>

* Updates to Zabbix Monitoring

## 2.0.6 2019-07-03 <gitsf@github>

* Updates for `manage_sync` and `manage_ignore` scripts

## 2.0.5 2019-06-20 <gitsf@github>

* Fix spelling mistake 

## 2.0.4 2019-06-20 <gitsf@github>

* Allow insync to gracefully exit when container shutting down

## 2.0.3 2019-06-20 <dave at tiredofit dot ca>

* Create alias to make insync-headless work when manually entering container

## 2.0.2 2019-06-20 <dave at tiredofit dot ca>

* Further Fixes to 2.x Release

## 2.0.1 2019-06-19 <dave at tiredofit dot ca>

* Regression with new format of handling configuration

## 2.0 2019-06-19 <dave at tiredofit dot ca>

* New unified configuration and data directory. Image should be able to catch anyone using old volume mapping of `/root/.config/Insync`. All you need to do is map `/data`
* Image now runs as `insync` user. Change UID and GID with USER_insync and GROUP_insync variables

## 1.4 2019-04-27 <samburney@github>

* Update Locale to fix error messages and sync issues
* Fix INSYNC*_DOWNLOAD vars to properly download msword types

## 1.3 2018-07-28 <dave at tiredofit dot ca>

* Add Zabbix Monitoring Scripts

## 1.2 2018-07-15 <dave at tiredofit dot ca>

* Add Multiple Account Support

## 1.2 2018-07-15 <dave at tiredofit dot ca>

* Update to Debian Stretch

## 1.1 2017-08-30 <dave at tiredofit dot ca>

* Patch for Environment Variables

## 1.0 2017-08-29 <dave at tiredofit dot ca>

* Initial Release
* Debian Jessie

