Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DC189017C
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Mar 2024 15:19:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FD75C6DD96;
	Thu, 28 Mar 2024 14:19:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5695BC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 14:19:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2FBB68818C;
 Thu, 28 Mar 2024 15:19:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1711635545;
 bh=SonutgD18/IvJSdqtAfr8jPeMT+pqsEe9jBU5XMTvVM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hs3RqxMJQCoEI9woF3jNnqv5D63sMTWJjGzivOtDRxDy2hrbQeSd7eSwq7O6GgRC0
 xaOgPFJVGNvbkgDPdfPH7WEBN83mQhn2m+ViwPZEZAF5/FwwM7JgCL7wCxACaGR03J
 l/8aEwaAXPvaaOKTnHuKLpUhAj3b39PsM67Q09qLJW6wsm2NFscYMT6ccD2NVxU/df
 GJc4OAWnxF5RmGXXjR/VpLiR70+M/hugonzdB3zGJyr3j5r6kB8eACLloha5PyXXEN
 Up6lSzcfFAMheNlq0c+0vsVsnlL3o/GNGtIiF6xKhO8UrpHIA1DAQmi+00rM8RjCOA
 evKusuNNo5nNg==
Message-ID: <480d4064-b553-4005-ad98-499a862703ff@denx.de>
Date: Thu, 28 Mar 2024 15:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240328140803.324141-1-christophe.roullier@foss.st.com>
 <20240328140803.324141-2-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240328140803.324141-2-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 1/1] dt-bindings: net: dwmac: Document
 STM32 property st, ext-phyclk
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

On 3/28/24 3:08 PM, Christophe Roullier wrote:

[...]

> | RMII    |    -   |     eth-ck    |      eth-ck        |       n/a        |
> |         |        | st,ext-phyclk | st,eth-ref-clk-sel |                  |
> |         |        |               | or st,ext-phyclk   |                  |
> 
> ---------------------------------------------------------------------------
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>   Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> index fc8c96b08d7dc..b35eae80ed6ac 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -82,6 +82,13 @@ properties:
>         Should be phandle/offset pair. The phandle to the syscon node which
>         encompases the glue register, and the offset of the control register
>   
> +st,ext-phyclk:

Don't you need two spaces in front of the 'st,' here ?

> +    description:
> +      set this property in RMII mode when you have PHY without crystal 50MHz and want to
> +      select RCC clock instead of ETH_REF_CLK. OR in RGMII mode when you want to select
> +      RCC clock instead of ETH_CLK125.
> +    type: boolean
> +

With that fixed:

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
