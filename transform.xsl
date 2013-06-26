<?xml version="1.0" encoding="UTF-8"?>
<!--
	2013 Sven-S. Porst, SUB Göttingen <porst@sub.uni-goettingen.de>
-->

<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

	<xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="/records">
		<ul>
			<xsl:for-each select="*">
				<xsl:sort select="dc:title"/>
				<li>
					<span class="title">
						<xsl:value-of select="dc:title"/>
					</span>
					<xsl:if test="dc:publisher">
						<span class="publisher"><xsl:value-of select="dc:publisher"/></span>
					</xsl:if>
					<xsl:if test="dc:date">
						<span class="zeitraum"><xsl:value-of select="dc:date"/></span>
					</xsl:if>
					<a class="zdbLink">
						<xsl:attribute name="href">
							<xsl:text>http://dispatch.opac.dnb.de/DB=1.1/CMD?ACT=SRCH&amp;PRS=HOL&amp;HLIB=009001506&amp;TRM=IDN+</xsl:text>
							<xsl:value-of select="dc:identifier[@xsi:type='dnb:IDN']"/>
						</xsl:attribute>
						<xsl:text>ZDB Opac</xsl:text>
					</a>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>


</xsl:stylesheet>
