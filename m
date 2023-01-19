Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 500D367328A
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jan 2023 08:34:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04948C69055;
	Thu, 19 Jan 2023 07:34:48 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E1EBC6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 00:31:35 +0000 (UTC)
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
 by mx.socionext.com with ESMTP; 19 Jan 2023 09:31:32 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
 by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id A806E2059054;
 Thu, 19 Jan 2023 09:31:32 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP;
 Thu, 19 Jan 2023 09:31:32 +0900
Received: from [10.212.156.59] (unknown [10.212.156.59])
 by kinkan2.css.socionext.com (Postfix) with ESMTP id 3D4D4A6B9C;
 Thu, 19 Jan 2023 09:31:30 +0900 (JST)
Message-ID: <8fd7ba4c-075c-6959-4473-f1e8110b9de2@socionext.com>
Date: Thu, 19 Jan 2023 09:31:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Thu, 19 Jan 2023 07:34:47 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 Palmer Debbelt <palmer@sifive.com>, Paul Cercueil <paul@crapouillou.net>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-riscv@lists.infradead.org,
 Stefan Roese <sr@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Samuel Holland <samuel@sholland.org>,
 Viresh Kumar <vireshk@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-tegra@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, =?UTF-8?B?77+9ZXI=?= <povik+lin@cutebit.org>,
 Olivier Dautricourt <olivierdautricourt@gmail.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, devicetree@vger.kernel.org, chuanhua.lei@intel.com,
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
 Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: dma: drop unneeded quotes
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 2023/01/19 3:01, Krzysztof Kozlowski wrote:
 >
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

About the followings,

>   .../devicetree/bindings/dma/socionext,uniphier-mio-dmac.yaml    | 2 +-
>   .../devicetree/bindings/dma/socionext,uniphier-xdmac.yaml       | 2 +-
Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

---
Best Regards
Kunihiko Hayashi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
