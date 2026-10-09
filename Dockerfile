FROM python:3.11-slim

# CPU-only Linux build: torch 2.14.1 has no wheel for Intel macOS
RUN pip install --no-cache-dir torch==2.14.1 --index-url https://download.pytorch.org/whl/cpu \
    && pip install --no-cache-dir jupyterlab ipykernel numpy matplotlib

WORKDIR /work
EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--IdentityProvider.token=lab"]
