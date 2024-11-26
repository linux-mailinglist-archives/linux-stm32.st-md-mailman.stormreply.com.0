Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0379D9E5D
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 21:19:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51CE1C78F6E;
	Tue, 26 Nov 2024 20:19:50 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB732C78F6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 20:19:42 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so810249966b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732652382; x=1733257182;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bIdOM98L3EBQwsq5FQMMGgLWqa/7d6Lq3LNh7wTZfHQ=;
 b=dqMVW4MrmXpP4Y5GCDNRV+r6zS8gfI641jLFhVAV1FgOoWmkvw2alv3/gSYczJx4Sd
 FBEtwAjthfPrb0aBICU4ZT8nJFsImI7rS3/kWB/3DaGOw3B6XEnlmSasunoZFB5ANr8m
 Z55tn5MB9L+toqPyHjDu0+Xt8G4eSo6jxgtcMnZIh3BUP5lFc8059DgS8v7no0io+Ui0
 YOvr9dZgel9TXLMABblU7ReMOe1Fj6tbq2+3l5NxvMJ/Dz7VPd+7rPXAyk1ijO2GCYIT
 MALdwPiLklasXnuYaLMYP60yv/ZW/kGTwIyYrT8RIF4Z0Kd+BoOvmywFdMi5pEjE7jxc
 0Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732652382; x=1733257182;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bIdOM98L3EBQwsq5FQMMGgLWqa/7d6Lq3LNh7wTZfHQ=;
 b=cnk6HJrEYZ/ABSGlesFHqyMKFFaTMc0SwN1MH/cjmIlZcVjOIbfXaeQVDPUoMDgKwd
 A2IANRTMWpvoFC4NKbAMSQe1n+D5VyCzlAJZE+8jfcq57lqWkFELIOVtE35LGfhubFJm
 8gfg4nizomRQaXHpjiOAQJ4Zu4m6ysvyOdjTeM9brxhVBSDI1lkbyVSuTvyI09WzJfzi
 oMBbqdt8BEn8OKRmhnAr0P/aFqciD+vsKx1QeXYhcuOzkQAC2V+ZLRYz4w8aXVVzWP6z
 /hFWT5NKYXeNSehMvUtquhTOjirGZa3cFho911GHJBzAPb6eA8KVlMtqO0dFPqhjnBZ6
 KUlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe5FdFLT5nqNgCZwJ0u91jeWVncmHTx0nfzFBacN7vRwxwL5sWjexGx7VIS68qSGqoqGvDZcO2zFBOSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxuxa5tc+xlQANoI8K/+vdntqdAt22wMcgzrSVyYp3vIpLXdoxk
 KAqSXaAh2fwk5M1yIJEyUqUIzdeAjDOinl28SqxtATniyy2XRwMW
X-Gm-Gg: ASbGncvM13UylAYZNBitB0KenOMAjkQ/EkfVwKm1vowtbTzYyyLvEl7tyEn02ofe39Q
 E67Pll5eICFnazC5wmaFC0I+89HA26cTqFX44BGCQV9w7eiPWR5CINARBjRK+5BY0Wp88G94TV0
 Zf1cijCX46DRWJfA7j8B7cpH9CrEL3OM84lLXHkEr12UtT9xdbHts1UWz+GV9ehXKuviZRfZGIw
 iv6+5g9YRXeL1R40VgNGzbSbNel99jekUz5YGEs1+Gy3d9ojiA3PVQB9IDAOhjJ9umZAG41qKbQ
 YwrKhK9ZpFv3ldPOevV+om2IoP6EnCYsB2Q3zE9nFFSUUldb9rmzxI3gvwLhBJEYJaWvD5uxSLa
 DOKb5KOQ1VGHWuQVNdjJ2opOj4djsBPkLQ9ZaqtUK6g==
X-Google-Smtp-Source: AGHT+IFJzXI+QGnug04VkzBBZH3/3gOfiit7iwiUpCdN3K1kV7d0P626vyqQmw6ZO1DajOX9UOmxZw==
X-Received: by 2002:a17:907:6ea6:b0:aa5:4c3a:3b55 with SMTP id
 a640c23a62f3a-aa580f5814amr26638366b.36.1732652381959; 
 Tue, 26 Nov 2024 12:19:41 -0800 (PST)
Received: from ?IPV6:2a02:3100:b1b1:7000:f43f:954d:8ddd:f91b?
 (dynamic-2a02-3100-b1b1-7000-f43f-954d-8ddd-f91b.310.pool.telefonica.de.
 [2a02:3100:b1b1:7000:f43f:954d:8ddd:f91b])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-aa50b3000e6sm628933066b.80.2024.11.26.12.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 12:19:40 -0800 (PST)
Message-ID: <fd994907-0d37-41a6-87fe-1064543bf9fc@gmail.com>
Date: Tue, 26 Nov 2024 21:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <E1tFv3K-005yhZ-E8@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <E1tFv3K-005yhZ-E8@rmk-PC.armlinux.org.uk>
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 03/23] net: phy: marvell: use
 phydev->eee_cfg.eee_enabled
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

On 26.11.2024 13:52, Russell King (Oracle) wrote:
> Rather than calling genphy_c45_ethtool_get_eee() to retrieve whether
> EEE is enabled, use the value stored in the phy_device eee_cfg
> structure.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/marvell.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
> index cd50cd6a7f75..1d117fa8c564 100644
> --- a/drivers/net/phy/marvell.c
> +++ b/drivers/net/phy/marvell.c
> @@ -1508,7 +1508,6 @@ static int m88e1540_get_fld(struct phy_device *phydev, u8 *msecs)
>  
>  static int m88e1540_set_fld(struct phy_device *phydev, const u8 *msecs)
>  {
> -	struct ethtool_keee eee;
>  	int val, ret;
>  
>  	if (*msecs == ETHTOOL_PHY_FAST_LINK_DOWN_OFF)
> @@ -1518,8 +1517,7 @@ static int m88e1540_set_fld(struct phy_device *phydev, const u8 *msecs)
>  	/* According to the Marvell data sheet EEE must be disabled for
>  	 * Fast Link Down detection to work properly
>  	 */
> -	ret = genphy_c45_ethtool_get_eee(phydev, &eee);
> -	if (!ret && eee.eee_enabled) {
> +	if (phydev->eee_cfg.eee_enabled) {
>  		phydev_warn(phydev, "Fast Link Down detection requires EEE to be disabled!\n");
>  		return -EBUSY;
>  	}

This one I had on my list too. Old and new check aren't waterproof as the user can still
enable EEE later, silently disabling FLD. But the check is better than nothing.

Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
