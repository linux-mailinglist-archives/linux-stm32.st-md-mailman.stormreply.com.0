Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDD0998CAA
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2024 18:03:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97F43C71290;
	Thu, 10 Oct 2024 16:03:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDA4FC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 16:03:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C422F5C5FB4;
 Thu, 10 Oct 2024 16:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A24C4CECC;
 Thu, 10 Oct 2024 16:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728576182;
 bh=rAq/G8gwCb1+rwQzT/Y8bXAu/xz5ci3OpT4Ooh+KTUI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CHfk2wExM4tvXO7/iZhHlO35in43YiPzcfc1UARpkPfi428kghCZ2aPybwWAJalB3
 BAuDAKRqLLeKEHcEUJHzEHBydE8WvBiEP0OoHf83xTssqg1TN5OLIWQ188DdAHRvp2
 8bYeZ8q9SjEE9De7uiMYEcrNcI2ZH2awrpUGy/U9XQJCFbKRRrztXW48D1DZrKyLKQ
 V5NESYJB0TXLaW3CvyWwugOlUrLGDVhdG8VAtt+EzDcjfWOVDxQm36UVxZ3aBcLBK+
 MNauGk907pjUcT5f8EoqjFzaAadp3KmJVH2A0PGtsFPM6WBTSqMZ4IV75e8r8WYPga
 iCtjwE8+L1xSg==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Valentin Caron <valentin.caron@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>
In-Reply-To: <20241010-spi-mp25-device-fix-v2-1-d13920de473d@foss.st.com>
References: <20241010-spi-mp25-device-fix-v2-1-d13920de473d@foss.st.com>
Message-Id: <172857618035.3841267.4703963999206968322.b4-ty@kernel.org>
Date: Thu, 10 Oct 2024 17:03:00 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-99b12
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: fix missing device mode
 capability in stm32mp25
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

On Thu, 10 Oct 2024 15:33:03 +0200, Alain Volmat wrote:
> The STM32MP25 SOC has capability to behave in device mode however
> missing .has_device_mode within its stm32mp25_spi_cfg structure leads
> to not being able to enable the device mode.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: fix missing device mode capability in stm32mp25
      commit: b5a468199b995bd8ee3c26f169a416a181210c9e

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
