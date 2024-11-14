    // on<Upload_Pics>((event, emit) async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   String? tokenAuth = prefs.getString('userToken');
    //   List<MultipartFile> multipleImages = [];

    //   for (final imageFiles in event.picsFiles) {
    //     String fileName = imageFiles.path.split('/').last;

    //     MultipartFile file =
    //         await MultipartFile.fromFile(imageFiles.path, filename: fileName);
    //     multipleImages.add(file);

    //     print(fileName);
    //   }
    //   print("image(s) count: " + multipleImages.length.toString());

    //   final formData = FormData.fromMap(
    //       {'type[images]': 'image', 'files[images][]': multipleImages});

    //   try {
    //     final response = await dio.post(api_url + "upload-files",
    //         options: Options(
    //           headers: {
    //             "Authorization": "Bearer $tokenAuth",
    //           },
    //         ),
    //         data: formData);

    //     print('____________upload pics status______________' +
    //         response.statusCode.toString());

    //     if (response.statusCode == 200) {
    //     } else {
    //       print('upload pics failed');
    //     }
    //   } on DioException catch (e) {
    //     print(e.response!.data);
    //   }
    // });
