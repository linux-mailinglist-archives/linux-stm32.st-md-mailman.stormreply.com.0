Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A035E5B79
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Sep 2022 08:38:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09542C0D2C2;
	Thu, 22 Sep 2022 06:38:11 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66642C035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Sep 2022 06:38:09 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id l12so9761647ljg.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 23:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=qyfZU/JafD8o6/SPahDQv0jUqUXGqfaIFI7Q3Ul2auI=;
 b=kkd99uZxOdiNalyDhr8+He7hgk7NzeStc8HhuMSENnPjGg5C366/cLNg/a268b7aRY
 5FH1wAENXzz80lUMaNZ306V8yotqdPqE3YxE+wPwcPDhlDX/Zson0A40UeuKXDaEEa8F
 L7cQi8UJTDRbBnqgd8I43iHQZPLkC8E1iJvC343ZOsrcQJgik38mGMuP4nTykKe/bWc8
 MuLJQaf1ByHh9wK7CDMgHOOgCCSwedl+graYTN5ROFJPlNKdnT3ku8gDe/hJj6le1JEZ
 x3O5F/7rOwOxuRpFUxaZtGUBvdU10MfGNNDWhMvU/GmoKsV259wsEZWxn1a4tklEHtk2
 xwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=qyfZU/JafD8o6/SPahDQv0jUqUXGqfaIFI7Q3Ul2auI=;
 b=jT2X1SIxOh2qemgV4/sy0kPUFEnBXR29HtnUS4LojgItC7keAYIul7KJW2VGc1a6IH
 +KaT4P1jBgmb0dd2fB5vNt6WMOQ4tA6u558efqPUN2AY+fXEuF8OZoeSKSYo65t4c+4H
 pykXTfBiSiBk3l/rJ/Auo2lmu1ZRxYIs9IwieF66FIL3Kt+Juuy9cTe/MTcCXaKMjA4B
 Uk50Z4PaVfMZYiXvuk3ZrVNB2qhbtz7E3HPj6saEL+dinusc3XErIhIg54ZdAeeAPBFq
 91mXtaHnH6kLRMIlwowkd0prLAr4tEK0BfkUz/Ea5pKqJrSVIKqMPIP8qtWsJrw/sEsw
 CJgg==
X-Gm-Message-State: ACrzQf3xk6y4klOtaY6MCNMOYgRFmcapbBOriHa/HluLLk8+kdi010Wz
 9Mrxz3ofui9VLaTaMdh1AfSi4w==
X-Google-Smtp-Source: AMsMyM74j0aPxMSIE9NbVNKhB5RET6Vu035qf1/l0Aypj5PElvYZATE6ZCJU/M40ykreSuiv5OANYw==
X-Received: by 2002:a2e:84d6:0:b0:26b:dce5:2fe5 with SMTP id
 q22-20020a2e84d6000000b0026bdce52fe5mr529732ljh.12.1663828688613; 
 Wed, 21 Sep 2022 23:38:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 b1-20020a056512070100b00493014c3d7csm767484lfs.309.2022.09.21.23.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 23:38:07 -0700 (PDT)
Message-ID: <821b3c30-6f1f-17c1-061c-8d3b3add0238@linaro.org>
Date: Thu, 22 Sep 2022 08:38:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220921070721.19516-1-jianguo.zhang@mediatek.com>
 <20220921070721.19516-3-jianguo.zhang@mediatek.com>
 <bd460cfd-7114-b200-ab99-16fa3e2cff50@linaro.org>
 <d231f64e494f4badf8bbe23130b25594376c9882.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d231f64e494f4badf8bbe23130b25594376c9882.camel@mediatek.com>
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

On 22/09/2022 04:15, Jianguo Zhang wrote:
> Dear Krzysztof,
> 
> 	Thanks for your comment.
> 
> On Wed, 2022-09-21 at 10:24 +0200, Krzysztof Kozlowski wrote:
>> On 21/09/2022 09:07, Jianguo Zhang wrote:
>>> Add clk_csr property for snps,dwmac
>>>
>>> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
>>> ---
>>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> index 491597c02edf..8cff30a8125d 100644
>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> @@ -288,6 +288,11 @@ properties:
>>>        is supported. For example, this is used in case of SGMII and
>>>        MAC2MAC connection.
>>>  
>>> +  clk_csr:
>>
>> No underscores in node names. Missing vendor prefix.
>>
> We will remane the property name 'clk_csr' as 'snps,clk-csr' and
> another driver patch is needed to align the name used in driver with
> the new name. 

You did not say anything that you document existing property. Commit msg
*must* explain why you are doing stuff in commit body.

We should not be asking for this and for reason of clk_csr.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
