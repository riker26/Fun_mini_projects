from flask import Flask, render_template, jsonify, request
import random
import json

app = Flask(__name__)

# Load quotes from a JSON file
def load_quotes():
    try:
        with open('quotes.json', 'r') as file:
            return json.load(file)
    except (FileNotFoundError, json.JSONDecodeError):
        # Default quotes if the file is missing or has an error
        return [
            "quotes one",
            "quotes two ehhe",
            "into my hehehee"
        ]

quotes = load_quotes()

# Save quotes to a JSON file
def save_quotes(quotes):
    with open('quotes.json', 'w') as file:
        json.dump(quotes, file)

# Route to get a random quote
@app.route('/quote', methods=['GET'])
def get_quote():
    random_quote = random.choice(quotes)
    return jsonify({'quote': random_quote})

# Route to add a new quote
@app.route('/quote', methods=['POST'])
def add_quote():
    new_quote = request.json.get('quote')
    if new_quote:
        quotes.append(new_quote)
        save_quotes(quotes)
        return jsonify({'message': 'Quote added successfully!'}), 201
    return jsonify({'message': 'Failed to add quote!'}), 400

# Route to delete a quote by its text
@app.route('/quote', methods=['DELETE'])
def delete_quote():
    quote_to_delete = request.json.get('quote')
    if quote_to_delete in quotes:
        quotes.remove(quote_to_delete)
        save_quotes(quotes)
        return jsonify({'message': 'Quote deleted successfully!'}), 200
    return jsonify({'message': 'Quote not found!'}), 404

# Home route to display the web page
@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
