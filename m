Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2921A5A7E36
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Aug 2022 15:04:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9AB8C03FDB;
	Wed, 31 Aug 2022 13:04:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0123C03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 13:04:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FCAB61A15;
 Wed, 31 Aug 2022 13:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D3EC433C1;
 Wed, 31 Aug 2022 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661951044;
 bh=RSI4EOwQ+8AxbiJ/TcfxFRbL8c6SneehjW86TBWE2t0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=q2nRvBXZwapTVPpgTrknqzCUAIK9LuQlJp085kuXCzQp2GW/xX+EvBvXIS3o/fLVD
 FTcaT4VEtdu4twrIr++RNpEQiryUwCtil+VtQGs1W/kL0fypw2M+HyIeZ2vk5EPe7q
 bbqb5+vFpqoZxss1heRJoYysNEu5Up6B5n9GGAxSRJxDtlpYROVTvAFl/5QkelktFf
 jj/+3hzvuxttQdU9Dp7tyG257flFYRjxuVJPmjYpJvkqOiEzyci+TTRR9WrgvrFZy9
 fotJMvEVPTfXheB4VwXN4ZckJT5hfs0mbmBC0NLKCVoS9h8o0iHvfbbnX0XOLBG9x0
 13yP17Fw4uaBg==
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220830182821.47919-1-andriy.shevchenko@linux.intel.com>
References: <20220830182821.47919-1-andriy.shevchenko@linux.intel.com>
Message-Id: <166195104216.267626.16919953203529886429.b4-ty@kernel.org>
Date: Wed, 31 Aug 2022 14:04:02 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-0c1df
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v1 1/2] spi: stm32-qspi: Replace
	of_gpio_named_count() by gpiod_count()
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

On Tue, 30 Aug 2022 21:28:20 +0300, Andy Shevchenko wrote:
> As a preparation to unexport of_gpio_named_count(), convert the
> driver to use gpiod_count() instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: stm32-qspi: Replace of_gpio_named_count() by gpiod_count()
      commit: eea0e7d20d6dab38522ac0a3af61fd92c53c34f6
[2/2] spi: stm32-qspi: Refactor dual flash mode enable check in ->setup()
      commit: c9448aa41ac7dd223a6bef79e71d6c168593ebb7

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
