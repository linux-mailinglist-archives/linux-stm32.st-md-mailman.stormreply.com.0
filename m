Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E72CD9C8E45
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 16:36:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B5D2C7A82E;
	Thu, 14 Nov 2024 15:36:13 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D286C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 15:36:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6C9F4A4150A;
 Thu, 14 Nov 2024 15:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C9FC4CECD;
 Thu, 14 Nov 2024 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731598565;
 bh=c+QtyugjOQ3i5dvHqnYIoLWX152YPjrTGXRzntFQuQw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OVNQnGG4/atn0pvBVfywdQNfSoFZUzXEKhLrySyKPqBzmyY+ARm8iuYuhVfpeHUJW
 WEWVQbIbc7Rw5XZDGykgKrnPsOig8GBILoHY/LjsZJqNCGFa/tk51XrMN5Qo+VXaj9
 xkRrooSUGTm+F4UM0ZO/5XEDirB7nL/x3rK103a9hvMMQtUvyMimqDMdmrI3/ZZGsV
 8hWKe6HvmOjIPYeoeFwrVsQGpqrXdgOImj9KbL5VEavs8w2DS0enqg0VYgrfie6iTD
 FcyXwstDXwBg4RoGkXvWVqNt9n2k3ogeQ7nyuks/SjkDhhazwDMf4U4flygTy8F8Ng
 arcklwJFfExew==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20241114102851.2497942-1-olivier.moysan@foss.st.com>
References: <20241114102851.2497942-1-olivier.moysan@foss.st.com>
Message-Id: <173159856240.505512.17591660886281127681.b4-ty@kernel.org>
Date: Thu, 14 Nov 2024 15:36:02 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-355e8
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: dfsdm: change rate upper
	limits
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

On Thu, 14 Nov 2024 11:28:51 +0100, Olivier Moysan wrote:
> Increase rate upper limit to 192kHz to reflect the rate range actually
> supported by the STM32 DFSDM peripheral.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: dfsdm: change rate upper limits
      commit: ba888450828befb0607219f34c03aa8645625447

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
