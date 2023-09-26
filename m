Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB047AE8E2
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Sep 2023 11:22:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB93FC6B473;
	Tue, 26 Sep 2023 09:22:58 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10A83C6B462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 09:22:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id ACA6CB80FEE;
 Tue, 26 Sep 2023 09:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34C1C433C7;
 Tue, 26 Sep 2023 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695720177;
 bh=7bQwHcH+xWHqv+nnB0YFhg3IMMKQkz8UhvLE1d7eG8M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=M1xplYQZkL0gLVXD6WWu6NC2lSVGCgPQjwpbfvsjP9D6W5G6vJs3/Zj99PU2el5t9
 1sAWwaQfmb+sBCMvniIPJHBkWynklQ9WZqKyZyYN2h7Fn0Ylmai86/njsMolJSW5lt
 jOdnhXSD9YzXlOqRcAJcRuzICo9zDSkUD8UgCQhRwCThgtlMOPSq9sd14subNz101N
 Y1SJlV2MzEhyUX/DQBxf088+RvlBd1Vd/MlK7vQSQb8EzWyNP5uSVHBuhXoDxN5Eco
 IgXTQBXFY63ITCIKmywywL7ZhnBnop0tmjEDdNkOuARjoy4AqACBsbzYdATlCtGt0O
 BPwpzeok9xgqQ==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Erwan Leray <erwan.leray@foss.st.com>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Rob Herring <robh@kernel.org>
In-Reply-To: <20230914190049.1853136-1-robh@kernel.org>
References: <20230914190049.1853136-1-robh@kernel.org>
Message-Id: <169572017456.2563985.7790100096745250244.b4-ty@kernel.org>
Date: Tue, 26 Sep 2023 11:22:54 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: dt-bindings: st, stm32-spi: Move "st,
 spi-midi-ns" to spi-peripheral-props.yaml
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

On Thu, 14 Sep 2023 14:00:42 -0500, Rob Herring wrote:
> In order to validate SPI peripherals, SPI controller-specific child node
> properties need to be in a separate schema, spi-peripheral-props.yaml,
> which SPI peripheral schemas reference. As there is just a single
> property in this case, just add it to spi-peripheral-props.yaml directly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: dt-bindings: st,stm32-spi: Move "st,spi-midi-ns" to spi-peripheral-props.yaml
      commit: 0fc57bf1b2ff178377e756761a884d4b6c69ebf9

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
