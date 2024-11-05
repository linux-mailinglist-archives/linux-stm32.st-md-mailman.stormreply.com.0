Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4B09BD3CD
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2024 18:53:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 374ECC71292;
	Tue,  5 Nov 2024 17:53:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B126C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 17:53:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3C1A55C4636;
 Tue,  5 Nov 2024 17:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342D2C4CECF;
 Tue,  5 Nov 2024 17:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730829191;
 bh=GBpdf1OVO9BOr56k/DS5sh/foQKQ7xW6cGQgQpR2NCA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Pw5KJOOypZ+1M8BcBE1sks8BopZNvfyjIUSRrCa8l9BsQDa57h+iIrOYogz4Z/R3F
 BGgMRI3BzVtRJZnrd8EPtO9bkkwfGVHl3pH2Wb9k32RvLss5b4kESmkAPGMFvsHWU7
 HsfImJ/9oLem4OZommuIE4+MHIC+59xP2TXTed92k01Z0Ns2ew0CGMHx4DACRKU4JJ
 Rt6gUyszCPAyqEP1rDnwCN2zxwe8JKeNsA5if3fvcBrbsH+KT6vrdO2jglYiHBjqQz
 2lzzf4V9w7F5Mxn1wsOslkLlsliJgQFtmY7DgHFTgI5KoAAPxXLXe1yuWuZKixE1Wi
 I40bxMdeGXilg==
From: Mark Brown <broonie@kernel.org>
To: amelie.delaunay@foss.st.com, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20241105140242.527279-1-olivier.moysan@foss.st.com>
References: <20241105140242.527279-1-olivier.moysan@foss.st.com>
Message-Id: <173082918893.89365.2926884723667800367.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 17:53:08 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-9b746
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/1] ASoC: stm32: spdifrx: fix dma channel
 release in stm32_spdifrx_remove
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

On Tue, 05 Nov 2024 15:02:42 +0100, Olivier Moysan wrote:
> In case of error when requesting ctrl_chan DMA channel, ctrl_chan is not
> null. So the release of the dma channel leads to the following issue:
> [    4.879000] st,stm32-spdifrx 500d0000.audio-controller:
> dma_request_slave_channel error -19
> [    4.888975] Unable to handle kernel NULL pointer dereference
> at virtual address 000000000000003d
> [...]
> [    5.096577] Call trace:
> [    5.099099]  dma_release_channel+0x24/0x100
> [    5.103235]  stm32_spdifrx_remove+0x24/0x60 [snd_soc_stm32_spdifrx]
> [    5.109494]  stm32_spdifrx_probe+0x320/0x4c4 [snd_soc_stm32_spdifrx]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: spdifrx: fix dma channel release in stm32_spdifrx_remove
      commit: 9bb4af400c386374ab1047df44c508512c08c31f

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
