import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:async';
import 'package:udp/udp.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ryze_tello/ryze_tello.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

late VideoPlayerController videoPlayerController;

void main() async {
  final RawDatagramSocket _socket;
  late final Tello tello;
  final videoSocket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 11111);

  try {
    /* Initializing */
    tello = await Tello.tello();
    await tello.startVideo();

    await Future.delayed(const Duration(seconds: 25));

    await tello.stopVideo();
    // Close resources


  } catch (error, stacktrace) {
    print("Error: $error");
    print("Stack Trace: $stacktrace");
  } finally {
    /* Cleanup & Disconnection */
    tello
        .disconnect(); // IMPORTANT: Must be called to properly dispose of the sockets that connect to the tello.
  }
}


