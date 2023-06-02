Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 076017202D8
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Jun 2023 15:13:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB887C6B443;
	Fri,  2 Jun 2023 13:13:44 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4ED78C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 13:13:43 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5147f7d045bso3006999a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jun 2023 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685711623; x=1688303623;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=57q4TdWvHlrEcIXeoi1W6gK5/9KE0SGJz/XNivOKPnk=;
 b=m9GaBMggEI20VXMLlKimzmXgfD2tFFpsgnDCnJnAzGBiSIil3R7xyTQsrSZ0tkBKQ2
 Dan82iwCSen/4Qc7ylIOt8DQXGEvhxbZlViE149oQ6jXGm0iWDn+RXA1eGo8J0vDX3Mc
 qYGzE3Tb04bFDQ5oz9hGJRnHjVJJgpU6m8ZmOe2V5iTi5SiokNy886+NLJrDVBOK+Wfq
 YrEoS1xUKfBU4khc/qPtsNsgb8BQAioPYPCu0YnueaAFfAUhR89gr80YqopukdfPwaHg
 zM4Ev9JbZ3Dtm1Asdwd8VYPDEs3pYrQ8nsOUW3nPQvLoqWmVbKq0aoIjDRmwnTj7Mog5
 7BPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685711623; x=1688303623;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=57q4TdWvHlrEcIXeoi1W6gK5/9KE0SGJz/XNivOKPnk=;
 b=WSe+SYvoIR3viHva9wqTkfDqpDlF67qsyuJGDv97FnbBwpyqb7lR1sx4i/bjhP0Bjs
 uV65vyRqHQD39ub5sDeNsdMMGhBT0YHt71f57MxM4edhD43DX+aF34YSinvMOfz8p7nO
 ivHUcHX1k8z8fWAZif0GL2cSfn71UgMijEa8HvFC7km6d5Gx/B5+aFvJfwwK02ol3M18
 cs5/WApdfEk20FSifgcTUEdMi6tUfXxFNN361Zi6BwgXv2WcjjbO4dMhsRz2jmfj/XfP
 mhAAEKQyzyKQp6/RDf/9rIuBb1Om6dYlgWu2qN/PFj5tdHQxZY+pOPz90GcsIllXdUo3
 sBwg==
X-Gm-Message-State: AC+VfDy5BQ4cDpNu7k71KPPsrfscNgQTR+gRTYgSTGexvceQD17wbwRS
 lG5QpUuqzG0/DP0cHWD3o4uuqA==
X-Google-Smtp-Source: ACHHUZ43d+sUWltwQzDiB3YR6CO9kaf0tCGFKY31o/sI7+FHsx2VcAbPoNydH2HsLkQ4RBU6XfW+uw==
X-Received: by 2002:a05:6402:205c:b0:50d:8979:5722 with SMTP id
 bc28-20020a056402205c00b0050d89795722mr1868357edb.39.1685711622721; 
 Fri, 02 Jun 2023 06:13:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a50e70f000000b0050d83a39e6fsm682708edn.4.2023.06.02.06.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 06:13:42 -0700 (PDT)
Message-ID: <955b84da-7d7c-1a30-680f-530c7593643d@linaro.org>
Date: Fri, 2 Jun 2023 15:13:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor@kernel.org>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-5-alexandre.torgue@foss.st.com>
 <20230529-backlit-dealing-b099e4eb5210@spud>
 <c805cd5f-92b1-eb56-d9bc-66814705e848@foss.st.com>
Content-Language: en-US
In-Reply-To: <c805cd5f-92b1-eb56-d9bc-66814705e848@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/11] dt-bindings: stm32: add st,
 stm32mp25 compatibles to the stm32 family
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

On 30/05/2023 10:39, Alexandre TORGUE wrote:
> Hi Conor
> 
> On 5/29/23 20:05, Conor Dooley wrote:
>> On Mon, May 29, 2023 at 06:20:27PM +0200, Alexandre Torgue wrote:
>>> STM32 family is extended by the addition of the STM32MP25 SoCs. It is composed
>>> of 4 SoCs: STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>> index 4af5b8f4f803..7d7ca33d2e61 100644
>>> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>> @@ -161,6 +161,15 @@ properties:
>>>             - const: phytec,phycore-stm32mp157c-som
>>>             - const: st,stm32mp157
>>>   
>>> +      - items:
>>> +          - const: st,stm32mp251
>>> +      - items:
>>> +          - const: st,stm32mp253
>>> +      - items:
>>> +          - const: st,stm32mp255
>>> +      - items:
>>> +          - const: st,stm32mp257
>>
>> I assume the slightly odd format is just to avoid churn when adding
>> the board compatibles.
> 
> Yes, exactly.
> 

I don't get it. How are you going to extend it? Or rather - what are you
documenting here? If these are SoCs, then this is not valid. We do not
allow these alone.

No, please drop it.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
