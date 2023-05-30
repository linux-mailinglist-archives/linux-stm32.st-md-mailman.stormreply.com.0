Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A1E71670E
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 17:30:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E50C5C6A613;
	Tue, 30 May 2023 15:30:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C5E6C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 15:30:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D83763292;
 Tue, 30 May 2023 15:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BB1C433EF;
 Tue, 30 May 2023 15:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685460607;
 bh=Beb3RsFF4BhoGVJ49Ey5uypg474z6jd7D6NAu8DXOQI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Zb3cLGg37Y31IcEshJFJn/+CSxgmdFhJ/pa6bES39riOjBTKNtYfv+VMHXg1SGX0a
 9aXixZyOuT+63q/ho9GwnOEslPIDWqZYWKjHzdifvCG43XymDfHpjB0tbOph1JBD5h
 nwIyUOOxl3nusTfJ5eUT7h8ig+weLjqzbPhKQhS87GShFwHdIDB+NQsgfiHg6ayjrn
 iCGtB16QybYYXMHTLCaMp2H8BGGM7NJ3oU3klzplZRK6TsElqZn6dj59SL1WWCaua/
 6/+e41JTRuIBwStQ7XSdTuTlQ3yw1Ri9+prghAOZqyR4/T90XI0zXkOU/uNtOSG9ZZ
 P5SXgKqthwYsQ==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>
In-Reply-To: <20230518023946.530381-1-marex@denx.de>
References: <20230518023946.530381-1-marex@denx.de>
Message-Id: <168546060437.564321.9613326589114474794.b4-ty@kernel.org>
Date: Tue, 30 May 2023 16:30:04 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-bfdf5
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] [RFC] regulator: stm32-pwr: Fix regulator
	disabling
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

On Thu, 18 May 2023 04:39:46 +0200, Marek Vasut wrote:
> The following shows up in the kernel log on systems using the STM32MP15xx USBPHYC:
> "
> regulator regulator.19: regulator disable timed out!
> reg18: failed to disable: -ETIMEDOUT
> "
> This 'regulator.19' is 'pwr@50001000' 'reg18' in stm32mp151.dts DT, or
> "Power control (PWR)" register "PWR_CR3" bits "REG18" on STM32MP15xx
> reference manual.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: stm32-pwr: Fix regulator disabling
      commit: 959c34765cf1d0688077ec5f41f9b71a9e70a6f1

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
