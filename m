Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B852998CA9
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2024 18:03:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6F5BC7801E;
	Thu, 10 Oct 2024 16:03:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF5E4C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 16:03:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3DE275C54D1;
 Thu, 10 Oct 2024 16:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4D1C4CEC5;
 Thu, 10 Oct 2024 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728576180;
 bh=qO2e+Fo8aDijI9cY8k1x9aHsA25fUoVeZlkJc7wbkm0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GdGULnfau88P5RpasMhVI2WJ7T9sAHMpAcQe+3+pKL7eA7xBHjWhICKBDFt36aoZE
 R5tCbWoGciIzvhJvhx6R3C/Vn9JSPfiVSeFbRtulvC7pEY/CycmI42a2X0vErJF4oj
 H4DQ8tNy5ttYtKz8rQ9bbwak2ELzosXkzHU0ATuRG7rb8+UgXRQF2p1H+vg/I6WJ5Y
 QF8JP85txIPsFym8LJ8Ry/LbRHJxVGduQreUi3DOtA9D0OxDAIQnD+f9Uta9OyG8xR
 Db8Mfa9qgnusS9T/joPgXrfLyyM9Rna5vWecgs0bcOTBZWgYVDNsbi+fvC3EHdwSYg
 hF76oEvk0mmXg==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Valentin Caron <valentin.caron@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>
In-Reply-To: <20241009-spi-mp25-device-fix-v1-1-8e5ca7db7838@foss.st.com>
References: <20241009-spi-mp25-device-fix-v1-1-8e5ca7db7838@foss.st.com>
Message-Id: <172857617679.3841267.4084268172252047791.b4-ty@kernel.org>
Date: Thu, 10 Oct 2024 17:02:56 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-99b12
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix missing device mode
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

On Wed, 09 Oct 2024 18:15:52 +0200, Alain Volmat wrote:
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
