Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A395C956
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 11:37:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B77CCC71287;
	Fri, 23 Aug 2024 09:37:30 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D6E9C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 09:37:23 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f43de7ad5eso16098581fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 02:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724405843; x=1725010643;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4Ac5nNCVhdhZDVEQMZ1e+QZs8PBYNOPIlMHADdFcn1k=;
 b=bsZq4E0SajNAMXkg9ZXx3jr/Qx17n9ro+EHUyJuhH+02GXMyHZq+CiPJf+OIuBtmqN
 0/c6glRh/QTAKSJuHl4DYm1XmLO35dSbWj4EN3ICgkYu27VMHipkrNYd/f9Q4VEEAMGO
 IacYooswc4WgT4hspKNyslEgVgUe7oZ1QYhLhhT9XdP66r7hm7msBxNOdPsgSXdtpKB7
 6umA8y549UYNDRvzgsHuqFkTia4wslEpJnjm+CthaHvw30JTLSVD6oRTxcGuGgsRoSyB
 Xl8J8c6WLzs6auOLwxnOQTusYxEDqdJ6yBhU1ejI98bqdfZYWA6hy3XoiEsyu+TkGOns
 elug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724405843; x=1725010643;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Ac5nNCVhdhZDVEQMZ1e+QZs8PBYNOPIlMHADdFcn1k=;
 b=tjkGxabUNRaR36XNthIWJG+gy3nCnH430jenzqJYetfELGWg0wx3cu2NAlPoHNf5OU
 RdQIORgnMLLgi42Xz5Pg+J1KLv+4k5hwcEcBs19HYgGLPVZi+lzVNOPn+L/E5B9A7Yjp
 VxciYwZg1pZ865ItPkiyHivMv5ckgorzMiCdtsb3PX7yL4YnNwsY5G8t/w8VqcfbJxaK
 cXlR2EgzFZiCVtHUjzLVMhlhISKU24NoTdqEHlNTuGbbvWLSGF6RcG/KcVYVnU3Vc6AD
 cb1zov2o9857oMnbAvpt0R6jrShWbmrOWoGZ24B5QQVe9ByMnG3NMAVqB5bYSEq+HuHk
 1LVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzSNu7hLAhmBUFVxScFZgNyKhsMV5WVwCZVJtuBw0zDf383Nfwoe2tKRG1hNdwi595W4YctBm49NxuFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxcbIpfEpcjiKDSx58y0AyIEQJUj0ooH/8WVktjWFBXH97HqQAo
 JZQARnpW55kiBItysjvf0w9WDtTHaO8u9kFYqKE1aM8F+X9/di0P
X-Google-Smtp-Source: AGHT+IEmGbUcGDz88fFiESnHSTe8A1VR8m1CYlhAGl7LSVJErE5o8dcM5mYZwvJiw622MTGNoY9ILA==
X-Received: by 2002:a2e:8e8f:0:b0:2f1:59ed:87ab with SMTP id
 38308e7fff4ca-2f4f4904c5dmr9805651fa.24.1724405841764; 
 Fri, 23 Aug 2024 02:37:21 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f40487e931sm4200131fa.104.2024.08.23.02.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 02:37:21 -0700 (PDT)
Date: Fri, 23 Aug 2024 12:37:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Message-ID: <zxfzr5s3hpmn5nkhjess5w2ruozdsco3lcakhfid67qeld2lpi@foykn7w4ltd3>
References: <20240823072122.2053401-1-frank.li@vivo.com>
 <20240823072122.2053401-3-frank.li@vivo.com>
 <qx4k2xehasda7zj6vt3bygdh3scehiiwniqvljj4b4rjde25a5@ys4oqsithhwi>
 <TY3PR01MB11346C33198DE80DD9DD1CC3C86882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346C33198DE80DD9DD1CC3C86882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "marcin.s.wojtas@gmail.com" <marcin.s.wojtas@gmail.com>,
 "kees@kernel.org" <kees@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "sd@queasysnail.net" <sd@queasysnail.net>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "clement.leger@bootlin.com" <clement.leger@bootlin.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Yangtao Li <frank.li@vivo.com>,
 "ulli.kroll@googlemail.com" <ulli.kroll@googlemail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "horms@kernel.org" <horms@kernel.org>,
 "justinstitt@google.com" <justinstitt@google.com>,
 "olteanv@gmail.com" <olteanv@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [net-next v2 2/9] net: stmmac: platform: Convert
 to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
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

Hi Biju

On Fri, Aug 23, 2024 at 09:15:06AM +0000, Biju Das wrote:
> Hi Serge Semin,
> 
> > -----Original Message-----
> > From: Serge Semin <fancer.lancer@gmail.com>
> > Sent: Friday, August 23, 2024 10:11 AM
> > Subject: Re: [net-next v2 2/9] net: stmmac: platform: Convert to devm_clk_get_enabled() and
> > devm_clk_get_optional_enabled()
> > 
> > Hi Yangtao
> > 
> > On Fri, Aug 23, 2024 at 01:21:14AM -0600, Yangtao Li wrote:
> > > Use devm_clk_get_enabled() and devm_clk_get_optional_enabled() to
> > > simplify code.
> > >
> > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > ---
> > > v2:
> > > -remove unused 'ret'
> > > -fix incompatible-pointer-types
> > >
> > >  .../ethernet/stmicro/stmmac/stmmac_platform.c | 35
> > > +++++--------------
> > >  1 file changed, 8 insertions(+), 27 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > index ad868e8d195d..1a66baaa4081 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > @@ -415,8 +415,6 @@ static int stmmac_of_get_mac_mode(struct
> > > device_node *np)  static void stmmac_remove_config_dt(struct platform_device *pdev,
> > >  				    struct plat_stmmacenet_data *plat)  {
> > > -	clk_disable_unprepare(plat->stmmac_clk);
> > > -	clk_disable_unprepare(plat->pclk);
> > >  	of_node_put(plat->phy_node);
> > >  	of_node_put(plat->mdio_node);
> > >  }
> > > @@ -436,7 +434,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> > >  	struct plat_stmmacenet_data *plat;
> > >  	struct stmmac_dma_cfg *dma_cfg;
> > >  	int phy_mode;
> > > -	void *ret;
> > >  	int rc;
> > >
> > >  	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL); @@
> > > -615,21 +612,16 @@ stmmac_probe_config_dt(struct platform_device
> > > *pdev, u8 *mac)
> > >
> > >  	/* clock setup */
> > >  	if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
> > > -		plat->stmmac_clk = devm_clk_get(&pdev->dev,
> > > -						STMMAC_RESOURCE_NAME);
> > > +		plat->stmmac_clk = devm_clk_get_enabled(&pdev->dev,
> > > +STMMAC_RESOURCE_NAME);
> > >  		if (IS_ERR(plat->stmmac_clk)) {
> > >  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
> > >  			plat->stmmac_clk = NULL;
> > >  		}
> > > -		clk_prepare_enable(plat->stmmac_clk);
> > >  	}
> > >
> > > -	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> > > -	if (IS_ERR(plat->pclk)) {
> > > -		ret = plat->pclk;
> > > -		goto error_pclk_get;
> > > -	}
> > > -	clk_prepare_enable(plat->pclk);
> > > +	plat->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> > > +	if (IS_ERR(plat->pclk))
> > 
> > > +		return (void *)plat->pclk;
> > 
> > Use the ERR_CAST() macro instead of the open coded void type cast.
> 

> Which is better ERR_PTR or ERR_CAST in this case?

The only correct macro in this case is ERR_CAST() which implies one
error-pointer cast to another. Open-coding the pointers cast is
discouraged.

The ERR_PTR() macro is utilized to cast an _integer-error_ to an
error-pointer.

-Serge(y)

> 
> Cheers,
> Biju
> 
> > 
> > >
> > >  	/* Fall-back to main clock in case of no PTP ref is passed */
> > >  	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref"); @@ -644,26
> > > +636,15 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8
> > > *mac)
> > >
> > >  	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
> > >  							   STMMAC_RESOURCE_NAME);
> > > -	if (IS_ERR(plat->stmmac_rst)) {
> > > -		ret = plat->stmmac_rst;
> > > -		goto error_hw_init;
> > > -	}
> > > +	if (IS_ERR(plat->stmmac_rst))
> > 
> > > +		return (void *)plat->stmmac_rst;
> > 
> > ditto
> > 
> > >
> > >  	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
> > >  							&pdev->dev, "ahb");
> > > -	if (IS_ERR(plat->stmmac_ahb_rst)) {
> > > -		ret = plat->stmmac_ahb_rst;
> > > -		goto error_hw_init;
> > > -	}
> > > +	if (IS_ERR(plat->stmmac_ahb_rst))
> > 
> > > +		return (void *)plat->stmmac_ahb_rst;
> > 
> > ditto
> > 
> > -Serge(y)
> > 
> > >
> > >  	return plat;
> > > -
> > > -error_hw_init:
> > > -	clk_disable_unprepare(plat->pclk);
> > > -error_pclk_get:
> > > -	clk_disable_unprepare(plat->stmmac_clk);
> > > -
> > > -	return ret;
> > >  }
> > >
> > >  static void devm_stmmac_remove_config_dt(void *data)
> > > --
> > > 2.39.0
> > >
> > >
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
