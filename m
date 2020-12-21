Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C78962DFEFF
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Dec 2020 18:30:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66006C56611;
	Mon, 21 Dec 2020 17:30:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BAEBC3FAE2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Dec 2020 17:30:37 +0000 (UTC)
From: Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Roman Guskov <rguskov@dh-electronics.com>, linux-spi@vger.kernel.org
In-Reply-To: <20201221123532.27272-1-rguskov@dh-electronics.com>
References: <20201221123532.27272-1-rguskov@dh-electronics.com>
Message-Id: <160857182009.9832.11490882818266811084.b4-ty@kernel.org>
Date: Mon, 21 Dec 2020 17:30:20 +0000
MIME-Version: 1.0
Cc: marex@denx.de, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: FIFO threshold level - fix
	align packet size
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

On Mon, 21 Dec 2020 13:35:32 +0100, Roman Guskov wrote:
> if cur_bpw <= 8 and xfer_len < 4 then the value of fthlv will be 1 and
> SPI registers content may have been lost.
> 
> * If SPI data register is accessed as a 16-bit register and DSIZE <= 8bit,
>   better to select FTHLV = 2, 4, 6 etc
> 
> * If SPI data register is accessed as a 32-bit register and DSIZE > 8bit,
>   better to select FTHLV = 2, 4, 6 etc, while if DSIZE <= 8bit,
>   better to select FTHLV = 4, 8, 12 etc

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: FIFO threshold level - fix align packet size
      commit: a590370d918fc66c62df6620445791fbe840344a

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
