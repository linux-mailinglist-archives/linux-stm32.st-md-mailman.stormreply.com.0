Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7259F868
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Aug 2022 13:12:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C3A8C6410D;
	Wed, 24 Aug 2022 11:12:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5CE6C0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 11:12:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D1B4618EC;
 Wed, 24 Aug 2022 11:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95404C433B5;
 Wed, 24 Aug 2022 11:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661339544;
 bh=H+veo+Dao6bkJ0QMyFov+hU73WKqs+8y5v0OSddUH8Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kBHMSKXnm0q0/ig5wiPntO3Jl5ZlIKYg+9lyllxyXo7josUAAKfnl1BGY3qq5uhyO
 Z39yjwD4/NFhx2B6Wc/+r0hxaXJ3UbARfcsvcwDHtrvsdD9i4JhAPciVl3T+CrM3hE
 /EfTraglUjPsMItvnKtQPOtWdoDhkRmhY/G/3keG1xGxXbDlJUrW1CZutdptQFqyPk
 xmLku2O2USngmtzYaRvm9/aAWs6ObNDWc20kLO8WBsH/+ochtgPB/WbGdw8JMgyDNG
 LzO0IgWc0DDMNlWKK3zbXjCzwriQw4vMTPFYeOP0n1m836BgYwak6uCgFGY1uhlIZY
 l8v5dwKXirf2Q==
From: Mark Brown <broonie@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 NXP Linux Team <linux-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 Rob Herring <robh@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Shane Chien <shane.chien@mediatek.com>
In-Reply-To: <20220823145649.3118479-8-robh@kernel.org>
References: <20220823145649.3118479-8-robh@kernel.org>
Message-Id: <166133953831.17904.2785802329558247784.b4-ty@kernel.org>
Date: Wed, 24 Aug 2022 12:12:18 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-0c1df
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: dt-bindings: Add missing
	(unevaluated|additional)Properties on child nodes
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

On Tue, 23 Aug 2022 09:56:39 -0500, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Add missing (unevaluated|additional)Properties on child nodes
      commit: 9e10a1ded6a1b7ffacbb2d9c75fe6aa91623051b

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
