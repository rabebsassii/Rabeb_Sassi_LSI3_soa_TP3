<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="getComptes">
        <tr>
            <td><xsl:value-of select="code"/></td>
            <td><xsl:value-of select="solde"/></td>
            <td><xsl:value-of select="date"/></td>
        </tr>
    </xsl:template>
    <!-- Création du variable xsl totalSolde pour stocker la somme totale des soldes des comptes -->
    <xsl:variable name="TotalSolde" select="sum(BanqueService/getComptes/solde)" />
    <xsl:template match="/">
        <html>
            <head>
                <title>Liste des Comptes</title>
            </head>
            <body>
                <h1>Liste des Comptes</h1>
                <table border="1">
                    <tr>
                        <th>Code</th>
                        <th>Solde</th>
                        <th>Date de Creation</th>
                    </tr>
                    <xsl:apply-templates select="BanqueService/getComptes"/>
                </table>
                <!-- Affichage du solde total -->
                <p>Somme totale des soldes : <xsl:value-of select="$TotalSolde"/></p>

                <!-- Filtration de données -->
                <!-- Création du variable xsl totalSolde pour stocker la somme totale des soldes des comptes -->
                <xsl:variable name="totalSoldeFiltre" select="sum(BanqueService/getComptes[substring(date, 1, 4) > 2000]/solde)" />
                <h1>Liste des Comptes Creés aprés l'annee 2000</h1>
                <table border="1">
                    <tr>
                        <th>Code</th>
                        <th>Solde</th>
                        <th>Date de Creation</th>
                    </tr>
                    <xsl:apply-templates select="BanqueService/getComptes[substring(date, 1, 4) > 2000]"/>
                </table>
                <!-- Affichage du solde total -->
                <p>Somme totale des soldes des comptes filtres : <xsl:value-of select="$totalSoldeFiltre"/></p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>


