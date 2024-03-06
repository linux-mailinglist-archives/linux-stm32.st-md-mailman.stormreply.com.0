Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B0B873DA0
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Mar 2024 18:42:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8C69C6A613;
	Wed,  6 Mar 2024 17:42:12 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4024C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 17:42:11 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-68f571be9ddso833396d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Mar 2024 09:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709746931; x=1710351731;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cP96RrcztrNAzMbEhfXoCNnB/B/rAwamum1tutFUVu8=;
 b=D3cVGhVz5FCVXhDo2cuATsC07emyrjWHnEXve65vJhqkCzEjUcUa5VXg+GVtMNzucg
 rO8V9O7h/ZAHkGF7c6Nqv/WXbGmuLROPBYkOXz5JnSWuNaLaHKzuz9aBNtKfk8AhzWJK
 UQ1RTYAlHfpQfht7mWhbzBLxg6kl8tPLzo3u0FzVc3M/kHfjJCVZPJCcZHXFmvWiaiB6
 gEP2mmlWjZCwj5H3qru/1sP2S8frszcYp8ch9FGuvjWL2ORVY2PAPsT1WQTwqPt94a1M
 LyVx0YL9mKNzgQJl9zI1oco1FMNivdP0xDpGvlrtGVQkisQFAggZ/d5oV5P6rHWiqnmu
 L6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709746931; x=1710351731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cP96RrcztrNAzMbEhfXoCNnB/B/rAwamum1tutFUVu8=;
 b=jK16UUE8QsW7mxjJTBiMrg5+pa15kqM6N5yHjaG0mx9c86ZG4PoZa9zcwcvX3oi+nl
 a1CdX70BP4Pryg9P2mWGY13i31lckZVHCH5nr7t/huV+A/eQ0TDNkf1u1HqJZH/JJZ5v
 naGUE/kxdHglYanAp/ADsDp19MhOE8gg44Sx/uVhAVp5EsYkkg8ejeEUZTUHxFVIxui7
 5t6OTwB421hw14IQslBlZwl2VdFPH4al7U6kIUvZfJfH/1SLVyzpFSgF6huVpZ2YtyNJ
 TLSYzyGbH2oeX9w9UYk+YX6Inm8f5H+HZ3zD6p31ObqYM9nI7K9xatKsZ7X1Ohty7K1C
 /WPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwnt+lD81AwKamhqMPWUl2aLd3xo9tnxqFoui66oGAcxhm+XqDdtyDZVLsJJwInlfo3uQwBvUgnBIPgB1aVrEUdl3ccc/Kl63Fj+db8CwTGwbZjWWhpuR2
X-Gm-Message-State: AOJu0Ywnt5z2VP7Tu5Hdl+J8IQ2XfdORQQ/SI+FkP0TPRlF3lFlhkDyv
 wVzKAe79yn38oGKO2tscx1uc+1Fg/yUtQxG0E2n9FDDIojbq0Ntr
X-Google-Smtp-Source: AGHT+IEdVVnjOkVxsshHgJLZVHna+BAO8gJvdt0HEpxKUw8ATSAgs42Yfrkygg+W6m2PVqJ1V92CMQ==
X-Received: by 2002:ad4:4990:0:b0:690:7e04:7874 with SMTP id
 u16-20020ad44990000000b006907e047874mr5613328qvx.2.1709746930844; 
 Wed, 06 Mar 2024 09:42:10 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 kr9-20020a0562142b8900b0068fcd643b9dsm7654626qvb.22.2024.03.06.09.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 09:42:09 -0800 (PST)
Message-ID: <fc8a079f-10f1-4b2e-abc1-0a043eb1876e@gmail.com>
Date: Wed, 6 Mar 2024 09:42:02 -0800
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
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com, linux-kernel@vger.kernel.org,
 m.felsch@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] dt-bindings: net: dwmac-imx:
	add nxp, phy-wol
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
> Add support for PHY WOL capability to dwmac-imx MAC driver.
> 
> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
> ---
>   Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> index 4c01cae7c93a..6cf373772eb1 100644
> --- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> +++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> @@ -71,6 +71,12 @@ properties:
>       description:
>         To select RMII reference clock from external.
>   
> +  nxp,phy-wol:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      If present, indicates that PHY supports WOL(Wake-On-LAN), and PHY WOL will be enabled.
> +      Otherwise, MAC WOL is preferred.

This is encoding a policy in Device Tree, which is not acceptable, see 
my comment about your second patch.

pw-bot: cr
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
