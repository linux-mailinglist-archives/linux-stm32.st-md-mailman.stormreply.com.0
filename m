Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 640D3D61F6
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 14:05:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2332FC36B0B;
	Mon, 14 Oct 2019 12:05:09 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 238F0C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ZEvx4rHQS/ChhCZb0lOjQFPU66r3utXfBR2h6nSX49o=; b=hy0uOOWFeDFK
 1sjkIDRwNDFgGrVSpw/8V93GKT59q6Xb9FQgw3HmDUZAzJskk40j0j5L1gvpCYXWDSm+vTGKypof0
 lGkz2Wqv5cimCBiMKF8280h4QfQn16Bvp0P0ssUulEBVScTlPehMSbkm5ftvYuzxi5eIMV0ZRptpo
 Ahdf0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iJz5u-0007WY-Tx; Mon, 14 Oct 2019 12:04:59 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 64B702742162; Mon, 14 Oct 2019 13:04:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20191011084816.14279-1-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Message-Id: <20191014120458.64B702742162@ypsilon.sirena.org.uk>
Date: Mon, 14 Oct 2019 13:04:58 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 mcoquelin.stm32@gmail.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "ASoC: stm32: spdifrx: retry synchronization
	in sync state" to the asoc tree
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

   ASoC: stm32: spdifrx: retry synchronization in sync state

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

From 0c93c291321f2ba8dc4cd3d4df74801caaa297db Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Fri, 11 Oct 2019 10:48:16 +0200
Subject: [PATCH] ASoC: stm32: spdifrx: retry synchronization in sync state

When STM32 SPDIFRX is in sync state, allow multiple
synchro attempts, instead of exiting on first unsuccessful
trial. This is useful when spdif signal is not immediately
available on input. This also allows Pulseaudio to check
iec capture device availability when no signal is present.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/20191011084816.14279-1-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_spdifrx.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index cd4b235fce57..3fd28ee01675 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -351,6 +351,8 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 		     SPDIFRX_CR_CUMSK | SPDIFRX_CR_PTMSK | SPDIFRX_CR_RXSTEO;
 		cr_mask = cr;
 
+		cr |= SPDIFRX_CR_NBTRSET(SPDIFRX_NBTR_63);
+		cr_mask |= SPDIFRX_CR_NBTR_MASK;
 		cr |= SPDIFRX_CR_SPDIFENSET(SPDIFRX_SPDIFEN_SYNC);
 		cr_mask |= SPDIFRX_CR_SPDIFEN_MASK;
 		ret = regmap_update_bits(spdifrx->regmap, STM32_SPDIFRX_CR,
@@ -666,7 +668,7 @@ static irqreturn_t stm32_spdifrx_isr(int irq, void *devid)
 	struct snd_pcm_substream *substream = spdifrx->substream;
 	struct platform_device *pdev = spdifrx->pdev;
 	unsigned int cr, mask, sr, imr;
-	unsigned int flags;
+	unsigned int flags, sync_state;
 	int err = 0, err_xrun = 0;
 
 	regmap_read(spdifrx->regmap, STM32_SPDIFRX_SR, &sr);
@@ -726,11 +728,23 @@ static irqreturn_t stm32_spdifrx_isr(int irq, void *devid)
 	}
 
 	if (err) {
-		/* SPDIFRX in STATE_STOP. Disable SPDIFRX to clear errors */
+		regmap_read(spdifrx->regmap, STM32_SPDIFRX_CR, &cr);
+		sync_state = FIELD_GET(SPDIFRX_CR_SPDIFEN_MASK, cr) &&
+			     SPDIFRX_SPDIFEN_SYNC;
+
+		/* SPDIFRX is in STATE_STOP. Disable SPDIFRX to clear errors */
 		cr = SPDIFRX_CR_SPDIFENSET(SPDIFRX_SPDIFEN_DISABLE);
 		regmap_update_bits(spdifrx->regmap, STM32_SPDIFRX_CR,
 				   SPDIFRX_CR_SPDIFEN_MASK, cr);
 
+		/* If SPDIFRX was in STATE_SYNC, retry synchro */
+		if (sync_state) {
+			cr = SPDIFRX_CR_SPDIFENSET(SPDIFRX_SPDIFEN_SYNC);
+			regmap_update_bits(spdifrx->regmap, STM32_SPDIFRX_CR,
+					   SPDIFRX_CR_SPDIFEN_MASK, cr);
+			return IRQ_HANDLED;
+		}
+
 		if (substream)
 			snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
