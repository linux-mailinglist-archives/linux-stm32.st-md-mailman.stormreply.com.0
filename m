Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 776147320D1
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 22:20:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F0D5C6A60E;
	Thu, 15 Jun 2023 20:20:29 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65B00C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 20:20:28 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-977ed383b8aso333891666b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 13:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686860428; x=1689452428;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PheO5hW175jjKSK37vk+49jVV02xT5gnJ8XioudxE24=;
 b=jJ1Yre5AYXwepAMacg3jhvKTHmzpMIh+WgtkpxRVxOr09dqTzMF7jp6K7qcoty8g7e
 iJ6wdMaGMHt5tg/K5QAh8NtzNcNt+aLaC1oyZ1HxxiZvKA3MIY8/q61xrbgsvNuUOf0w
 pVAJHpFRgr+iV+YA2UFKQlYk7ACJehZdfhglFSfCjEp/Ut2ohj5B+JbjmxP4fk6NOi8i
 0B1B1vLpZU2doFhOgOsxbxY5011fFf14lWlNaDPeeD+yZc4mHM5uo5KsHzzmYs4/eXR+
 7Re81CHd66YhxGm9kasxDV0yK7YJrPElZmCFx7hWR9burlrPrOz73VbqNIAkcEH/ynwL
 30bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686860428; x=1689452428;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PheO5hW175jjKSK37vk+49jVV02xT5gnJ8XioudxE24=;
 b=LxWhYyFT4T0HfMR/H3sdsLN0NVb7hGshaj19+wdpUCWNmEWLti5/Ifw8Da8KaIh1pV
 8XSsiM1M4ABmegAx8U1XEa3GVuBXzJTOxpTlkqRkJ1OgBxGUIGOYddNa580C3t30Zdx8
 Wga/C8NkGQ+xj4LqZ2o/iG2T3JPFAcQDsJOyHW5R5Y7uXqIUi/qj4GRCKIRm/MZoRLgi
 pQQJVubOZCHuoiM3hnao2CSHPGIipQ28cJyDmN0sQ52RYkTHT/aSAOjuNWrIsPr7juaw
 X8U4LZ0R3mz7Jv+w//Tq18UEBJvZ+lNmpnizxFo1eArx6X5o5wmNEZzAHl6EYZDywBqs
 pdRw==
X-Gm-Message-State: AC+VfDx/m665/0E09FGt1Dl+H/xKDpXQ89QaXwC0TyhQhWEgEu1dsd69
 AyJDv6H2eaVGw3sMRJn1utIkaQ==
X-Google-Smtp-Source: ACHHUZ5o8zCpuaorGfbrYqyO1FXI2LXPqdCPH/jO8rGp25VgkKZhHn6c43x02tQ8XqtH/xIB860/uA==
X-Received: by 2002:a17:906:db0b:b0:982:25d1:bfd3 with SMTP id
 xj11-20020a170906db0b00b0098225d1bfd3mr116904ejb.15.1686860427808; 
 Thu, 15 Jun 2023 13:20:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a17090680c900b0096f782f727esm9989482ejx.140.2023.06.15.13.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 13:20:27 -0700 (PDT)
Message-ID: <ba63e07f-69db-c54f-08eb-7adb635a68fb@linaro.org>
Date: Thu, 15 Jun 2023 22:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Valentin CARON <valentin.caron@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20230615075815.310261-1-valentin.caron@foss.st.com>
 <20230615075815.310261-4-valentin.caron@foss.st.com>
 <479bf05e-342d-f94b-87f3-4cc0a95fb01a@linaro.org>
 <b25d30de-8a22-b5ea-e58c-78b3d55b3cac@foss.st.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b25d30de-8a22-b5ea-e58c-78b3d55b3cac@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/4] dt-bindings: spi: stm32: disable
 spi-slave property for stm32f4-f7
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

On 15/06/2023 19:38, Valentin CARON wrote:
> Hi Krzysztof,
> 
> On 6/15/23 15:36, Krzysztof Kozlowski wrote:
>> On 15/06/2023 09:58, Valentin Caron wrote:
>>> From: Alain Volmat <alain.volmat@foss.st.com>
>>>
>>> STM32F4 and STM32F7 can't switch to spi device mode.
>>> Forbid this property with compatible "st,stm32f4-spi".
>> Just to clarify - driver cannot switch or hardware does not support it?
> 
> Driver can't support it right now but hardware can.
> 

DT is independent of some chosen (or current) Linux drivers. Imagine
Linux cannot support it but OpenBSD does.

As Mark pointed out, this needs a follow up commit.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
