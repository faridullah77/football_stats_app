from flask import Flask, jsonify

app = Flask(__name__)

# Mock data for football stats
football_stats = {
    "live_scores": [
        {"match": "Team A vs Team B", "score": "2-1"},
        {"match": "Team C vs Team D", "score": "0-0"}
    ],
    "top_players": [
        {"name": "Player X", "goals": 10},
        {"name": "Player Y", "goals": 8},
        {"name": "Player Z", "goals": 7}
    ]
}

@app.route('/api/stats', methods=['GET'])
def get_stats():
    return jsonify(football_stats)

if __name__ == '__main__':
    app.run(debug=True)