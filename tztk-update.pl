#!/usr/bin/perl -w
use strict;

die "usage: $0 version\n\nFor example,\n$0 1.7.2\n" unless @ARGV == 1 && $ARGV[0] =~ /^\d+(?:\.\d+)+/;
my $version = $ARGV[0];

print "Previous hash: ";
system("md5sum minecraft_server.jar");
system("wget -N -nv --no-check-certificate https://s3.amazonaws.com/Minecraft.Download/versions/$version/minecraft_server.$version.jar");
unlink("minecraft_server.jar");
symlink("minecraft_server.$version.jar", "minecraft_server.jar");
print "New hash:      ";
system("md5sum minecraft_server.jar");
