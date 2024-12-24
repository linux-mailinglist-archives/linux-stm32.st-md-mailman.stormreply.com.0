Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E04BB9FC0AC
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Dec 2024 18:08:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5413C78F65;
	Tue, 24 Dec 2024 17:08:15 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6707EC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Dec 2024 17:08:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 990F240004;
 Tue, 24 Dec 2024 17:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735060094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSDAGRiX5uW2hASEynfGv8MA56J5pas3+2b3+3jgoTI=;
 b=NWeSscwSHEiYDed758p0Sz7XLYoEmgcCUuMG2FxPUiP+UjMSiZa4CUEYTHJ81jbA99oCbK
 pU6KGwB8IU0mhnIAF9uLp46iZ/AyGA/1u4sS0VhvK0B0WTgbseJ86J5S0WU0gugJXlRmxV
 2Tix99EFRBVeDdcTNWk1bQrBF/Xj4JgoxMn2P/B1x9W+0leLiRjfSq1Zag7rwcSMoCbgV/
 mprDs8N1a8v2MubogrOEhBzP1HPe8Dd3yaM6IBYd1DpifyEJhUpoxaS0Jt7MqYuJskjY+X
 IIpVOJrU1O/YsOFzilsjoxVjbs3/Ff0lwoEPD3Gl+LPluVfhNH/HOVV5WLW5/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Dec 2024 18:06:09 +0100
MIME-Version: 1.0
Message-Id: <20241224-winbond-6-11-rc1-quad-support-v2-24-ad218dbc406f@bootlin.com>
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
In-Reply-To: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 24/27] mtd: spinand: Add support for read
	DTR operations
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

Advanced SPI-NAND chips are capable of reading data much faster by
leveraging DTR support. This support extends to dual and quad
configurations.

Create macros defining all possible read from cache DTR variants:
- SPINAND_PAGE_READ_FROM_CACHE_DTR_OP
- SPINAND_PAGE_READ_FROM_CACHE_X2_DTR_OP
- SPINAND_PAGE_READ_FROM_CACHE_X4_DTR_OP
- SPINAND_PAGE_READ_FROM_CACHE_DUALIO_DTR_OP
- SPINAND_PAGE_READ_FROM_CACHE_QUADIO_DTR_OP

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spinand.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 1948e654b8aacb3d4b774a00939e8e8198f53da7..eeabf4a17c578405550fcc1ed1653f9ef09b5ff6 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -87,6 +87,13 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 1))
 
+#define SPINAND_PAGE_READ_FROM_CACHE_DTR_OP(addr, ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0d, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(2, addr, 1),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy, 1),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 1),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
 #define SPINAND_PAGE_READ_FROM_CACHE_X2_OP(addr, ndummy, buf, len)	\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 1),				\
@@ -99,6 +106,13 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 2))
 
+#define SPINAND_PAGE_READ_FROM_CACHE_X2_DTR_OP(addr, ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3d, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(2, addr, 1),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy, 1),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 2),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
 #define SPINAND_PAGE_READ_FROM_CACHE_X4_OP(addr, ndummy, buf, len)	\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6b, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 1),				\
@@ -111,6 +125,13 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 4))
 
+#define SPINAND_PAGE_READ_FROM_CACHE_X4_DTR_OP(addr, ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6d, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(2, addr, 1),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy, 1),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 4),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
 #define SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(addr, ndummy, buf, len)	\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 2),				\
@@ -123,6 +144,13 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 2),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 2))
 
+#define SPINAND_PAGE_READ_FROM_CACHE_DUALIO_DTR_OP(addr, ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbd, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(2, addr, 2),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy, 2),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 2),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
 #define SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(addr, ndummy, buf, len)	\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 4),				\
@@ -135,6 +163,13 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 4))
 
+#define SPINAND_PAGE_READ_FROM_CACHE_QUADIO_DTR_OP(addr, ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xed, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(2, addr, 4),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy, 4),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 4),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
 #define SPINAND_PROG_EXEC_OP(addr)					\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x10, 1),				\
 		   SPI_MEM_OP_ADDR(3, addr, 1),				\

-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
