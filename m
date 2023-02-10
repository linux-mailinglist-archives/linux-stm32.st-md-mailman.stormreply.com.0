Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0660A691844
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 07:05:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC3DCC6A5EA;
	Fri, 10 Feb 2023 06:05:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5F76C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 06:05:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 548E361CA4;
 Fri, 10 Feb 2023 06:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77ADC433D2;
 Fri, 10 Feb 2023 06:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676009109;
 bh=R+M0ft2NoW5OEkw9Yp/lx0D4Vb1O1La2tMhNLmrHwBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UzFaShVbYUL6AnzcrewjwVNrWiJJde9hTV8N08ircjXv3C51e3nW1I8NUd2RMI+7M
 3qFjHfFG7uUtTMfQ3B0mmemAuWTzOCQsVIym1QDac0Fwh6uGDPSj2lZQFVTwFfBf+J
 qXnz//A5czX2LOvB+wyWER7bwOfG59bq2nmKpbzKWgYYw14Kf2JzmmQlTomzMeLQhA
 +POxMFnDWrSFug3xwaq+SJuL5KJIXJArxMGqB99mLZ2l/k2nVd4Lq/Gs3AhFG9XiUR
 hLRjRPu2RUQIFYOBXTlsc2I6Deu+PJSzIOoLmDbZH50Qu31YrxFNc0fxfN1/oMMCik
 pcYUxYygwH29Q==
Date: Fri, 10 Feb 2023 11:35:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <Y+XekQsIwpixyPD0@matsya>
References: <20230124081117.31186-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124081117.31186-1-krzysztof.kozlowski@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Debbelt <palmer@sifive.com>,
 Paul Cercueil <paul@crapouillou.net>, Biju Das <biju.das.jz@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-riscv@lists.infradead.org,
 Stefan Roese <sr@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, =?utf-8?B?77+9ZXI=?= <povik+lin@cutebit.org>,
 Olivier Dautricourt <olivierdautricourt@gmail.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, devicetree@vger.kernel.org, - <chuanhua.lei@intel.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Sven Peter <sven@svenpeter.dev>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, Green Wan <green.wan@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Long Cheng <long.cheng@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Rajesh Gumasta <rgumasta@nvidia.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: dma: drop unneeded
	quotes
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

On 24-01-23, 09:11, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.

Applied both, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
