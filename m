Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A627C32C9
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2019 13:40:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58343C36B0B;
	Tue,  1 Oct 2019 11:40:56 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A10C2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2019 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=tYidPqV9evGITvFKkefYkx+MVPV/Xz9CUR8kqXFz+Ew=; b=h2gfqiL6AL84
 v6pwTjwDOv2ZAoIuZcIr5WwnVFaft1ll5i3RA+foapZDUGA+mjAxOsw0uEF+imR5a1vdpRVCipmGO
 44SROcKViRDJOcju0+nsHcUyYWin4kYqXBHMFP0P7G1iLSGBHgJlWfdDQPKsJlg9A4o5h0dvp+REV
 Ypmn4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWN-0004Ss-NL; Tue, 01 Oct 2019 11:40:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2F9722742A30; Tue,  1 Oct 2019 12:40:47 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Colin Ian King <colin.king@canonical.com>
In-Reply-To: <20190925112621.9312-1-colin.king@canonical.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114047.2F9722742A30@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:47 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "ASoC: stm32: sai: clean up indentation
	issue" to the asoc tree
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

   ASoC: stm32: sai: clean up indentation issue

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 423013f824ab0590c229a107f21c54ac6596c4e1 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 25 Sep 2019 12:26:21 +0100
Subject: [PATCH] ASoC: stm32: sai: clean up indentation issue

There is a statement that is indented one level too deeply,
remove the extraneous tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20190925112621.9312-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_sai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index ef4273361d0d..e20267504b16 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -100,7 +100,7 @@ static int stm32_sai_sync_conf_provider(struct stm32_sai_data *sai, int synco)
 		dev_err(&sai->pdev->dev, "%pOFn%s already set as sync provider\n",
 			sai->pdev->dev.of_node,
 			prev_synco == STM_SAI_SYNC_OUT_A ? "A" : "B");
-			stm32_sai_pclk_disable(&sai->pdev->dev);
+		stm32_sai_pclk_disable(&sai->pdev->dev);
 		return -EINVAL;
 	}
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
