Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 958F63B86D9
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 18:11:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47BA8C56630;
	Wed, 30 Jun 2021 16:11:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEF0DC424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 16:11:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84CE661456;
 Wed, 30 Jun 2021 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625069462;
 bh=Mn6BvXNRp0phAqi6zTdlYuSEGtWIvr3Z3ZC/zZJaBEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gLwnimKq6hyYCW3BqM/23ionIcvsfNBkyoMyHgU6iSp0WZLTbGdggsInvc8h+FuOe
 3iGMY/PoI4WTYi38sKKhiRmbVjWM3eVIGyQXRgEiLQ1PHyh1ZuPJvdtJEVleNyPcok
 r3dwu6rey7IERKoRrDWAn8GxR1d3P5D8JouEJ0PjtWGcIJwB74BLBbkdNg2A7vvzcg
 +M+UzKQKvOiIhmlZReIl4DYBlfNXmRRaEgZl4MLszvikVmbj7G8ZLE2Aa34kS5Vi7v
 XJ3VS4kHXwM/QR1MG+Ld9PCBsXc8oEaOTWtNX0LQI+4msrfaKjPekp9V19suP89V9Y
 qRLv+zdKwPzTQ==
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>,
	amelie.delaunay@foss.st.com
Date: Wed, 30 Jun 2021 17:10:30 +0100
Message-Id: <162506903591.43818.15164606693002988349.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1625042723-661-1-git-send-email-alain.volmat@foss.st.com>
References: <1625042723-661-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Cc: Mark Brown <broonie@kernel.org>, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH 0/6] spi: stm32: various fixes &
	cleanup
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

On Wed, 30 Jun 2021 10:45:17 +0200, Alain Volmat wrote:
> This series contains fixes & cleanup mainly regarding fifo
> and the way end of transfer triggered, when used with or
> without DMA.
> An additional patch cleans up the pm_runtime calls.
> 
> Alain Volmat (5):
>   spi: stm32: fixes pm_runtime calls in probe/remove
>   spi: stm32h7: fix full duplex irq handler handling
>   Revert "spi: stm32: properly handle 0 byte transfer"
>   spi: stm32h7: don't wait for EOT and flush fifo on disable
>   spi: stm32: finalize message either on dma callback or EOT
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/6] spi: stm32h7: fix full duplex irq handler handling
      commit: e4a5c19888a5f8a9390860ca493e643be58c8791

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
