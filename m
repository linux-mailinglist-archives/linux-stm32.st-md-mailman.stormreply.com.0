Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP9fMr9G8mmTpQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2026 19:58:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2B14986AA
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2026 19:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21BB8C8F263;
	Wed, 29 Apr 2026 17:58:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28008C8F262
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 17:58:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 290B4C5CD63;
 Wed, 29 Apr 2026 17:59:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E99E35FD43;
 Wed, 29 Apr 2026 17:58:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6FE631072B176; 
 Wed, 29 Apr 2026 19:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777485500; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MmcPFcCFT0gegKw7/GAlAOSTHc6JlaEROIWqR2nOl4k=;
 b=Kc0vRRlqvfSudEFr1jF1Gd7LJngYIVk/OpJ9Xy8LuG253NtHk6/h4qCUHyLC/uelRVb4cc
 4dtdIBzKI2GiH9nxWVLuBkH0XM6+60TUTV3lPbduunRwVmtsS7NZANu7HdJhAtQLgyg/XC
 qfAyvlNfSlYsoOKdexYgZ4wm/bWSodcggsYCwEBKkDHvzztBYmluC6xuKPrOLpX9/h7Qic
 pT6L6tnkencqHbZvV4EVzLeBhMxFjsgykFNa9YcAAIpXCmpJMwhvoG1NFc/Ior2L3DtbkU
 3DKkjUd9tAEKhfs0hEhZ7womvlhnP/h4dMJsvpfuXnYvpxywIGUMsaSX8ch/9Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 29 Apr 2026 19:56:48 +0200
MIME-Version: 1.0
Message-Id: <20260429-winbond-v6-18-rc1-cont-read-v3-11-0f38b3c229ad@bootlin.com>
References: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
In-Reply-To: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Steam Lin <STLin2@winbond.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Santhosh Kumar K <s-k6@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, Pratyush Yadav <pratyush@kernel.org>
Subject: [Linux-stm32] [PATCH v3 11/11] mtd: spinand: winbond: Add support
 for continuous reads on W25NxxJW
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 5F2B14986AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:mwalle@kernel.org,m:miquel.raynal@bootlin.com,m:takahiro.kuwano@infineon.com,m:lorenzo@kernel.org,m:ray.liu@airoha.com,m:chin-ting_kuo@aspeedtech.com,m:clg@kaod.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:j.neuschaefer@gmx.net,m:thomas.petazzoni@bootlin.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:STLin2@winbond.com,m:linux-spi@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:s-k6@ti.com,m:linux-stm32@st-md-mailman.stormreply.com,m:pratyush@kernel.org,m:taliperry1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_TO(0.00)[kernel.org,nod.at,ti.com,bootlin.com,infineon.com,airoha.com,aspeedtech.com,kaod.org,jms.id.au,codeconstruct.com.au,gmail.com,google.com,foss.st.com,gmx.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	NEURAL_SPAM(0.00)[0.986];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,bootlin.com:mid,bootlin.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

As for the W35NxxJW family, add support for W25N{01,02}JW continuous
read support. Similar operations require to be done, such as setting a
specific bit in a configuration register, and providing a set of read
variants without the address cycles.

As read from cache variants are badly supported by SPI memory
controllers, we create a new set of read from cache templates with a
fake address cycle and just enough dummy cycles. There are two
unsupported configurations (which would require 4.5 dummy bytes), so we
just do not provide them.

The same extra value in the ECC is possible as with the W35NxxJW family,
so we reference the same helper to retrieve the ECC status.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
All variants have been validated on a Nuvoton MA35D1 platform.
---
 drivers/mtd/nand/spi/winbond.c | 108 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 98 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index ffbcd25b0366..578f702528ee 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -46,6 +46,62 @@
 		   SPI_MEM_OP_DATA_IN(len, buf, 1),			\
 		   SPI_MEM_OP_MAX_FREQ(freq))
 
+#define WINBOND_CONT_READ_FROM_CACHE_1S_1D_1D_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0d, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(2, 0, 1),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy, 1),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 1),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_1S_2S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 1),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 2),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 2),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 2),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 2),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_2D_2D_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbd, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(1, 0, 2),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy - 1, 2),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 2),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_1S_4S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6b, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 1),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 4),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_1D_4D_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6d, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(1, 0, 1),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy - 1, 1),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 4),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_4S_4S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 4),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 4),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 4),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_4D_4D_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xed, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(1, 0, 4),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy - 1, 4),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 4),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
 #define WINBOND_CONT_READ_FROM_CACHE_1S_1S_8S_OP(ndummy, buf, len, freq) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x8b, 1),				\
 		   SPI_MEM_OP_ADDR(1, 0, 1),				\
@@ -133,6 +189,20 @@ static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 54 * HZ_PER_MHZ));
 
+static SPINAND_OP_VARIANTS(cont_read_cache_dual_quad_dtr_variants,
+		WINBOND_CONT_READ_FROM_CACHE_1S_4D_4D_OP(11, NULL, 0, 80 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1D_4D_OP(5, NULL, 0, 80 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_4S_4S_OP(7, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_4S_4S_OP(6, NULL, 0, 104 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_4S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_2D_2D_OP(6, NULL, 0, 80 * HZ_PER_MHZ),
+		/* The 1S_1D_2D variant would require 4.5 dummy bytes, this is not possible */
+		WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(5, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(4, NULL, 0, 104 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_2S_OP(4, NULL, 0, 0),
+		/* The 1S_1D_1D variant would require 4.5 dummy bytes, this is not possible */
+		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0));
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
@@ -445,11 +515,25 @@ static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 	if (iface != SSDR)
 		return -EOPNOTSUPP;
 
+	/*
+	 * At this stage, we do not yet know the continuous read template, nor
+	 * if there is going to be one. Let's assume the continuous read
+	 * template will be selected with the same heuristics as the buffered
+	 * read variant, as there cannot be a HS configuration mismatch between
+	 * them.
+	 */
 	op = spinand->op_templates->read_cache;
 
 	return w25n0xjw_set_sr4_hs(spinand, w25n0xjw_op_needs_hs(op));
 }
 
+static int w25n0xjw_set_cont_read(struct spinand_device *spinand, bool enable)
+{
+	u8 mask = enable ? 0 : WINBOND_CFG_BUF_READ;
+
+	return spinand_upd_cfg(spinand, WINBOND_CFG_BUF_READ, mask);
+}
+
 static int w35n0xjw_write_vcr(struct spinand_device *spinand, u8 reg, u8 val)
 {
 	struct spi_mem_op op = SPINAND_OP(spinand, winbond_write_vcr,
@@ -580,12 +664,14 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbc, 0x21),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_dual_quad_dtr_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_dual_quad_dtr_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&cont_read_cache_dual_quad_dtr_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&w25n01jw_ooblayout, NULL),
-		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg)),
+		     SPINAND_ECCINFO(&w25n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
+		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg),
+		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
 	SPINAND_INFO("W25N01KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xae, 0x21),
 		     NAND_MEMORG(1, 2048, 96, 64, 1024, 20, 1, 1, 1),
@@ -624,12 +710,14 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbf, 0x22),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 2, 1),
 		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_dual_quad_dtr_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_dual_quad_dtr_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&cont_read_cache_dual_quad_dtr_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
-		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg)),
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25w35nxxjw_ecc_get_status),
+		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg),
+		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
 	SPINAND_INFO("W25N02KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),

-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
