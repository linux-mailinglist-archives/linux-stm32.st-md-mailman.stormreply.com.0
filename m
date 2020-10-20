Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC32C287E6E
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Oct 2020 00:01:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67636C32EA8;
	Thu,  8 Oct 2020 22:01:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E12D2C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Oct 2020 22:01:55 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 074C622242;
 Thu,  8 Oct 2020 22:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602194513;
 bh=EVyvVTNpmJa/UPKAvAjxfvZgDTbHQqPP7CHorPAJG0I=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=vM5VX/caeJccko8pxOGsWKe4Js0eh0gUIKEymMMKDGBRUXqSrImM9VaLkRZaIwfPq
 9chkJ5QP6EzfHj13YfOQgIi9y+9AKBt2Cj926eqxYyiRTcn2vNuU5/6z930B1WGKEL
 anzYLTkemExf4Y2rvv8NLnMX9js6x1fZNX5uqHoo=
Date: Thu, 08 Oct 2020 23:01:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>, lgirdwood@gmail.com,
 arnaud.pouliquen@st.com, tiwai@suse.com, perex@perex.cz,
 alexandre.torgue@st.com
In-Reply-To: <20201007153459.22155-1-olivier.moysan@st.com>
References: <20201007153459.22155-1-olivier.moysan@st.com>
Message-Id: <160219448332.29664.10143559083895905802.b4-ty@kernel.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/2] ASoC: stm32: dfsdm: change rate limits
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

On Wed, 7 Oct 2020 17:34:57 +0200, Olivier Moysan wrote:
> Widening of the supported rate range in the STM32 DFSDM driver.
> The rates were previously limited to 8kHz, 16kHz and 32kHz.
> Allow rate capture in the whole range 8kHz-48kHz as there is no hardware
> limitation to support it.
> Actual sample resolution is dependent on audio rate and DFSDM configuration.
> Add a trace to allow simple check of sample resolution.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: stm32: dfsdm: change rate limits
      commit: 6101bf71192f543799a796274e160f7dfc10f2d2
[2/2] ASoC: stm32: dfsdm: add actual resolution trace
      commit: 41bceb1272164ee2a6fd1ac3bed97043c94b6636

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
