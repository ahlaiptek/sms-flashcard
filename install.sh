cp .env_example .env

if [ ! -f .env ]; then
  echo "File .env tidak ditemukan. Silakan pastikan file tersebut tersedia."
  exit 1
fi

if [ ! -d env ]; then
  echo "Direktori 'env' tidak ditemukan. Menjalankan langkah pembuatan virtual environment..."
  python3 -m venv env
fi

source env/bin/activate

if [ ! -f requirements.txt ]; then
  echo "File requirements.txt tidak ditemukan. Pastikan file tersebut tersedia dengan daftar dependensi yang diperlukan."
  deactivate
  exit 1
fi

pip install -r requirements.txt
