Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40A5BF906
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Sep 2022 10:24:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4FEFC62D6D;
	Wed, 21 Sep 2022 08:24:08 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D779C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 08:24:07 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id q17so6015914lji.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=z2MCRZwnAPTEqYODMkj3+PTJcU+ncclCIozA5x11uMM=;
 b=BB35Aku2zGsCqnMGpK7NKQd1UICT5YpQwu7ZrKCddceP/5xfHPurL1Q69YMIhyIPV3
 21F4kSBCktfqX1gUFg9zlBxj4KdIPaUvjAM2SScf1baXqUD9KdA8lXcu4Dt5c6B6yjKR
 fkFgPLvX52svpOmU9DWoH8liK0fB4jhojs3RrOBP3I/QzX0s5Df5cBQlAtHyj02rkz35
 QvZcqpr+GSqJ23HKKrkaYLXtReanYgkneApheeoHjepuw+4IyRAIjZsHM+a439lPAJnG
 YM42xgEhu6fv9Ez9jizLriJeTLfG+TL0P7lWbeqp9gU8jx6ed+qqBToUCNVE+MQ2H37t
 gVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=z2MCRZwnAPTEqYODMkj3+PTJcU+ncclCIozA5x11uMM=;
 b=iedUQRQsL+xsShm1G2pyodcebObvcquLBzUY/xXH0pZRPeSB0K6mn+3KIrnzpCrODF
 Ym9EyTsteMdv5AuBdKRAKibyS9SM9aam1TiVdsIVIBwibunqkH/myoBmRzHgIj9b9SNR
 R8MSU14qZDT7MOKgnHCTCpbiNS/ZPVW0zf6ZLW1BTqUdXQPpPMR0V7/Al0jEPc12aEi4
 D+AakrPzlT9Ndv1QPpy1YaFqIdozTsxKBp0nNKd6ctmUqhouz7rE4P6hQ1uZs202Yb8Y
 YCI+GRIaOLQCBcVYBYtEvIhpINLgjxsSGRSXS4hYSH3YLgmfMhpg3YQiC9FGPd3+qKnc
 pnDQ==
X-Gm-Message-State: ACrzQf1xrDVSyyGN1QG+1yHPbCHWvOo5e/bcFmA7gjcXrRdEINp145dX
 ayd7atwlhDy17GO7UA4tsm96nA==
X-Google-Smtp-Source: AMsMyM6Io3BmRoigc9CnsetOFpauZCLrMtETpU3n2CWPkIA90UfIJN1GhK1zG57LSt5VssYM+AN+vg==
X-Received: by 2002:a2e:2f07:0:b0:26c:59d3:4a26 with SMTP id
 v7-20020a2e2f07000000b0026c59d34a26mr3021933ljv.471.1663748646667; 
 Wed, 21 Sep 2022 01:24:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 d25-20020ac25459000000b0048af4dc964asm337998lfn.73.2022.09.21.01.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 01:24:06 -0700 (PDT)
Message-ID: <bd460cfd-7114-b200-ab99-16fa3e2cff50@linaro.org>
Date: Wed, 21 Sep 2022 10:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220921070721.19516-1-jianguo.zhang@mediatek.com>
 <20220921070721.19516-3-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921070721.19516-3-jianguo.zhang@mediatek.com>
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/2] dt-bindings: net: snps,
	dwmac: add clk_csr property
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

On 21/09/2022 09:07, Jianguo Zhang wrote:
> Add clk_csr property for snps,dwmac
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 491597c02edf..8cff30a8125d 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -288,6 +288,11 @@ properties:
>        is supported. For example, this is used in case of SGMII and
>        MAC2MAC connection.
>  
> +  clk_csr:

No underscores in node names. Missing vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Frequency division factor for MDC clock.

Can't common clock framework do the job? What is the MDC clock?

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
