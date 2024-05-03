Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C938BA7D2
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 09:31:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A307C712A2;
	Fri,  3 May 2024 07:31:57 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE5F6C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 07:31:49 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-51f3a49ff7dso1640246e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 May 2024 00:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714721509; x=1715326309;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8nIAbUzFZ0W2jGneqHDrLTTJJlX3iJTnQjqRXAlljl4=;
 b=bbo3KqNSNq/hjgPzAP9JyZRQS0Xi+NJ8paGsq+/ITxfiFRxH6o4LH9PRyU+sx1uPdB
 irpu7fcQbnyXWvFX06bgCNv5Mn0Qj6Hw3WxouKFtayJeCY+d+ZypGK9/VEGViTzEQOpz
 XEET3LNLpbG0wgt9iL7Dk5nfZP/C9+gmNk1KxmYULKBlA1NrtCIF3cyx7jHhym8VwNE/
 ZgqMOHZXL6+3BGQbcnlvI8mMsFFCHe08J7T4iRtLBgn/glhIxwneiA5gX/IaeoaAyzCx
 FDkFQJm3SFslOZfAHamJoM6T2YjPyIlOSVOPWYOqZJw/buVgmOrzPeKhj8usXLZ3oElU
 IvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714721509; x=1715326309;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8nIAbUzFZ0W2jGneqHDrLTTJJlX3iJTnQjqRXAlljl4=;
 b=p5ZZxAbdXXdfQPGsk8BLsaqVC/AMMx7DDj1puIfFt8eWvnJYD5tezDCclVUz5U8Scw
 1GVAzNPQFRq8Y8lmewdGuQBKZRWOuPxf7psCkJ0oqMJZ5uSwCie+8IiLu6Q5NNoAW9tw
 U3+ZfWLt1RyzqIAWvVzECAt6AgFgxmH2lTjeouaq+ItUUKK3FPRm7aWIC4NXiMKoH69A
 8tmIx8rvJGZ16w+3gru2OOZMfUNWvg76mkW2dtmbhrH/7Ouxg+IvflVXh7Wj7lJV8505
 HlQOhLj+AEfbytLe9z4yjhzt/9npVHdovg07HP/BPQi2mnW3ZzBbDDKNyCq0RoTQAYoF
 MzLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQqMyI1V0W2c/xZpPyWztIjgaPsH6kMLI8D2j935eDtNSSxxxdGCvOwUTz4jkiSkgD6pBHUIxhF09XqLObePfjZzYwvMjPqfqHaRPC1YuZKoQ4MYkOB03/
X-Gm-Message-State: AOJu0Yw1fwKvGAvQ6kcdFrBP6W/pQrmI8erjLIDQKtRdo6CrHaeaqYoH
 FD4jU2brfO5OvP4XNGetYwZZjeNTAlQ8D6oExscDUVZJhGRKXanU
X-Google-Smtp-Source: AGHT+IFsUViOgQWBfed0iW3it0Tz8tCjvrW37J5LJ5nqlT1r2qRnsl694GKdCGtShTdCqT/cBC7gsQ==
X-Received: by 2002:a05:6512:3ba:b0:51c:d528:c333 with SMTP id
 v26-20020a05651203ba00b0051cd528c333mr570067lfp.20.1714721508677; 
 Fri, 03 May 2024 00:31:48 -0700 (PDT)
Received: from [172.16.183.82] ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id
 x27-20020ac259db000000b0051d71292d5bsm450650lfn.74.2024.05.03.00.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 00:31:47 -0700 (PDT)
Message-ID: <017b2462-f9c9-42c0-bfd9-1a0e76d2ea3d@gmail.com>
Date: Fri, 3 May 2024 10:31:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
From: Matti Vaittinen <mazziesaccount@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 5/3/24 10:21, Krzysztof Kozlowski wrote:
> When referencing other schema, it is preferred to use an absolute path
> (/schemas/....), which allows also an seamless move of particular schema
> out of Linux kernel to dtschema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/mfd/actions,atc260x.yaml         |  6 +--
>   .../devicetree/bindings/mfd/brcm,cru.yaml     |  8 ++--
>   .../devicetree/bindings/mfd/brcm,misc.yaml    |  2 +-
>   .../bindings/mfd/canaan,k210-sysctl.yaml      |  6 +--
>   .../bindings/mfd/delta,tn48m-cpld.yaml        |  4 +-
>   .../devicetree/bindings/mfd/iqs62x.yaml       |  4 +-
>   .../bindings/mfd/kontron,sl28cpld.yaml        | 10 ++--
>   .../devicetree/bindings/mfd/max77650.yaml     |  8 ++--
>   .../bindings/mfd/maxim,max77686.yaml          |  2 +-
>   .../bindings/mfd/maxim,max77693.yaml          |  2 +-
>   .../bindings/mfd/richtek,rt4831.yaml          |  4 +-
>   .../bindings/mfd/ricoh,rn5t618.yaml           |  6 +--
>   .../bindings/mfd/rockchip,rk805.yaml          |  2 +-
>   .../bindings/mfd/rockchip,rk808.yaml          |  2 +-
>   .../bindings/mfd/rockchip,rk817.yaml          |  2 +-
>   .../bindings/mfd/rockchip,rk818.yaml          |  2 +-
>   .../bindings/mfd/rohm,bd71815-pmic.yaml       |  2 +-
>   .../bindings/mfd/rohm,bd71828-pmic.yaml       |  4 +-
>   .../bindings/mfd/rohm,bd71837-pmic.yaml       |  2 +-
>   .../bindings/mfd/rohm,bd9571mwv.yaml          |  2 +-
>   .../bindings/mfd/rohm,bd9576-pmic.yaml        |  2 +-

For the ROHM stuff,
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

>   .../bindings/mfd/samsung,s2mpa01.yaml         |  2 +-
>   .../bindings/mfd/samsung,s2mps11.yaml         | 12 ++---
>   .../bindings/mfd/samsung,s5m8767.yaml         |  4 +-
>   .../devicetree/bindings/mfd/st,stmfx.yaml     |  2 +-
>   .../devicetree/bindings/mfd/st,stpmic1.yaml   |  4 +-
>   .../bindings/mfd/stericsson,ab8500.yaml       | 48 +++++++++----------
>   .../bindings/mfd/stericsson,db8500-prcmu.yaml | 40 ++++++++--------
>   .../devicetree/bindings/mfd/ti,tps65086.yaml  |  4 +-
>   29 files changed, 99 insertions(+), 99 deletions(-)
>
Thanks!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
