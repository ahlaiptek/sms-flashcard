if [ -f .env ]; then
  read -p "File .env sudah ada. Apakah Anda ingin menimpa? (y/n): " overwrite
  if [ "$overwrite" != "y" ]; then
    echo "Pengoperasian dibatalkan. Tidak ada file yang ditimpa."
    continue
  fi
  cp .env_example .env
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
