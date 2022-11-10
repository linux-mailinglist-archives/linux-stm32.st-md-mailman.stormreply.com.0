Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCC5624A27
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Nov 2022 20:04:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7CCDC6505D;
	Thu, 10 Nov 2022 19:04:29 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5365DC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 19:04:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A5AB8CE225C;
 Thu, 10 Nov 2022 19:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BAFC4347C;
 Thu, 10 Nov 2022 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668107066;
 bh=P84Ae0OVSjLriM+LMwCx/4pQY5c2hZAQryWUgrF5sKs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MdCBhY/ZxXyc2FJPPprOdUJVW6KsAQuyH506It9HaZHpZM84C4O1qhUqcdDrFxEIn
 9ATgl+41Nt7d9xv0B6Me5lb1MWFCos1ONMK7ly80XhS7TmefG/quxkOUv7JGXKc6Js
 f4kzDU3SGs/k86bxQBHpU1CltDzMpNI0zx4wgcu9kKhexxwK7p+90MoHy0WSyBiDLJ
 oJbysYsZPuqOEzQ68zI1kVC7vkwhMl+UdqdayeWqYqSp55hWb8W5z8qnBqvus+iSU7
 ElULPMqvMPhJQKEBBKqs+ravPC3yDL4alE+RDMUH3OO0Zv6EkHNcXUEzshJR/mZ97a
 0ag2bK5TrdlHA==
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20221110084406.287117-1-olivier.moysan@foss.st.com>
References: <20221110084406.287117-1-olivier.moysan@foss.st.com>
Message-Id: <166810706385.995851.10605818222907923454.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 19:04:23 +0000
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: i2s: remove irqf_oneshot flag
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

On Thu, 10 Nov 2022 09:44:06 +0100, Olivier Moysan wrote:
> The IRQF_ONESHOT flag allows to ensure that the interrupt is not
> unmasked after the hard interrupt context handler has been executed
> and the thread has been woken. The interrupt line is unmasked after
> the thread handler function has been executed.
> 
> The STM32 I2S driver does not implement a threaded IRQ handler.
> So, the IRQF_ONESHOT flag is not useful in I2S driver.
> Remove this flag to allow the interrupt routine to be managed
> as a thread in RT mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: i2s: remove irqf_oneshot flag
      commit: 7c0f8f1462c9edeaa202a2cbea1bde0960434b09

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
