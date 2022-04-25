Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 581F650E2AC
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 16:06:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11A5FC60462;
	Mon, 25 Apr 2022 14:06:49 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70F38C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 14:06:47 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id g23so11533802edy.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=/vpSTQOxMIjkwOKDd/IzLiSQDeYbAvNqMNwYa2oQYqE=;
 b=vKwliupk7ILiPaMFtJEU1aYZmewCgLpvxJGMWMS3r4Dbpq81h3mZ3BAZaHVMvcD3ns
 StiMfxnZzlQckNOWj8dIe4HYZs3aZGY9a8U8qdFXHQp71GID8HhFOU5d0XvmRhaFkcVW
 HFO201/98clZYXhATwcDgZpKJXmhVmQk3OKTnuD+N/1p+DRug4wHUAB6jWh4unugYmSd
 a+8XGjwrg8Kbjm/5Sa2l+w2/9vqIdfXd5yH5aFQXe37QepXmHcLn1FyKxzg379hm5XJJ
 yPxnttZCWa7mTlakwmaQlqxS8gBAv8X0PT9iWJUnkFOAnLyfOp6mw5Ar4s7UmRYeAExp
 F35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=/vpSTQOxMIjkwOKDd/IzLiSQDeYbAvNqMNwYa2oQYqE=;
 b=kBFZzQgV0mxc8UizTp97QeS4XktHfvVtrlY24SsSQz0xS7lZRPPD8aqWdgpK1GOjEe
 ddxD1gCE+QRXLua6MhAUE1pxHq8Xyfwa1wWiCSMtClMViZOE1a5/zn/XzmLVXlBuSSw0
 Wrhwa8JRn5GkzBNWgFPJaliJg1u1Nol1notRhmVFx/TmgrgWhLnsg3ualDsL0YpgGHLN
 +asgXeWHjg9/cpUr/I6PIBbfyhGVoLUI3sMPgdVyO1cjnVsxy7VslCYyhA3uj8mi7TPh
 PaaPG4i0lIOPP8YuLlZMCXjtNsN+1eCPcvYv6u1dpPCKmk+EDRNH6fT+loqfnx4JjQUC
 mhCA==
X-Gm-Message-State: AOAM530qIPEmUBGa8YVonY6UMtuM49OCAnvOE8kYDqPHmzXKHKLFVo8h
 F8XZlRQyehXFFeBZFFcv9Ho6Xg==
X-Google-Smtp-Source: ABdhPJyZuFxlR17FQ27WvK6hB8uY+2zlu7SUpICQqyinBeK6k2xotFJ+rDD1CGFkKZP1pqSzVmKeQg==
X-Received: by 2002:a05:6402:f1a:b0:425:f303:8b35 with SMTP id
 i26-20020a0564020f1a00b00425f3038b35mr1901074eda.332.1650895607099; 
 Mon, 25 Apr 2022 07:06:47 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 k15-20020aa7c04f000000b004229daeaf37sm4649052edo.40.2022.04.25.07.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 07:06:46 -0700 (PDT)
Message-ID: <5c6ce97d-e31a-6cf9-6da6-8d27f19a53cc@linaro.org>
Date: Mon, 25 Apr 2022 16:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
References: <20220425132844.866743-1-o.rempel@pengutronix.de>
 <20220425132844.866743-2-o.rempel@pengutronix.de>
 <35648611-cfa9-1df4-7130-7cd1bcf1a69e@linaro.org>
In-Reply-To: <35648611-cfa9-1df4-7130-7cd1bcf1a69e@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/4] dt-bindings: arm: stm32: Add
 compatible strings for Protonic T1L boards
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

On 25/04/2022 15:53, Krzysztof Kozlowski wrote:
> On 25/04/2022 15:28, Oleksij Rempel wrote:
>> This boards are based on STM32MP151AAD3 and use 10BaseT1L for
>> communication.
>>
>> - PRTT1C - 10BaseT1L switch
>> - PRTT1S - 10BaseT1L CO2 sensor board
>> - PRTT1A - 10BaseT1L multi functional controller
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Although the order is still messed up. I through you will move the entry
just slightly up, not to the beginning, so maybe just rebase on top of:
https://lore.kernel.org/all/20220425140436.332467-1-krzysztof.kozlowski@linaro.org/


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
