Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0720EAA5B1E
	for <lists+linux-stm32@lfdr.de>; Thu,  1 May 2025 08:38:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB211C78F61;
	Thu,  1 May 2025 06:38:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22027C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 May 2025 06:38:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 75E134405D;
 Thu,  1 May 2025 06:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE5AC4CEE3;
 Thu,  1 May 2025 06:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746081486;
 bh=UAP2AV+qSbFSO/2/N++l3ypruXuDaFFIRSPyTIofkqg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nTK9N3wFBMkhJe08xeOfs0C9EN4ztFCTh7V3x7cbBbR0jT5Wd68xB2EcCgKupe7vj
 DMnGWRYowzYv7KdRIGvxdPra3V571FpD5SgH8wudI2jmNigkHtleguUE+3hymi62DU
 ZcE9DY186mYo9CyQGHEOOzs3DiVTx/VTfjCiBQzDjJVPbqICnlWzA+J37d/A9NYhHT
 lkBQwunLyYBoI+uT+Ge9aPReAx+9quY0zhLB/ZaJCj9Vy1rvPPrsnLU6ZHGuAYNfq0
 KVL3zmVq2VcijwmMSIIYIOnxBMZOUydXa6wZbr/pHZi9T5mp0RB25OswPcvHuiLF9k
 I5+ojStYAwv+g==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20250430165210.321273-1-olivier.moysan@foss.st.com>
References: <20250430165210.321273-1-olivier.moysan@foss.st.com>
Message-Id: <174608148419.4032397.674149169345577452.b4-ty@kernel.org>
Date: Thu, 01 May 2025 15:38:04 +0900
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/2] ASoC: stm32: sai: fix kernel rate
	configuration
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

On Wed, 30 Apr 2025 18:52:07 +0200, Olivier Moysan wrote:
> This patchset adds some checks on kernel minimum rate requirements.
> This avoids potential clock rate misconfiguration, when setting the
> kernel frequency on STM32MP2 SoCs.
> 
> Olivier Moysan (2):
>   ASoC: stm32: sai: skip useless iterations on kernel rate loop
>   ASoC: stm32: sai: add a check on minimal kernel frequency
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: stm32: sai: skip useless iterations on kernel rate loop
      commit: edea92770a3b6454dc796fc5436a3315bb402181
[2/2] ASoC: stm32: sai: add a check on minimal kernel frequency
      commit: cce34d113e2a592806abcdc02c7f8513775d8b20

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
