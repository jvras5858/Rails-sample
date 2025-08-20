require "pagy/extras/metadata"

# escolha UMA das linhas abaixo:

# a) Sem URLs (só números e limites)
Pagy::DEFAULT[:metadata] = %i[scaffold_url page prev next last count pages limit]

# b) Com URLs prontas (se preferir)
# Pagy::DEFAULT[:metadata] = %i[scaffold_url first_url prev_url page_url next_url last_url count page pages limit]
