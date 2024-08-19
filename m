Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9971956945
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 13:23:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AB6CC6DD94;
	Mon, 19 Aug 2024 11:23:43 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D2EFC6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 11:23:36 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5320d8155b4so5521385e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 04:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724066615; x=1724671415;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tprFxrKfsDYUogvcMoI1LKxJEeb7f1ZyOv21fW+7YTg=;
 b=HfS4hXG/R90s2FGjbBOVdrzB1JyGUmxBd82lOInYE3+0WhuI6OXFDZ0be6HdA2Ved+
 oLFxHRgNBNHpvuPboCSN5KYjKnkmW5cVgxhoubiaBFwmoBIiW3pyouYmT++SPmFbxGgU
 U5kCeJZZK3ZVqtF5QDe5JdDomLm7577GjKzUkhdZQFru+gOmYW7cJek/8Q1WhGqPhfaF
 mQxjgGcmAUT00Lgt5O0/SOXKYSYQcouiIEWFLAhFtSsgjwH/YU+Ykf/T3rcr/n+YKiOX
 KWNStxBvy08RfmrRxoiVSNqgxwimHMJhrowSs2zIBLlwpksBDZwq+7l+Or5dLRFXbs1L
 2oLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724066616; x=1724671416;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tprFxrKfsDYUogvcMoI1LKxJEeb7f1ZyOv21fW+7YTg=;
 b=m/z2UhcCF4Jh2/sesy4OeOAelN7MXo4gbldbryp8bKXrr9LcxJtvX0i/AHGjsYZLN0
 a/18B8S7eoYhYBlR9iC/d1ZxXtdc2VrusCUzJTwyR0lPTscbkBa4w384tsW0Qv9jKq0G
 ZceFMpAB7Lqkwy9blktAC3yfBFixD6vxP1Jgwf6ZnQXc5+8teaQdu/0P4GPwcasKRTOC
 iEIhijwop89yNAeRWmwPckNXr4772zNuwzjuYqykfZfGgTYY7uJadlApbjoM//nGN3vX
 ryUSDVeXw91Wr55X+ejIORXomaCr8drcI31JWge7hPVNuafr0iTJP2fVEEDgLpWeEsYQ
 ndzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUazJiw5Nu8vJUQwHKERoxYyXLu/hcNcojGN2HA3itBdAFtuRq4SoCiBEzU9Lkr5ZTn5BFSuAjv/LQ6Fw3Q+Bhg9s8OLoiZwT2V/ByoIoLbWxrsEUZrS9hR
X-Gm-Message-State: AOJu0YyiXIV9GxGDydbPsNoeOihtjhAbxYuZeWa+C80ajb7mNz85U3MB
 ErLleBldCq073DubQhfSElP9Zxz7QcloDXtC81hJN9d+hF2MToYr
X-Google-Smtp-Source: AGHT+IGqHw5aq4Yu5IwvBHPNFj0C3R+/6U8ytKFwReL7XY64X9J8HjO+AB7srHVJE+zt2fnxZzC+qA==
X-Received: by 2002:a05:6512:1086:b0:52e:9b2f:c313 with SMTP id
 2adb3069b0e04-5331c6ac976mr7551084e87.22.1724066615124; 
 Mon, 19 Aug 2024 04:23:35 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d425c0fsm1456167e87.298.2024.08.19.04.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 04:23:34 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:23:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Message-ID: <r5jc6kzvalommas5gs6pxmxpsygjkuj6zi6pz6qtdlya2n2kqv@4rtqdorr5iw7>
References: <AM9PR04MB85062693F5ACB16F411FD0CFE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <ciueb72cjvfkmo3snnb5zcrfqtbum5x54kgurkkouwe6zrdrjj@vi54y7cczow3>
 <AM9PR04MB8506994625600CA8C4727CFAE2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM9PR04MB8506994625600CA8C4727CFAE2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Cc: dl-S32 <S32@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/6] net: stmmac: Expand clock rate
	variables
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

Hi Jan

On Sun, Aug 18, 2024 at 06:54:01PM +0000, Jan Petrous (OSS) wrote:
> > -----Original Message-----
> > From: Serge Semin <fancer.lancer@gmail.com>
> > Sent: Tuesday, 6 August, 2024 12:18
> > To: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>; Alexandre Torgue
> > <alexandre.torgue@foss.st.com>; dl-S32 <S32@nxp.com>; linux-
> > kernel@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; linux-
> > arm-kernel@lists.infradead.org; Claudiu Manoil <claudiu.manoil@nxp.com>;
> > netdev@vger.kernel.org
> > Subject: Re: [PATCH 2/6] net: stmmac: Expand clock rate variables
> > 
> > On Sun, Aug 04, 2024 at 08:49:49PM +0000, Jan Petrous (OSS) wrote:
> > > The clock API clk_get_rate() returns unsigned long value.
> > > Expand affected members of stmmac platform data.
> > >
> > > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > 
> > Since you are fixing this anyway, please convert the
> > stmmac_clk_csr_set() and dwmac4_core_init() methods to defining the
> > unsigned long clk_rate local variables.
> 
> OK, will add it to v2.
> 
> > 
> > After taking the above into account feel free to add:
> > Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> > 
> > -Serge(y)
> > 
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 2 +-
> > >  include/linux/stmmac.h                                  | 6 +++---
> > >  3 files changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > index 901a3c1959fa..2a5b38723635 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > @@ -777,7 +777,7 @@ static void ethqos_ptp_clk_freq_config(struct
> > stmmac_priv *priv)
> > >  		netdev_err(priv->dev, "Failed to max out clk_ptp_ref: %d\n",
> > err);
> > >  	plat_dat->clk_ptp_rate = clk_get_rate(plat_dat->clk_ptp_ref);
> > >
> > > -	netdev_dbg(priv->dev, "PTP rate %d\n", plat_dat->clk_ptp_rate);
> > > +	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
> > >  }
> > >
> > >  static int qcom_ethqos_probe(struct platform_device *pdev)
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > index ad868e8d195d..b1e4df1a86a0 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > @@ -639,7 +639,7 @@ stmmac_probe_config_dt(struct platform_device
> > *pdev, u8 *mac)
> > >  		dev_info(&pdev->dev, "PTP uses main clock\n");
> > >  	} else {
> > >  		plat->clk_ptp_rate = clk_get_rate(plat->clk_ptp_ref);
> > > -		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
> > > +		dev_dbg(&pdev->dev, "PTP rate %lu\n", plat->clk_ptp_rate);
> > >  	}
> > >
> > >  	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
> > > diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> > > index 7caaa5ae6674..47a763699916 100644
> > > --- a/include/linux/stmmac.h
> > > +++ b/include/linux/stmmac.h
> > > @@ -279,8 +279,8 @@ struct plat_stmmacenet_data {
> > >  	struct clk *stmmac_clk;
> > >  	struct clk *pclk;
> > >  	struct clk *clk_ptp_ref;
> > > -	unsigned int clk_ptp_rate;
> > > -	unsigned int clk_ref_rate;
> > > +	unsigned long clk_ptp_rate;
> > > +	unsigned long clk_ref_rate;
> > >  	unsigned int mult_fact_100ns;
> > >  	s32 ptp_max_adj;
> > >  	u32 cdc_error_adj;
> > > @@ -292,7 +292,7 @@ struct plat_stmmacenet_data {
> > >  	int mac_port_sel_speed;
> > >  	int has_xgmac;
> > >  	u8 vlan_fail_q;
> > 
> > > -	unsigned int eee_usecs_rate;
> > > +	unsigned long eee_usecs_rate;
> > 
> > Sigh... One another Intel clumsy stuff: this field is initialized by
> > the Intel glue-drivers and utilized in there only. Why on earth has it
> > been added to the generic plat_stmmacenet_data structure?.. The
> > only explanation is that the Intel developers were lazy to refactor
> > the glue-driver a bit so the to be able to reach the platform data at
> > the respective context.
> 

> I guess it is home work for Intel developers, right?

Mainly yes, plus to that it's a one more crying out loud from deep
inside my soul about another clumsy solution incorporated into the
poor STMMAC driver.)

-Serge(y)

> 
> Thanks for review.
> /Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
