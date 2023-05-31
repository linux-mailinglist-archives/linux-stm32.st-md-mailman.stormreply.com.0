Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 918ED718A59
	for <lists+linux-stm32@lfdr.de>; Wed, 31 May 2023 21:40:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D65CC6A614;
	Wed, 31 May 2023 19:40:52 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5005CC6904E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 19:40:51 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-96fb45a5258so1076090266b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 12:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685562051; x=1688154051;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pobc0FZC6eSroL/2lHGSWPK4EdAbIGAq+x1N33jzXbs=;
 b=kfFl6UjQ4EwXR9O5rqEeCXLNFvrihpxmfNee25KH5BLrtviktGmFTbPdAlBFMtRHmy
 A/oqkPbSI5NZkj45ltLv4PAnSE+TGYjqg5HLNvHNOje1RBuby+fTk5j7nEZML8crztTA
 XLSGLqrCsWqJRt7vO8gNCPpd3x8QcMsBbXei2aodtMadWs0PWLs7TaSAs8jI1kVGcHDT
 3lUZVUfgt8hpg5W+VsynbKQwIZ7ZvMvaTTNj996Yc1LAF2sUth1tMWU6d5CK6XefF6yf
 vQ3MCtPoiTAu/SAhlYINVXxdxR7ypUnrS8SesuQFOtWOECK8qr+OMpvoysYFwDbacJHZ
 G9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685562051; x=1688154051;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pobc0FZC6eSroL/2lHGSWPK4EdAbIGAq+x1N33jzXbs=;
 b=beKIxJUVAzDVAAiT0b25fxRX4mBMyK77mJz4sHgubzSj13clPdCUZFYpTIIpqze0eC
 KGA5gNGRjG1+9AN4HI2pV9HSJigGMmijNKR8508deLBllHiSOFBRT9R3K/I4+csDwH0A
 5t75Iv+Y9sBLxsv1iy6L271MpC25d5MNxNjt+a2BHrGcAHg1d2KeXu2Mng6gCAY//PJU
 fWRE/+uH+bhYCyaZupoQuZoN4zfJrZMKcUTQ0jgj/vm5c1+9JlQyzp9N5e4FzsJvltVH
 scBZGfIGHyxRQTrIWHuBb3ksZ4KZ+6LS6vVExJBQQCfTGYGxdJcjnLbF3gsIuvbHHyNt
 AxCA==
X-Gm-Message-State: AC+VfDyGRrnWosd2Uy/ZQh6uCJYPvYJbhaBi15fdepMx4g0P1meoCA7j
 vFCiit80FEjcU9cCJjvM/m0jxA==
X-Google-Smtp-Source: ACHHUZ6NOszzBlFtX4KUWAeQCIqCPlPa5liXWZCOZ+7MT+N4TdFLdIIAyRDgUmJ9D1GhTkhVXTGH5Q==
X-Received: by 2002:a17:907:c07:b0:970:164c:31b5 with SMTP id
 ga7-20020a1709070c0700b00970164c31b5mr6228000ejc.46.1685562050764; 
 Wed, 31 May 2023 12:40:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 se24-20020a170906ce5800b009662b4230cesm9583865ejb.148.2023.05.31.12.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 12:40:50 -0700 (PDT)
Message-ID: <6699ec62-9eb5-8b9a-97e0-4b0d5f760962@linaro.org>
Date: Wed, 31 May 2023 21:40:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>
References: <20230517152513.27922-1-marex@denx.de>
 <1ad00eb9-7bcb-b93a-191e-7673c835c31e@linaro.org>
 <2ff8d48f-c069-6ece-7865-4268296618fd@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2ff8d48f-c069-6ece-7865-4268296618fd@denx.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: nvmem: syscon: Add
 syscon backed nvmem bindings
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

On 24/05/2023 05:29, Marek Vasut wrote:
> On 5/18/23 16:30, Krzysztof Kozlowski wrote:
>> On 17/05/2023 17:25, Marek Vasut wrote:
>>> Add trivial bindings for driver which permits exposing syscon backed
>>> register to userspace. This is useful e.g. to expose U-Boot boot
>>> counter on various platforms where the boot counter is stored in
>>> random volatile register, like STM32MP15xx TAMP_BKPxR register.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>
>> Let me also leave a note here - cross linking for all parties:
>>
>> Please propose a solution solving also mediatek,boottrap, probably
>> extendable to range of registers. Other solution is what Rob mentioned -
>> this might not be suitable for generic binding and device.
> 
>  From what I can tell, shouldn't the mediatek 1g MAC driver have a 
> nvmem-cells phandle to this OTP/fuses/whatever area and shouldn't the 
> driver read out and decode its settings within the kernel ?

Maybe, but since you both implement the same driver and similar
bindings, it's a NAK for having both. It looks like solution matching
both or boottrap is not really nvmem syscon (as you said).

> 
> That doesn't seem really related to this particular issue I'm trying to 
> solve I'm afraid.

It's similar in implementation, not necessarily in hardware.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
