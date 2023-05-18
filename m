Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 084327083EC
	for <lists+linux-stm32@lfdr.de>; Thu, 18 May 2023 16:30:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83D49C6B445;
	Thu, 18 May 2023 14:30:09 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56AA8C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 May 2023 14:30:08 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-95fde138693so256109566b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 May 2023 07:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684420208; x=1687012208;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ls9dh09ENn+6fe7/vJfQ3VRRA3BvM+SzwILtRYqYDnY=;
 b=gmPlnPCVhoaDyNM6MVkkA+adWeyXH6HJGFhbf/nfIqTlGlqGsVnLn04An3U9rEPO0s
 i6YZlC75MQrfgjQ5q72+dXms7qtFHKQIfxNROdkZuIwALMy5As1QW/Z7pGHbvKHLG1Q0
 l12B9BDX/Cbq2nphP+4VNPefTIIDA/mLFKVDv837iarGLmlVwMtXd3uasm/gYzIcrwuC
 KFjxUUz2bsZuc6EQXrTH93cuLUY2+7fOwdRRXQfcqXS0wp0X3Eo8cETYuLsG8Wz9Z/zZ
 zqbzDeyQ5oLf0HontaNENmBf1BPTXNHqaaHP6o3lpyQArrn0/iT8zD72OrdAN4gdZZed
 UChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684420208; x=1687012208;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ls9dh09ENn+6fe7/vJfQ3VRRA3BvM+SzwILtRYqYDnY=;
 b=FMQI5c/q/D2YyZH5Hu8FsYvzIlvaswRNsiCUOjAJHeJmXzQLmPP5cAZY/keR39kPKS
 qItsjkgb4rzwzf+DAwwj+TuQwelCZHPQrSbQmLLJlo6GEUmMqZwoPu6nVtj1Kfg5K0P0
 Opctp9Grkesno4Z3FR10Y3dsOQJWiVaXsos0YFDaD7hqmDcBSd1PnbrSP4h0AZMcRoSx
 Fy9hLIINqvRDv4xC9UlWJvx5FrzUIG41jlAfQdLdE3q3h3/IpwNt3xneDHpSzrK9OxC5
 rQZwswtyvOwptcnTbiTWDmSHS9ztdyrc9zWvk3jz24jFp/09gqHzl1vmm2Eeuc0GyMZW
 Jl0g==
X-Gm-Message-State: AC+VfDwn+9CtoOyeYaHfvEOyOXy1GdOP1a6e6BAWUVW6WbWZnk0okekv
 Q+RPac6JreXH3wz1p5bVn27f0Q==
X-Google-Smtp-Source: ACHHUZ7RefkcnOCKj936lk8NtLACFEYhXjwqbckO2ALsSctKMH6+At3thKKYt2nncaO0HVsKNm4hbw==
X-Received: by 2002:a17:907:94ce:b0:965:77d2:7802 with SMTP id
 dn14-20020a17090794ce00b0096577d27802mr6149261ejc.0.1684420207747; 
 Thu, 18 May 2023 07:30:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e24:6d1b:6bf:4249?
 ([2a02:810d:15c0:828:7e24:6d1b:6bf:4249])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a1709063a8d00b009596e7e0dbasm1036175ejd.162.2023.05.18.07.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 May 2023 07:30:05 -0700 (PDT)
Message-ID: <1ad00eb9-7bcb-b93a-191e-7673c835c31e@linaro.org>
Date: Thu, 18 May 2023 16:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>
References: <20230517152513.27922-1-marex@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517152513.27922-1-marex@denx.de>
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

On 17/05/2023 17:25, Marek Vasut wrote:
> Add trivial bindings for driver which permits exposing syscon backed
> register to userspace. This is useful e.g. to expose U-Boot boot
> counter on various platforms where the boot counter is stored in
> random volatile register, like STM32MP15xx TAMP_BKPxR register.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Let me also leave a note here - cross linking for all parties:

Please propose a solution solving also mediatek,boottrap, probably
extendable to range of registers. Other solution is what Rob mentioned -
this might not be suitable for generic binding and device.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
