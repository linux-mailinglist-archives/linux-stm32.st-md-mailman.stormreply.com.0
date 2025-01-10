Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D233A093C6
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 15:45:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EC8BC78F7B;
	Fri, 10 Jan 2025 14:45:28 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40A43C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 14:45:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54FB5FF809;
 Fri, 10 Jan 2025 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736520326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dHPofq5XZq7az/ZH3pSbnokgc8b9g3SIFoGkVNSo6iM=;
 b=QaykDlSwtQxbTXSFx/WQbVyeesPYBW12EuQ2e83119ikzKXwERkm59oGK8cQtYV6jA7uyt
 nr0ZCtAn6FdPe6RrgAHZUYM5u6MoLPdP9IIAGGaJSQAmLzW3vc+a8hwSFBOZwUzvG9d5N1
 RjjVie2+9GL+I2Tptx7o5sBeHjizza20bxGbLeeGet2CiAEMHRZkLBeEbDnOHiRhGwYr5Y
 ItlINRNMCLBiOuXDN1+EGarnTO9PBFL6oX9U+iDjUsW7jHNbW8kimAtb9fed96Wwmrt6BB
 EBm+jPCNzi6JMVBbchseGwpaeMN7nYjD9MwmTcRdl7W6F45psfhShwxgJ9a7uA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:06 +0100
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-4-7ab4bd56cf6e@bootlin.com>
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
Subject: [Linux-stm32] [PATCH v3 04/27] spi: amd: Drop redundant check
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

Both spi and spi-mem cores already take care of checking the minimum and
maximum speed for transfers depending on the controller
capabilities. There is no reason to repeat this check in controller
drivers.

Once this possible error condition removed from the function, it makes
no longer sense to return an int.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amd.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-amd.c b/drivers/spi/spi-amd.c
index 485ae1e382e3eb8f4d72ebb0fb15c51b9a118d3b..fbe795bbcf507abcbbd973b226b5db0de1584898 100644
--- a/drivers/spi/spi-amd.c
+++ b/drivers/spi/spi-amd.c
@@ -298,19 +298,16 @@ static const struct amd_spi_freq amd_spi_freq[] = {
 	{ AMD_SPI_MIN_HZ,   F_800KHz,         0},
 };
 
-static int amd_set_spi_freq(struct amd_spi *amd_spi, u32 speed_hz)
+static void amd_set_spi_freq(struct amd_spi *amd_spi, u32 speed_hz)
 {
 	unsigned int i, spd7_val, alt_spd;
 
-	if (speed_hz < AMD_SPI_MIN_HZ)
-		return -EINVAL;
-
 	for (i = 0; i < ARRAY_SIZE(amd_spi_freq); i++)
 		if (speed_hz >= amd_spi_freq[i].speed_hz)
 			break;
 
 	if (amd_spi->speed_hz == amd_spi_freq[i].speed_hz)
-		return 0;
+		return;
 
 	amd_spi->speed_hz = amd_spi_freq[i].speed_hz;
 
@@ -329,8 +326,6 @@ static int amd_set_spi_freq(struct amd_spi *amd_spi, u32 speed_hz)
 		amd_spi_setclear_reg32(amd_spi, AMD_SPI_SPEED_REG, spd7_val,
 				       AMD_SPI_SPD7_MASK);
 	}
-
-	return 0;
 }
 
 static inline int amd_spi_fifo_xfer(struct amd_spi *amd_spi,
@@ -679,9 +674,7 @@ static int amd_spi_exec_mem_op(struct spi_mem *mem,
 
 	amd_spi = spi_controller_get_devdata(mem->spi->controller);
 
-	ret = amd_set_spi_freq(amd_spi, op->max_freq);
-	if (ret)
-		return ret;
+	amd_set_spi_freq(amd_spi, op->max_freq);
 
 	if (amd_spi->version == AMD_SPI_V2)
 		amd_set_spi_addr_mode(amd_spi, op);

-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
