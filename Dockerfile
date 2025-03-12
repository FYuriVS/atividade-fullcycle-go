FROM golang:1.10-alpine AS stage
WORKDIR /app

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o app .

FROM scratch
WORKDIR /

COPY --from=stage /app/app /app

EXPOSE 8080

CMD ["/app"]