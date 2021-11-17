Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CCD455087
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Nov 2021 23:31:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E9A3C5E2CC;
	Wed, 17 Nov 2021 22:31:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2BE2C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Nov 2021 22:31:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A10461882;
 Wed, 17 Nov 2021 22:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637188287;
 bh=jn1cqoJ3XZaDqZgqyRQKukXK0FQ0EKQh7jJIum/8OaQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hoTkBKgwg3wNI7wPETWtWKDEHpOczYSpXY7Fd7OfCnJaUCcB8havj6RGTOwsoLH90
 2jZSxxaMytPyaN2Wh7GIYQbsW7a7Jrrpq4Z5ckeblOBBiaua2ngMNUOISCM5IVsapE
 Hkt3bv7MBSB0so6oKFS1OQswjxfsPUx4jZPoK+MQiMRQeUoGUwKLbIqhqoJYXw4t2Y
 ITEgt9B4ELBvXWLwnovHZW/TiBIQZiCv1B7Imrjr9Zcx+Zo4vBMKA1FMnXao9feAfF
 AbLz8UFBxVi9O46VMrpU9ujlPm0QQaFoq8n6PzMaZmC7eryaQ27NJ2j9QW/lSChkdY
 wV5NXrh5OD5ww==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20211117110031.19345-1-olivier.moysan@foss.st.com>
References: <20211117110031.19345-1-olivier.moysan@foss.st.com>
Message-Id: <163718828521.136850.8228648734064724171.b4-ty@kernel.org>
Date: Wed, 17 Nov 2021 22:31:25 +0000
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: sai: increase channels_max
	limit
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

On Wed, 17 Nov 2021 12:00:31 +0100, Olivier Moysan wrote:
> From: Olivier Moysan <olivier.moysan@st.com>
> 
> The SAI peripheral supports up to 16 channels in TDM mode (8L+8R).
> The driver currently supports TDM over two channels.
> Increase SAI DAI playback/record channels_max,
> to also allow up to 16 channels in TDM mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: sai: increase channels_max limit
      commit: 7fabe7fed182498cac568100d8e28d4b95f8a80e

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
