FROM golang:alpine

LABEL org.opencontainers.image.source = "https://github.com/blyndusk/go-eland"

# ----- SETUP -----

# Enable Go modules
ENV GO111MODULE=on

# Set the current working with go absolute path
WORKDIR /go/src/github.com/blyndusk/go-eland

# ----- INSTALL -----

# Copy go.mod + go.sum for install before full copy
COPY go.mod .

COPY go.sum .

# Download all dependencies
RUN go mod download -x

# ----- COPY + RUN -----

# Copy the source from the current directory to the container
COPY . .

# Build CLI into specific folder
RUN go build -o tmp/main cmd/go-eland/main.go

# Use the excutable
ENTRYPOINT [ "tmp/main" ]