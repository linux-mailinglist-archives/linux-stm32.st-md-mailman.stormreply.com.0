Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D73641E03
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Dec 2022 17:47:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C828BC65067;
	Sun,  4 Dec 2022 16:47:10 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9210C64112
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Dec 2022 16:47:09 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id bn5so11016359ljb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Dec 2022 08:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IBSaaBdFn+BP+xzbg2xAiyjV0AjU3IsjmFiKfeCqqvI=;
 b=wJTrVXJOn+oqKMcWQtvULX7ulDXWLrtPzSQaCY4aUPic6EJRnTU8lpjcSCs4NXujGa
 5B/GwS81kHr5ShQHFdRjt18fi0NXOrNAxrT32DzlDZqRkiOO5QiTijH3HjRfEmwPz/hA
 1XRsGbRqG4MCscTzmETpOCXB8HlJc04gBwdTPqQUbctpbJDffiaNKZ5OjZmS+oaGNOEw
 k4gP18xu7u1DfYB80LqsTWgMRMj2XnMS8u/wnDxGaqKvhZQc4/fOU45+Lhn+N04UZVc6
 IJlhricGMUAFHmurSmdMVqg9SwBN3M2FwtGiSoFgVVS5Ly1wTyC/jXRj8agENVJkzVw+
 KPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IBSaaBdFn+BP+xzbg2xAiyjV0AjU3IsjmFiKfeCqqvI=;
 b=DkTCmWbXPKeTg1pjSChpm4wURB0GePrXtIwHGlmbzciMpClyD1wPmEXh1AIvlxbe54
 3s9BxxFI8QxnDn6u17GFnIAW9k1Fc5qng2yuTPV4W4vrFCOy0z9Q3hFWr5TJAXpg1cRK
 7YYhqaUN5UoGWuu7N+itB09aU9m+FF2RP/xwNkMXyVR37HwJtGv18V0VpWZCZ8j7Pmo9
 4jm9QHpAiVobfBM9x715gqqbWIMo+yWZdYbL7/6tJXiDEvoxgVKJmO4GXPTeWKzQl3u1
 c/N1O8QBOpM3Z8FKXykuHfbhWlOwpjAaVOW/WOBUFkBqcd0vTEGM3OHHUHlJovxFYhbT
 6dbg==
X-Gm-Message-State: ANoB5pniSbYwGohWZh/Enf8+X574NP4DtvaWPvVSSHKvEdegnHC7ghpS
 hOXvdOR42F9OQgE735ct64mHog==
X-Google-Smtp-Source: AA0mqf4kBdTo6SDQ4Um37LTIlSLql9Lw0iLy1FQ9H6KpXZOkmUBpkamfuV9PNogA/0JeVQ7HB2Tjjw==
X-Received: by 2002:a05:651c:1510:b0:277:75fb:1fc5 with SMTP id
 e16-20020a05651c151000b0027775fb1fc5mr24664380ljf.405.1670172429042; 
 Sun, 04 Dec 2022 08:47:09 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a0565120b8d00b004b373f61a60sm1828538lfv.96.2022.12.04.08.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 08:47:08 -0800 (PST)
Message-ID: <7c258f71-23d0-36bd-8abf-b227d2522267@linaro.org>
Date: Sun, 4 Dec 2022 17:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Ban Tao <fengzheng923@gmail.com>,
 =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Stephan Gerhold
 <stephan@gerhold.net>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.om>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Bogdan Togorean <bogdan.togorean@analog.com>, =?UTF-8?Q?Nuno_S=c3=a1?=
 <nuno.sa@analog.com>, Vincent Knecht <vincent.knecht@mailoo.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Daniel Drake <drake@endlessm.com>, Katsuhiro Suzuki
 <katsuhiro@katsuster.net>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>, Jee Heng <jee.heng.sia@intel.com>,
 Lubomir Rintel <lkundrak@v3.sk>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Derek Fang <derek.fang@realtek.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Davis <afd@ti.com>,
 Shi Fu <shifu0704@thundersoft.com>, Shenghao Ding <shenghao-ding@ti.com>,
 Matt Flax <flatmax@flatmax.com>, Ricard Wanderlof <ricardw@axis.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
 <20221203160442.69594-2-krzysztof.kozlowski@linaro.org>
 <2251607.XGVbBG2WQu@archbook>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2251607.XGVbBG2WQu@archbook>
Subject: Re: [Linux-stm32] [PATCH 2/3] ASoC: dt-bindings: Reference common
	DAI properties
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

On 04/12/2022 17:09, Nicolas Frattaroli wrote:
> On Samstag, 3. Dezember 2022 17:04:41 CET Krzysztof Kozlowski wrote:
>> Reference in all sound components which have '#sound-dai-cells' the
>> dai-common.yaml schema, which allows to use 'sound-name-prefix'
>> property.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> This is an output of discussion here:
>> https://lore.kernel.org/all/Y255C+TGNVJ9fs8A@sirena.org.uk/
>>
>> This patch supersedes previous WSA883x one.
>> ---
> 
> Hello,
> 
> for rockchip,i2s-tdm, we get some (new?) warnings with W=1:
> 
>     /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
>             From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml

I did not touch reset names, so are you sure these are not old warnings?


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
