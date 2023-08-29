#include <iostream>
#include <fstream>
#include <string>
#include <regex>

std::string generateOutputFileName(const std::string &inputFileName) {
    size_t lastDot = inputFileName.find_last_of(".");
    if (lastDot == std::string::npos) {
        return inputFileName + "_cut";
    }
    return inputFileName.substr(0, lastDot) + "_cut" + inputFileName.substr(lastDot);
}

int main() {
    std::string inputFileName;
    std::cin.ignore();  // Clear the input buffer (optional, but useful)
    std::cout << "What is the path to your transcript file? ";
    std::getline(std::cin, inputFileName);


    std::string outputFileName = generateOutputFileName(inputFileName);

    std::ifstream inputFile(inputFileName);
    std::ofstream outputFile(outputFileName);

    if (!inputFile.is_open() || !outputFile.is_open()) {
        std::cout << "Could not open file(s)." << std::endl;
        return 1;
    }

    std::string line;
    std::regex timestamp_regex(R"(\d{2}:\d{2}:\d{2}.\d{3} --> \d{2}:\d{2}:\d{2}.\d{3})");

    while (std::getline(inputFile, line)) {
        if (std::regex_match(line, timestamp_regex) || line.empty()) {
            continue;
        }

        if (std::all_of(line.begin(), line.end(), ::isdigit)) {
            continue;
        }

        outputFile << line << std::endl;
    }

    inputFile.close();
    outputFile.close();

    std::cout << "Processed transcript. Output saved to " << outputFileName << std::endl;

    return 0;
}
