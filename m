Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF556D6720
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 17:21:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5008C6A603;
	Tue,  4 Apr 2023 15:21:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99B32C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 15:21:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57A45635CE;
 Tue,  4 Apr 2023 15:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4005DC4339C;
 Tue,  4 Apr 2023 15:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680621661;
 bh=5G84N3XbT0auoxdD1TsB8mJL7Tr2AtnwhLeyQfvCGyE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mdZ00DnEP42M/QLiaDjNAR4LQPlmFUIrhDOwPIY76iX/H5pTWCfMyEL4gVo6q8xRN
 MliVhxpvYBs/BzxpfIovntA/TSh1Aeo8TCSUT0HEWvg5szwBlRf6BVxROP7PiNvVn7
 pyiSUIUkDM0gdq4fWowFgIkUWyCR+b4CLY6sc256ngSyPsBwrEHzIwnOqq9FTpJjpz
 YNGrDQFlhiBRUBk8UEh7jGBC6o/B2q12FxHMHPwl0djF85IxZyfGrquEBc9BJPErN4
 zSeiDA1O6mZXvis7qCwc/13ETtVr1qtqG93wwLEV3tb7IFLrYuYe2xLtKzKGz31DIJ
 4K6/FnFQOc+qQ==
From: Mark Brown <broonie@kernel.org>
To: Yang Li <yang.lee@linux.alibaba.com>
In-Reply-To: <20230328061839.82185-1-yang.lee@linux.alibaba.com>
References: <20230328061839.82185-1-yang.lee@linux.alibaba.com>
Message-Id: <168062165893.53383.15724461693571159313.b4-ty@kernel.org>
Date: Tue, 04 Apr 2023 16:20:58 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-00303
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] spi: stm32: Use
 devm_platform_get_and_ioremap_resource()
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

On Tue, 28 Mar 2023 14:18:39 +0800, Yang Li wrote:
> According to commit 890cc39a8799 ("drivers: provide
> devm_platform_get_and_ioremap_resource()"), convert
> platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: Use devm_platform_get_and_ioremap_resource()
      commit: 75c1b5fc493c21ebe524e9e5bb8501bb351ad94a

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
