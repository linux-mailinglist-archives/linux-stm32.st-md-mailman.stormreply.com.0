Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D84455083
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Nov 2021 23:31:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C69CC5E2CC;
	Wed, 17 Nov 2021 22:31:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4352C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Nov 2021 22:31:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27DC861B51;
 Wed, 17 Nov 2021 22:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637188281;
 bh=uU2qHnUEljTCEgcQnVLhefzFnphaBzkPX4DWASgLNyg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ijHAK4jp/W3+yP3SjYIwyudnH1gsROgiOIUR6o3QBOWhju89RKd1Nf+EzfqVJ3y5G
 D8aXK9pihpRlXkeH0IzZydkb/bpVeLKzxye4sWYcMLTfA0psDu9HFDc4Hw+oVfhapc
 ZhTthq0YfMMAIdzXhZ44ZMjKWO5PhEIg6kz8ql7L6npP+CosNDQIPdqPfUDAOjIVVE
 xx1uJ4aUU3/35gP2rNnUlDBknO10Q7Wf3CqG5aptbx1I1IrtpOoBkXHnK7EJkp8esd
 aoIsottl3SoS4aYhuL6HOepm20J6JVlkg3G29pDprOFW8l0o3oBhnkazG89fTUjoUp
 6ur/vZ+GudlnA==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <20211117104404.3832-1-olivier.moysan@foss.st.com>
References: <20211117104404.3832-1-olivier.moysan@foss.st.com>
Message-Id: <163718827890.136789.10813827893934217729.b4-ty@kernel.org>
Date: Wed, 17 Nov 2021 22:31:18 +0000
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: i2s: fix 32 bits channel
	length without mclk
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

On Wed, 17 Nov 2021 11:44:04 +0100, Olivier Moysan wrote:
> Fix divider calculation in the case of 32 bits channel
> configuration, when no master clock is used.
> 
> Fixes: e4e6ec7b127c ("ASoC: stm32: Add I2S driver")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: stm32: i2s: fix 32 bits channel length without mclk
      commit: 424fe7edbed18d47f7b97f7e1322a6f8969b77ae

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
