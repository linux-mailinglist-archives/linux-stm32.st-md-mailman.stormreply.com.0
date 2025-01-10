Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E6A093EF
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 15:45:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E42AC78F6F;
	Fri, 10 Jan 2025 14:45:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD081C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 14:45:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDE5DFF810;
 Fri, 10 Jan 2025 14:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736520357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SAByBbXiK3tHL9UezLrdCpjMXX5M3FEzgTsevNDT0k8=;
 b=P2U5fKyZYswFF9zTxCkihRiJ/IjXGDYYXqAxB9nbUBdtuPNrExP+b+US+jalb28xa613Dp
 Lo2qdPsNrx46ZhRNahavCrl3YdBLoURmXtkRU6c5y/AVYP3KRVVoaoZR6OIPapFzAInKx4
 y1tQh3ElNb0TmVunb4Hgd51bAgtywkUfgcOkXv/QO+z1zg/Hj9KuZ+VxvUG1dDa8bPhuOq
 WHPR6UGo2YQ0IS+xuEx4jgwBrWetWMeqR4Y09/8BEbWy94b1TISUY6arH5OYWZ7bftivFi
 aw7TORnfDLAKHKt814ebg8A7CJcuerLvmxEhHp8WfO0RIT7rgKbD5DTbDHXXaA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:23 +0100
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-21-7ab4bd56cf6e@bootlin.com>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
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
 linux-rockchip@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 21/27] mtd: spinand: Create distinct fast
 and slow read from cache variants
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

So far, the SPINAND_PAGE_READ_FROM_CACHE_OP macro was taking a first
argument, "fast", which was inducing the possibility to support higher
bus frequencies than with the normal (slower) read from cache
alternative. In practice, without frequency change on the bus, this was
likely without effect, besides perhaps allowing another variant of the
same command, that could run at the default highest speed. If we want to
support this fully, we need to add a frequency parameter to the slowest
command. But before we do that, let's drop the "fast" boolean from the
macro and duplicate it, this will further help supporting having
different frequencies allowed for each variant.

The change is also of course propagated to all users. It has the nice
effect to have all macros aligned on the same pattern.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/alliancememory.c |  4 ++--
 drivers/mtd/nand/spi/ato.c            |  4 ++--
 drivers/mtd/nand/spi/esmt.c           |  4 ++--
 drivers/mtd/nand/spi/foresee.c        |  4 ++--
 drivers/mtd/nand/spi/gigadevice.c     | 16 ++++++++--------
 drivers/mtd/nand/spi/macronix.c       |  4 ++--
 drivers/mtd/nand/spi/micron.c         |  8 ++++----
 drivers/mtd/nand/spi/paragon.c        |  4 ++--
 drivers/mtd/nand/spi/toshiba.c        |  4 ++--
 drivers/mtd/nand/spi/winbond.c        |  4 ++--
 drivers/mtd/nand/spi/xtx.c            |  4 ++--
 include/linux/mtd/spinand.h           | 20 ++++++++++++++++----
 12 files changed, 46 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/nand/spi/alliancememory.c b/drivers/mtd/nand/spi/alliancememory.c
index 7936ea546b038e3441fcd81bd92e358a0f22ed82..6046c73f8424e9fb338ec3a1d35dc6fe30a2e1bc 100644
--- a/drivers/mtd/nand/spi/alliancememory.c
+++ b/drivers/mtd/nand/spi/alliancememory.c
@@ -21,8 +21,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 			   SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/ato.c b/drivers/mtd/nand/spi/ato.c
index 82b377c068124ec8c982bd526cd088ae20ebe7b0..bb5298911137f08c1793d244b33dddf1971e2fed 100644
--- a/drivers/mtd/nand/spi/ato.c
+++ b/drivers/mtd/nand/spi/ato.c
@@ -15,8 +15,8 @@
 
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index 4597a82de23a45919adf97f36ac0ea87d6ef6f53..323a20901fc9fcc252b8317d9434aabf5e30a495 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -15,8 +15,8 @@
 static SPINAND_OP_VARIANTS(read_cache_variants,
 			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-			   SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-			   SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+			   SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+			   SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 			   SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/foresee.c b/drivers/mtd/nand/spi/foresee.c
index e0d2d9257045a86c64b3a2d93a8d836b1322413e..cb5c9e0517eaa5b6e609f34fecac9a8c18451190 100644
--- a/drivers/mtd/nand/spi/foresee.c
+++ b/drivers/mtd/nand/spi/foresee.c
@@ -14,8 +14,8 @@
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index 6023cba748bb858373a54dd58c5808057d9841fc..d620bb02a20a0df04e8d0af187ee277d6ef430f2 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -28,32 +28,32 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(read_cache_variants_f,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP_3A(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(false, 0, 0, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP_3A(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(0, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(read_cache_variants_1gq5,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(read_cache_variants_2gq5,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 4, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index d277c3220fdcbcd6d9ff7ea2690492e0893f5e4a..3dc4d63d6832d0213387f335fd233f1c4306bfff 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -28,8 +28,8 @@ struct macronix_priv {
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 12601bc4227a729575eb9fb28adf9992d7961b3c..ad0bb9755a099dc668e4a0b0a56928f968fba824 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -33,8 +33,8 @@ static SPINAND_OP_VARIANTS(quadio_read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(x4_write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
@@ -48,8 +48,8 @@ static SPINAND_OP_VARIANTS(x4_update_cache_variants,
 static SPINAND_OP_VARIANTS(x4_read_cache_variants,
 			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-			   SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-			   SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+			   SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+			   SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(x1_write_cache_variants,
 			   SPINAND_PROG_LOAD(true, 0, NULL, 0));
diff --git a/drivers/mtd/nand/spi/paragon.c b/drivers/mtd/nand/spi/paragon.c
index 519ade513c1f34cf7499c6bacff61b23412ece88..6e7cc6995380c00ae40fe362f711a490ff463130 100644
--- a/drivers/mtd/nand/spi/paragon.c
+++ b/drivers/mtd/nand/spi/paragon.c
@@ -26,8 +26,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index bbbcaa87c0bc78576ff9ca0b88deb4fa81703276..2e2106b2705f0852aa5b13263d29d8916c1a6e7d 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -17,8 +17,8 @@
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_x4_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 7180e615ac975259d79f065dc8f0dadc998a2770..fb6fee71bcb6d00c5ae7a5578b57c8c3725c7391 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -22,8 +22,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/xtx.c b/drivers/mtd/nand/spi/xtx.c
index 66a4255bdf06617f76f502ddaa873c1334c24ea4..3f539ca0de861c082217701607f96c2a6b7c5378 100644
--- a/drivers/mtd/nand/spi/xtx.c
+++ b/drivers/mtd/nand/spi/xtx.c
@@ -27,8 +27,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 702e5fb13dae73de5e77ddc71964dd46ff756253..63c89307c86524143913660c66ec4fe4375904f8 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -62,14 +62,26 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPINAND_PAGE_READ_FROM_CACHE_OP(fast, addr, ndummy, buf, len)	\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(fast ? 0x0b : 0x03, 1),		\
+#define SPINAND_PAGE_READ_FROM_CACHE_OP(addr, ndummy, buf, len) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 1),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 1))
 
-#define SPINAND_PAGE_READ_FROM_CACHE_OP_3A(fast, addr, ndummy, buf, len) \
-	SPI_MEM_OP(SPI_MEM_OP_CMD(fast ? 0x0b : 0x03, 1),		\
+#define SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(addr, ndummy, buf, len) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),			\
+			 SPI_MEM_OP_ADDR(2, addr, 1),			\
+			 SPI_MEM_OP_DUMMY(ndummy, 1),			\
+			 SPI_MEM_OP_DATA_IN(len, buf, 1))
+
+#define SPINAND_PAGE_READ_FROM_CACHE_OP_3A(addr, ndummy, buf, len) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),				\
+		   SPI_MEM_OP_ADDR(3, addr, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
+		   SPI_MEM_OP_DATA_IN(len, buf, 1))
+
+#define SPINAND_PAGE_READ_FROM_CACHE_FAST_OP_3A(addr, ndummy, buf, len) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),				\
 		   SPI_MEM_OP_ADDR(3, addr, 1),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 1))

-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
