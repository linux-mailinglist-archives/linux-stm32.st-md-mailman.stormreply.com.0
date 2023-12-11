Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0064E80CB79
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 14:52:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A74CCC6B458;
	Mon, 11 Dec 2023 13:52:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.145.221.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B83ECC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 13:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702302764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rAKJhgDZFjppnOq8yVAY97GiR5RWWlY/Hz8yw7/jdJE=;
 b=J5rmR3tQi2M13PXqVKbiu0qKRCqPDiYfxjNKcfnUPTBk6hL8rfYQdW6oug3Y4mKq+TqNtZ
 zlbZOcwzDCVecUh7VvJAzh+N/Z/jzCfv1LvO+yIWnKtAKOuZBwmhdZ4fMrc02uBal82WrF
 vdLbXexObBBurpDn7dTHIIKE3TvnAw4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-k2imMlt8OVKc81dY7R-Fag-1; Mon, 11 Dec 2023 08:52:41 -0500
X-MC-Unique: k2imMlt8OVKc81dY7R-Fag-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-67ee1ca3b05so1808236d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 05:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702302761; x=1702907561;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rAKJhgDZFjppnOq8yVAY97GiR5RWWlY/Hz8yw7/jdJE=;
 b=KX7E+nNLCNDgeRLAV7Lftue/2Y9aAm5z/jq9NEGMP7LV/1A7HFKd7Om9nbJvkXP+6G
 IuWdOdf2bThP7nowtVhjHiOZctErQRPcut1ORdb41RmsKE1O0o5l9b+sKyn1tSq5Jr/a
 b3QxDMn4HkKU0HtkJH6gIKHJo9caUssVNP4HwvD7sTWykpSoyaIooQl4DWG/Q/s/jyJy
 tdVTPB85hJieQJoCCgAbtVDr7BDsutZ/wglbycoQCHsxSveklY0I6JG02gizv2VVYfZT
 yvJvEqkZBq+rqwGRjgTTubLU0lbry/vLuJNGqybouZpwcjIsoc1dLAJn4gHADW4Itlp+
 cAJg==
X-Gm-Message-State: AOJu0Yx3Mizp5zC16HDqFfR/NWLJsGeXpMMor5gkfKxh6V8EkyxpVmIL
 /eCdPr/OTHS/BQlTf7WJdsTRbh67RivgwU+3jTlLIdgbyTDD8937ctc13V2piYNMLp67ddqGaWP
 kplJtk6K8Xc8o1MCKpc+Hzo1UGi9G1E/9DHH6Vi/R
X-Received: by 2002:ad4:452a:0:b0:67a:5887:b55d with SMTP id
 l10-20020ad4452a000000b0067a5887b55dmr4932147qvu.49.1702302760914; 
 Mon, 11 Dec 2023 05:52:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzx/nt6T6DLUCU49cSJD+NhxTBsGn6eVt/zPBsL7ZgqtW6sJsBZ5K+Q5WGQkXV6vBLIadoeg==
X-Received: by 2002:ad4:452a:0:b0:67a:5887:b55d with SMTP id
 l10-20020ad4452a000000b0067a5887b55dmr4932121qvu.49.1702302760605; 
 Mon, 11 Dec 2023 05:52:40 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 tc6-20020a05620a2cc600b0077db614cb7fsm2936968qkn.8.2023.12.11.05.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 05:52:40 -0800 (PST)
Date: Mon, 11 Dec 2023 07:52:37 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <2ihncgvnfxgzj5kfm3eedvj3jvru7fokpno5pdzgtnuuy2mpqf@sfuzuugeuxzh>
References: <20231211080153.3005122-1-quic_jsuraj@quicinc.com>
 <20231211080153.3005122-2-quic_jsuraj@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20231211080153.3005122-2-quic_jsuraj@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Jose Abreu <joabreu@synopsys.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/3] dt-bindings: net: qcom,
 ethqos: add binding doc for safety IRQ for sa8775p
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

On Mon, Dec 11, 2023 at 01:31:51PM +0530, Suraj Jaiswal wrote:
> Add binding doc for safety IRQ. The safety IRQ will be
> triggered for ECC(error correction code), DPP(data path
> parity), FSM(finite state machine) error.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>

Rob gave you his Reviewed-by over here on the last revision:

    https://lore.kernel.org/netdev/170206782161.2661547.16311911491075108498.robh@kernel.org/

in the future if someone gives you a tag you should add it to the patch
for the next revision you send out (assuming you have to send out
another version, otherwise the maintainers will collect the tags when
they merge that version of the series). If the patches change a lot then
it makes sense to remove the tag since it wasn't what they reviewed, but
in this case you've only expanded a comment in the commit message so it is
appropriate to be present.

> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 9 ++++++---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 6 ++++--
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 7bdb412a0185..93d21389e518 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -37,12 +37,14 @@ properties:
>      items:
>        - description: Combined signal for various interrupt events
>        - description: The interrupt that occurs when Rx exits the LPI state
> +      - description: The interrupt that occurs when HW safety error triggered
>  
>    interrupt-names:
>      minItems: 1
>      items:
>        - const: macirq
> -      - const: eth_lpi
> +      - enum: [eth_lpi, safety]
> +      - const: safety
>  
>    clocks:
>      maxItems: 4
> @@ -89,8 +91,9 @@ examples:
>                 <&gcc GCC_ETH_PTP_CLK>,
>                 <&gcc GCC_ETH_RGMII_CLK>;
>        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> -                   <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> -      interrupt-names = "macirq", "eth_lpi";
> +                   <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-names = "macirq", "eth_lpi", "safety";
>  
>        rx-fifo-depth = <4096>;
>        tx-fifo-depth = <4096>;
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 5c2769dc689a..3b46d69ea97d 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -107,13 +107,15 @@ properties:
>        - description: Combined signal for various interrupt events
>        - description: The interrupt to manage the remote wake-up packet detection
>        - description: The interrupt that occurs when Rx exits the LPI state
> +      - description: The interrupt that occurs when HW safety error triggered
>  
>    interrupt-names:
>      minItems: 1
>      items:
>        - const: macirq
> -      - enum: [eth_wake_irq, eth_lpi]
> -      - const: eth_lpi
> +      - enum: [eth_wake_irq, eth_lpi, safety]
> +      - enum: [eth_wake_irq, eth_lpi, safety]
> +      - enum: [eth_wake_irq, eth_lpi, safety]
>  
>    clocks:
>      minItems: 1
> -- 
> 2.25.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
