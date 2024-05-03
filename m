Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D6D8BA853
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 10:09:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0270FC712A2;
	Fri,  3 May 2024 08:09:00 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 436DCC712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 08:08:53 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2dd615b6c44so98875951fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 May 2024 01:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714723732; x=1715328532;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9F32g4MjpRz2uIAU44wJHuksonJ+RwP1zeSV74QN6B0=;
 b=qE6zGvfzv+F4ZzYlsB8dqLmzpAxOSR2O7RWpLd4LQSCiqf/uwMKCIbH8Xag78AqKgs
 nVHh+YC6one4oI4fm4ZaPw+iJotePbg8jXGiIu6glE2JW4dnSzHw3fjWTuOb8OKBVIFH
 SjLVyrdT952iuljGI/N+r/ucPD5lotK1L+f/txpSnm3w2xyHVbr+gYDGaIEu+qNw1+R8
 Hd2p7v8z5RF/DZNCm6uWp5/M2STYwb2BlwUYKl56FrJgwq2+QIxzt3b0IVRzVavZpA2+
 8uJ+I773duV7NMTmFsce6lZy9P8jGlqpFbymBt1uqNw2JW1Sy5O1JQ2D7vFgFykENOds
 A3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714723732; x=1715328532;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9F32g4MjpRz2uIAU44wJHuksonJ+RwP1zeSV74QN6B0=;
 b=vhELkw4Dr9gAYTELARJqj4ohF8UCccDRU3g4lcCn1G+ynMVJRu1y20eU/yVjulw1cK
 SQ0kztLhm1eFS0cdsHKjq3fqCZoOs3pL3goA81fNUArPhFjq8Or2ZYXgcOBXyU5LvN1q
 lHAxutfT68FShU4VJbuBrbEl4z+wVle9ZT+FG9wvWav2wn0K9sGPdHu6B6eqJrFzWwrT
 wJLrwWbJoZlibg16KHbtPkYSZ6g1K2oWVfYrWsE1TQp7MA5BSDJdBDpv/y9ty2L0iTHh
 IwqUOm8NxloXvtGJIFwBIHTQ8B4fC176EfGXU2HDA2i1nGwf1+rGo0elToMi9y8/wEq4
 vvyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcW8HHexylhiwhJFRZjQFG0R2jxD9Wft7cKfK0O4k5wx22LofTUMDjYuW3mtPi3bB+VjtfrgcA1HVNveEvX7gk6SUIkkxPXrSZAg0q8VaKZnHsIHHLuqDD
X-Gm-Message-State: AOJu0Yy7L8rQ8/PgOldS7q+KSh1KneSRpRWmDeRjMuw6ZFvoGKJzwJLz
 J+BysWHwvwyeJbgwXy+ynLs+0WA+VW1fI2kVXMiecbRpxsF+MDNuotYnXyEpH+c=
X-Google-Smtp-Source: AGHT+IEyVSxtgBjxgwR445qD/sr1uxqCDskSMlyg7yV9YjhIzBtojmFjs//+3uZsQR/8QqR1GYTL8Q==
X-Received: by 2002:a2e:b0d5:0:b0:2dd:7712:efcf with SMTP id
 g21-20020a2eb0d5000000b002dd7712efcfmr1255172ljl.10.1714723732369; 
 Fri, 03 May 2024 01:08:52 -0700 (PDT)
Received: from [192.168.1.119] ([37.251.223.213])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a05600c445200b0041bf21a62bcsm8456940wmn.1.2024.05.03.01.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 01:08:51 -0700 (PDT)
Message-ID: <a2886f72-210e-41a1-aae0-c079a4d11396@linaro.org>
Date: Fri, 3 May 2024 09:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: Use full path to other
	schemas
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



On 5/3/24 08:21, Krzysztof Kozlowski wrote:
>  .../bindings/mfd/samsung,s2mpa01.yaml         |  2 +-
>  .../bindings/mfd/samsung,s2mps11.yaml         | 12 ++---
>  .../bindings/mfd/samsung,s5m8767.yaml         |  4 +-

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
