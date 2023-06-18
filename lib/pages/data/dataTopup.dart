class DataUtil {
  static int? savedData = null;

  static void saveData(int data) {
    savedData = data;
  }

  static int? getData() {
    return savedData;
  }
}
