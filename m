Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F24EA0B522
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 12:08:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D66B7C78018;
	Mon, 13 Jan 2025 11:08:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20160C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 11:08:37 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4363298fff2so3766285e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 03:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736766516; x=1737371316;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kvoFJS6F9wk4jz44qoey7Q8fjFA+Q2ZM9VARRWQtXsA=;
 b=nLYsRngvJ73jOsc6tL3N4dO0ogGLi2tmYKU0EMyx7qFrhbApYG4/cpm2Eah7PgFbzk
 OPqZIQ9VQim/O5iHLqkzMAB9h6WJoXRLWaQbFsrVn7YjdBpaFtj5GvCB+ezz/b+s43yl
 ecOKjGHWKgBNEbgzYWWZwkNcomq15CPqiK0c43yuWJhgTP64d+cSGzcRBorE8fp00Ejo
 JSAOcWqpRrmt5RGy90sN5V5X+6CJfg0w5/SnE8cq7/sdIDqP6Ex6J/9LI65SREIcvWH/
 qPbDofnMf5MmDHxDA6Z4sGo8q3cAfbwD8EZK+oca2LcgZjzgvryzmkxuFsB8npBPnDj9
 Bmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736766516; x=1737371316;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kvoFJS6F9wk4jz44qoey7Q8fjFA+Q2ZM9VARRWQtXsA=;
 b=Y6wjwLI7fsX89eNe6Lt5YqMo9SkO0SZKhmD3ncEAKm6cgtGvfd/skxeHOHNprmvsgI
 udkJYZQFEtm5q53QJ9bZi35u6OtLmq0s2Z37ZYEj56IBCeiu2vAJcN7qLlMizZ80kBg1
 WTRFgfoggWbNxwkzE2vSo65z5G+iX7Z4QZmOqI+PDTIPnWgNR2hM+H4B283YhCaZW3GM
 uAOUE6vTyUba4hTbTyJPMYy41VEjM9vCvCzSoCRy4+5XwwIQMz1JUYU40OCLac4cDR/h
 yz40a29khIt2V4/TOs1vlzoXTNZo7AVaoYk6VWUw5CMG9SIgnMVKO+4t9/4OnvXLiE+5
 NCiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXnBYH2UnqafO3cnZbDMkMnkZA3tkJYy4SYEEs1R3u4YxdgWeBNGGt6sZ78u54myQ7cEUwW/2si0Lfmw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyIohzBMe4/NyvLwbV77RltixGCxP/cf1Yq1MKmCv3koW9YQYCx
 HB7e4PIrMhG/6Hv5dm1bBepX5VEhLD/Q0Yi/TglUaSujhHvwcKP0RYSiXegts6I=
X-Gm-Gg: ASbGnctAuCVjYmbcaOur99uNAs67FCMYua45fAJqAXgjnJYMZ2wa3HRW/RxLZH6oHCt
 /cQhyKwx6m/CrE1/pGwthcd3t994bBTIshOQoFtB9mdUG4Sx541CwFbJg0r2YqWGzlAJlBD7pMQ
 JMFFq+i3ELvdRxN4VszTRpWcebCXCMJse3ZemIFGA+0eMmYcmQuVieE/MMXDOsvi4D3EGS+dujl
 vMO1NwJjkNnV4sQXeBztH8JMknXnjqUc6vTSeSiXmshG+AXJFP6rtj3efYgB0H3n8fo+bDlPvTL
X-Google-Smtp-Source: AGHT+IEtKtLo/TYcYGUtHWrN3Y4wjZbk9HsbQfFeClkVRV79rZvw4FVq+Cj27cVFDaCibTRx/n3qjA==
X-Received: by 2002:a05:600c:4f03:b0:436:1ada:944d with SMTP id
 5b1f17b1804b1-436e26ff7famr73442685e9.4.1736766516543; 
 Mon, 13 Jan 2025 03:08:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da6271sm173554635e9.9.2025.01.13.03.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 03:08:36 -0800 (PST)
Message-ID: <249902d2-5a03-4c9b-a7e8-61dcfa9b5029@linaro.org>
Date: Mon, 13 Jan 2025 12:08:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yanteng Si <si.yanteng@linux.dev>, MD Danish Anwar <danishanwar@ti.com>,
 Roger Quadros <rogerq@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
 <20250112-syscon-phandle-args-net-v1-5-3423889935f7@linaro.org>
 <5d97dd34-f293-4403-b605-c0ae7b5490fd@linux.dev>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5d97dd34-f293-4403-b605-c0ae7b5490fd@linux.dev>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH net-next 5/5] net: stmmac: stm32: Use
 syscon_regmap_lookup_by_phandle_args
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

On 13/01/2025 09:05, Yanteng Si wrote:
>> -	dwmac->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscon");
>> +	dwmac->regmap = syscon_regmap_lookup_by_phandle_args(np, "st,syscon",
>> +							     1, &dwmac->mode_reg);
> The network subsystem still requires that the length of
> each line of code should not exceed 80 characters.


Please read the coding style regarding this issue, before you nitpick
such things.

I see you send comments like:
WARNING: line length of 81 exceeds 80 columns

which is not really helpful. That's not the review aspect necessary to
point.

> So, let's silence the warning:
> 
> WARNING: line length of 83 exceeds 80 columns
> #33: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c:307:
> +							     &dwmac->intf_reg_off);

Unless networking maintainers tell me otherwise, I find my code more
readable thus it follows the coding style.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
