Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F16A8A047
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 15:56:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8273CC78023;
	Tue, 15 Apr 2025 13:56:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F13EC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 13:56:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so5498411f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 06:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744725370; x=1745330170;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=f7Ug76I8PBqsVyX7451rWvT3DCckR1pFD90rVI4kapk=;
 b=Ugebg8GZzYZ31U+tX7viJVRvxfLubR3Pzc2TFj1HANJ7qEnk2UW9KEOvjSuJf00f6+
 CAJIuaYn4qNVn4ob1L1qW9mXrhltDbLqknMrXgJekLTTbUa0lhb+eml4mNylO9r8GkQr
 D4bVWLnCsXOaqY6OYpcq/rJ8skVyVerxDEWk9H72h3nrV1yXjViPfMjpCJYF2CM83Lhr
 kSN5ZKAf7ox7mUo+ghc12u41qtb8szeG0vf5ItGqdQjxxoYZhTyFm3H2detNnW/nWXJN
 NsbkLWJ4WXyUrwnt00xb2NxO/aSl9VRjDofjYYdNIUAeXQZq7QFf6poyTS6xTLZVgrau
 +Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744725370; x=1745330170;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f7Ug76I8PBqsVyX7451rWvT3DCckR1pFD90rVI4kapk=;
 b=L30XTwH+fwDNTVxPI36Nfkdb+40+DIxaPZvMjt6VQoMRkn3cPfbgAM1CVTU0CtR4d3
 XcOBazabiF5zpFRSGMA8q9E+vP2Vy9yaXBzu+uprVTTsIFIWxAvIhX3zu+iqQHN+Kze2
 5iZBqhlZwQCGba6IXnhtTarCh3mjN+s+sYzoNVh2tAnl90zMleGbKrF2w1t8rjqaWaYS
 vGbsyF/iVe5PL/0lEo2OcUk5W7/AAJs9RPV2ZblhcCvNIpulA/zU8USmwdHQx/ylRS0+
 i+qLvsJ0j79k4oDiwRKglRvpfUk+G2juMqMQjghzzCAhosO0w/mv5ttrRpVygcvi6fee
 4NoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxCZ58gz98mzJ/Drv5LqqeZaMN6Uk7KU7nA7YpI5zoEo4M59CjN1yfE/qCG3fl9sKwmQZJI/WQXAyxzA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx1APL6J32n94urqBz27pUd9mNYYubR/vTOadWEg9WcfJ/xFUEP
 +O+6VF6upQhAuFcMP54yOXSuua/3tEUTsuWZRyRZ96CQWP+tPyJ2
X-Gm-Gg: ASbGncuE/oEq5Vdkq8fyZOOQP69q01AF/Sd78lpnv55g3tFnd3KWdBiuKawX3N9BDHp
 +GJW1cCP/m6Ss+RhAfGAK8ufeQWzTVOY4QVmCmHrhr8V+aGeJV6Q/GZ3SSrMC4c2vumlEJqw1U1
 x5OL3+fFM3skdJ7TKZlkN8fIiq01CKHRLBZcpcX5jhUaYStISem/Q5Cnci3BVNP0ALqNJxEpLf4
 BUoMwxxpO5J5yoRF21XWS0Use+h+no69OnKqv2H4hv5DYWdWwfJUxgGiDQhJ5lbzHGwZDS351oh
 gCvsIbXOIw40yvjepb7HqW+hxya93Odah+K3h6t9hw==
X-Google-Smtp-Source: AGHT+IEUc51u2H2A2sXDUuHdbW0oUHYeFA2HCqNohoAXTGQXycwn5Mca0dijghzNDofByf9HiAEEYQ==
X-Received: by 2002:a05:6000:381:b0:39a:c80b:8283 with SMTP id
 ffacd0b85a97d-39ea521206bmr13186409f8f.31.1744725369575; 
 Tue, 15 Apr 2025 06:56:09 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-39eaf445515sm13993745f8f.89.2025.04.15.06.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 06:56:09 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:56:07 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <Z_5ld6D1Yyo7Ysur@Red>
References: <E1u4dKb-000dV7-3B@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1u4dKb-000dV7-3B@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: sun8i: use
	stmmac_pltfr_probe()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Le Tue, Apr 15, 2025 at 11:15:53AM +0100, Russell King (Oracle) a =E9crit :
> Using stmmac_pltfr_probe() simplifies the probe function. This will not
> only call plat_dat->init (sun8i_dwmac_init), but also plat_dat->exit
> (sun8i_dwmac_exit) appropriately if stmmac_dvr_probe() fails. This
> results in an overall simplification of the glue driver.
> =

> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> =


Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-on: sun50i-h6-pine-h64
Tested-on: sun8i-a83t-bananapi-m3

Thanks
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
