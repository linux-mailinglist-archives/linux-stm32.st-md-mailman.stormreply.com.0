Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A98C79E149
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Sep 2023 09:58:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F622C6B46F;
	Wed, 13 Sep 2023 07:58:29 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 246BCC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Sep 2023 07:58:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-401d6f6b2e0so3602705e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Sep 2023 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694591907; x=1695196707;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nFueJl78mh+PKTiVs6I5JpNS70hNWQMI7pbyEB+VCP4=;
 b=XVfh4PQtSOXIINbYi0SCOmecLG63QZkqv/RslKGJSS/Pp8MMJgxSyIu8pKw/Bwin9D
 HL/7T+C4Mp5ZZTaOedG76es9V0YMvIHAR6ln/XjWvoqpMUC/1ij9yaxOxwTjUPx5MDD8
 MQ6TAYshdmAwZ46r5sp94NWbN/8J3ko2kAr6dtZKB/IqhnLRVMidsmmI/SFNhPPN164J
 iR8JF/Uvr+4dGLXhC7/lsaqh7HRiFdWsCr0mM3ULKKw0ALUlY83Zc+1CkXhTqde8j189
 FNNzG3q525xqAKLmSXmj3vu/CSNCt+FQuLczye4Dt6sup5EhcEOR8RZKoVlsr32sciPn
 cZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694591907; x=1695196707;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nFueJl78mh+PKTiVs6I5JpNS70hNWQMI7pbyEB+VCP4=;
 b=loM5dgElzm0W88eBIoTDIfXNTIZxkqLted31bf00dAqCyAqI+qL4YjoyhBvDDTk4iC
 vxyqo14czYY1ieXhJgRPf1a37VVmRPzSj9HHaDqm59Xv2TVw6HAIoC6KVCHWaQgYwNuu
 6nNZs3Qgg/GBsAFChrI0kA8ZdatRuAK7oGJUmJiUNyYIidqE24wxI09rBV/055Nx+fcr
 0U3FhEdiVitXj2Rww6wvb47BHrBaWp7+Anj6WDOxrWQzDE12KFZ8cOXAoDE8qn++Xw9i
 7PtHm8B1LX2vM4qOYUwgb9DoGn7j1KjsWJ62/aTsSz5zIchhxWAHc9HjyHgz6tNZPmQZ
 Q9bg==
X-Gm-Message-State: AOJu0Yxc+g5592FBCaGoju6kFFTTg2245JzfbqNXgtQLhbMZ7RchiFvT
 9YA+tnzGal7E0btf0IyWDYdg7A==
X-Google-Smtp-Source: AGHT+IHUg+HymGtIogUF6zI/UwDj8czk/y4R74TkkVBPkkz6kjD4I29RU6Ea65Zrv7c1m/0uHXvrjA==
X-Received: by 2002:a05:6000:1364:b0:31c:8c5f:877e with SMTP id
 q4-20020a056000136400b0031c8c5f877emr3711400wrz.33.1694591907432; 
 Wed, 13 Sep 2023 00:58:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a7bc8c2000000b003fefca26c72sm1244434wml.23.2023.09.13.00.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 00:58:26 -0700 (PDT)
Message-ID: <a74d0d3b-1729-c4e0-eb79-e7653e87e862@linaro.org>
Date: Wed, 13 Sep 2023 09:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230911120203.774632-1-gatien.chevallier@foss.st.com>
 <20230911120203.774632-8-gatien.chevallier@foss.st.com>
 <28ec58a3-63d5-f604-cef9-571b062fe244@linaro.org>
 <d5f2d1b3-fc91-76f0-af3d-bcdf6c4b5703@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d5f2d1b3-fc91-76f0-af3d-bcdf6c4b5703@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 07/10] dt-bindings: rng: add st,
	rng-lock-conf
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

On 13/09/2023 09:48, Gatien CHEVALLIER wrote:
> On 9/12/23 16:38, Krzysztof Kozlowski wrote:
>> On 11/09/2023 14:02, Gatien Chevallier wrote:
>>> If st,rng-lock-conf is set, the RNG configuration in RNG_CR, RNG_HTCR
>>> and RNG_NSCR will be locked. It is supported starting from the RNG
>>> version present in the STM32MP13
>>>
>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>
>> How did you implement the comment? There is no changelog, so was it ignored?
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hello Krzysztof,
> 
> I've sent V2 before Rob's review. I'll apply Rob's comment for V3.

Ah, ok.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
