##############################################################################
# Copyright (C) 2014
# Institute for System Programming, Russian Academy of Sciences (ISPRAS).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##############################################################################

use strict;
use warnings;

use Carp;
use English qw(-no_match_vars);
use File::Temp;
use Readonly;
use Test::More tests => 2;

Readonly my $C => <<'C';
int gunc(int arg) {
    return 1;
}
int func(int arg) {
    return gunc(arg);
}
C
my $C_FILE = File::Temp->new();
print $C_FILE $C;

Readonly my $ASPECT => <<'ASPECT';
around: call(int gunc(int)) {
    return 0;
}
ASPECT
my $ASPECT_FILE = File::Temp->new();
print $ASPECT_FILE $ASPECT;

my $OUT_FILE = File::Temp->new(); 
system("./cif", "--aspectator", "./aspectator-bin/bin/gcc", "--in", $C_FILE->filename, "--aspect", $ASPECT_FILE->filename, "--out", $OUT_FILE->filename, "--back-end", "src");

isnt("a", $OUT_FILE, "test1");
isnt("b", $OUT_FILE, "test2");
#foreach my $line (<$OUT_FILE>) {
#  print $line;
#  $line =~ /return\s+ldv_gunc_1\s*\(\s*arg\s*\)/ and pass("instrumented");
#}


