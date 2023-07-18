Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7183757603
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jul 2023 09:59:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6598DC6A611;
	Tue, 18 Jul 2023 07:59:48 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A253C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 07:59:47 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-992f15c36fcso746527166b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 00:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689667186; x=1692259186;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FxG/dgx1lJpw0Lc0GgA2hZzfp5EFCNWKYdqUEuovTVQ=;
 b=uwq1Bj9uJBZn+EMfsjTHtGo4gtCkN+HhVTk9FiB/tXndUT+0b/ZXAUsZNPjCdWHQMo
 CW+I3s7pNSJF0kQnvcKnRX0Eh7pTnJLZm6ZIHcDR8IZbUlNBJ5/GIoZIgtSUU7uSWm95
 7lpkEHTdVhBB+pLCtZfjKsGfUj8Hz474ZXpAkjZtArI6PxPqf+I4Pa8Fi3vHCJNTZLGi
 k1Yb+bPPnxN+GrfNuM+dMxHo+fiup7W+uOKOpZA/1IvqhSbwZ97CYXN7Vsg5ZLnQ7L2t
 LhIIDc3bgHhSF7w2ztNB/nLOc7aX9aRei0/J/AJqzaX3n9sWiWyiSgRKu4nk2EQc2z6K
 5B5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689667186; x=1692259186;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FxG/dgx1lJpw0Lc0GgA2hZzfp5EFCNWKYdqUEuovTVQ=;
 b=d4YAB6ZSPln7C0PHQtjXfDteKC/8VY5v8V/yUSuZ864+gTzCY8gjZO5WEHBA2P7tfR
 YvUg5aNsTOhL/HlFFW+qxjMYLSV1ohD1LaH3efI4EuJii3Fu+bTzjDoZfGbpAsHi/8Mp
 k9V1tX8N1fA7FP1h+YovggqWov5aXPzsEYGK4RzOUhwRHPnEOjRLVQqDOTEwU/S6n8gW
 CClDA/KktIj+B22B2J/qHjiRlE3UvOhurAzq/oCbhLK721e0nUf93nWf8ZM3nJWuHFRq
 u9EQaJsV5/mP4zXW9mAlqr1u6qSW1Nv2vkf6uwqkHMqYPUn42bmELJkXD8DQiSQ4r2ts
 d+7A==
X-Gm-Message-State: ABy/qLZO+iAlTpJB0YEDtBfQzOucYMHrIwr6aofrGF6RSvrF8yz5Uhdk
 WzADPsv/KOUmMAsIY9/g6TeCTQ==
X-Google-Smtp-Source: APBJJlGvyotpbpSMeNWfrlnOSBa8BIfuSDUuHdp+6qgXvn3jbTe33GGd40wYCJJDEOYua3tnBBqsvw==
X-Received: by 2002:a17:907:310f:b0:991:e5a5:cd4b with SMTP id
 wl15-20020a170907310f00b00991e5a5cd4bmr11135118ejb.56.1689667186645; 
 Tue, 18 Jul 2023 00:59:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a170906045500b0098cf565d98asm682840eja.22.2023.07.18.00.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 00:59:46 -0700 (PDT)
Message-ID: <4287a5b2-698d-4c2d-46a1-4cdeb2ac28e6@linaro.org>
Date: Tue, 18 Jul 2023 09:59:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>
References: <20230717164307.2868264-1-m.felsch@pengutronix.de>
 <a34ef1ed-e204-77ba-a4b1-1a4bbabdac7a@linaro.org>
 <20230717165724.juh77dr4nmoxoehq@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717165724.juh77dr4nmoxoehq@pengutronix.de>
Cc: kernel@pengutronix.de, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
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

On 17/07/2023 18:57, Marco Felsch wrote:
> On 23-07-17, Krzysztof Kozlowski wrote:
>> On 17/07/2023 18:43, Marco Felsch wrote:
>>> Document the common phy-supply property to be able to specify a phy
>>> regulator.
>>>
>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>>> ---
>>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> index 363b3e3ea3a60..f66d1839cf561 100644
>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> @@ -159,6 +159,9 @@ properties:
>>>        can be passive (no SW requirement), and requires that the MAC operate
>>>        in a different mode than the PHY in order to function.
>>>  
>>> +  phy-supply:
>>> +    description: PHY regulator
>>> +
>>
>> Isn't this property of the PHY? Why would the Ethernet controller play
>> with a supply of a phy?
> 
> Because this is the current state. Please check the all other MACs
> handling the phy-supply (if supported). Some of them handling it under
> the mdio-node (not the phy-node) but most bindings do specify this on
> MAC level (e.g. FEC, DWMAC (suni, rk)).
> 
> I agree that the phy sould handle this but this would be a lot more
> effort and since the dwmac-sun8i/rk bindings do support this on MAC
> level I would keep it that way.

Indeed phy bindings do not allow a supply.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
