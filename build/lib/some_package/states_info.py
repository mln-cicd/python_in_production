import json
from pathlib import Path

THIS_DIR = Path(__file__).parent
CITIES_JSON_FPATH = THIS_DIR / "cities.json"


def is_city_capitol_of_state(city: str, state: str) -> bool:
    """Put a docstring."""
    cities_json_contents = CITIES_JSON_FPATH.read_text()
    cities = json.loads(cities_json_contents)
    print(cities)


if __name__ == "__main__":
    is_city_capitol_of_state(city="Montgomery", state="Alabama")
