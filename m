Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1D75E76CD
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Sep 2022 11:23:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDB1EC5A4FD;
	Fri, 23 Sep 2022 09:23:15 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B32D1C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 09:23:14 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id f9so18854373lfr.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=6KRGHi5QO3WPnDzOkycHTFaQ6rn1LlFLCXaq4LIPA2o=;
 b=nr19Q9adKvfDHJX1/MuKtdcCmb+W2G4kH9i+60wOK18TE2mFjrQb+Zhxkd4iaZDLYw
 UljVVMKI9OZEOTsuDxxGAT5c/UFL8XR67rS6OWaaw9r4B8Qgmujg/irw+c6WkX8QZbyS
 uc4dhF5ciBcdB6NnytStFtuQlGW/MCd6onKxK6cu8Ue6qxkAAec6dFtEW27xIKGPCGf+
 RJUnMQeiGSrQ6DmPFstmf9gOAdikqtf/ykVZrUAvavkQBmcQrXPZk3kubgEHf9sxAbjQ
 KYQt8AkzYu1LGEoaUIe2emDFYd9Atk9KwGWgew5BnOESRBgIDVIrqORDZrcToYmUVGlb
 5d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6KRGHi5QO3WPnDzOkycHTFaQ6rn1LlFLCXaq4LIPA2o=;
 b=S9ayY7GneA8pybNm34bMdHW1qm1Z/oXTHV1US6nRRGShcidsvZv8EFq3AQphPSdB//
 4X2XZPqwHV/HMA6zvUv54KIT3g0Pov3E0RnvuHY1qfPIClWEmLCpUWJKi4avhcpHrl7z
 A4faTMcvFuN/9hkx8Won0W3SbEjOg8KI3eMIcFFeOqbSY5lc3tULdjIZM1sfo5IPxChc
 UfQ/dCQ6gNOWM9nIJjqa5MxZRlOWpWGug2rLBLtR1Rwvden6ojgTJYoduKNNx2+bMm8G
 YAgaE40/WSyoLUyvcdR1JK8sk22xhYmcdiW6io1+/ISNvg32cGKGsDz0LYZlZSbyZZHU
 gDkg==
X-Gm-Message-State: ACrzQf180RPeUjp///c0qm94Sj4KNwyBT2yxns2gQmbPNCLRModE5ev5
 +GSobNo+ep4K3dD3Pu52zeTTUw==
X-Google-Smtp-Source: AMsMyM5CQWggSmYXQq0F3Di+/pXRM3IYsH2YikO+/Bi2/zu7pZyr6nxphxgrV9sWndQW0zsNvXqCvQ==
X-Received: by 2002:a05:6512:1320:b0:488:8fcc:e196 with SMTP id
 x32-20020a056512132000b004888fcce196mr2715533lfu.602.1663924994025; 
 Fri, 23 Sep 2022 02:23:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 11-20020ac25f4b000000b00499b1873d6dsm1349862lfz.269.2022.09.23.02.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 02:23:13 -0700 (PDT)
Message-ID: <29f9fbd3-a266-e947-5dad-27181d3945e3@linaro.org>
Date: Fri, 23 Sep 2022 11:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220922092743.22824-1-jianguo.zhang@mediatek.com>
 <20220922092743.22824-3-jianguo.zhang@mediatek.com>
 <04b9e5ef-f3c7-3400-f9df-2f585a084c5d@linaro.org>
 <8007b455dd18837c06ab099a6009505e7dddc124.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8007b455dd18837c06ab099a6009505e7dddc124.camel@mediatek.com>
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [resend PATCH v4 2/2] dt-bindings: net: snps,
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

On 23/09/2022 03:48, Jianguo Zhang wrote:
> Dear Krzysztof,
> 
> 	Thanks for your comment.
> 
> On Thu, 2022-09-22 at 17:07 +0200, Krzysztof Kozlowski wrote:
>> On 22/09/2022 11:27, Jianguo Zhang wrote:
>>> The clk_csr property is parsed in driver for generating MDC clock
>>> with correct frequency. A warning('clk_csr' was unexpeted) is
>>> reported
>>> when runing 'make_dtbs_check' because the clk_csr property
>>> has been not documented in the binding file.
>>>
>>
>> You did not describe the case, but apparently this came with
>> 81311c03ab4d ("net: ethernet: stmmac: add management of clk_csr
>> property") which never brought the bindings change.
>>
>> Therefore the property was never part of bindings documentation and
>> bringing them via driver is not the correct process. It bypasses the
>> review and such bypass cannot be an argument to bring the property to
>> bindings. It's not how new properties can be added.
>>
>> Therefore I don't agree. Please make it a property matching bindings,
>> so
>> vendor prefix, no underscores in node names.
>>
>> Driver and DTS need updates.
>>
> We will rename the property 'clk_csr' as 'snps,clk-csr' and update DTS
> & driver to align with the new name in next versions patches.

Thanks!

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
