Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EA6B1695A
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Jul 2025 01:46:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5630DC3F92E;
	Wed, 30 Jul 2025 23:46:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A67FC3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 23:46:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88F915C5435;
 Wed, 30 Jul 2025 23:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE60C4CEEB;
 Wed, 30 Jul 2025 23:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753919193;
 bh=lVT1wO7Gp792FLsRAdREUHlRgKkz5jzpbMWb3qz8oAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N6aMB3CEnMYdRMvFhM0HoWxdlsfSHx5m9Bk/+p1Tu0UGicuWCsqhq19gp+dX0Al9h
 ufzZFFn01VVIdroTIq4MKl0fZ/jXA0kQi1QCdTjqDcwTjZxYoyfU/uuJyEJFJ07qA3
 JeevVFdeYuOabfOwyqTlFCWN1dNkch6m/kOPdEHig9UkogvqR0kkVlL3sW42idySmr
 x7aqCguqpUrMz8Z85WFv4WuLtwZBipysMMnejHZV3hwlBdm9je7Ql0SKF+YJtdXmhy
 NHQOsrp+G1CwLUn1GZ0rWyOwYzqJkYhvDIzHrpoYxleGqrTIE6mU0fyubuC2rc1aQK
 gJh+uVlo0psBg==
Date: Wed, 30 Jul 2025 18:46:31 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Message-ID: <20250730234631.GA1899887-robh@kernel.org>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-1-b505c1238f9f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250730-topic-dma_genise_cookie-v1-1-b505c1238f9f@oss.qualcomm.com>
Cc: imx@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Paul Cercueil <paul@crapouillou.net>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-spi@vger.kernel.org,
 Janne Grunau <j@jannau.net>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti <andi.shyti@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 linux-mips@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 asahi@lists.linux.dev, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-tegra@vger.kernel.org, Sven Peter <sven@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Saravana Kannan <saravanak@google.com>, Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Takao Orito <orito.takao@socionext.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RFC 1/6] dt-bindings: dma: qcom,
 gpi: Retire passing the protocol ID
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

On Wed, Jul 30, 2025 at 11:33:28AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is a software construct that has no business being expressed in
> dt-bindings. Drivers can be constructed to retrieve the protocol ID at
> runtime or hardcode them per protocol.
> 
> Remove it, as a pre-requisite for further simplifying the GENI
> bindings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index bbe4da2a11054f0d272017ddf5d5f7e47cf7a443..745613b93b210afd38946030f7477e91e08c907a 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -61,14 +61,13 @@ properties:
>      maxItems: 13
>  
>    "#dma-cells":
> -    const: 3
> +    const: 2

I think you need to keep 3 and note it is deprecated. Does an existing 
kernel support this being 2 already. If not, ABI break...

>      description: >
>        DMA clients must use the format described in dma.txt, giving a phandle
>        to the DMA controller plus the following 3 integer cells:
>        - channel: if set to 0xffffffff, any available channel will be allocated
>          for the client. Otherwise, the exact channel specified will be used.
>        - seid: serial id of the client as defined in the SoC documentation.
> -      - client: type of the client as defined in dt-bindings/dma/qcom-gpi.h
>  
>    iommus:
>      maxItems: 1
> @@ -98,7 +97,7 @@ examples:
>      #include <dt-bindings/dma/qcom-gpi.h>
>      gpi_dma0: dma-controller@800000 {
>          compatible = "qcom,sdm845-gpi-dma";
> -        #dma-cells = <3>;
> +        #dma-cells = <2>;
>          reg = <0x00800000 0x60000>;
>          iommus = <&apps_smmu 0x0016 0x0>;
>          dma-channels = <13>;
> 
> -- 
> 2.50.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
