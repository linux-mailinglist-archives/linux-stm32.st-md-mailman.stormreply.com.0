Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15670763AED
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 17:24:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B544FC6B45C;
	Wed, 26 Jul 2023 15:24:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD699C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 15:24:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7028B61B83;
 Wed, 26 Jul 2023 15:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8ED6C433C7;
 Wed, 26 Jul 2023 15:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690385081;
 bh=XtQHPjwlUAYxGYo7V7WNdtEo+xDINh3xf8oWKZdFtPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ajWOBzMzGhBoqzfc5/DW9aF/gzYa0wM+vSx2pxzmI/7dY0miIeIIjqjyBGxE0JzWb
 0+Be9ZPNi4QMYnzvKxNL06mLMrPnlHI6r1AFOiBDJf0fub79NUx64XIhQxnbfb0qAS
 0D2Qj+MXNiJeESeORBdztPo+ffbinai/Z+J5lIIuGm3cxF998g2HPKBJc4e4AKgdHr
 SWC1FzJ4EbDQNDK/SsYHmtcsCxrAyNLRVB7/n0Be8lW9ED2pkKPxE56jwkFYjX1z3x
 FdGILD3G7swQqW17sCU6lryDnJAMjG5uHjqnHSQ90YgI369/OKpvKUMfyTRSF281Do
 G3Z8h4PW665iA==
Received: (nullmailer pid 1474009 invoked by uid 1000);
 Wed, 26 Jul 2023 15:24:39 -0000
Date: Wed, 26 Jul 2023 09:24:39 -0600
From: Rob Herring <robh@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20230726152439.GA1471409-robh@kernel.org>
References: <20230723161029.1345-1-jszhang@kernel.org>
 <20230723161029.1345-10-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230723161029.1345-10-jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 09/10] dt-bindings: net: snps,
 dwmac: add per channel irq support
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

On Mon, Jul 24, 2023 at 12:10:28AM +0800, Jisheng Zhang wrote:
> The IP supports per channel interrupt, add support for this usage case.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index bb80ca205d26..525210c2c06c 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -101,6 +101,11 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  snps,per-channel-interrupt:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Indicates that Rx and Tx complete will generate a unique interrupt for each channel

Can't you determine this based on the number of interrupts or interrupt 
names?

> +
>    interrupts:
>      minItems: 1
>      items:
> @@ -109,6 +114,8 @@ properties:
>        - description: The interrupt that occurs when Rx exits the LPI state
>        - description: The interrupt that occurs when Safety Feature Correctible Errors happen
>        - description: The interrupt that occurs when Safety Feature Uncorrectible Errors happen
> +      - description: All of the rx per-channel interrupts
> +      - description: All of the tx per-channel interrupts

You added 2 interrupts here and...

>  
>    interrupt-names:
>      minItems: 1
> @@ -118,6 +125,22 @@ properties:
>        - const: eth_lpi
>        - const: sfty_ce_irq
>        - const: sfty_ue_irq
> +      - const: rx0
> +      - const: rx1
> +      - const: rx2
> +      - const: rx3
> +      - const: rx4
> +      - const: rx5
> +      - const: rx6
> +      - const: rx7
> +      - const: tx0
> +      - const: tx1
> +      - const: tx2
> +      - const: tx3
> +      - const: tx4
> +      - const: tx5
> +      - const: tx6
> +      - const: tx7

And 16 here?

>  
>    clocks:
>      minItems: 1
> -- 
> 2.40.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
