# Bắt đầu từ một image Ruby chính thức
FROM ruby:3.3.0

# Cài đặt các phụ thuộc hệ thống cần thiết
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libvips-dev \
  libpq-dev

# Cài đặt Yarn (giúp quản lý các gói front-end)
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn

# Tạo thư mục ứng dụng trong container và thiết lập là thư mục làm việc
WORKDIR /app

# Sao chép Gemfile và Gemfile.lock vào container
COPY Gemfile /app/
COPY Gemfile.lock /app/

# Cài đặt các gem từ Gemfile
RUN bundle install

# Sao chép toàn bộ mã nguồn của dự án vào container
COPY . /app/

# Khởi động server Rails (có thể thay đổi tùy vào ứng dụng của bạn)
CMD ["rails", "server", "-b", "0.0.0.0"]
