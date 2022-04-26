Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E25050F168
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Apr 2022 08:45:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4C53C60466;
	Tue, 26 Apr 2022 06:45:08 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 510FEC5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 06:45:07 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id m20so13290940ejj.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 23:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GCTUtskM/bUVNqoWwWzS0KAkms8zQjbR5nbiEfiWJ2M=;
 b=e6RCe4wt2jOhwCC7a30bZb0cYOCLxSqN0BwDORx1w117AoEHJxKvsRC99Pg9ZOkSxN
 BYbbcR9OpWXx0qHFBw4u6t/Jai9I4KQgMGO74PZpZUIe+pcLnQRE3/z+fXM+l45QoCP1
 cND1PJHq/47XhA1jrQEcymkMpd1c9HI0BfziHrW+NJ9q8zeIc4WPN8lJ2GSkgUJkeCh/
 a/HDA1Wa6ClvNJZEpmjELV8RxnZwsvTQdskkBSa3Cy19YKp2Yiz8FKwsm7ZCoOmLySed
 pImbO3a9qULVn6fsGyZNYDyhDvNq6ZfZRQeYoNk041ko9+gI2a3JWuPcgNjAs3Ta8jOI
 K8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GCTUtskM/bUVNqoWwWzS0KAkms8zQjbR5nbiEfiWJ2M=;
 b=Up4Pdb0cgpI/dgRvsRcPrWVH1YeiXvZCLoKAVCacESXrfcrNl2yuWNc0VnAiQYDiTy
 qjkqcYll5zU3DyL5Uls2twsoX4yJabqN/NWMHzfxm5jUYMBw+7Agi6f26wFndGI8O+z+
 HRXN03kzcilezAKQ/LR1qE63WLjPl2/LnL8zNu2b4B8lUy9DQ7jLr9bIJIFseC5RLO2/
 5bpVEBOE9W1EqYk5IvBL5fXpgxKPV4V+LpPz+KpijiVKxIvh5yEbuehbjzr4HqrI61CQ
 PfKOjO6z3zpAnDYo8CO3a8hMsc1q2AR7NQNnuPBGGH059kd2KMGareifpmAGh1e1s7QZ
 9fww==
X-Gm-Message-State: AOAM5317NFt9BxIKkPrKalPY9aDvZsQT9iLahB4V2unZuOJWdd+DrGTf
 GRI30UaBrTZjLL90ZBBl5wymUA==
X-Google-Smtp-Source: ABdhPJyKy2sT/kR3eWE34jx+Och5uYkRNfzgYx/gjSb2QtBiuG3W+E9beq63JAbRXNzJ/noyrm3sQw==
X-Received: by 2002:a17:907:1c8d:b0:6f2:eb2:1cd6 with SMTP id
 nb13-20020a1709071c8d00b006f20eb21cd6mr12393047ejc.568.1650955506949; 
 Mon, 25 Apr 2022 23:45:06 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 q6-20020a17090622c600b006f3876cd90csm2564511eja.198.2022.04.25.23.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 23:45:06 -0700 (PDT)
Message-ID: <3dcec64c-3e34-9bef-f71e-754135278968@linaro.org>
Date: Tue, 26 Apr 2022 08:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Oleksij Rempel <o.rempel@pengutronix.de>
References: <20220425132844.866743-1-o.rempel@pengutronix.de>
 <20220425132844.866743-2-o.rempel@pengutronix.de>
 <35648611-cfa9-1df4-7130-7cd1bcf1a69e@linaro.org>
 <5c6ce97d-e31a-6cf9-6da6-8d27f19a53cc@linaro.org>
 <20220426063517.GB3419@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220426063517.GB3419@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
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

On 26/04/2022 08:35, Oleksij Rempel wrote:
> On Mon, Apr 25, 2022 at 04:06:45PM +0200, Krzysztof Kozlowski wrote:
>> On 25/04/2022 15:53, Krzysztof Kozlowski wrote:
>>> On 25/04/2022 15:28, Oleksij Rempel wrote:
>>>> This boards are based on STM32MP151AAD3 and use 10BaseT1L for
>>>> communication.
>>>>
>>>> - PRTT1C - 10BaseT1L switch
>>>> - PRTT1S - 10BaseT1L CO2 sensor board
>>>> - PRTT1A - 10BaseT1L multi functional controller
>>>>
>>>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>>>> ---
>>>
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Although the order is still messed up. I through you will move the entry
>> just slightly up, not to the beginning, so maybe just rebase on top of:
>> https://lore.kernel.org/all/20220425140436.332467-1-krzysztof.kozlowski@linaro.org/
> 
> I put it according to the SoC version. st,stm32mp151 would be the first
> entry before stm32mp153. What order do you prefer, where should I put my
> boards?

153 is defined lower. The first entry in the file is a trap. :)


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
