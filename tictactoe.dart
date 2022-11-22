import 'dart:io';

void main() {
  List<List<String>> full_list = [
    [" ", " ", " "],
    [" ", " ", " "],
    [" ", " ", " "]
  ];

  int round = 1;
  bool game_ended = false;
  for (var i = 0; i < full_list.length; i++) {
    if (game_ended) {
      break;
    }
    for (var j = 0; j < full_list[i].length; j++) {
      if (full_list[i][j] == " ") {
        print_game(full_list);
        if (round % 2 == 0) {
          print("next move for X");
        } else {
          print("next move for O");
        }
        stdout.write("line index: ");
        int? line_index = int.tryParse(stdin.readLineSync().toString());
        if (line_index == null) {
          print("invalid line index");
          j--;
          continue;
        } else {
          line_index -= 1;
          if (line_index >= 3 || line_index < 0) {
            print("invalid line index");
            j--;
            continue;
          }
        }

        stdout.write("row index: ");
        int? row_index = int.tryParse(stdin.readLineSync().toString());
        if (row_index == null) {
          print("invalid row index");
          j--;
          continue;
        } else {
          row_index -= 1;
          if (row_index >= 3 || row_index < 0) {
            print("invalid row index");
            j--;
            continue;
          }
        }

        if (full_list[line_index][row_index] != " ") {
          print("already occupied");
          j--;
        } else {
          if (round % 2 == 0) {
            full_list[line_index][row_index] = "X";
          } else {
            full_list[line_index][row_index] = "O";
          }

          if (check_game(full_list)) {
            game_ended = true;
            break;
          }

          // print_game(full_list);
          round++;
        }
      }
    }
  }

  print("game ended");
  print_game(full_list);
}

print_game(game_list) {
  String zz = game_list[0][0];
  String zo = game_list[0][1];
  String zt = game_list[0][2];

  String oz = game_list[1][0];
  String oo = game_list[1][1];
  String ot = game_list[1][2];

  String tz = game_list[2][0];
  String to = game_list[2][1];
  String tt = game_list[2][2];
  print("[$zz] [$zo] [$zt]");
  print("[$oz] [$oo] [$ot]");
  print("[$tz] [$to] [$tt]");
}

check_game(List game_list) {
  String diag = game_list[0][0] + game_list[1][1] + game_list[2][2];
  if (return_winner(diag)) {
    return true;
  }

  String current_row_0 = "";
  String current_row_1 = "";
  String current_row_2 = "";

  for (var i = 0; i < game_list.length; i++) {
    if (return_winner(game_list[i].join(""))) {
      return true;
    } else {
      current_row_0 += game_list[i][0];
      current_row_1 += game_list[i][1];
      current_row_2 += game_list[i][2];
    }
  }
  List<String> current_row = [current_row_0, current_row_1, current_row_2];
  for (var j = 0; j < current_row.length; j++) {
    if (return_winner(current_row[j])) {
      return true;
    } else {}
  }

  return false;
}

bool return_winner(String combined) {
  if (combined == "XXX") {
    print("X Wins!");
    return true;
  } else if (combined == "OOO") {
    print("O Wins!");
    return true;
  } else {
    return false;
  }
}
