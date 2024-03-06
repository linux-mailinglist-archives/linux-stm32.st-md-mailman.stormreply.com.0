Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 261DD873D9C
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Mar 2024 18:41:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC13BC6A613;
	Wed,  6 Mar 2024 17:41:56 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9909C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 17:41:55 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6902947c507so12775526d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Mar 2024 09:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709746915; x=1710351715;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qoGpBFyUJXIJqUxawCbUvlxpYBQviBzPiWSgkxLAi40=;
 b=nf8bkTjZDYjA5blBGLJk16OHZ5VEVlwFdyNw3H1Dll/Ih+MJkfrRPeQVsqCFUxLjSw
 x8W269tBYegoGy35JP6cCj+dIjR0lhQlxkX/yZZ6az24I8tvHWMugbopA3iX/CafcV1D
 jvwkNlE+TdvDpMU/j/Wz72kBTMQBZqBHk/3wh3zZsjO6gIo+nUYcoAJRjV402y54YKXc
 g9SDgHKTczov4ZF32NBb0guxho0vFgcuqA5a5k+c6ZjtUplnWC1jIClzMkFBTYRT96EB
 /ASqA62p5600Ng75D8/PwTN7V40qV3xUtWR8HRUdcmZBFctmCXEAVg0TggER4iqs5uID
 3jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709746915; x=1710351715;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qoGpBFyUJXIJqUxawCbUvlxpYBQviBzPiWSgkxLAi40=;
 b=AjIVNAJG6v06lTx7NLBdnTBDyoWqZW8nXmL1VD7cnZhgXDvxURXofPBUT5YtODsRtk
 FeOsun7IaQinkEtIhxQqKPcn/yQYDmNDKBQa4eROgbTydLcdDGCKUx93FM91Fi/az30K
 2a70aA3e2EnzNaPaPcuBQ1h4gZKaGMjXObP4cNdldGYA9WAWGu67xx19vzPkpq9Vj9/0
 aiEhwse2wNuYKTgT0ax6NBdW7y27HeN89hDyZnUCCKGhabvbZAVF7frArjgn5CHTOCpZ
 /matNVDXTKPCXhkrQbUfLbjNlkW7GN2IqoSym+9e+DNO08QLmvXLP9yvyZl+KGGk6N9K
 6A7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSPPsWlUoDg8D2zWiz0XVlVGQ1xsYoT1UOqoelKw0i7uUY8g2mPjLpPtMGlKPIsCUwmkSmxdumyGOPvSGNzvd2OJzrXCnxM+HU7I585RGk2Hz7vPa8tune
X-Gm-Message-State: AOJu0YyKgz/xeltj00p6DAKWbQiQ424H8pCLbn9vjeF3qpgYzDtYQBfn
 VVKzFYvJstyabZksKb7T5sHkX0i/4QWlws0ppPfE+bm6WI9mUA3w
X-Google-Smtp-Source: AGHT+IFD+RKpduUO3UYUWKne+01iux1Pi69wxHgOjz/HwCNYjShAG4SFhDUnQo4ph2bQjFWyjVcpAw==
X-Received: by 2002:a05:6214:1788:b0:68f:fe7f:abff with SMTP id
 ct8-20020a056214178800b0068ffe7fabffmr5829870qvb.19.1709746914713; 
 Wed, 06 Mar 2024 09:41:54 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 kr9-20020a0562142b8900b0068fcd643b9dsm7654626qvb.22.2024.03.06.09.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 09:41:53 -0800 (PST)
Message-ID: <bbe3e611-a310-41f5-a037-4b7d5e914b94@gmail.com>
Date: Wed, 6 Mar 2024 09:41:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
 linux-imx@nxp.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
References: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
 <20240306172409.878928-2-catalin.popescu@leica-geosystems.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240306172409.878928-2-catalin.popescu@leica-geosystems.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com, linux-kernel@vger.kernel.org,
 m.felsch@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-imx: add
 support for PHY WOL
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

On 3/6/24 09:24, Catalin Popescu wrote:
> Add support for PHY WOL capability into dwmac-imx MAC driver.
> This is required to enable WOL feature on a platform where MAC
> WOL capability is not sufficient and WOL capability built into
> the PHY is actually needed.
> 
> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>

Nope, this is not about how to do this. You use a Device Tree property 
as a policy rather than properly describe your systems capabilities.

What sort of Wake-on-LAN do you want to be done by the PHY exactly? Does 
the PHY have packet matching capabilities, or do you want to wake-up 
from a PHY event like link up/down/any interrupt?

If the former, then you would need to interrogate the PHY driver via 
phy_ethtool_get_wol() to figure out what Wake-on-LAN modes it is capable 
of supporting and then make a decision whether to prioritize Wake-on-LAN 
from the PHY or the MAC, or maybe only the PHY can actually wake-up the 
system in your case.

If the latter, then you need to add support for WAKE_PHY to the stmmac
driver.

pw-bot: cr
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
