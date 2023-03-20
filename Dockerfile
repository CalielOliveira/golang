FROM golang:1.16 AS builder

WORKDIR /app

RUN echo "package main\nimport \"fmt\"\n\nfunc main() {\n\tfmt.Println(\"Full Cycle Rocks\")\n}" > hello.go

RUN go build hello.go

FROM scratch

COPY --from=builder /app/hello .

CMD ["./hello"]