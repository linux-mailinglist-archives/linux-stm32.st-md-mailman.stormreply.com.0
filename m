Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A40FF14E8B
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 17:03:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 610A8C057F9
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 15:03:58 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 075D8C057F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ulGxU59+SHg0LveLVxFzfgXsIwZDWNfvFJ6byVaTrN4=; b=NM7cVQmEeobn
 o0U/OVzVq7HtcosM5EC+eu1pb3dJw4ER7LYUhWsCqnSicdu2yZoWP24syMOFiFi89+LJme7CThJat
 SOhjX+AW0JE6H1G4CId6jsYhsvw9LVJolGztkwffkMi9a0GQ2JUO+WQKGdJTwNsChSEEWSSz3QbhU
 jEqbQ=;
Received: from [2001:268:c0e6:658d:8f3d:d90b:c4e4:2fdf]
 (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNf9d-0001uP-IN; Mon, 06 May 2019 15:03:46 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 26ACA440010; Mon,  6 May 2019 16:03:42 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <1557146646-18150-4-git-send-email-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Message-Id: <20190506150342.26ACA440010@finisterre.ee.mobilebroadband>
Date: Mon,  6 May 2019 16:03:42 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 mcoquelin.stm32@gmail.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "ASoC: stm32: spdifrx: manage identification
	registers" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The patch

   ASoC: stm32: spdifrx: manage identification registers

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 1a5c0b28fc56044737f988960f3bc5fdcdba0827 Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Mon, 6 May 2019 14:44:06 +0200
Subject: [PATCH] ASoC: stm32: spdifrx: manage identification registers

Add support of identification registers in STM32 SPDIFRX.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_spdifrx.c | 37 +++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index b4c3d983e195..62a887ee4a03 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -16,6 +16,7 @@
  * details.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
@@ -36,6 +37,9 @@
 #define STM32_SPDIFRX_DR	0x10
 #define STM32_SPDIFRX_CSR	0x14
 #define STM32_SPDIFRX_DIR	0x18
+#define STM32_SPDIFRX_VERR	0x3F4
+#define STM32_SPDIFRX_IDR	0x3F8
+#define STM32_SPDIFRX_SIDR	0x3FC
 
 /* Bit definition for SPDIF_CR register */
 #define SPDIFRX_CR_SPDIFEN_SHIFT	0
@@ -169,6 +173,18 @@
 #define SPDIFRX_SPDIFEN_SYNC	0x1
 #define SPDIFRX_SPDIFEN_ENABLE	0x3
 
+/* Bit definition for SPDIFRX_VERR register */
+#define SPDIFRX_VERR_MIN_MASK	GENMASK(3, 0)
+#define SPDIFRX_VERR_MAJ_MASK	GENMASK(7, 4)
+
+/* Bit definition for SPDIFRX_IDR register */
+#define SPDIFRX_IDR_ID_MASK	GENMASK(31, 0)
+
+/* Bit definition for SPDIFRX_SIDR register */
+#define SPDIFRX_SIDR_SID_MASK	GENMASK(31, 0)
+
+#define SPDIFRX_IPIDR_NUMBER	0x00130041
+
 #define SPDIFRX_IN1		0x1
 #define SPDIFRX_IN2		0x2
 #define SPDIFRX_IN3		0x3
@@ -607,6 +623,9 @@ static bool stm32_spdifrx_readable_reg(struct device *dev, unsigned int reg)
 	case STM32_SPDIFRX_DR:
 	case STM32_SPDIFRX_CSR:
 	case STM32_SPDIFRX_DIR:
+	case STM32_SPDIFRX_VERR:
+	case STM32_SPDIFRX_IDR:
+	case STM32_SPDIFRX_SIDR:
 		return true;
 	default:
 		return false;
@@ -642,10 +661,11 @@ static const struct regmap_config stm32_h7_spdifrx_regmap_conf = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = STM32_SPDIFRX_DIR,
+	.max_register = STM32_SPDIFRX_SIDR,
 	.readable_reg = stm32_spdifrx_readable_reg,
 	.volatile_reg = stm32_spdifrx_volatile_reg,
 	.writeable_reg = stm32_spdifrx_writeable_reg,
+	.num_reg_defaults_raw = STM32_SPDIFRX_SIDR / sizeof(u32) + 1,
 	.fast_io = true,
 	.cache_type = REGCACHE_FLAT,
 };
@@ -911,6 +931,7 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	struct stm32_spdifrx_data *spdifrx;
 	struct reset_control *rst;
 	const struct snd_dmaengine_pcm_config *pcm_config = NULL;
+	u32 ver, idr;
 	int ret;
 
 	spdifrx = devm_kzalloc(&pdev->dev, sizeof(*spdifrx), GFP_KERNEL);
@@ -967,7 +988,19 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 		goto error;
 	}
 
-	return 0;
+	ret = regmap_read(spdifrx->regmap, STM32_SPDIFRX_IDR, &idr);
+	if (ret)
+		goto error;
+
+	if (idr == SPDIFRX_IPIDR_NUMBER) {
+		ret = regmap_read(spdifrx->regmap, STM32_SPDIFRX_VERR, &ver);
+
+		dev_dbg(&pdev->dev, "SPDIFRX version: %lu.%lu registered\n",
+			FIELD_GET(SPDIFRX_VERR_MAJ_MASK, ver),
+			FIELD_GET(SPDIFRX_VERR_MIN_MASK, ver));
+	}
+
+	return ret;
 
 error:
 	if (!IS_ERR(spdifrx->ctrl_chan))
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
