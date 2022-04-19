Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7476506D2E
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 15:10:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91B77C6049A;
	Tue, 19 Apr 2022 13:10:14 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 319CFC60494
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 13:10:13 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id lc2so32755278ejb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6CuIgS1BfUtpTM+Pz1fHGr+8MNQCk51/yx0AK7OcWBc=;
 b=xsQTOgA49u/fP3Mugg9NyZY3BW9owhYCMISUkWzhH1AkqNDclSJ2uiUjQSmbnVStup
 08R1SyVoVojZRZCDHQ1QcrowgMyJ93gK1DKXie4yiEomulQHoZHdur0URpNroKFX0ZXg
 twbnVdM7rSCjDYy1yUEYVzeqYGwGecYx3EtAtaXAmDUGx3dhWPatMDUeKFN4YATsg4XK
 u3tBvty3pQ4oS/eWISZsrNAhxZ66XfN4tdtHAlGKaKqGZqVfzf1olCVrYXBoy9gSFgot
 YtvJrqMdKTAuq8lk8okqZGOJ+EOaAyiJWIiiUvcQkZ+rt7Fnq0NhzGX9CRd0wlOuhpfx
 jMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6CuIgS1BfUtpTM+Pz1fHGr+8MNQCk51/yx0AK7OcWBc=;
 b=c7w/iBaTiR6Li04sT3ads1oN6ypwuKncTGkfn8N92/gdt2X1sRJaKw7ym2+E4Khbre
 jn4jFVq2jUq61uWB1JOpBKYd8lJHH2ObZuxfqw/6B4EtCRgFqgE+fXui6+E5TwAdRxVC
 Gr0ETgpa2LXzN5nvlNm9vUUzFrMQw7jbPVcxLYgSZXynRCJgeB/twBweHNxzm+DRDO5R
 o/2J42raIe1s9jdxCVD17QLhpuhAxzJ+zQBsyspflLItklaAmyeiLTtafA/+9ZI5toBF
 B6HghQraC/HSq7J/SJTvbopD4dh3LcfTTJ2xfm7yR3v2rThcacUrScvq9qYNfbD3S4Gy
 3dqQ==
X-Gm-Message-State: AOAM533KyOkhF/IOoqx/ejhGHvLCTzfZ5gYPm+4eiQ29uR8ECi50LSTl
 16dqjjDRqGZHcM8ymY13iiVlCQ==
X-Google-Smtp-Source: ABdhPJyvlrN/AdAcX6QIeIHMg6GFnCLyKvjTlPMI3hvoWRbMQn2WS4LiM6SxMAH1J+hjlm5Z5zfQSw==
X-Received: by 2002:a17:907:7f08:b0:6e8:b005:5f4e with SMTP id
 qf8-20020a1709077f0800b006e8b0055f4emr13499539ejc.177.1650373812715; 
 Tue, 19 Apr 2022 06:10:12 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 b23-20020a05640202d700b00422da9b980esm6337505edx.22.2022.04.19.06.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 06:10:12 -0700 (PDT)
Message-ID: <8798d7bb-6480-90ef-90fd-d7ff7d7beb2a@linaro.org>
Date: Tue, 19 Apr 2022 15:10:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20220407143027.294678-1-krzysztof.kozlowski@linaro.org>
 <d0d9c16f-4668-1263-49fa-e51648c8c098@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d0d9c16f-4668-1263-49fa-e51648c8c098@foss.st.com>
Cc: Olof Johansson <olof@lixom.net>, arm@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: align SPI NOR node name with
	dtschema
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

On 19/04/2022 15:03, Alexandre TORGUE wrote:
> Hi Krzysztof
> 
> On 4/7/22 16:30, Krzysztof Kozlowski wrote:
>> The node names should be generic and SPI NOR dtschema expects "flash".
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   arch/arm/boot/dts/da850-evm.dts                  | 2 +-
>>   arch/arm/boot/dts/dm8168-evm.dts                 | 2 +-
>>   arch/arm/boot/dts/spear1310-evb.dts              | 2 +-
>>   arch/arm/boot/dts/spear1340-evb.dts              | 2 +-
>>   arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 2 +-
>>   arch/arm/boot/dts/stm32mp157c-ev1.dts            | 4 ++--
>>   6 files changed, 7 insertions(+), 7 deletions(-)
> 
> Thanks for your patch. Is it possible to split it per vendor 
> (TI/STM32/SPEAR) ?

This was a part of a bigger set where most of these I split. However
here split would be more churn for such simple change, so I combined them.

This was already picked up by Arnd:
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?h=for-next&id=56147a156e7e2f50bef695efe6cc4fe8e91c40dc


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
