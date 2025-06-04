# ProjectAI – RAG‐Based Retrieval-Augmented Chatbot for Mauritania

A Django web application that implements a Retrieval-Augmented Generation (RAG) pipeline over Mauritanian legal texts to answer user queries with high accuracy and traceability. This repo includes data, LLM models, vector indices, and front-end components to run a conversational AI service.

---

## 🎯 Project Objective

Build a scalable RAG system that:
1. **Indexes** a corpus of Mauritanian “Journal Officiel” (legal gazettes) and curated legal documents.  
2. **Retrieves** relevant passages using a dense vector index (FAISS).  
3. **Augments** a pre-trained LLM with retrieved context for accurate, grounded answers.  
4. **Deploys** a Django-based REST API and web UI to interactively ask questions and display citations.

---

## 📂 Repository Structure

```text
ProjectAI/
├── Data/                              # Legal corpus & preprocessed indices
│   ├── jo_texts/                      # Raw “Journal Officiel” text files (.txt)
│   ├── jo_metadata.pkl                # Pickled metadata (titles, dates, etc.)
│   ├── mauritania_rag.zip             # Pre-generated index and embeddings
│   └── jo_vector.index                # FAISS vector index (binary)
├── src/                               # Django project & RAG engine
│   ├── manage.py                      # Django management utility
│   ├── requirements.txt               # Python dependencies
│   ├── Dockerfile                     # Containerization for production
│   ├── docker-compose.yml             # Multi-service setup (Django + Redis/DB if needed)
│   ├── Scrapping_AI.ipynb             # Notebook: scraping & preprocessing pipeline
│   ├── src/mauritania_rag/            # Django project settings
│   │   ├── __init__.py
│   │   ├── settings.py
│   │   ├── urls.py
│   │   └── wsgi.py
│   ├── src/rag_app/                   # Django app implementing RAG endpoints
│   │   ├── __init__.py
│   │   ├── admin.py
│   │   ├── apps.py
│   │   ├── migrations/
│   │   │   └── ...                    # Database migrations for chat/message logging
│   │   ├── models.py                  # Models: ChatMessage, SystemSettings, etc.
│   │   ├── rag_engine.py              # Core: embedding, retrieval, LLM prompting
│   │   ├── urls.py                    # API URL patterns (e.g., /api/predict/)
│   │   └── views.py                   # REST views for chat endpoints
│   ├── src/static/                    # Front-end assets (CSS, JS)
│   │   ├── css/style.css
│   │   └── js/chat.js                 # Handles AJAX calls to /api/predict/
│   └── src/templates/                 # HTML templates
│       ├── base.html                  # Base layout with CSS/JS imports
│       ├── chat.html                  # Chat interface: user input + response display
│       ├── analytics.html             # (Optional) Analytics dashboard for logs
│       └── admin_settings.html        # Admin view to configure RAG parameters
└── README.md                          # ← You are here
