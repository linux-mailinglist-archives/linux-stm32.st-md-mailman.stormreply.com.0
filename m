Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A741B5ECC83
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 20:59:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A06CC63328;
	Tue, 27 Sep 2022 18:59:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B622BC63325
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 18:59:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E52561B41;
 Tue, 27 Sep 2022 18:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EA0C433D6;
 Tue, 27 Sep 2022 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664305177;
 bh=aWwbM2FcbB4m2ZMOVJGrcGwpXL3zIDpNnuzwy+bKje8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PI86W4WQZExn9qPgexr8c3lnxMuukf7lbiKbt5mPsHiL+lSPZ13s/gm0FrZsmUyCY
 HRKD7ZzKmK6WyKLZDsiXkRiWW2PGWN+XkUx2WxZg17P8imjWpx+wbH8eWedUVTry/a
 LGXB3IxTv6jwtKTdqXpSor7eq3KxlXJygDw/AfJWehYcebJSxefW5Cg6J9slByamgN
 DgWtRmh0vRoQU2nb1FkLS+vOJkad5LUqipiujkO+VEECkpGWszIgkpnZbJtZDF9e6W
 JhbcBz0IET5hlMH0e/GEo+BQ9cAiAGaltN7fNnjPwvtAd/pJ3fI+Nu50FHcT02yuEA
 3dHn8ujhZ4I3w==
From: Mark Brown <broonie@kernel.org>
To: arnaud.pouliquen@foss.st.com, olivier.moysan@foss.st.com, tiwai@suse.com,
 perex@perex.cz, 
 Zhang Qilong <zhangqilong3@huawei.com>, mcoquelin.stm32@gmail.com,
 lgirdwood@gmail.com
In-Reply-To: <20220927142601.64266-1-zhangqilong3@huawei.com>
References: <20220927142601.64266-1-zhangqilong3@huawei.com>
Message-Id: <166430517501.513274.13539394672852355316.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 19:59:35 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 -next 0/2] Fix PM disable depth
	imbalance in stm32 probe
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

On Tue, 27 Sep 2022 22:25:59 +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced. We fix it by moving pm_runtime_enable to the
> endding of probe.
> v2:
> - Add reviewed-by
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: stm32: dfsdm: Fix PM disable depth imbalance in stm32_adfsdm_probe
      commit: b9a0da5b2edcae2a901b85c8cc42efc5bec4bd7b
[2/2] ASoC: stm32: spdifrx: Fix PM disable depth imbalance in stm32_spdifrx_probe
      commit: 0325cc0ac7980e1c7b744aab8df59afab6daeb43

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
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
