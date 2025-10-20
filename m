Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F19BF0D17
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Oct 2025 13:25:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CD32C5A4E4;
	Mon, 20 Oct 2025 11:25:52 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A6DAC57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 11:25:51 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b593def09e3so2820542a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 04:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760959549; x=1761564349;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oz+Xl2/NrMdS6fZi0EK9OqxzCdzOSL6WeQJpOQkz1Yo=;
 b=lBUQHXuT/w74N1xfazha6nYYmVmhR9mX/C7RmpP2dujTuh65LCSAJJjxNhrn8fmw+e
 lYnmgra7eXV0W/KcgIqrT3zcMpsudsTT2/0INM2NZ2aG98ik8fs09ziDfJaxkr8xWOhR
 TCRSS528yDpQF8NgoWsGWZgZHepr9tZC6/+EiXSe6ytjhF5MG4944FU04lhRwJl5LL/f
 5KAhVNG1eLNvZYaGsxjFfjiublymCfCQdyeNqLOhbubviIRubi7yrXnzwGBDIFerBJZL
 GoiA1QBcrV+/hdN0vnjn6GPz10BpA1nrtdXQf2qepizNtkLaaWyjKb1xWHqoU3GfQdey
 B6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760959549; x=1761564349;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oz+Xl2/NrMdS6fZi0EK9OqxzCdzOSL6WeQJpOQkz1Yo=;
 b=iBltKrInwuumGM0pwg7jgsj+6ha9VIMTkkkIIVINVBCDxgGCDExJdRuKdUUuQHMkAi
 6btkoWjwZS0jxcToiYjN5SCJeYjUUiIPkZIqlSZYLaXPz0fInCV0p5Lq+EuKKLfEMoHy
 vkgmkK6eZXxUQ8gphufOTFgHeLdnzqdeQLUvRTbQnS0mRkbl1K2fh19c1tsz5MUVbmNe
 NthaMDznmrlG66JoMlvJ19mKUb6JUmB6HS1BzfqO2eWcGJNEOAsrqAHFiNGTMjU8lo1K
 Qg9Ew+/Y+y/6sD/no+/r0FAOiN+Mwfo5E71OGMzgeXzFjXStnE2RPqLSO5I9FC9RC8ZI
 YKUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2eNphNTgPGEfUJF96hU3I91ZlHnZUDMm/LLSxmyIQCTJFtf6T7vTcjeSgGyKcalhCFQMwJ4Fi8rHzOg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzrqCKJ/6F2hjXwvTdWJHJyRTnEB9Z6xozBSvHmPOb7uVaug3WY
 VWnKrSFfzuTjG4+8JiPOHMoNeTmfEQuTmY7EgiT43tcncvmkCHc8SSyM
X-Gm-Gg: ASbGncsnYv95CSsamvhfYEVzMtMA6UrhUN8Hqvf09mCGZ4b7gWlMV0x987Ib39kOn9o
 kdfuIbfCy00bOGJ2d6Z2FM89P2wovS7O4044YFm88T7Q1FKkYaJtU/axTKfLW/3oh92mTv01b9R
 /bobhv0c+UGKS2JrMKb5e0bX6gThG55yTUxRE3TBMERJDCJT3BCr6iLAGJkqFr5le48liThfLjm
 PXy+KuGXJRRIL3gErr1sX4CVgG4jMIiqFoKKjl9mpN7KBrvKiSmkHK9eCgbI7jjrmNAjWRJ5JEX
 4fHbTWOtqjY9hnb2A98SrfbEL9taPzV7lnPbpuEBI6X43q8z+anShW8/jLNzVHo/EU1jBCyRSTa
 FJo5rZVozCHnSOpCBPSHCP1wM4WD58Bmn0DFu05ful5oZT+wN/uL0hqhE7IdFrk4xk6qrM/BYWP
 CGWRwagk7S/Q==
X-Google-Smtp-Source: AGHT+IGmXkq5K8nuswuZOy/Q3vJ1q/fs2FggRu+CXIAg0ikFpAfPL8SJOtCn/E3IpbjQlSwX+Wyw8w==
X-Received: by 2002:a17:903:b90:b0:290:bd15:24a8 with SMTP id
 d9443c01a7336-290c9c89fa6mr155748285ad.11.1760959549499; 
 Mon, 20 Oct 2025 04:25:49 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471d598asm77433485ad.63.2025.10.20.04.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 04:25:48 -0700 (PDT)
Date: Mon, 20 Oct 2025 19:24:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <ljyivijlhvrendlslvpo4b7rycclt5pheipegx3fwz3fksn4cn@fgpzyhr2j4gi>
References: <20251020095500.1330057-1-inochiama@gmail.com>
 <20251020095500.1330057-4-inochiama@gmail.com>
 <20251020110219-GYH1506524@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020110219-GYH1506524@gentoo.org>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Yao Zi <ziyao@disroot.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, sophgo@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] net: stmmac: dwmac-sophgo: Add phy
 interface filter
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

On Mon, Oct 20, 2025 at 07:02:19PM +0800, Yixun Lan wrote:
> Hi Inochi,
> 
> On 17:54 Mon 20 Oct     , Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be remove
> missed my comment in v1?
> 

My fault, I forgot to fix here

> > when init the mac, otherwise the phy will be misconfigurated.
> > 
> > Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-sophgo.c  | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > index 3b7947a7a7ba..960357d6e282 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > @@ -7,11 +7,16 @@
> > 
> >  #include <linux/clk.h>
> >  #include <linux/module.h>
> > +#include <linux/property.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> > 
> >  #include "stmmac_platform.h"
> > 
> > +struct sophgo_dwmac_data {
> > +	bool has_internal_rx_delay;
> > +};
> > +
> >  static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
> >  				    struct plat_stmmacenet_data *plat_dat,
> >  				    struct stmmac_resources *stmmac_res)
> > @@ -32,6 +37,7 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
> >  static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  {
> >  	struct plat_stmmacenet_data *plat_dat;
> > +	const struct sophgo_dwmac_data *data;
> >  	struct stmmac_resources stmmac_res;
> >  	struct device *dev = &pdev->dev;
> >  	int ret;
> > @@ -50,11 +56,20 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> > 
> > +	data = device_get_match_data(&pdev->dev);
> > +	if (data && data->has_internal_rx_delay)
> > +		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > +									  false, true);
> > +
> >  	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> >  }
> > 
> > +static struct sophgo_dwmac_data sg2042_dwmac_data = {
> static const?

Right.

> > +	.has_internal_rx_delay = true,
> > +};
> > +
> >  static const struct of_device_id sophgo_dwmac_match[] = {
> > -	{ .compatible = "sophgo,sg2042-dwmac" },
> > +	{ .compatible = "sophgo,sg2042-dwmac", .data = &sg2042_dwmac_data },
> >  	{ .compatible = "sophgo,sg2044-dwmac" },
> >  	{ /* sentinel */ }
> >  };
> > --
> > 2.51.1.dirty
> > 
> 
> -- 
> Yixun Lan (dlan)

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
