FROM mcr.microsoft.com/dotnet/core/sdk:3.0-alpine as builder
WORKDIR /tmp/workdir
COPY . .
RUN dotnet publish -c Release -r linux-x64 -o dist

FROM alpine
WORKDIR /root
COPY --from=builder /tmp/workdir/dist .
# You can add this line if you want.
# ENTRYPOINT ["project_name"]
