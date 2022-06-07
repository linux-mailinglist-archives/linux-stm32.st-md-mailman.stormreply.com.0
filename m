Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D6853FBB5
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jun 2022 12:45:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57062C5E2CC;
	Tue,  7 Jun 2022 10:45:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6397EC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jun 2022 10:45:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3246E61531;
 Tue,  7 Jun 2022 10:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1780BC3411E;
 Tue,  7 Jun 2022 10:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598722;
 bh=H7439HAhKBiBU5PJ0wEYhH+/aj2uOXs88io1cN6Ww+I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IZJSFxF3NIi3cewoR1VlvJQkQVHSUj3nrlHYEWLewWIaLDLl3OCLisXwJk8+U6N7k
 xAbXEtMyKf/faeh1lawU5kwfT3E6Wy0rTQ5QERHAt6NVjJ1DdVKsNtwmmB4eXkZumX
 s0qkSMeKyQbAiOT5ozjwAxPlyPDV7Zg+to24SS0nvp7oex+F10NyB+ax9Vn5ShVvzK
 Z8te27GrRgIwob/Vi5X2zadr+Q2ACUKhB7gIN56o+pBApMCXIO8IYkSbX8jz5zYd0m
 MMukOD4clitxdcEa2BeAq79ezlu9vZ9bFljGbxJpy3pQ63EFOdkNheKmQL3yMnzbUJ
 c5nRjaoG4seVw==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, Julia.Lawall@inria.fr
In-Reply-To: <20220521111145.81697-76-Julia.Lawall@inria.fr>
References: <20220521111145.81697-76-Julia.Lawall@inria.fr>
Message-Id: <165459871980.301808.7235614685174421255.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:19 +0100
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, mcoquelin.stm32@gmail.com,
 arnaud.pouliquen@foss.st.com, Jaroslav Kysela <perex@perex.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: dfsdm: fix typo in comment
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

On Sat, 21 May 2022 13:11:26 +0200, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: dfsdm: fix typo in comment
      commit: 2685d5046962f018b1a155b3eef316562414638b

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
