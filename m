Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 498E261809B
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Nov 2022 16:08:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03A59C6411D;
	Thu,  3 Nov 2022 15:08:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98C8AC035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Nov 2022 15:08:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B09F61F0D;
 Thu,  3 Nov 2022 15:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25534C433D6;
 Thu,  3 Nov 2022 15:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667488102;
 bh=KhRW53DoqMIL02J6y2okdVdA8j0iIM0VREqjEufLwkM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BggIhs21AGl3tcUI1M35R8FkXZUaa16Ldc6OBqymKfDnolM+r30o6tE6zI+/qzHdU
 m4xkeaLBPUANkFqc3ZUGCc8SKB5iuCZ9SUF5Hbyp2SMPYTXoNwrGg/X3ls5A3SV8Og
 0XaWZJLVcnUu73kof2GiMUkOwj950T2ocNPnRxgYBQENcYWmiEn7nWjKmalul1JY9r
 mZhk8jGuEYR8/9N5QkSdYgyHtkxmtBRIc5BdLIVec1gpJvul7kpifhP+gdBEFcws98
 ZiI0osnH+g0aOzEOBVZ9AicdMxchQnL80eMSc18YVKDjX678KCCbT4WBOnP2h5F2K0
 OIGDqup0y4QHw==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sean Nyekjaer <sean@geanix.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>
In-Reply-To: <20221103080043.3033414-1-sean@geanix.com>
References: <20221103080043.3033414-1-sean@geanix.com>
Message-Id: <166748810082.250043.8488161005893728423.b4-ty@kernel.org>
Date: Thu, 03 Nov 2022 15:08:20 +0000
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix stm32_spi_prepare_mbr()
	that halves spi clk for every run
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

On Thu, 3 Nov 2022 09:00:42 +0100, Sean Nyekjaer wrote:
> When this driver is used with a driver that uses preallocated spi_transfer
> structs. The speed_hz is halved by every run. This results in:
> 
> spi_stm32 44004000.spi: SPI transfer setup failed
> ads7846 spi0.0: SPI transfer failed: -22
> 
> Example when running with DIV_ROUND_UP():
> - First run; speed_hz = 1000000, spi->clk_rate 125000000
>   div 125 -> mbrdiv = 7, cur_speed = 976562
> - Second run; speed_hz = 976562
>   div 128,00007 (roundup to 129) -> mbrdiv = 8, cur_speed = 488281
> - Third run; speed_hz = 488281
>   div 256,000131072067109 (roundup to 257) and then -EINVAL is returned.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: fix stm32_spi_prepare_mbr() that halves spi clk for every run
      commit: 62aa1a344b0904549f6de7af958e8a1136fd5228

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
