print("Hi! I'm keypad_valid.py")

timeChars = ['0', '0', ':', '0', '0']

def is_valid_time(timeChars):
    if int(timeChars[0]) >= 1 and int(timeChars[1]) > 2:
        return False
    elif int(timeChars[0]) > 2:
        return False
    elif int(timeChars[3]) > 5:
        return False
    elif int(timeChars[0]) > 1:
        return False
    else:
        return True

    
    
#iterate over every possible combination of the timeChars array from 00:00 to 99:99
#output to .txt file

def print_time(timeChars):
    timeString = ""
    for i in timeChars:
        timeString += i
    return timeString

with open('output.txt', 'w') as f:
    for i in range(0, 10):
        timeChars[0] = str(i)
        for j in range(0, 10):
            timeChars[1] = str(j)
            for k in range(0, 10):
                timeChars[3] = str(k)
                for l in range(0, 10):
                    timeChars[4] = str(l)
                    if(is_valid_time(timeChars)):
                        f.write("VALID TIME: ")
                        f.write(print_time(timeChars))
                        f.write("\n")
                    else:
                        f.write("INVALID TIME: ")
                        f.write(print_time(timeChars))
                        f.write("\n")