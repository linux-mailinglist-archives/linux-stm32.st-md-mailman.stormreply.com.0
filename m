Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6DF260432
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Sep 2020 20:06:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A78ECC3FAE2;
	Mon,  7 Sep 2020 18:06:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E50B7C3FADF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Sep 2020 18:06:50 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2C952078E;
 Mon,  7 Sep 2020 18:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599502009;
 bh=W1iDqsIlJuCF7NJOcqH4rH5wkAbpEm3VAXrL3oEGahU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=VNsOcR5f4UVfNytv+yIwc1owalt4qghz9kIWh/kqV/OVlRvVddQxSkeSuHR+k51hs
 oYYkFsr0+49wR76K0YR1TeXpF3/EuGh3OIsZA7LquyNqzF9E7Vo2JFXv2DmQ3/hMcS
 4m/v0NMTDNbS+KI20AWUMaPNNPhsem5x15dIbYAU=
Date: Mon, 07 Sep 2020 19:06:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>, linux-spi@vger.kernel.org
In-Reply-To: <20200905151913.117775-1-marex@denx.de>
References: <20200905151913.117775-1-marex@denx.de>
Message-Id: <159950195999.52926.14905827506055172230.b4-ty@kernel.org>
Cc: Antonio Borneo <borneo.antonio@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: Rate-limit the 'Communication
	suspended' message
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Sat, 5 Sep 2020 17:19:13 +0200, Marek Vasut wrote:
> The 'spi_stm32 44004000.spi: Communication suspended' message means that
> when using PIO, the kernel did not read the FIFO fast enough and so the
> SPI controller paused the transfer. Currently, this is printed on every
> single such event, so if the kernel is busy and the controller is pausing
> the transfers often, the kernel will be all the more busy scrolling this
> message into the log buffer every few milliseconds. That is not helpful.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: Rate-limit the 'Communication suspended' message
      commit: ea8be08cc9358f811e4175ba7fa7fea23c5d393e

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
