Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6CA5BC550
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Sep 2022 11:27:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7FA7C65042;
	Mon, 19 Sep 2022 09:27:49 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FB17C65040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 09:27:48 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id a3so33934370lfk.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Ni5vNsO8umndiniabq8C5W9eiIXqQqotBmgaNWkkLK0=;
 b=kdGdpmpEChbWIseVkCKVEvUwIFi0MK0B4sNLWcpeEmqU9CRrk2WTj+kKzfKYObMR7m
 mXTvLyiMeNthhWAu8GagmQ82H8Edn+6gSumV048FtoC17iw9TJG+Nh8+R1WLThAaMurM
 I4jkZovZ1fuU/0VMZHnBMNWlfWfcv/QYfv1fFbL3meE0eOr1n0zwvocmGc66XdkeMEBe
 TKiE8eEBKPICnX7K946jxfyP1rPCdO61qSJ6GmKPYeZAgKW0E2f6lQcRIvjugfQDHnTl
 XcBY+5NOBufJa4x37aCbFok8afQLMXl8ISv2RjLCIgw54pRiwlYDAyoNcT7P6tP8NWZ8
 ximQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ni5vNsO8umndiniabq8C5W9eiIXqQqotBmgaNWkkLK0=;
 b=tUIWH6SARffsC/9pub9f+9A4YEBidtFnglR4pd1Jpw9atR8wWrSfAKyIhjprpryb2w
 Wg5raRh4DE/RpRwcCRnUW6PYpUIRFqRWpXvjxJ1jL3ZegDId0kqdFR7y1zkuE56Jho/h
 wa8tdCF0DD0Aa/PrWGk9TAyBeaFMEe85q4xniw+6HySBzSq45xF0ScpFbYesxuD9E+UG
 Sai8KyJ8C9TyE+otFdeRjpbQSJDrDu4iRrMsyiMujl4CsjEotGyFKtUWTNea6UTDrzJo
 oQfJG4Q1ZXH4iKfGB4ECl4gfR9jGinfif+fhfkvnWQ3mHAmwdVhs+uNsDmwRRXE/sYVo
 8VzA==
X-Gm-Message-State: ACrzQf3oO0SqDX9kDckOnCkgH2pIq/mWwW9VTG78+IpkEbUol9oSOhj/
 4KZbqe045RRi1Qs1mHR9krpB/g==
X-Google-Smtp-Source: AMsMyM7lxiuvbds2FRZKDW9lrUwIuvpGFw0m9oRIkcp0QON8mh5L72dtCjDGDIjOi83tFBanr+gAeA==
X-Received: by 2002:a05:6512:3d1c:b0:49d:87fc:f63 with SMTP id
 d28-20020a0565123d1c00b0049d87fc0f63mr5950005lfv.327.1663579667364; 
 Mon, 19 Sep 2022 02:27:47 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 q16-20020a194310000000b004946aef1814sm5112366lfa.137.2022.09.19.02.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 02:27:46 -0700 (PDT)
Message-ID: <88412fcc-96be-cd9d-8805-086c7f09c03b@linaro.org>
Date: Mon, 19 Sep 2022 11:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
 <20220919080410.11270-2-jianguo.zhang@mediatek.com>
 <d28ce676-ed6e-98da-9761-ed46f2fa4a95@linaro.org>
 <4c537b63f609ae974dfb468ebc31225d45f785e8.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4c537b63f609ae974dfb468ebc31225d45f785e8.camel@mediatek.com>
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

On 19/09/2022 10:37, Jianguo Zhang wrote:
> Dear Krzysztof,
> 
> 	Thanks for your comments.
> 
> 
> On Mon, 2022-09-19 at 10:19 +0200, Krzysztof Kozlowski wrote:
>> On 19/09/2022 10:04, Jianguo Zhang wrote:
>>> Add ethernet support for MediaTek SoCs from mt8188 family.
>>> As mt8188 and mt8195 have same ethernet design, so private data
>>> "mt8195_gmac_variant" can be reused for mt8188.
>>>
>>> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
>>> ---
>>>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
>>> b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
>>> index d42e1afb6521..f45be440b6d0 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
>>> @@ -720,6 +720,8 @@ static const struct of_device_id
>>> mediatek_dwmac_match[] = {
>>>  	  .data = &mt2712_gmac_variant },
>>>  	{ .compatible = "mediatek,mt8195-gmac",
>>>  	  .data = &mt8195_gmac_variant },
>>> +	{ .compatible = "mediatek,mt8188-gmac",
>>> +	  .data = &mt8195_gmac_variant },
>>
>> It's the same. No need for new entry.
>>
> mt8188 and mt8195 are different SoCs and we need to distinguish mt8188
> from mt8195, so I think a new entry is needed for mt8188 with the
> specific "compatiable".

No, this does not justify new entry. You need specific compatible, but
not new entry.

> On the other hand, mt8188 and mt8195 have same ethernet design, so the
> private data "mt8195_gmac_variant" can be resued to reduce redundant
> info in driver.

And you do not need new entry in the driver.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
