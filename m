Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 189755BC603
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Sep 2022 12:06:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF60AC0D2C1;
	Mon, 19 Sep 2022 10:06:08 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBF9CC03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 10:06:06 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id x27so12855179lfu.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 03:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=E/6rguEg/ZdWc1ukf7xlwUxy6XdvsLO+DoWiEuYD7Kc=;
 b=R/d5F8iQ5A3MJQq2a2urDyF3hOpf96JRd6MMVeuZytNnN38d+CMzYHcqO67WLlgjrF
 1YOTkwdBXx89EEa5IHZCIOnsH/D7ixYq0fnqz7E6WzF9juomojx3oI04uV+WLIpC7pSq
 VUlPCpXDbtXt1bOBZICVgjdP5lDuEF6FW9ya//+jjjjvV4Rdu1Io9wwK6PShHtWVk05C
 myyCftKiYalXiuQf3wsSfCHOD5hrDwaw9Dy4z1o7/Lkli8O3u6KPW46z/bDhJILuJ5Ea
 qFQ/gGWd+eX6p+JCLsf4mZezgCkL2wP/f0kkg5zBeR73KILKAfNYbrWR6TYXWl5SvOyO
 YuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=E/6rguEg/ZdWc1ukf7xlwUxy6XdvsLO+DoWiEuYD7Kc=;
 b=p8k7XTtF+k7XxGowAuX4pPZwjqLd4u/FLeeY8WOP+eHL1TEGfs3krLIBj8PKSJ96Td
 UmW+bT6wzy3NwABrwx+5pXS6jb0GLnpwZL+HdeJd3+Q6JdhFUT6chp6KMNyE5N9tX8Te
 hkpAm+lkwE8JxagI/QXAhgHF74BbeRnPt4r4uPxXGCRDhhceVYalLVTZIlIsnrFSlYOR
 nsHozqnFfKxc17IXTw9AR1aF5yPGfeIHvBJ3U6ASSby54PEtj10kpXgs+tqw62nuRJFY
 5cGDXC5mpG7xJ8cb98+GHUhTCX0BQQBgGjrxJBK/QQdlQo6xsVO5CygPlZmNoXyX8KZ1
 Klhw==
X-Gm-Message-State: ACrzQf2SOInK+rHvpi6G0g6O3wC0Anx0Uyyc+NOSRRpT73UzVLfl09ft
 X3Yaha3H3ag3km834pK6LQx4xA==
X-Google-Smtp-Source: AMsMyM7gfRP2Gkver1jK03ZgtDxTkEMoPJyKiDo+jioBxtwYyq894VSIuGwOrIApkwapq8djpspI7g==
X-Received: by 2002:a05:6512:e9a:b0:498:ff3b:4639 with SMTP id
 bi26-20020a0565120e9a00b00498ff3b4639mr5805175lfb.388.1663581966082; 
 Mon, 19 Sep 2022 03:06:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 n4-20020a05651203e400b00492d064e8f8sm5141134lfq.263.2022.09.19.03.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 03:06:05 -0700 (PDT)
Message-ID: <b343e4c7-a247-28b8-3d16-cb7cea7ba36b@linaro.org>
Date: Mon, 19 Sep 2022 12:06:04 +0200
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
 <88412fcc-96be-cd9d-8805-086c7f09c03b@linaro.org>
 <f72e133e9aec70724702054e5f6a8712b649d34f.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f72e133e9aec70724702054e5f6a8712b649d34f.camel@mediatek.com>
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

On 19/09/2022 11:56, Jianguo Zhang wrote:
>> No, this does not justify new entry. You need specific compatible,
>> but
>> not new entry.
>>
>>> On the other hand, mt8188 and mt8195 have same ethernet design, so
>>> the
>>> private data "mt8195_gmac_variant" can be resued to reduce
>>> redundant
>>> info in driver.
>>
>> And you do not need new entry in the driver.
> Do you mean that I can use "mediatek,mt8195-gmac" as compatible for
> ethernet in mt8188 DTS file?

Yes, as a fallback. Example schema describes such case.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
