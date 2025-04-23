Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7904A988CE
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 13:44:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B6A5C7128A;
	Wed, 23 Apr 2025 11:44:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C837DC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 11:44:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A3C15C60D1;
 Wed, 23 Apr 2025 11:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A09BC4CEE2;
 Wed, 23 Apr 2025 11:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745408667;
 bh=5cQQ2k3EMTyhmzUp7//r0VkHXfsAWm3XNAjUaKxYfeQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KUwF4t6t487uwT0ohnuanuQXtWNurrxiMBebUH6vxSwX5yH0Tw2/KTnMxUDmHBki7
 nbKsWGXM6N2YMMhZ/01UNvhT+W/vhKfCCsf356vtSTOilONszEn/yvXP+KNNrLSahd
 EMPy5RawgUx7sTFvBsGjSaWGI3gI6F1xy1xaKy2lgbe6xoCNhmmJ3k3Vw8yqx2LbaG
 uBMCNyho0hRJXJSr1DZGo1Xp96zUQf3iTX6T5RPXlSU/uzFhY40tZ995cJ0svqMqdN
 0cF3vqjjvdT8shUAEJIBofeEg6b5ZEaOPqOBKcW0K/sa2OJJEg6zz1PYmGE68ydWms
 Y0i9IX+SDeacQ==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
References: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
Message-Id: <174540866515.26715.3420851726467928798.b4-ty@kernel.org>
Date: Wed, 23 Apr 2025 12:44:25 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
Cc: linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-ospi: Fix an error handling
 path in stm32_ospi_probe()
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

On Fri, 18 Apr 2025 13:27:53 +0200, Christophe JAILLET wrote:
> If an error occurs after a successful stm32_ospi_dma_setup() call, some
> dma_release_channel() calls are needed to release some resources, as
> already done in the remove function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Fix an error handling path in stm32_ospi_probe()
      commit: 460b14b0929fa9f658a7e159ef646ce456962ab0

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
