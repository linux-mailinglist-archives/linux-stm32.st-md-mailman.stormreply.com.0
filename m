Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9702756984
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jul 2023 18:47:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 499D1C6B457;
	Mon, 17 Jul 2023 16:47:39 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC11DC6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 16:47:38 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-992ca792065so664546766b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689612458; x=1692204458;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JK6TkOQBHFr4q96srFPr4OjrpsieTptoErK+rdA0Pjs=;
 b=gSVw5wcPbsf/QbpAH0hRSagM9a9kzssQWbI6taOsnZI7l2LvzXCps64xOZn4gkhSU0
 VOg60k5Q+3/LglcekmxcrdMyHmB5OJxtspd+ZWW1eqD5Cu84C8zFkh4q2G3RYCv4T+ur
 WobKpSvcRu+vALFSu0nNRRtNiSXKlxdSPDycdiuYam+noheKXbGRr104HAojgjhKTLki
 hzdezggTjMF40whEQPEVlWXLKeAD5A8t7EQzRTHc/a4rRu3V0bpHI3gi2ZP1NYW3UIhE
 bcnfghSfTbDRJIRAdUcCAUwc8dXgXakX4mgmDb5N5ECFGIKeJxvpScEr3fFYpVInMzn/
 CqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689612458; x=1692204458;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JK6TkOQBHFr4q96srFPr4OjrpsieTptoErK+rdA0Pjs=;
 b=hL9PFRxVWHSvPeNObTdyC4lqaWHrFNV8432qmzrTDCtEOCTxLcAKDqitQyvb325qfd
 vzppHv9ZJutn9DWNpGSZ8kRWwCN2SzEg8CFibD2bGwlJxHAtpbygZF8AKzS0cLnQSAWn
 YNIs924DQmKR8CK2AIQ5XD78wu4BAKZLC28V493d8thkd9n0idCFTBFqDYJDKaLg1ov4
 aglDE5htm6Mv+y/qp1FHBvkkqzAwc4vPOEp+5jBSWE4eYebfJ7grUq6Ffk4Q321N+zsI
 nFb/PHiqEOhiZEH8LxTf93IlUPuaQxkGDO1PEDHmKqBnBmTL7UbD6g+HxRkAV5rJTMXJ
 c1GQ==
X-Gm-Message-State: ABy/qLb3Qh+V09GmTyrtsnMCsc0mr/bKoA+38TU93vFVDLwd/VSm0rr0
 w/CgWHsfhjbqkNMVxjFhr5BJZg==
X-Google-Smtp-Source: APBJJlH0qMy8XozwM95e5By8BV0d4jRKCPbiiNYUEYx+N2c06vencG+JUCyJcZsjwFwwdoHev4v5Bg==
X-Received: by 2002:a17:906:3109:b0:994:54ff:10f6 with SMTP id
 9-20020a170906310900b0099454ff10f6mr6962190ejx.30.1689612458219; 
 Mon, 17 Jul 2023 09:47:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a1709062bc700b00992e14af9c3sm4616559ejg.143.2023.07.17.09.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 09:47:37 -0700 (PDT)
Message-ID: <a34ef1ed-e204-77ba-a4b1-1a4bbabdac7a@linaro.org>
Date: Mon, 17 Jul 2023 18:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Marco Felsch <m.felsch@pengutronix.de>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
References: <20230717164307.2868264-1-m.felsch@pengutronix.de>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717164307.2868264-1-m.felsch@pengutronix.de>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] dt-bindings: net: snps,
 dwmac: add phy-supply support
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

On 17/07/2023 18:43, Marco Felsch wrote:
> Document the common phy-supply property to be able to specify a phy
> regulator.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 363b3e3ea3a60..f66d1839cf561 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -159,6 +159,9 @@ properties:
>        can be passive (no SW requirement), and requires that the MAC operate
>        in a different mode than the PHY in order to function.
>  
> +  phy-supply:
> +    description: PHY regulator
> +

Isn't this property of the PHY? Why would the Ethernet controller play
with a supply of a phy?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
