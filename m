Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDA69DB8D9
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Nov 2024 14:36:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF823C78038;
	Thu, 28 Nov 2024 13:36:21 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0512C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 14:51:26 +0000 (UTC)
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3FB7040CE3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1732719083;
 bh=ddTmmaktStUX+KyiWQA7QlRxka08sVdAlnNv34gi4rQ=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=cqc0hW1uD0jRhYLJnPXSGUFUDywfizbkPvUkImeQQTLFw7g3vMnMX7TC8B8F1h9Qs
 nO/3eFpVNdln4gZWZE5brKmpoyrIuXvscAUoYC7uzXJr3LqhhHuraMzWacRBbkRaqb
 iT0lNFSW83dappjtk0AN4aj2aVSqC8LcHt18bnmJmMoxrCozq4pVYEigbF9op+ZVX9
 YOXm1R4Y3vXBXZ6Y+gspd3arqac7YButyD4EEshSG5fc8AYlCqM70612zbwnU7wAI6
 nIXRT55O9rDcStbxIcbP+rsVyEXBvvdmVPhsOahj4N66+jzf+xa9lbBdTnYl3wGpIB
 BYyZb/bXq8SUA==
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-5f1e9fac321so613727eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 06:51:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732719081; x=1733323881;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ddTmmaktStUX+KyiWQA7QlRxka08sVdAlnNv34gi4rQ=;
 b=UG53cjgjOkK2Q0g6+rGy1zGrjUwULmQ8LQKjJXSXjdG12r6iY88DbTtdqfHlHzJLEj
 M63olZNW2luQbhTFGXuuagvKjpvfVRbO6IV/nt6z3/XLPMpKCmIKwYUokQWBtWNS+1d3
 AihX2INy1nZ+YEBW2ClYV6oeG+NWJYnoeDMDa1tDHlP87HBUFGos6c5oDkbo6JOVn1C4
 l9zWfW/gJIMCjVJPxs6wS2E8tS4mfKTSelOI13Qd/ZZSMAdwEuLR8qBZTw9VJUaEKwqx
 harULSyOqehSBu5Rf7vMo+AtVunXNJziAHmIMLQck+uPm9+qZBrjk4i8SOR3yIoBFKrY
 0Dbw==
X-Gm-Message-State: AOJu0YxGP3pr+PRpAVV5dFg+S2WucCxEfVn6sMLELrwfbc5NjN4mBAnJ
 NsM1dQ9UfKJ0QwCk2bm1GlnTPJH/rcfbcx+z5NomEplRLmylMFg9cUIA2hYf9JV7gX5gPcj4ZXB
 1SU+kvR3sBGXslHy6PTUDhwHzOgroM82gusRhvOr0Dc8TLSrWqI14IX5ZDrodYHkIXbzK5Hik8O
 5AVrfliQvKc+ThhNvkh1AJOgQVqXxXSlFfkG+PrZookAKcDyWKLrTYF64aFnfjkR3lv7rn
X-Gm-Gg: ASbGnctePTmVUamkdwEjxRZKMuZH8oR3Mog71VVI7C7/UKUzjoV/Wx59N1x7ruP0Xam
 XWINekNoOZu1j2DlUwbESk1HjIsrYCQT0ZcmECUulmdszTCsqeQriAhZL+1kB
X-Received: by 2002:a05:6820:4981:b0:5f1:fbef:c868 with SMTP id
 006d021491bc7-5f1fc43a130mr3684975eaf.0.1732719081287; 
 Wed, 27 Nov 2024 06:51:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfFJGOrjEK1lKzXEW/QXPfJgWZfDO/+kYkPBQ8RDpwNJVjReUG8X0KbLCz17ehyjwvJu+WybHbfVyct/J5soQ=
X-Received: by 2002:a05:6820:4981:b0:5f1:fbef:c868 with SMTP id
 006d021491bc7-5f1fc43a130mr3684952eaf.0.1732719080947; Wed, 27 Nov 2024
 06:51:20 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Nov 2024 06:51:20 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241124-upstream_s32cc_gmac-v6-9-dc5718ccf001@oss.nxp.com>
References: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
 <20241124-upstream_s32cc_gmac-v6-9-dc5718ccf001@oss.nxp.com>
Mime-Version: 1.0
Date: Wed, 27 Nov 2024 06:51:20 -0800
Message-ID: <CAJM55Z9PZH3797=gvRWquHFSE7YOsO0-bcOBFjBETCiQW-YURw@mail.gmail.com>
To: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Vinod Koul <vkoul@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>
X-Mailman-Approved-At: Thu, 28 Nov 2024 13:36:21 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next v6 09/15] net:
	dwmac-starfive: Use helper rgmii_clock
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

Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
>
> Utilize a new helper function rgmii_clock().
>

Thanks!
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 421666279dd3..0a0a363d3730 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -34,24 +34,13 @@ struct starfive_dwmac {
>  static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
>  {
>  	struct starfive_dwmac *dwmac = priv;
> -	unsigned long rate;
> +	long rate;
>  	int err;
>
> -	rate = clk_get_rate(dwmac->clk_tx);
> -
> -	switch (speed) {
> -	case SPEED_1000:
> -		rate = 125000000;
> -		break;
> -	case SPEED_100:
> -		rate = 25000000;
> -		break;
> -	case SPEED_10:
> -		rate = 2500000;
> -		break;
> -	default:
> +	rate = rgmii_clock(speed);
> +	if (rate < 0) {
>  		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> -		break;
> +		return;
>  	}
>
>  	err = clk_set_rate(dwmac->clk_tx, rate);
>
> --
> 2.47.0
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
