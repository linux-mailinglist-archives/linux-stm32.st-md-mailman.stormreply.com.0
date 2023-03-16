Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A3F6BD8DE
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 20:20:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 855D8C65043;
	Thu, 16 Mar 2023 19:20:55 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18FAEC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 19:20:54 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id eh3so11710657edb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 12:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678994453;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I6W9kUfmlY3tEraL4nU9eY/Af3MdcpRFdLZzCUy+85U=;
 b=hVfamywI7Z36xHj6XfceRT3rEYu7wfXqO1XRTmOt0XtuS1PkmzUQX16lsH2KqLEfeV
 d255f9CAmKEI7EjqrU+c2cWlBUD0/GqyV9J10tpEQV7fjFsPcfLEIB8cu57VtX7rUDek
 4UanuNT7Ya6abBq+7caHifRqkiFOySFpEFbTnXAGI11fG0/r91wVhtxEmL9DFt2KZ+v9
 61m93BAFn1HQ/DoFe2qm/JF3HyET+PE7ufKR1sVG3VDpherQkPZwxCxGbZFJj/Mf+ZmD
 KzSeMCcilkxHvT6YH859eyYaRNj29AaCjaDhv1aCh46FqqymjR95pJOp7h4ME5sShC6V
 8VDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678994453;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I6W9kUfmlY3tEraL4nU9eY/Af3MdcpRFdLZzCUy+85U=;
 b=YthmVITf6IgUDkTwPwgcE5wWISpfFekBVm1G3TtLmMLZGcSOiE4K8gS3Sp0OlDAnj9
 5tEOoonXDvbYykovQME05//qYtEa2ciD6tT1Hwbp1ZqnRo9kSgrRzwXHbpofPVFEzLd5
 yMv/5OCBDkoWcwupeSrE/A99S7Mh9IWt9GSejozWvt2FjMO4dDHcxw5khD+u7QdoC8OY
 NJf2BlITn71A+yAdMr4U54FSaT1gGR/+EZbOr9Aia9tI6Ct8zo6OMApbFQdF1WN18ek9
 CGp+v/HncehxlfrtdPdaPd1sNtv+gI5JtCf+i1MtiOz6U1/wOqE4oJ8eD60jR5an4d2y
 ZFnw==
X-Gm-Message-State: AO0yUKVD29hYbDmeMFTwK3f78Cj3GzYzzeHVpAVCR6ccG6ldvncoOIp2
 gp5BxZIS6EjZDJt9UCCOumvo+w==
X-Google-Smtp-Source: AK7set8t10Jjk9M0yulDUJsBcv70/mUwE18d9PBfWRZHveo8W0esOHyL0XnxuDdXiwksCvF4lp4NSg==
X-Received: by 2002:aa7:db96:0:b0:4fa:d2b1:9176 with SMTP id
 u22-20020aa7db96000000b004fad2b19176mr672063edt.22.1678994453564; 
 Thu, 16 Mar 2023 12:20:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a50ce4c000000b004af70c546dasm143487edj.87.2023.03.16.12.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 12:20:53 -0700 (PDT)
Message-ID: <066ca8a9-783d-de4f-aa49-86748e5ee716@linaro.org>
Date: Thu, 16 Mar 2023 20:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-2-ahalaney@redhat.com>
 <d4831176-c6f1-5a9b-3086-23d82f1f05a6@linaro.org>
 <20230316161525.fwzfyj3fhekfwafd@halaney-x13s>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316161525.fwzfyj3fhekfwafd@halaney-x13s>
X-Topics: 
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com,
 agross@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 andrey.konovalov@linaro.org, ncai@quicinc.com, devicetree@vger.kernel.org,
 bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, bmasney@redhat.com, mohammad.athari.ismail@intel.com,
 robh+dt@kernel.org, ruppala@nvidia.com, jsuraj@qti.qualcomm.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
 netdev@vger.kernel.org, andersson@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 01/11] dt-bindings: net: snps,
 dwmac: Update interrupt-names
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

On 16/03/2023 17:15, Andrew Halaney wrote:
> On Thu, Mar 16, 2023 at 08:13:24AM +0100, Krzysztof Kozlowski wrote:
>> On 13/03/2023 17:56, Andrew Halaney wrote:
>>> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>>
>>> As commit fc191af1bb0d ("net: stmmac: platform: Fix misleading
>>> interrupt error msg") noted, not every stmmac based platform
>>> makes use of the 'eth_wake_irq' or 'eth_lpi' interrupts.
>>>
>>> So, update the 'interrupt-names' inside 'snps,dwmac' YAML
>>> bindings to reflect the same.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
>>> ---
>>>
>>> I picked this up from:
>>> 		https://lore.kernel.org/netdev/20220929060405.2445745-2-bhupesh.sharma@linaro.org/
>>> No changes other than collecting the Acked-by.
>>>
>>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> index 16b7d2904696..52ce14a4bea7 100644
>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> @@ -105,8 +105,8 @@ properties:
>>>      minItems: 1
>>>      items:
>>>        - const: macirq
>>> -      - const: eth_wake_irq
>>> -      - const: eth_lpi
>>> +      - enum: [eth_wake_irq, eth_lpi]
>>> +      - enum: [eth_wake_irq, eth_lpi]
>>
>> I acked it before but this is not correct. This should be:
>> +      - enum: [eth_wake_irq, eth_lpi]
>> +      - enum: eth_lpi
> 
> Would
> +      - enum: [eth_wake_irq, eth_lpi]
> +      - const: eth_lpi
> be more appropriate? With the suggested change above I get the following
> error, but with the above things seem to work as I expect:
> 
>     (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac|rebase-i] % git diff HEAD~
>     diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>     index 16b7d2904696..ca199a17f83d 100644
>     --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>     +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>     @@ -105,8 +105,8 @@ properties:
>          minItems: 1
>          items:
>            - const: macirq
>     -      - const: eth_wake_irq
>     -      - const: eth_lpi
>     +      - enum: [eth_wake_irq, eth_lpi]
>     +      - enum: eth_lpi

Eh, right, obviously should be here const, so:

 - const: eth_lpi

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
