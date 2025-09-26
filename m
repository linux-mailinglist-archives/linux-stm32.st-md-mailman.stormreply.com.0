Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30786BA3ADC
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Sep 2025 14:50:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C43BBC3FADA;
	Fri, 26 Sep 2025 12:50:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 131FAC3FAD8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 12:50:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB9A943707;
 Fri, 26 Sep 2025 12:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824FAC4CEF4;
 Fri, 26 Sep 2025 12:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758891002;
 bh=+FntD5D+phS0YBxPxU6QJWpFdofG4rmVfhVcOMJIEYg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KiakMvoMejz3dsRFw2z5k9c0tYclLKa+ETP8FAog0cK1Rlvt9MtPHWM7CzhcpgQpJ
 WG5ZthXXSiKP/Y6djv/m3AmCBQt1mjIz/DxbkmRAqv42w9zmPwrwCUgda/dJ5C6DA0
 R/BphdHlL9qR2L3zy24pEWTeWV7FTVKb6HqGCmk5lqfoKjuW1y4XojGG7BKNgE1LbB
 tQY0rTpOoQLBXL5+ffSbSTwhYr3Bu+/OsstAEYsn244WUOaQotvuhC8S24ZKyALJ7a
 AmgIQFfiW33t35ko4+ZU+ar5gfu+WZ4SqGQ5Mq4dIyGTaSEMSK79Tbot/LaoocgbTe
 TqAVe6OG91/7A==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20250916123118.84175-1-olivier.moysan@foss.st.com>
References: <20250916123118.84175-1-olivier.moysan@foss.st.com>
Message-Id: <175889100028.84679.2534810503622402862.b4-ty@kernel.org>
Date: Fri, 26 Sep 2025 13:50:00 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-56183
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: sai: manage context in
 set_sysclk callback
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

On Tue, 16 Sep 2025 14:31:18 +0200, Olivier Moysan wrote:
> The mclk direction now needs to be specified in endpoint node with
> "system-clock-direction-out" property. However some calls to the
> set_sysclk callback, related to CPU DAI clock, result in unbalanced
> calls to clock API.
> The set_sysclk callback in STM32 SAI driver is intended only for mclk
> management. So it is relevant to ensure that calls to set_sysclk are
> related to mclk only.
> Since the master clock is handled only at runtime, skip the calls to
> set_sysclk in the initialization phase.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: sai: manage context in set_sysclk callback
      commit: 27fa1a8b2803dfd88c39f03b0969c55f667cdc43

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
