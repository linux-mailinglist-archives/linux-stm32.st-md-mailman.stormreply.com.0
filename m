Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKmYD7RG8mmTpQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2026 19:58:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E8B49868E
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2026 19:58:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8BFDC87EDB;
	Wed, 29 Apr 2026 17:58:11 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56987C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 17:58:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 22BA01A3452;
 Wed, 29 Apr 2026 17:58:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E9AEA5FD43;
 Wed, 29 Apr 2026 17:58:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 715EB1072B16B; 
 Wed, 29 Apr 2026 19:58:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777485487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pSiHGhf6ru2F9nLoledFRKcwtuecIRMIsmhWqwY8OEQ=;
 b=bLojio66LcIQgqN/n+btKKH1+KzZHd0PhjJy8pHU7MF2zY82En696K6fsqgENUw3A3AiWY
 X3FxgrXGk0o1KAKhuIXvZpamGGbU32i2p4Gb5DM8ThZNiNaHCKEfAM25Tj4GfcHeUp38Ic
 JN20kVj7ma8kWBTC92wK1zqutKyjAEaIxGMNPSoVSNzpsERpflZ1gcOcahdkVe+BCVuqME
 IfXeNaYNchdXorisuS9wvRB0un5DgtDzDQf7URs05HuP4/S7wGhp0DnwWiXj4DXWJLlAr8
 /Pf9CLPcC1E+1hnBjbVv7CguXmPeSSmuY/vsYMQnmnEKbndre52QePySVLx4wA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 29 Apr 2026 19:56:45 +0200
MIME-Version: 1.0
Message-Id: <20260429-winbond-v6-18-rc1-cont-read-v3-8-0f38b3c229ad@bootlin.com>
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
Subject: [Linux-stm32] [PATCH v3 08/11] mtd: spinand: winbond: Add support
 for continuous reads on W35NxxJW
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
X-Rspamd-Queue-Id: 14E8B49868E
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
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_TO(0.00)[kernel.org,nod.at,ti.com,bootlin.com,infineon.com,airoha.com,aspeedtech.com,kaod.org,jms.id.au,codeconstruct.com.au,gmail.com,google.com,foss.st.com,gmx.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	NEURAL_SPAM(0.00)[0.992];
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

W35N{01,02,04}JW support being read continuously under certain
circumstances. A bit must be set in their configuration register, and
a specific read from cache operation, a bit shorter than usual because
it no longer requires the address cycles, must be used for the occasion.

Setting the "enable" bit is already supported by the core, aside from
the subtlety of making sure the HFREQ bit is also set in octal DTR mode
above 90MHz. However, handling two different read from cache templates
involves creating a list of read from cache variants adapted the
continuous reads, ie. without address cycles.

Unfortunately, these operations, despite being very close to their
original read from cache cousins, are often unsupported by smart SPI
controller drivers because reading from cache historically allowed
changing the offset at which the host would start by providing a 2-byte
column address. In order to prevent issues with this, it has been
decided to implement these variants with a single "ignored" address byte
(respectively two in the octal DTR case), further reducing the amount of
dummy cycles needed before the first bit of data.

Enabling continuous reads has a side effect: the ECC status register now
may also return the value b11, which means that more than 1
uncorrectable error happened during the read. This non standard
behaviour requires to re-implement, almost identically the "get ECC"
helper from the core, with just an extra case for this value (it is
prefixed "w25w35nxxjw" because all these chips have the same behaviour).

Speed gain is substantial, see below. The flash_speed -C benchmark has
been run on a TI AM62A7 LP SK with CPU power management disabled,
mounted with a W35N01JW chip.

1S-8S-8S:

     1 page read speed is 15058 KiB/s
     2 page read speed is 15058 KiB/s
     3 page read speed is 16800 KiB/s
     4 page read speed is 17066 KiB/s
     5 page read speed is 18461 KiB/s
     6 page read speed is 18461 KiB/s
     7 page read speed is 19384 KiB/s
     8 page read speed is 19692 KiB/s
     9 page read speed is 19384 KiB/s
     10 page read speed is 20000 KiB/s
     11 page read speed is 20000 KiB/s
     12 page read speed is 20000 KiB/s
     13 page read speed is 20800 KiB/s
     14 page read speed is 20363 KiB/s
     15 page read speed is 20000 KiB/s
     16 page read speed is 19692 KiB/s
     32 page read speed is 19692 KiB/s
     64 page read speed is 19692 KiB/s

8D-8D-8D:

     1 page read speed is 23272 KiB/s
     2 page read speed is 23272 KiB/s
     3 page read speed is 28000 KiB/s
     4 page read speed is 32000 KiB/s
     5 page read speed is 34285 KiB/s
     6 page read speed is 34285 KiB/s
     7 page read speed is 36000 KiB/s
     8 page read speed is 36571 KiB/s
     9 page read speed is 36000 KiB/s
     10 page read speed is 34285 KiB/s
     11 page read speed is 36666 KiB/s
     12 page read speed is 40000 KiB/s
     13 page read speed is 41600 KiB/s
     14 page read speed is 37333 KiB/s
     15 page read speed is 40000 KiB/s
     16 page read speed is 36571 KiB/s
     32 page read speed is 42666 KiB/s
     64 page read speed is 42666 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Not all configurations have been tested/validated yet.
---
 drivers/mtd/nand/spi/winbond.c | 126 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 111 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index f4d4ffaa1f62..6c11f59a9f8d 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -15,9 +15,11 @@
 
 #define SPINAND_MFR_WINBOND		0xEF
 
+#define WINBOND_CFG_HFREQ		BIT(0)
 #define WINBOND_CFG_BUF_READ		BIT(3)
 
 #define W25N04KV_STATUS_ECC_5_8_BITFLIPS	(3 << 4)
+#define W25W35NXXJW_STATUS_ECC_MULT_UNCOR	(3 << 4)
 
 #define W25N0XJW_SR4			0xD0
 #define W25N0XJW_SR4_HS			BIT(2)
@@ -29,6 +31,49 @@
 #define W35N01JW_VCR_IO_MODE_OCTAL_DDR		0xC7
 #define W35N01JW_VCR_DUMMY_CLOCK_REG	0x01
 
+/*
+ * Winbond chips ignore the address bytes during continuous reads, and
+ * because the dummy cycles are enough they indicate dropping the
+ * address cycles from the continuous read from cache variants. This is
+ * very poorly supported by SPI controller drivers which are "wired" to
+ * always at least provide the column. Keep using address cycles, but
+ * reduce the number of dummy cycles accordingly.
+ */
+#define WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 1),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 1),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_1S_8S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x8b, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 1),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 8),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_1D_8D_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x9d, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(1, 0, 1),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy - 1, 1),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 8),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_8S_8S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xcb, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 8),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 8),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 8),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_8D_8D_8D_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0x9d, 8),			\
+		   SPI_MEM_DTR_OP_ADDR(2, 0, 8),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy - 2, 8),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 8),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
 /*
  * "X2" in the core is equivalent to "dual output" in the datasheets,
  * "X4" in the core is equivalent to "quad output" in the datasheets.
@@ -49,6 +94,19 @@ static SPINAND_OP_VARIANTS(read_cache_octal_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
 
+static SPINAND_OP_VARIANTS(cont_read_cache_octal_variants,
+		WINBOND_CONT_READ_FROM_CACHE_8D_8D_8D_OP(24, NULL, 0, 120 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_8D_8D_8D_OP(16, NULL, 0, 86 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1D_8D_OP(3, NULL, 0, 120 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1D_8D_OP(2, NULL, 0, 105 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_8S_8S_OP(20, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_8S_8S_OP(16, NULL, 0, 162 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_8S_8S_OP(12, NULL, 0, 124 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_8S_8S_OP(8, NULL, 0, 86 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_8S_OP(2, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_8S_OP(1, NULL, 0, 133 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(1, NULL, 0, 0));
+
 static SPINAND_OP_VARIANTS(write_cache_octal_variants,
 		SPINAND_PROG_LOAD_8D_8D_8D_OP(true, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_8S_8S_OP(true, 0, NULL, 0),
@@ -326,6 +384,26 @@ static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+static int w25w35nxxjw_ecc_get_status(struct spinand_device *spinand, u8 status)
+{
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case STATUS_ECC_HAS_BITFLIPS:
+		return 1;
+
+	case STATUS_ECC_UNCOR_ERROR:
+	case W25W35NXXJW_STATUS_ECC_MULT_UNCOR:
+		return -EBADMSG;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 			   enum spinand_bus_interface iface)
 {
@@ -451,6 +529,18 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand,
 	return 0;
 }
 
+static int w35n0xjw_set_cont_read(struct spinand_device *spinand, bool enable)
+{
+	const struct spi_mem_op *cont_op = spinand->op_templates->cont_read_cache;
+	u8 mask = enable ? 0 : WINBOND_CFG_BUF_READ;
+
+	if (cont_op && enable && spinand_op_is_odtr(cont_op) &&
+	    cont_op->max_freq >= 90 * HZ_PER_MHZ)
+		mask |= WINBOND_CFG_HFREQ;
+
+	return spinand_upd_cfg(spinand, WINBOND_CFG_BUF_READ | WINBOND_CFG_HFREQ, mask);
+}
+
 static const struct spinand_info winbond_spinand_table[] = {
 	/* 512M-bit densities */
 	SPINAND_INFO("W25N512GW", /* 1.8V */
@@ -504,13 +594,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdc, 0x21),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 1, 1),
 		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
-					      &write_cache_octal_variants,
-					      &update_cache_octal_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_octal_variants,
+							&write_cache_octal_variants,
+							&update_cache_octal_variants,
+							&cont_read_cache_octal_variants),
 		     0,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
-		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
-		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
+		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
+		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
+		     SPINAND_CONT_READ(w35n0xjw_set_cont_read)),
 	/* 2G-bit densities */
 	SPINAND_INFO("W25M02GV", /* 2x1G-bit 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xab, 0x21),
@@ -555,13 +647,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
 		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
-					      &write_cache_octal_variants,
-					      &update_cache_octal_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_octal_variants,
+							&write_cache_octal_variants,
+							&update_cache_octal_variants,
+							&cont_read_cache_octal_variants),
 		     0,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
-		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
-		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
+		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
+		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
+		     SPINAND_CONT_READ(w35n0xjw_set_cont_read)),
 	/* 4G-bit densities */
 	SPINAND_INFO("W25N04KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x23),
@@ -585,13 +679,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),
 		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
-					      &write_cache_octal_variants,
-					      &update_cache_octal_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_octal_variants,
+							&write_cache_octal_variants,
+							&update_cache_octal_variants,
+							&cont_read_cache_octal_variants),
 		     0,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
-		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
-		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
+		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
+		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
+		     SPINAND_CONT_READ(w35n0xjw_set_cont_read)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)

-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
