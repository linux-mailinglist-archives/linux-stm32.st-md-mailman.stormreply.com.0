Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C707BF5A
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2019 13:30:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62BA4C10C8A;
	Wed, 31 Jul 2019 11:30:17 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66200C2907D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 11:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=eTlh4lvM63+Wx0DzBrmZ0tzksgKJVQojvvLUdCsPwUA=; b=ptiskyC7AuFD
 XFnW3gNje3mu5imMWSxNCSDDUac5sGXS2eNwaQrGNd2bUVueDxyIrCCVt7TdFqepH/vfy5p6yJd5f
 ON4tmFUsHpJmBMdrCq/QR5PB5O8WqUZAj1se4LRFM9ZvP3AW+ITXLRoGhGEDXf9AwqB/5FB4EF1xv
 AExDA=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsmne-0001lS-R2; Wed, 31 Jul 2019 11:29:42 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3841B2742CDE; Wed, 31 Jul 2019 12:29:42 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190727150738.54764-17-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190731112942.3841B2742CDE@ypsilon.sirena.org.uk>
Date: Wed, 31 Jul 2019 12:29:42 +0100 (BST)
Cc: mripard@kernel.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, paul@crapouillou.net, jcmvbkbc@gmail.com,
 thierry.reding@gmail.com, shawnguo@kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 f.fainelli@gmail.com, khilman@baylibre.com, tiwai@suse.com,
 michal.simek@xilinx.com, jonathanh@nvidia.com, Hulk Robot <hulkci@huawei.com>,
 wens@csie.org, bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 s.hauer@pengutronix.de, matthias.bgg@gmail.com, linux-xtensa@linux-xtensa.org,
 yamada.masahiro@socionext.com, rjui@broadcom.com, robert.jarzmik@free.fr,
 haojian.zhuang@gmail.com, nicoleotsuka@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, perex@perex.cz,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 baohua@kernel.org, timur@kernel.org, sbranden@broadcom.com, eric@anholt.net,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, wahrenst@gmx.net,
 kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, daniel@zonque.org
Subject: [Linux-stm32] Applied "ASoC: codecs: msm8916-wcd: use
	devm_platform_ioremap_resource() to simplify code" to the asoc tree
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

   ASoC: codecs: msm8916-wcd: use devm_platform_ioremap_resource() to simplify code

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From f62d6426718837663484bbf0ed94e56573cbc365 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 27 Jul 2019 23:07:20 +0800
Subject: [PATCH] ASoC: codecs: msm8916-wcd: use
 devm_platform_ioremap_resource() to simplify code

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190727150738.54764-17-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/msm8916-wcd-digital.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
index 1db7e43ec203..9fa5d44fdc79 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -1143,7 +1143,6 @@ static int msm8916_wcd_digital_probe(struct platform_device *pdev)
 	struct msm8916_wcd_digital_priv *priv;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
-	struct resource *mem_res;
 	struct regmap *digital_map;
 	int ret;
 
@@ -1151,8 +1150,7 @@ static int msm8916_wcd_digital_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, mem_res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
