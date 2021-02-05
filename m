Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF15E310E13
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 17:44:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F7A2C57B51;
	Fri,  5 Feb 2021 16:44:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FAADC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 16:44:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33D8064E41;
 Fri,  5 Feb 2021 16:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612543490;
 bh=PXiONkiHLFyycY0uLa3iLGkOkJkNgYGXd95uCU3KPkw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=d/emirZYV79/LFZ3gcUyV5l56jL3WETg3Tl0W4quAHJh6baGjqwHdUigr3RvkssZH
 7rRo6FTU+6yosPVjiSmbpm8FL8oBmgElYdmGmuZFRgnPXm6i8//rWwVhypXA3JKmcO
 O7ZS5z7EfOOO0QGYylkGCv4xQDyvsz1hylOMW1XSc1sf2r6Q8+NAMLGKWrOiAoEt/Z
 En8YP9+vOpYDBoye/bsuuNPQHN/wGrGCM3JfqhN7+SSXu9Wn5BVTBwyt2h20lJ+YMw
 fwRyeHwERI/4RHORm7R4JYB5loFa+XrnhHiOv7/2chbT1vJm9SmJSaDVLc292zgxH9
 V72ed8/lbTvpA==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Jaroslav Kysela <perex@perex.cz>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20210205104404.18786-1-olivier.moysan@foss.st.com>
References: <20210205104404.18786-1-olivier.moysan@foss.st.com>
Message-Id: <161254344059.9495.3602816971823494322.b4-ty@kernel.org>
Date: Fri, 05 Feb 2021 16:44:00 +0000
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [RESEND PATCH 0/2] ASoC: stm32: i2s: add master
	clock provider
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

On Fri, 5 Feb 2021 11:44:02 +0100, Olivier Moysan wrote:
> Add master clock generation support in STM32 I2S driver.
> Resend of patch https://lkml.org/lkml/2020/9/11/264
> 
> Olivier Moysan (2):
>   ASoC: dt-bindings: add mclk provider support to stm32 i2s
>   ASoC: stm32: i2s: add master clock provider
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: add mclk provider support to stm32 i2s
      commit: df91785a22e2505d2ac668f1d3e6b6e6d8ba627a
[2/2] ASoC: stm32: i2s: add master clock provider
      commit: 8a262e614ef8675cfde924c6ddf873a95db0be6a

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
