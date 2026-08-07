# ==========================
# Stage 1 - Build
# ==========================
FROM golang:1.25-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o frontend .

# ==========================
# Stage 2 - Runtime
# ==========================
FROM alpine:3.22

RUN apk add --no-cache ca-certificates wget

RUN addgroup -S appgroup && \
    adduser -S appuser -G appgroup

WORKDIR /app

# Binario
COPY --from=builder /app/frontend .

# Recursos estáticos
COPY --from=builder /app/templates ./templates
COPY --from=builder /app/static ./static

USER appuser

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
CMD wget --spider http://localhost:8080 || exit 1

ENTRYPOINT ["./frontend"]