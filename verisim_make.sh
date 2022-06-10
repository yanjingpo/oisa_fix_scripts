#!/bin/bash
(cp sbt-launch.jar oisa/Pre-NDSS/rocket-chip)
(cd oisa/Pre-NDSS/verisim && make clean && make)
