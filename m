Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8431A655F8B
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Dec 2022 04:41:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A122C65068;
	Mon, 26 Dec 2022 03:41:34 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 940FEC64109
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Dec 2022 03:41:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AAC03B80B9D;
 Mon, 26 Dec 2022 03:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72628C433F1;
 Mon, 26 Dec 2022 03:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672026091;
 bh=zmtqhXQv7hiPZDJGmROKlujPmTGm2oRNxnDcUz2K1XA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=aFP63n6aR/0rsvyekq2AImCT+Ltsl9Jl7dPzbNYHhoyZYHDH6lK2bZrhlcgunmhld
 RgMVPID00zacoRWh6/2WcYeqqfuXii7bfwtJk5lxNcH9sYhs6uYZ65sHxjCjvHVJGC
 jU2sooTMKGRe+SFmEQSyRrM2Z5Ebr4Jv8ipoN7FtPVN5x7rUbCF4ahlzEUcQHuzwgS
 dPZnfjIrxijvQKXa4OnPsL5xX8faKU1LhwAeeoNrFyIvTCF3+ednhZDVur/h1/X3jD
 E41cCnOUXtPEk1kFVfqyh2f9D9ufm9IlqPIid1pjLmSc0vc0NcK4CEzAwGC3ktCoTG
 JD3TuvTuDV3ew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4CBF2E50D66; Mon, 26 Dec 2022 03:41:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <167202609130.9518.10337988666912704066.git-patchwork-notify@kernel.org>
Date: Mon, 26 Dec 2022 03:41:31 +0000
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: heiko@sntech.de, dri-devel@lists.freedesktop.org, perex@perex.cz,
 s.nawrocki@samsung.com, jonathanh@nvidia.com, peter.ujfalusi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, cychiang@chromium.org,
 samuel@sholland.org, katsuhiro@katsuster.net, khilman@baylibre.com,
 joabreu@synopsys.com, derek.fang@realtek.com, povik+lin@cutebit.org,
 linux-sunxi@lists.linux.dev, flatmax@flatmax.com, james.schulman@cirrus.com,
 vincent.knecht@mailoo.org, linux-kernel@vger.kernel.org, mhiramat@kernel.org,
 alsa-devel@alsa-project.org, tanureal@opensource.cirrus.com,
 david.rhodes@cirrus.com, cy_huang@richtek.com, thierry.reding@gmail.com,
 srinivas.kandagatla@linaro.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev, lars@metafoo.de, fengzheng923@gmail.com,
 alexandre.belloni@bootlin.om, drake@endlessm.com,
 linux-rockchip@lists.infradead.org, jbrunet@baylibre.com,
 ckeepax@opensource.cirrus.com, martin.blumenstingl@googlemail.com,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org, biju.das.jz@bp.renesas.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, mcoquelin.stm32@gmail.com,
 rriveram@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 spujar@nvidia.com, nuno.sa@analog.com, festevam@gmail.com,
 hayashi.kunihiko@socionext.com, jernej.skrabec@gmail.com, wens@csie.org,
 bogdan.togorean@analog.com, arnaud.pouliquen@foss.st.com, stephan@gerhold.net,
 rf@opensource.cirrus.com, broonie@kernel.org, bleung@chromium.org,
 mkumard@nvidia.com, j-choudhary@ti.com, lgirdwood@gmail.com,
 konrad.dybcio@linaro.org, asahi@lists.linux.dev, rohitkr@codeaurora.org,
 shengjiu.wang@nxp.com, codrin.ciubotariu@microchip.com, paul@crapouillou.net,
 ricardw@axis.com, shifu0704@thundersoft.com, krzysztof.kozlowski+dt@linaro.org,
 airlied@gmail.com, frattaroli.nicolas@gmail.com, agross@kernel.org,
 devicetree@vger.kernel.org, bgoswami@quicinc.com, shenghao-ding@ti.com,
 lkundrak@v3.sk, robh+dt@kernel.org, tzungbi@kernel.org,
 linux-tegra@vger.kernel.org, patches@opensource.cirrus.com,
 andersson@kernel.org, tiwai@suse.com, jee.heng.sia@intel.com, afd@ti.com,
 daniel@ffwll.ch
Subject: Re: [Linux-stm32] [PATCH 1/3] ASoC: dt-bindings: Extend
 name-prefix.yaml into common DAI properties
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

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Mark Brown <broonie@kernel.org>:

On Sat,  3 Dec 2022 17:04:40 +0100 you wrote:
> Rename name-prefix.yaml into common DAI schema and document
> '#sound-dai-cells' for completeness.  The '#sound-dai-cells' cannot be
> really constrained, as there are users with value of 0, 1 and 2, but at
> least it brings definition to one common place.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [1/3] ASoC: dt-bindings: Extend name-prefix.yaml into common DAI properties
    https://git.kernel.org/chrome-platform/c/3fda85324b8d
  - [2/3] ASoC: dt-bindings: Reference common DAI properties
    https://git.kernel.org/chrome-platform/c/58ae9a2aca6f
  - [3/3] ASoC: dt-bindings: maxim,max98357a: Convert to DT schema
    https://git.kernel.org/chrome-platform/c/8a5a05583a04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
