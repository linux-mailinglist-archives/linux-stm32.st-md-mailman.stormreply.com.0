Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F47686D6
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jul 2023 19:48:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C92C2C6B470;
	Sun, 30 Jul 2023 17:48:10 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50CC2C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 17:48:09 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-99454855de1so533077166b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 10:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690739289; x=1691344089;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vXKQ+FT+ekXbJrRPEIuPYA+iGs9lD32lLjaVB8WOkqg=;
 b=NZXsMIFMSLCs4+QDwceXzmBnaaK14KVhIqegweudBDG32KMjauPNLPeLqW/387BC45
 SkiJXPT5Hr1Z0C9T8pTN9zhHJBwhXeLbHoj8inInwwBeUWWUq0VXKoS40e8q0Axj+fLK
 6pou8JxL1U2EaASYK22MCaq/54iiV4depgEG3CaEkSKkkBKGRMFdThbyy0DpkkAvbvbV
 rri+j6QoqREMkludmGpAVJOGe+kiqUMOWj0yS1Kp79rnpDIypCVtQpdkwONM7N84rew6
 8Q1enUJ/u8dKQFk2yTmGVLSt//LxWUUfOwdONFLAPB0Nez9Bs5mUhDu4daUsoWaRR9bf
 re1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690739289; x=1691344089;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vXKQ+FT+ekXbJrRPEIuPYA+iGs9lD32lLjaVB8WOkqg=;
 b=jgG7EPsauu7g1MiHXUT5kfL3nsnA32kSQcdTeHSnXs/CqGau+7cug9Y093YcYRgo/v
 2KtXbG0e2BPpkUtKPJL+1kNGq7tBUNnHMWnz1ckduU/h9Olya63nezSGFd75W64IYE1f
 ii4FNYMuxs7nsSAFp0i5CEBRsX+dfhhegQd+kgaZOhcYThFu+t3USufIDFJ+epN5vgvl
 q9v909V8BYAw5/R/FqchMvrUaKWx9QSqqNfOjuzrBwIcI/MgB9axLXjugF10lE5VJYE1
 LxGzolxiY0KXAQAa6qkIhNY1C+ypwiIrhMwsNkdsFpiW35IEQFG8HRnc8kIix1/RjHc8
 52/A==
X-Gm-Message-State: ABy/qLazcIoXamSLS/aa2i2olrqiAupyI/MKqcpMNPzFjyVKig8+2f5K
 oIyO+8Qmou/fl+QwaTZpUcsmfQ==
X-Google-Smtp-Source: APBJJlFZSxLeec25a5kiJaaoHg3q/S3QWVUH2q6ROn1ceOrFwC2RtorZVHCxlbc8BcE8bpP1BWThTA==
X-Received: by 2002:a17:907:7709:b0:983:cb6c:8aa3 with SMTP id
 kw9-20020a170907770900b00983cb6c8aa3mr4127267ejc.59.1690739288810; 
 Sun, 30 Jul 2023 10:48:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a170906449600b00992e51fecfbsm4976102ejo.64.2023.07.30.10.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jul 2023 10:48:08 -0700 (PDT)
Message-ID: <222ae956-213e-264d-c217-45bb8d624382@linaro.org>
Date: Sun, 30 Jul 2023 19:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20230726070353.103989-1-krzysztof.kozlowski@linaro.org>
 <20230726070353.103989-3-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726070353.103989-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 3/4] AMR: dts: st: ste: switch to
	enable-gpios
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

On 26/07/2023 09:03, Krzysztof Kozlowski wrote:
> The recommended name for enable GPIOs property in regulator-gpio is
> "enable-gpios".  This is also required by bindings:
> 
>   ste-hrefv60plus-stuib.dtb: regulator-gpio: Unevaluated properties are not allowed ('enable-gpio' was unexpected)
> 

Subject prefix needs fixes (AMR->ARM)

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
