const sqlite3 = require('sqlite3').verbose();
const fs = require('fs');

// Ligar à base de dados
const db = new sqlite3.Database('./clinica.db');

// Ler o conteúdo dos teus ficheiros SQL
const schemaSQL = fs.readFileSync('./schema.sql', 'utf8');
const seedSQL = fs.readFileSync('./seed.sql', 'utf8');

console.log('A preparar a base de dados...');

db.serialize(() => {
    // 1. Criar as Tabelas
    db.exec(schemaSQL, (err) => {
        if (err) {
            console.error('Erro a criar as tabelas:', err.message);
        } else {
            console.log('Tabelas criadas com sucesso (schema.sql)!');
            
            // 2. Inserir os Dados (só depois das tabelas existirem)
            db.exec(seedSQL, (err) => {
                if (err) {
                    console.error('Erro a inserir os dados:', err.message);
                } else {
                    console.log('Dados simulados inseridos com sucesso (seed.sql)!');
                    console.log('Tudo pronto! A base de dados já não está vazia.');
                }
            });
        }
    });
});

db.close();