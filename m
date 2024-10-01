Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E949F98C4D4
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2024 19:53:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9590AC71290;
	Tue,  1 Oct 2024 17:53:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1315CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 17:53:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6A7F75C54D0;
 Tue,  1 Oct 2024 17:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DFFC4CECD;
 Tue,  1 Oct 2024 17:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727805200;
 bh=an7wYpPqt2R7TgWMl+pfDAOwZGn/V/Z9kjfDwk8AGtA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cUdghwbcOytt1+ZkD7mUFJTbf/S5CMvNfpMdxCoMCRjb3Gib8E0qpdGuw420cw4SJ
 H5iuDfEMa6Hu5CC6IhlEnYXq+dydv+v7X5cXQASyim/FHy0AlkOen/bBGH+A95+lse
 boaoG5uvecAMEuVuoox0RlBGUdUbh9PZkrp6rfcZHDS6qizBPnFQjvLg/UETTWPSoD
 /mQwjT21NzQLvLGAFOJFeN2ZDaSKupMHZkgfaahikJL5F2EeMXPZssXYv6H+E9+GoZ
 oKDEzufB2pjrOMgzxh38CbZvRgQuGYEQkCqj6O2ciglGUl/OpJvNv/soOV7FwE3LR4
 bvMHn35L2HYbw==
From: Mark Brown <broonie@kernel.org>
To: Tim Harvey <tharvey@gateworks.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
References: <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
Message-Id: <172780519475.2298697.14049924817371991791.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 18:53:14 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-99b12
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] {ASoC,
 media}: constify snd_soc_component_driver when used as read-only
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

On Mon, 29 Jul 2024 11:37:36 +0200, Javier Carrasco wrote:
> Declare `snd_soc_component_driver` as const to move their declarations
> to read-only sections for the drivers that do not modify the struct
> after its declaration.
> 
> Apart from a single case under media/, the affected drivers are members
> of the ASoC subsystem.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] media: i2c: tda1997x: constify snd_soc_component_driver struct
      (no commit info)
[2/2] ASoC: constify snd_soc_component_driver struct
      commit: 8adff2ff73d8271c993549b106b26f301fa003cf

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
