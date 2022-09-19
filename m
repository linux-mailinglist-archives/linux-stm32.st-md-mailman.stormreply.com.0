Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F45BC428
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Sep 2022 10:19:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1302C57183;
	Mon, 19 Sep 2022 08:19:35 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D8C7C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 08:19:34 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id k10so45669485lfm.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 01:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=cGOksTlx7HPSEJ3tGiKUBW8haHMuXJVe8E31nOF/Xns=;
 b=u9l2LNU0CtHKm3nLxR0sboWaatfqLlHDDYdD0KtG6vgT7rByAJBdDqLIW8xoizWSpI
 JGuIrGSoS+YC8NMafiKedkZhmmi6H/JQYvKgLkyUK/5eayLL6wwCI6JxE9atMQsxVTgs
 bJeBcOaTgwbYtcLzCjy/WdyZxxlMpidrQ35dwPmsE86vsSzlOw5dM7Fc5Q/ZOPz5Fppr
 eGU+rUIJV0ltdyeqopkPtnju4ZyfTrJyvglKK8OnEs9lZOiVZhn9lYqC7UpKFozAe3xL
 IETBbJCmkOd3KzcDUzrmzPfsKEoDZl4iu8gJKe/VB+Bsn87Knwfwnhm5R6FBhOWalmfl
 EILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cGOksTlx7HPSEJ3tGiKUBW8haHMuXJVe8E31nOF/Xns=;
 b=0O2L6nq/JF++B2LrdMa9pZ4Lh8Qb169sKTqIliuRGKPZLio4GgsnLnN6wHA+Z6MCM4
 /1UtSBjED6rOGu99mPb3p7lnatrNYjBJ0gl3d0CPc1G3laPgnVspW4pWFQh43ASbhd9f
 A+ZzSOlTiotC+mC8fhhbvUyBd/Mh1HyTnB7n3WiHZtrg0uY7kKTx8HodGgAvkrGLzfv7
 i8dGMECvV/BtFmnqJ1O/RPt8p5TB4yVLfx1qwI7/8XDS0h25rt15WBudNMyXXR40Ewo3
 SegMpA/Fzm2sFI03/sKG6H87hxsB04Xb0VCTgIqZuEEH14+8UfCW4jlbphBWg4dBPi/p
 cNYg==
X-Gm-Message-State: ACrzQf00QYt0MOB1PgKLf1hiM2tK3HpnLzHQ/o9NZ/we3b4djtQ6IvWN
 TZzxL2AQNtGIyvbPH9je7QyxMQ==
X-Google-Smtp-Source: AMsMyM4bsPPOk94vI7dWhP43voq8RX38StuUfrTlgpjKh06SgkNvXLTG2zWq+zZzzqFCbHg8+VZQtQ==
X-Received: by 2002:a05:6512:3d9f:b0:497:a108:544f with SMTP id
 k31-20020a0565123d9f00b00497a108544fmr5478197lfv.688.1663575573570; 
 Mon, 19 Sep 2022 01:19:33 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 j20-20020a056512345400b00493014c3d7csm5059793lfr.309.2022.09.19.01.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 01:19:33 -0700 (PDT)
Message-ID: <d28ce676-ed6e-98da-9761-ed46f2fa4a95@linaro.org>
Date: Mon, 19 Sep 2022 10:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
 <20220919080410.11270-2-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919080410.11270-2-jianguo.zhang@mediatek.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] stmmac: dwmac-mediatek: add support
	for mt8188
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

On 19/09/2022 10:04, Jianguo Zhang wrote:
> Add ethernet support for MediaTek SoCs from mt8188 family.
> As mt8188 and mt8195 have same ethernet design, so private data
> "mt8195_gmac_variant" can be reused for mt8188.
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index d42e1afb6521..f45be440b6d0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -720,6 +720,8 @@ static const struct of_device_id mediatek_dwmac_match[] = {
>  	  .data = &mt2712_gmac_variant },
>  	{ .compatible = "mediatek,mt8195-gmac",
>  	  .data = &mt8195_gmac_variant },
> +	{ .compatible = "mediatek,mt8188-gmac",
> +	  .data = &mt8195_gmac_variant },

It's the same. No need for new entry.


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
