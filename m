Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B8874FA8A
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 00:04:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 520A0C6B457;
	Tue, 11 Jul 2023 22:04:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD2D9C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 22:04:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 890F8615FF;
 Tue, 11 Jul 2023 22:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF5FC433CC;
 Tue, 11 Jul 2023 22:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689113049;
 bh=1qUIYTa5qH+71pJpjqPgB4HJsLDFKxPRZi5HFjGOMLs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oOEPJja8myKtu19uf9CQ22ifaq3vPiL2ri5Z2xQ2P/8FEMrI+Wt5t3BMttW+5e8ou
 VclyQXWp77ziXpg6foLd9+45yaV4m7qByHvMf9Q8VyG0SFYLgVu3h17u9rYSLzukGx
 9CzwkBdcJl6WHekct/4Mtj46BZIUkzpPHRE1z9DaAdlIYJIpQGaM76D4EQbdkokyJ5
 cDeIXQjItFmtOo6M0MzYsiDUmWwOwgA0GncP9pnNTGrm2Eu70zMz7VXip1FLLKwJvH
 u4KHioJPeJEjJmoGa8bz42SHinZoDFyx6Yku+vcpkIAnm3eqJSC6kh69vUoU0TKchz
 FRZtXi2ZOAVEQ==
From: Mark Brown <broonie@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
In-Reply-To: <20230706081342.468090-1-valentin.caron@foss.st.com>
References: <20230706081342.468090-1-valentin.caron@foss.st.com>
Message-Id: <168911304710.642798.3178025159634647364.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 23:04:07 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] spi: stm32: disable device mode with
 st, stm32f4-spi compatible
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

On Thu, 06 Jul 2023 10:13:42 +0200, Valentin Caron wrote:
> STM32 SPI driver is not capable to handle device mode with stm32f4 soc.
> Stop probing if this case happens.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: disable device mode with st,stm32f4-spi compatible
      commit: fee681646fc831b154619ac0261afedcc7e671e7

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
