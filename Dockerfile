FROM golang:1.16.4 AS builder
WORKDIR /var/app
COPY ./codeeducation.go .
RUN go mod init andrewvazzoler/codeeducation && \
  go mod tidy && \
  go build codeeducation.go


FROM scratch
WORKDIR /var/app
COPY --from=builder /var/app/codeeducation .
CMD [ "./codeeducation" ]

