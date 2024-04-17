Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 858958A89F3
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 19:10:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09897C6B47E;
	Wed, 17 Apr 2024 17:10:19 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0001EC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 17:10:17 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1e5b6e8f662so44732255ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713373816; x=1713978616;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FUzDJY7t9H7U+uIUYVqmIVsezT70evHGuhSl2xA7NDc=;
 b=COg3Y5+J/FwjG3d65v28QbVOGnMbgzONTvRgPIesP/y5i/IRYvwKiZs4fCbaqT0t0z
 m54xkkKsk0K2tL0ysesobBbLPWQMaxwul4bj5jphHKCQyyXKp9wAyScYk7HYiN96eZ7D
 hB91eowweoUWCvYUgzubmDs7lenFdkPNuuOlCLDCF2KAcPQ4jSs1jg1Ai1zUiPpI8rEv
 VP84l2EF34bW336qJuP79f2z9MmAAfXJCRSKD//Ket0PHJwCLioF+1wdUYvozViWwrkz
 ekjdrbT1mXF75s0Q+LhR2+x+y4yVx1xxX/q/Uegk6AY67gB4cRT8Q4vDKar+cdAgYBvY
 iW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713373816; x=1713978616;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUzDJY7t9H7U+uIUYVqmIVsezT70evHGuhSl2xA7NDc=;
 b=SZFldyURck3NDkdEKAWMwH8do7rGksQi3pd3LuWVHKn/0mzZa11rtbxgcUbWqhykR7
 hYSVmAyCevXNELNqZSDiirbeyFW3jNtk5cow1LSTfJYHLSiqMzoDSJhNOVkMz6A6ZKUd
 kaSyp/S+Q9E3j5nmKxLqXUybd9DsMBb+OnuM0fJRqggghxFnHSvfASGs6YH/xNSs1Lvg
 os3uE9ZJELoRIrdpq9whCOXZ+9gxmiZZ4ipj1pyQxnCRvM2UOD2kdo33euYhYkgWcMcd
 oE5kkbXgq2HbiS1HIJ3nQeRQYV7owdTml+txuIi7BrN+2yrSiY7YJIqj8uv4p+/McV3Z
 ztOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjTSjbkTuGD9+NVcfZntxWm/QXe1+TbxC6uFLHDWekgNepNzebQ27HFEEhNzO09iyVWld2fhiNeuhzFWYTcv984O1ePmwheTdUlgoc/hsS157fogTP+4Xl
X-Gm-Message-State: AOJu0YwKLt5s/6nJ8eCoxubPtPDPrrJJnm6+yXLAEN0FefkeRCBkPQEU
 A+IMAXXXv8LjWb7Qq65kSlotB/Goowf7qNLenPdDEcvafjD9QpSDRO1vElYj84Y=
X-Google-Smtp-Source: AGHT+IH5PV2K/cfOZAuGQxOdypxVU3UbAHnIhIC9mRywjS+TQPh9qv3pbXlB2e33qDT/TIHIqPM7cw==
X-Received: by 2002:a17:902:f7d5:b0:1dd:bf6a:2b97 with SMTP id
 h21-20020a170902f7d500b001ddbf6a2b97mr62194plw.60.1713373816426; 
 Wed, 17 Apr 2024 10:10:16 -0700 (PDT)
Received: from [10.36.51.174] ([24.75.208.151])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170902650b00b001e509d4d6ddsm12046145plk.1.2024.04.17.10.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 10:10:15 -0700 (PDT)
Message-ID: <294f9048-9756-4d8d-b770-ebaaa4023c54@linaro.org>
Date: Wed, 17 Apr 2024 19:10:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <171182151736.34189.6433134738765363803.b4-ty@linaro.org>
 <cfa5aa01-44ef-4eb1-9ca6-541ed5908db4@linaro.org>
 <8a8a8e8b-8256-4d33-a39b-9e3cbc4ccff2@arm.com>
 <4e762eb1-864e-4bb5-ab5d-debeac19c8fa@linaro.org>
 <Zh/Tmarryr4TzHIA@shell.armlinux.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Zh/Tmarryr4TzHIA@shell.armlinux.org.uk>
Cc: kvm@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-input@vger.kernel.org,
 Mike Leach <mike.leach@linaro.org>, Andi Shyti <andi.shyti@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Olivia Mackall <olivia@selenic.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 James Clark <james.clark@arm.com>
Subject: Re: [Linux-stm32] [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
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

On 17/04/2024 15:50, Russell King (Oracle) wrote:
> On Wed, Apr 17, 2024 at 03:29:26PM +0200, Krzysztof Kozlowski wrote:
>> On 16/04/2024 12:41, Suzuki K Poulose wrote:
>>> + Greg
>>>
>>>
>>> Hi Krzysztof,
>>>
>>> On 30/03/2024 18:00, Krzysztof Kozlowski wrote:
>>>> On 30/03/2024 18:58, Krzysztof Kozlowski wrote:
>>>>>
>>>>> On Tue, 26 Mar 2024 21:23:30 +0100, Krzysztof Kozlowski wrote:
>>>>>> Merging
>>>>>> =======
>>>>>> All further patches depend on the first amba patch, therefore please ack
>>>>>> and this should go via one tree.
>>>>>>
>>>>>> Description
>>>>>> ===========
>>>>>> Modules registering driver with amba_driver_register() often forget to
>>>>>> set .owner field.
>>>>>>
>>>>>> [...]
>>>>>
>>>>> Applied, thanks!
>>>>>
>>>>> [01/19] amba: store owner from modules with amba_driver_register()
>>>>>          (no commit info)
>>>>
>>>> Patchset applied here:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git/log/?h=for-v6.10/module-owner-amba
>>>
>>> How do you plan to push this ? Given this affects most of the drivers/, 
>>> do you plan to send this to Greg ? We have changes in the coresight
>>> tree that would conflict with this "tag" ( I haven't merged them yet, 
>>> but is in my local queue). I want to make sure we can avoid the
>>> conflicts. I am happy to merge this to my local tree and base the
>>> changes on this, if this is going in for v6.10 and all are in agreement.
>>
>> I pushed it to arm-linux patches but it hasn't been picked up.
>>
>> I propose you take entire set then.
> 
> You are again being, IMHO, abrasive with your attitude. So far, every
> interaction with you has been abrasive and bordering on abusive.
> 
> You haven't asked me whether I will take them. I will - just not at the
> moment because 

Thanks for confirming, I wanted to ping you because there was no feedback.

Can you provide stable tag for coresight tree?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
