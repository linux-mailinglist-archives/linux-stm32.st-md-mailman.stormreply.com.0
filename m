Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12982A093E0
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 15:45:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC60EC78F6F;
	Fri, 10 Jan 2025 14:45:45 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE5A8C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 14:45:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF7E5FF811;
 Fri, 10 Jan 2025 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736520344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOM20MlWPFKmxw5KkK0hLotjF6wgAi7LSWkedeOSHRU=;
 b=XZUdHskMqNiQqXzrkdfH82Jzihs03ga1WVHdtuAMzHaJHIyH0x+htnYHwTUNh7VV5z5CPp
 Vm9jG1CczoVXrpTPykNsXITlsPiCuLvR8m/tIu5qeNIEbCof/pGZNKmFR8Tkmf/iLbYZC4
 sLy6KJO0MdcASmcLIMmdlf8AZgngPSOeBWb3pn2YxbL6x09YEepMyinYAC/+TSw59YO/Bc
 eHxgxGsh7KhLKgySJT9zYHR8juNwytx/1362fJT76ReAIfnJ560kIctiDEH69gm+ZP7CcC
 ZOu7QA1T/zYwgkeGe/JDECMaKPLIdhxZ18yU78/HgG4vOZQJNoE7q9sOBTmvWA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:16 +0100
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-14-7ab4bd56cf6e@bootlin.com>
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
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 14/27] spi: spi-sn-f-ospi: Support per
 spi-mem operation frequency switches
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

Every ->exec_op() call correctly configures the spi bus speed to the
maximum allowed frequency for the memory using the constant spi default
parameter. Since we can now have per-operation constraints, let's use
the value that comes from the spi-mem operation structure instead. In
case there is no specific limitation for this operation, the default spi
device value will be given anyway.

The per-operation frequency capability is thus advertised to the spi-mem
core.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-sn-f-ospi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sn-f-ospi.c b/drivers/spi/spi-sn-f-ospi.c
index adac645732fedfe6e33a5a0979ba43d5d203bfce..6ad4b729897e3909a5e22b33aa47b812219a6ee5 100644
--- a/drivers/spi/spi-sn-f-ospi.c
+++ b/drivers/spi/spi-sn-f-ospi.c
@@ -335,7 +335,6 @@ static void f_ospi_config_indir_protocol(struct f_ospi *ospi,
 static int f_ospi_indir_prepare_op(struct f_ospi *ospi, struct spi_mem *mem,
 				   const struct spi_mem_op *op)
 {
-	struct spi_device *spi = mem->spi;
 	u32 irq_stat_en;
 	int ret;
 
@@ -343,7 +342,7 @@ static int f_ospi_indir_prepare_op(struct f_ospi *ospi, struct spi_mem *mem,
 	if (ret)
 		return ret;
 
-	f_ospi_config_clk(ospi, spi->max_speed_hz);
+	f_ospi_config_clk(ospi, op->max_freq);
 
 	f_ospi_config_indir_protocol(ospi, mem, op);
 
@@ -577,6 +576,10 @@ static const struct spi_controller_mem_ops f_ospi_mem_ops = {
 	.exec_op = f_ospi_exec_op,
 };
 
+static const struct spi_controller_mem_caps f_ospi_mem_caps = {
+	.per_op_freq = true,
+};
+
 static int f_ospi_init(struct f_ospi *ospi)
 {
 	int ret;
@@ -614,6 +617,7 @@ static int f_ospi_probe(struct platform_device *pdev)
 		| SPI_RX_DUAL | SPI_RX_QUAD | SPI_RX_OCTAL
 		| SPI_MODE_0 | SPI_MODE_1 | SPI_LSB_FIRST;
 	ctlr->mem_ops = &f_ospi_mem_ops;
+	ctlr->mem_caps = &f_ospi_mem_caps;
 	ctlr->bus_num = -1;
 	of_property_read_u32(dev->of_node, "num-cs", &num_cs);
 	if (num_cs > OSPI_NUM_CS) {

-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
