Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F8481A5EB
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Dec 2023 18:04:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0150CC6B45E;
	Wed, 20 Dec 2023 17:04:39 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45502C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Dec 2023 17:04:38 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40c38de1ee4so59801795e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Dec 2023 09:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703091877; x=1703696677;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=INk/MVNoQ2UUzk1dXHvibFqURoJv1a6zXTU0efZViEM=;
 b=QH1OVENjMWYQJ0s0rrMN1vZFYEAL92Q7fbOSx7JgNpQprT1neTBZ3R6dOha3dB/j8L
 fPyR1PEAgdLDL2HdNFgJSogE/U5W074nwSlfpLSKz2hmM21Eyx+HtbQ3DO0AXRPlFVGr
 Ec4gWDmeTMSRkewsWoRdxXXBR2b5LTCht6Kfz5G1hTQNrdp13EfRISfMvDhnx1569Oni
 UB3qlxbbeDcOJQCs2nacI2lhNjioC0XvJH/qOLNcZGM0ohX8JSEw9bHLKS5jtrfzLXkd
 QTTpLxbbYdnaICenK/O/FUuB7314qwB65s0aE3JJHyU0+WljTM2ou7YJKUeXBTtF5Tqg
 fbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703091877; x=1703696677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=INk/MVNoQ2UUzk1dXHvibFqURoJv1a6zXTU0efZViEM=;
 b=WoS9HW7CYfizQwiXqnIIpCZaq6MOKsrKdMoPImUlI1Yscg8inJeh+rzVR6waIisVFP
 iBqyQR3+PEXnPu7LJ3lZ8CfnZI8e8CSMWqKUqVWFpngc4KOAv7Bu/jOn6XZLt5MC80fY
 tvdAamx9zly3pUdNIcc1zayv8/5qOqPoriXZ5l54LjGyCG+zD9OID8qoDz4M8H1O+pA+
 B/y6oduA8Sder7ktKO2VNfT05eJOyKGT+1S8FdWeOOo5gR5KW3LDc3+JW/DXq9xclOIC
 TCFnUlNFl8x3UN3I7JzNxVQhO4Qd6DMioKMDzNtx/YYDa1j1vcgdyRzAwXDMhLQ3uZEL
 jTvg==
X-Gm-Message-State: AOJu0YyJmilVO0f7mQ1Lhog5vglDhXcPd3+VAxCiYeK3Q6tM7roK3+Ey
 HLe8K6DylZVSJNUjgENOsq8=
X-Google-Smtp-Source: AGHT+IHh6y/Y+b5+6bjmUDcz9Rc43dU9g/m+wQbExtDATUQ5/6ZmupKkVs8JknG1LfDY/thKOV7L8A==
X-Received: by 2002:a05:600c:5187:b0:40d:33cb:b577 with SMTP id
 fa7-20020a05600c518700b0040d33cbb577mr9913wmb.3.1703091877345; 
 Wed, 20 Dec 2023 09:04:37 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c154c00b0040d18ffbeeasm243399wmg.31.2023.12.20.09.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 09:04:32 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 =?utf-8?B?6bqm5YGl5bu6?= <maijianzhang@allwinnertech.com>
Date: Wed, 20 Dec 2023 18:04:28 +0100
Message-ID: <2370947.NG923GbCHz@jernej-laptop>
In-Reply-To: <ZYKvCQBD-SY9uVLF@debian.cyg>
References: <ZYKvCQBD-SY9uVLF@debian.cyg>
MIME-Version: 1.0
Subject: Re: [Linux-stm32] [PATCH] gmac: sun8i: r40: add gmac tx_delay
	support
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

Dne sreda, 20. december 2023 ob 10:08:25 CET je fuyao napisal(a):
> r40 can support tx_delay, so we add it.

I don't see how. User manual, 3.3.4.64. GMAC Clock Register talks only
about RX delay.

Best regards,
Jernej

> 
> Signed-off-by: fuyao <fuyao1697@cyg.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 137741b94122..fd07573afc9b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -127,6 +127,7 @@ static const struct emac_variant emac_variant_r40 = {
>  	.support_mii = true,
>  	.support_rgmii = true,
>  	.rx_delay_max = 7,
> +	.tx_delay_max = 7,
>  };
>  
>  static const struct emac_variant emac_variant_a64 = {
> 




_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
