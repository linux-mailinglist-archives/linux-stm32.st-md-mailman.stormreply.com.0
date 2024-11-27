Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D542A9DAF37
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2024 23:15:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 812FAC7802D;
	Wed, 27 Nov 2024 22:15:33 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79779C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 22:15:25 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-aa55da18f89so23765066b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 14:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732745725; x=1733350525;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=C4hMroRe5vC2NxlBWRRYYxsYO1szD/OqQeolaWtKQGk=;
 b=lNM5sqj8v2rEP9Mj/aiQYcTq3D6HSSQDqhISFUDQJvPu/5Z2VSvIKdB0DvV9LctQt4
 84gKIA7tP4t5EaQ2W80vBw7KhD3MkhY6FeMVg4m3aYfGgVp7KEH7ZTAsvXQ6QyI0UhXU
 BxY4nIf3sxSpzs5oZrSDsT5wDsGGYK48OFu5HaI1Q3d7i02JNwq8D0z44BHaOoeXW9c6
 Rm+4R70ddpXl37w95Rq9iJNJakf9+6pREZiLX9cTrI9BODUMy9P68EE8AreNnA29Rpl0
 b6KKcq69jUJpkt63HtFTT1W4rWACAbM8h7lO7/PcO9OPRxjt8bsVcyQUfOE9yHksWr/f
 uisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732745725; x=1733350525;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4hMroRe5vC2NxlBWRRYYxsYO1szD/OqQeolaWtKQGk=;
 b=mJzeOHE66B5dlTe0/+l9cDxhBoWJgxlISSBWLP9kCZGBbXW0KDpC8KGkvJy+EJ4FTS
 lYP8PFLliZjHcP93gbNeRlgyPZ9YT8XitgN2CKiMXMn9/eUddMP4qF+Ph4ehjf0H15M4
 pHeje+qNWBYVLs04NBK9gwYS4KpJ9LBcdKpW6GtverbTz7uIBNrASGmKSxIbzQLJwHBm
 RebUUr0mPYFmeGdGxCrIdE8vR6ucy266joHbp8xeJLAmGPWSaKttB9EeLk1Ubh5ibmYJ
 5hVr0nJmMpik4sES8SeH/Gl7sF7vkfXZVZPEkqc1J8Vv304/9ahHlrBcUShIyw2ogPno
 5Tyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPdPDXx2odXb+xYS1aUTbd4pWzxxlh05ThDBv8UKHybBdhABJBYLfMpulJ2L1vzgTRZGJiU0OupPAzGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxOtgjUPQBLgO2PM3ZpNC2gzj3IixYUv+e4hwU/Yz5yaj0hhE9v
 Y7DXQgvUJuM5fgb8xZJBt/560Eg4vCn+2YVassqEdxnXgc4hKvT3
X-Gm-Gg: ASbGncsYk9ebxfA2QRo8+p0UnUiPbub18uEHoU2BFFC1zbEzEsRDYm349tub8+i9hEd
 29OyNcBCGskrz9XYqweN8Xv0VbEw6scXZ/NnbIihPE3Q/POeJ1BJiKozYCRhQ9mmsw4h7A0SinV
 yluRPMEyQiYv6P5LYQeFViIBDXbgM0GGPH/A5sbwHghHQEz43A3zJymkdRmx1bPLJDJ2bvlBMWb
 nbSDGbwFE8FoCzy36FuxSb8NwcTJ8OgP4DZIuZmxQz7o6OXTqMB0pSztEc/vTPfiEIhqzpg6AGj
 jcC41oWFyAdiw2bLZf6YmuyLuTAS7FGsQCxePzvdE/j87gEkPA0uYSrbg+Ow60n6VRkHHII+DWI
 yzlN6QOFzAcstlznfJwStkZYO52pSjIgaA6uxNEgXOQ==
X-Google-Smtp-Source: AGHT+IHYgWvU50Owdns9gA4SJOoFe3enu43XPSQT/+67ke9HUNtG8d/ql9AEHSChYJ3EEYt+kRuvzg==
X-Received: by 2002:a17:907:254e:b0:a99:529d:81ae with SMTP id
 a640c23a62f3a-aa581062752mr318792466b.55.1732745724778; 
 Wed, 27 Nov 2024 14:15:24 -0800 (PST)
Received: from ?IPV6:2a02:3100:b12f:4200:648f:850f:5e23:bc2f?
 (dynamic-2a02-3100-b12f-4200-648f-850f-5e23-bc2f.310.pool.telefonica.de.
 [2a02:3100:b12f:4200:648f:850f:5e23:bc2f])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-aa55567771esm386400266b.79.2024.11.27.14.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 14:15:24 -0800 (PST)
Message-ID: <6d4bf2cb-b5be-4b35-bc05-c6cac08a7028@gmail.com>
Date: Wed, 27 Nov 2024 23:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <Z0b5NepJdXiEQ1IC@shell.armlinux.org.uk>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <Z0b5NepJdXiEQ1IC@shell.armlinux.org.uk>
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] net: rtl8169: EEE seems to be ok
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

On 27.11.2024 11:49, Russell King (Oracle) wrote:
> On Tue, Nov 26, 2024 at 12:51:36PM +0000, Russell King (Oracle) wrote:
>> In doing this, I came across the fact that the addition of phylib
>> managed EEE support has actually broken a huge number of drivers -
>> phylib will now overwrite all members of struct ethtool_keee whether
>> the netdev driver wants it or not. This leads to weird scenarios where
>> doing a get_eee() op followed by a set_eee() op results in e.g.
>> tx_lpi_timer being zeroed, because the MAC driver doesn't know it needs
>> to initialise phylib's phydev->eee_cfg.tx_lpi_timer member. This mess
>> really needs urgently addressing, and I believe it came about because
>> Andrew's patches were only partly merged via another party - I guess
>> highlighting the inherent danger of "thou shalt limit your patch series
>> to no more than 15 patches" when one has a subsystem who's in-kernel
>> API is changing.
> 
> Looking at the rtl8169 driver, it looks pretty similar to the Marvell
> situation. The value stored in tp->tx_lpi_timer is apparently,
> according to r8169_get_tx_lpi_timer_us(), a value in bytes, not in a
> unit of time. So it's dependent on the negotiated speed, and thus we
> can't read it to set the initial phydev->eee_cfg.tx_lpi_timer state,
> because in the _probe() function, the PHY may not have negotiated a
> speed.
> 
Right, hw stores the tx_lpi_timer in bytes. Driver's default value is
one frame plus a few bytes. It doesn't use phydev->eee_cfg.tx_lpi_timer.
set_eee() op isn't implemented for tx_lpi_timer, because no one ever
asked for it and I'm not aware of any good use case.

> However, this driver writes keee->tx_lpi_timer after
> phy_ethtool_get_eee() which means that it overrides phylib, so hasn't
> been broken.
> 
> Therefore, I think rtl8169 is fine.
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
