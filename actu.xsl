<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Actualités</title>
</head>
<body>
    <h1>Actualités</h1>
    <p>
        Brèves en français :
        <xsl:value-of select="count(//breve[@langue='fr'])"/>
        <br/>
        Brèves en anglais :
        <xsl:value-of select="count(//breve[@langue='en'])"/>
    </p>
    <xsl:for-each select="//breve[not(@theme = preceding-sibling::breve/@theme)]">
        <h2>Thème : <xsl:value-of select="@theme"/></h2>
        <xsl:for-each select="//breve[@theme = current()/@theme]">
            <div>
                <h3><xsl:value-of select="titre"/></h3>
                <p><xsl:value-of select="texte"/></p>
                <xsl:if test="photo">
                    <img>
                        <xsl:attribute name="src">
                            <xsl:value-of select="photo/@src"/>
                        </xsl:attribute>
                    </img>
                </xsl:if>
                <ul>
                    <xsl:for-each select="url">
                        <li>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="@href"/>
                                </xsl:attribute>
                                <xsl:value-of select="."/>
                            </a>
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
        </xsl:for-each>
    </xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
