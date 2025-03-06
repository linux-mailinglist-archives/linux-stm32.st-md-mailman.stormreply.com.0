Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6BDA55044
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 17:10:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61141C7801E;
	Thu,  6 Mar 2025 16:10:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D805CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 16:10:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 314CE5C5807;
 Thu,  6 Mar 2025 16:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E12C4AF09;
 Thu,  6 Mar 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741277441;
 bh=dO5KuEHT5N6JPz0mZT1IGgNKs9grKUWa+Hx4+yx3kc4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JCqBfelle7bd3f+VaMdYkAAJYOLVyqPuRy+iagi9Fuw7JAId6/MsywpvuUBHTwnq1
 KvNpYZCs3czm870bWeKDTn0jRE0gxCsoMYcIrC5aYwe5zx/2k9GYF0rw9epTuSDhUV
 S0lLbFRV6Ur7yI9KI0CV5CJguD66+/7N1mtPAc6kcrNYarmwS6dTZSHWzB2SZhLc0f
 Z+lCGPXOl3bMpSMFPt078zrZtRfxTWL2o3ldBZqMbFYKHtYm4jHknp88vi7GI+GY8V
 BuL7zfDzeiyVfRUcZqHoX0TT6Yh8JmS0UYqTnAGpkX09C/tWXrJzOM7bg+FSs6SCkt
 wmh0cJSryQ2bA==
From: Mark Brown <broonie@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <bc4c9123-df43-4616-962f-765801d30b4c@stanley.mountain>
References: <bc4c9123-df43-4616-962f-765801d30b4c@stanley.mountain>
Message-Id: <174127743980.139137.18227484559909848489.b4-ty@kernel.org>
Date: Thu, 06 Mar 2025 16:10:39 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-1b0d6
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH next] spi: stm32-ospi: Fix an IS_ERR() vs
 NULL bug in stm32_ospi_get_resources()
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

On Thu, 06 Mar 2025 12:48:34 +0300, Dan Carpenter wrote:
> The devm_ioremap() function returns NULL on error, it doesn't return
> error pointers.  Fix the check to match.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Fix an IS_ERR() vs NULL bug in stm32_ospi_get_resources()
      commit: 7dfc9bdde9fa20cf1ac5cbea97b0446622ca74c7

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
