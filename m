Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 105A858D2B1
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Aug 2022 06:18:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAC14C04003;
	Tue,  9 Aug 2022 04:18:38 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF888C03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Aug 2022 04:18:36 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id l21so344501ljj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Aug 2022 21:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ktjbOwbUIz6JZWGLIYlF9Qv19zLsmQ14nlnBHaQqtKY=;
 b=fQbtoJUe4jFNbbbhRZa3Tv3NjHw8InWX5xP/yg0r7db2IBJyPK2LkV+4jCyhbDQxTw
 rS0bRSG/hcpK0Ii5M7QHqSc7nbfDNrH8nq39KCCP42jnpx40OMM+sayFO5PvyZL97k8k
 dJPX3sQtCrl/8Qx3b30gxzLIBFrnvQmGjPPpXLRAzFUHKw+plgD8zpAbIcjExJ3qS74q
 5pNKgzTmMakgmVu14v4B5GKshfCaFDntqrRboBU4fdj8b4KF09hpLWQ15iTdEnNKwlNN
 HQB0Ff1f5ldnZOq1TZ4UtvFSTmp5mgvhGd8oCI99ROxC6dFDMXGfpQQszUFs0uSzBXNK
 nDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ktjbOwbUIz6JZWGLIYlF9Qv19zLsmQ14nlnBHaQqtKY=;
 b=oUAMtOAIRV8OvbWo+jPPLNsYct3C8owx5hS8gXDu+mjczjbSyThAdkP3e7Hx7VLBej
 D96i+7M13779mb0P5oA4frmMmBwKvmu5LIhE2MoHrYratVFYbvqyvgM2o46GLu7HdV6e
 C1YX3PoHUghVS/QXLvqxA6+NztbZd9YLPVHefb9B+Rxjc4oomLytTHkvAuUu68ZSCFck
 wRP/bz8hcHyFFL88yN+vpHVzVX7klk/yP9a9aWzcfJBmPtV32S3IQ07aJGZw5zGu9zMy
 gDXtYR2F9oqViiik8EeY26G/o27zzLS2fOV/HbUxPppJsZ56DBAR1/UDpCCcpx31mLR9
 Yrxw==
X-Gm-Message-State: ACgBeo2j39N05oF917KxnzVpCiry09E1XpN4BDbE2FCnpN27JZ7cMrng
 djgVVm2ChaPI5mQAS3VzYjk4iQ==
X-Google-Smtp-Source: AA6agR7anU7Jd1Qacvlqh82YFYxyDO1oFmXIYlQYQsIHymSU5X0Uh7ffWNrP57hUs0cBE78V8Gi8pQ==
X-Received: by 2002:a2e:bea8:0:b0:25f:e9ab:5a1b with SMTP id
 a40-20020a2ebea8000000b0025fe9ab5a1bmr1592141ljr.448.1660018716032; 
 Mon, 08 Aug 2022 21:18:36 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a2e9d0f000000b0025e2e70b41fsm1529430lji.71.2022.08.08.21.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 21:18:35 -0700 (PDT)
Message-ID: <38c3977a-0196-1832-ff94-317064cbc439@linaro.org>
Date: Tue, 9 Aug 2022 07:18:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Mark Brown <broonie@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220808074051.44736-1-patrice.chotard@foss.st.com>
 <20220808074051.44736-2-patrice.chotard@foss.st.com>
 <9ad4b4a8-988e-f185-f80c-6f15f341ce8c@linaro.org>
 <79fd7e19-ceef-14fb-5a83-603740735f8f@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <79fd7e19-ceef-14fb-5a83-603740735f8f@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: spi: stm32: Add st,
 dual-flash property in st, stm32-qspi.yaml
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

On 08/08/2022 19:08, Patrice CHOTARD wrote:
> Hi Krzystof
> 
> On 8/8/22 11:01, Krzysztof Kozlowski wrote:
>> On 08/08/2022 10:40, patrice.chotard@foss.st.com wrote:
>>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>>
>>> Add new property st,dual-flash which allows to use the QSPI interface as a
>>> communication channel using up to 8 qspi line.
>>> This mode can only be used if cs-gpios property is defined.
>>>
>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>> ---
>>>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>>> index 6ec6f556182f..5e4f9109799e 100644
>>> --- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>>> +++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>>> @@ -46,6 +46,14 @@ properties:
>>>        - const: tx
>>>        - const: rx
>>>  
>>> +  st,dual-flash:
>>> +    type: boolean
>>> +    description:
>>> +      Allows to use 8 data lines in case cs-gpios property is defined.
>>
>> It's named dual-flash, but what if you want to use QSPI to connect for
>> example to FPGA?
>>
>> Also how is this related to parallel-memories property?
> 
> I called it "dual-flash" simply because it enable the dual flash feature of the QSPI block (bit CR_DFM : Dual Flash Mode)
> which allows to use the 8 lines simultaneously of our dual QSPI block.

And how is it related to existing parallel-memories property?

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
