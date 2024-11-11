Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 898809C42DF
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 17:44:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C43DC78F66;
	Mon, 11 Nov 2024 16:44:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDB5AC78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 16:43:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 25EF15C5B64;
 Mon, 11 Nov 2024 16:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD48C4CED7;
 Mon, 11 Nov 2024 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731343435;
 bh=+THKv8bFBNp01IW6Q6So54Rj6RkeI0Ny3NWfKq5gGK4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BLtK4rKL+gpP+pQFX/tBVJ+hUGq8ay9mokFf+ENetcB3Ytp3YNQJcFwiroTwhNW3l
 wOOTS6vcYOW3P3ldDnuKW4W/yrkawF6FTVY80esbz23/p79sQxOl5S1JWvCL157Z2C
 bE7Krbjjdh5Wqp2d0tFDRXOVlioooHJWWZGTmeodd+ZXSjIGJYdYqp/iEAvuZIwo9t
 TFF1DyePzhqw/NgfPGnJUjvrrWOzCfjj3pYCg2kXUkJvjtc4KxtIKq2+3PGlcH356k
 34+Bv3Q59sxsyWscJi2OpZ/okO3Z2LkkHrXU4+ReSF0iTpbVBmtopXuHAqueCypLRR
 yKmLuiqlz2RxQ==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20241105135942.526624-1-olivier.moysan@foss.st.com>
References: <20241105135942.526624-1-olivier.moysan@foss.st.com>
Message-Id: <173134343208.341130.17895048996231459327.b4-ty@kernel.org>
Date: Mon, 11 Nov 2024 16:43:52 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-355e8
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: dt-bindings: stm32: add missing
	port property
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

On Tue, 05 Nov 2024 14:59:41 +0100, Olivier Moysan wrote:
> Add missing port property in STM32 SPDIFRX binding.
> This will prevent potential warning:
> Unevaluated properties are not allowed ('port' was unexpected)
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: stm32: add missing port property
      commit: 98d34ddd43de0b040bd3ff74b511be7074b0b310

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
