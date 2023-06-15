Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AD87319B5
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 15:16:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AB90C65E58;
	Thu, 15 Jun 2023 13:16:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7574FC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 13:16:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3AF1D60FAA;
 Thu, 15 Jun 2023 13:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BB8C433C8;
 Thu, 15 Jun 2023 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686834962;
 bh=BZz7VgE7FZsHyhQC20/TP0fYQCt9kxxbS+7BpFxp0Qg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ONIbZw9nFYdVAI8RzqPvNfyDIkAQ1WIVTIL3GcbFQ6BxtBYOxrwysYJuk22+zeGMN
 Sga/nSXVvexeb2lhSdEwomGBeq6VwBBGKlHopueeoFrWZ15yqzeSIHAi4cNtdTdUxt
 UwVS7TTNYCQhDUHMTmX8qwX21OdbY2sDggdiUcY+t2Rb8jPFCv/jptT5V+zWN9xWi5
 bV6ol0zgnOl0HKUOUBgw0n4mtsQ20IQ8jXwoyIHOuIhwuOhACpr/6UtOp5W/RtDWLo
 BgGT5FQbzSxJ5em79FWybn+N5Qfm+M2X0c464X6tyrQ1+BMTcyI/37IcCM9S6WbIes
 dDYoVTAKJmJyg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Valentin Caron <valentin.caron@foss.st.com>
In-Reply-To: <20230615075815.310261-1-valentin.caron@foss.st.com>
References: <20230615075815.310261-1-valentin.caron@foss.st.com>
Message-Id: <168683495795.547441.10667645380315680455.b4-ty@kernel.org>
Date: Thu, 15 Jun 2023 14:15:57 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-c6835
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 0/4] spi: stm32: add spi device mode
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

On Thu, 15 Jun 2023 09:58:11 +0200, Valentin Caron wrote:
> STM32 SPI can operate in device mode.
> This series adds this functionnality in spi-stm32 driver.
> 
> Since v2:
>  - Rename this series: spi device mode
> 
> Since v1:
>  - Do not add #address-cells and #size-cells in st,stm32-spi.yaml
>  - Do not add cs-gpio description in st,stm32-spi.yaml
>  - Do not add st,spi-slave-underrun property to handle spi slave underrun
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] spi: stm32: renaming of spi_master into spi_controller
      commit: 6f486556abe35f2e6684f95241acbc463342d3eb
[2/4] spi: stm32: use dmaengine_terminate_{a}sync instead of _all
      commit: 4f2b39dc2d14d4fc55d7a3a140ac07eaa761b701
[3/4] dt-bindings: spi: stm32: disable spi-slave property for stm32f4-f7
      commit: e6afe03351ac81fbc4f2b93bf3b356f7b662939d
[4/4] spi: stm32: introduction of stm32h7 SPI device mode support
      commit: e40335fcb89acb274d05deffad9225e973278ec9

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
