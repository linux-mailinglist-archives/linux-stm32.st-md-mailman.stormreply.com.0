Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD96B07C0D
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jul 2025 19:31:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AE73C3F938;
	Wed, 16 Jul 2025 17:31:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17410C3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jul 2025 17:31:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A56E0448AA;
 Wed, 16 Jul 2025 17:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44FDC4CEF0;
 Wed, 16 Jul 2025 17:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752687061;
 bh=PaXYTlyE1AmCd9f7kz8r4SkpNALOlTX1xFZrFy9kj0A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RIsPrqhyv6e9Qxaf7h3jN09thDJp15IZQO/mwKshVTqYWa95vzhXZlSxH4erTUW1/
 N1F+kqa3Fi0D3Jk5hEhCKwaEXoq64BRYzpY1gqHIcbdfCQWTOavi97qhqzxaEAYnwS
 RoRevb3I2gJBTTmtwLo6Szt/gjD56GbFshfWMcfcEkOScawnBl1UvuHzTa4XhgJSGB
 5yMeBlder1FV2bxGLHEqLTGSaY3GRInR3di0cjC2jMVct8LRagXyHbBusEth12UhoW
 y2OXRTuDA82/dyb5XZ4CwPq4cRG/nOEI2E3sv0x2IQgX+lxtDgrbGBXrDfR/MayeLh
 V1civMqJepi3Q==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <fb2a26a2-119b-4b5a-8d44-b29e2c736081@sabinyo.mountain>
References: <fb2a26a2-119b-4b5a-8d44-b29e2c736081@sabinyo.mountain>
Message-Id: <175268705940.745920.11297005700076211217.b4-ty@kernel.org>
Date: Wed, 16 Jul 2025 18:30:59 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH next] spi: stm32-ospi: Fix NULL vs
 IS_ERR() bug in stm32_ospi_get_resources()
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

On Tue, 15 Jul 2025 18:01:39 -0500, Dan Carpenter wrote:
> This code was changed from using devm_ioremap() which returns NULL to
> using devm_ioremap_resource() which returns error pointers.  Update
> the error checking to match.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Fix NULL vs IS_ERR() bug in stm32_ospi_get_resources()
      commit: 951a6d8d41289b86a564ee5563ededa702b62b1b

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
