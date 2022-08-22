Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8559C3A8
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Aug 2022 18:05:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E420C64119;
	Mon, 22 Aug 2022 16:05:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DA6CC640F3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Aug 2022 16:05:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9B8A611D7;
 Mon, 22 Aug 2022 16:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15FFC433C1;
 Mon, 22 Aug 2022 16:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661184338;
 bh=uuMiUaC5/wvKmXz9DTRGlt3cPWVNksaOjRNpLBZP8II=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hi3kF0hk4m5sv1XhA3aC5qpqdDppodyhGdiKBL1yZWmGWuoeEgxkjpI23WNPC+Hvw
 d9O85NGNVWGsEedFea2NXA8lfmH8+Z7N3yu3GL+DKLIQsPosVd9DUAtyC2JgTQqQHV
 Ko/HaPwo28OYbjHzUn0PMaA7xPvmTiJ/omsXiZddhDQWsXPk9xC1JNCNw/fNFIAooO
 5FSyszZo89cqH5MxPrPGnQteJN0vjYDk4o4uGV+ZZosE8AaimFpM2eLUtf2unWk/Cd
 G7VDUkUHZUkX+Yst5nVqc9tEeU2hIMHVHUcNudIeJ/mISAvBSe89YYkbPmQ0mXffnH
 +8+hI5q81Qwhg==
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com, krzysztof.kozlowski+dt@linaro.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, robh+dt@kernel.org
In-Reply-To: <20220810093215.794977-1-patrice.chotard@foss.st.com>
References: <20220810093215.794977-1-patrice.chotard@foss.st.com>
Message-Id: <166118433650.209120.13370601331472107366.b4-ty@kernel.org>
Date: Mon, 22 Aug 2022 17:05:36 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fe10a
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v2 0/2] spi: stm32_qspi: use QSPI
	bus as 8 lines communication channel
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

On Wed, 10 Aug 2022 11:32:13 +0200, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> 
> The goal of this series is to allow to use QSPI bus as a 8 lines communication
> channel for specific purpose.
> 
> The QSPI block offers the possibility to communicate with 2 flashes in
> parrallel using the dual flash mode, 8 data lines are then used.
> Usage of DT parallel-memories property is needed to enable dual flash mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: stm32_qspi: Add transfer_one_message() spi callback
      commit: b051161f44d414e736fa2b011245441bae9babd7

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
