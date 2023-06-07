Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98488726A9C
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 22:17:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BD8FC6A5E7;
	Wed,  7 Jun 2023 20:17:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2ED3C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 20:17:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C589F6438D;
 Wed,  7 Jun 2023 20:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C655AC4339C;
 Wed,  7 Jun 2023 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686169051;
 bh=EnhsOR6kucpdK0EOSLdjc3AK/uSODOaGZXYxak38Ha8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WMAbdwrps7m7m85JIqoJJrvQxmam1frNR+HR81CoNY/zg6lhLodxJnA4TddOTqbjx
 PZv2skSn8qXfz5a5RFdSrk94Tmb7MGANXF2PYHAk/mvn3vHR+7eEa6zX4/onzQu6Bh
 HK5apALdrFPKp2Gpbx/aXqQ4OFQiHifP4+uygOhs4BYQmBBQF7AT95aj0ggKNjotkG
 pIcKWCyybe8qdhW/g8h7UQnAIIS5MjA4xTb6PP9iY505z+cbcwKgZix+s1Ab0qFqTi
 Wxt4DDCKwPud8Bnr/zow/AUoAj/7ylCYRtLBjdu2ZO4a2v8HrEGN/hu2aMmWHexE/l
 /acSByfho4/bw==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20230531140912.819373-1-olivier.moysan@foss.st.com>
References: <20230531140912.819373-1-olivier.moysan@foss.st.com>
Message-Id: <168616904749.205102.9240096518191845115.b4-ty@kernel.org>
Date: Wed, 07 Jun 2023 21:17:27 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-bfdf5
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Alexandre Torgue <alexandre.torgue@st.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH 0/3] ASoC: stm32: fix dtbs_check
	warnings
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

On Wed, 31 May 2023 16:09:09 +0200, Olivier Moysan wrote:
> Fix dtbs_check warnings in STM32MP15 DK boards Devices Trees for
> STM32 I2S and Cirrus CS42L51 codec.
> 
> - Add OF graph port property in I2S and CS42L51 DT bindings.
>   Fixes warnings:
>   audio-controller@4000b000: Unevaluated properties are not allowed
>   ('port' was unexpected)
>   cs42l51@4a: Unevaluated properties are not allowed
>   ('port' was unexpected)
> - Correct OF graph DAI audio format property for STM32MP15x Dkx I2S node
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: stm32: document audio of graph port for i2s
      commit: 401ec2b8878f34b6baf64fba3e29411c246b785c
[2/3] ASoC: dt-bindings: document audio of graph port for cs42l51
      commit: fe748da7c216528d46adb4c6f4a969346ec3a452

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
