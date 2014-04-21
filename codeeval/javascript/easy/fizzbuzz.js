var fs = require("fs");

function fizzBuzz(a, b, n) {
    if (n % a === 0 && n % b === 0)
        return "FB";
    if (n % a === 0)
        return "F";
    if (n % b === 0)
        return "B";
    return n
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
        var arr = line.split(" ");
        var a = arr[0];
        var b = arr[1];
        var m  = arr[2];
        var l = Array();
        for (var i = 1; i <= m; i++) {
            l.push(fizzBuzz(a, b, i));
        }
        console.log(l.join(" "));
    }
});
