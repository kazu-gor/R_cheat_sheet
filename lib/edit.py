string = ""
with open("kionosaka1883-2021.txt", "r") as f:
    for lines in f:
        string += " " + lines.rstrip() + ","

with open("kionosaka.txt", "w") as f:
    f.write(string)