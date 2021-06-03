Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9467539A58A
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jun 2021 18:14:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22ECFC57B69;
	Thu,  3 Jun 2021 16:14:11 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1B66C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 16:14:09 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id h24so10104806ejy.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Jun 2021 09:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xJa+cKTetnpXQQd53c16/1A7QuzRyd4+W33T7AT4E/Y=;
 b=OG57Gdivz5kGldX0yMBroXGatkl8x3xO3Ul1obmCjJjZGB9mKicHiqMSRFY+5gLPUI
 Giz5pqbJaLxrJSgJ9/C1woYDWX0z9R0NynrA0j5zw8JXrO3EPdaF9GpE2TNyscNkqIKU
 gkq8bZY6QQ8+EbNcV17wK6tK+xMfRDBPN0Z06qNLaiPoQmHRfRpu5PGbAl1SkEILi6X9
 8YRfD8N3/bsQ4yfgXy1b88O7J0DSGs6zfeUTltasZbuG0YLMhdkfmLwv8LC/eYbYT+HV
 co8FieSQNPRDaCfB1Nx/bp0weEY8vcypS6Hvh8fgutf0gRQ7z8OCs+EJf9+N+xhN/J+5
 EUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xJa+cKTetnpXQQd53c16/1A7QuzRyd4+W33T7AT4E/Y=;
 b=qK0zEJmedMaNJA9D0b1ZxpwaZbEw6COvtQmJDnGDfoCIKJcCnWT/zm0p6uoy7W6fbc
 PrWaOp1RRFz6+cwPjWXWYFg792IMxvh9D6SCsDUhgiACM8hQHP2MgWt5YMO6pJxew1Ar
 30HjcDSuCXzPuxh0GzjgG7tL2Ad7mLnhX7T95hGGyypOUTEHo5/k10tCr/+OM+YD19FH
 3p96f2iY7dfhaq0C0tq7E+KnZxo2GOl/wswTN5Ucnqcz8ewrZvRpRvIDDiwFkwSke9u7
 s99rCK2aGMTgA1nWuPEwj265LvtQZYZsbcQGVnnMbNExmwerovXx/HP+3X5i+yQLM7Po
 BsdA==
X-Gm-Message-State: AOAM533fTqrztq1cAV6l+6sjCsKJ7245QxtZabTB+7/PGNvDaE2qIKP4
 Rx21q1iMnsgM0SSK+3VuBWI=
X-Google-Smtp-Source: ABdhPJwXS2Ya7y1PIN+2VhS5fql1jcZ6gz+sEsu7Yf6EHpI1qjppFUgiil4jnp4q98nDnzTAEbRwew==
X-Received: by 2002:a17:906:b10e:: with SMTP id
 u14mr147196ejy.546.1622736849389; 
 Thu, 03 Jun 2021 09:14:09 -0700 (PDT)
Received: from skbuf ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id b14sm2015353edz.21.2021.06.03.09.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:14:08 -0700 (PDT)
Date: Thu, 3 Jun 2021 19:14:07 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Message-ID: <20210603161407.457olvjmia3zoj6w@skbuf>
References: <20210603115032.2470-1-michael.wei.hong.sit@intel.com>
 <20210603115032.2470-2-michael.wei.hong.sit@intel.com>
 <20210603132056.zklgtbsslbkgqtsn@skbuf>
 <SA2PR11MB50513D751429D3D456A5A9409D3C9@SA2PR11MB5051.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SA2PR11MB50513D751429D3D456A5A9409D3C9@SA2PR11MB5051.namprd11.prod.outlook.com>
Cc: "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "vee.khee.wong@linux.intel.com" <vee.khee.wong@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Voon,
 Weifeng" <weifeng.voon@intel.com>, "Wong, Vee Khee" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Tan,
 Tee Min" <tee.min.tan@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [RESEND PATCH net-next v4 1/3] net: stmmac: split
 xPCS setup from mdio register
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

On Thu, Jun 03, 2021 at 01:49:20PM +0000, Sit, Michael Wei Hong wrote:
> Hi Vladimir,
> 
> > -----Original Message-----
> > From: Vladimir Oltean <olteanv@gmail.com>
> > Sent: Thursday, June 3, 2021 9:21 PM
> > To: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>
> > Cc: Jose.Abreu@synopsys.com; andrew@lunn.ch;
> > hkallweit1@gmail.com; linux@armlinux.org.uk; kuba@kernel.org;
> > netdev@vger.kernel.org; peppe.cavallaro@st.com;
> > alexandre.torgue@foss.st.com; davem@davemloft.net;
> > mcoquelin.stm32@gmail.com; Voon, Weifeng
> > <weifeng.voon@intel.com>; Ong, Boon Leong
> > <boon.leong.ong@intel.com>; Tan, Tee Min
> > <tee.min.tan@intel.com>; vee.khee.wong@linux.intel.com;
> > Wong, Vee Khee <vee.khee.wong@intel.com>; linux-stm32@st-
> > md-mailman.stormreply.com; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [RESEND PATCH net-next v4 1/3] net: stmmac: split
> > xPCS setup from mdio register
> > 
> > Hi Michael,
> > 
> > On Thu, Jun 03, 2021 at 07:50:30PM +0800, Michael Sit Wei Hong wrote:
> > > From: Voon Weifeng <weifeng.voon@intel.com>
> > >
> > > This patch is a preparation patch for the enabling of Intel mGbE
> > > 2.5Gbps link speed. The Intel mGbR link speed configuration (1G/2.5G)
> > > is depends on a mdio ADHOC register which can be configured in the bios menu.
> > > As PHY interface might be different for 1G and 2.5G, the mdio bus need
> > > be ready to check the link speed and select the PHY interface before
> > > probing the xPCS.
> > >
> > > Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
> > > Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
> > > .../net/ethernet/stmicro/stmmac/stmmac_main.c |  7 ++
> > > .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 73 ++++++++++---------
> > >  3 files changed, 46 insertions(+), 35 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > index b6cd43eda7ac..fd7212afc543 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > @@ -311,6 +311,7 @@ enum stmmac_state {  int
> > > stmmac_mdio_unregister(struct net_device *ndev);  int
> > > stmmac_mdio_register(struct net_device *ndev);  int
> > > stmmac_mdio_reset(struct mii_bus *mii);
> > > +int stmmac_xpcs_setup(struct mii_bus *mii);
> > >  void stmmac_set_ethtool_ops(struct net_device *netdev);
> > >
> > >  void stmmac_ptp_register(struct stmmac_priv *priv); diff --git
> > > a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index 13720bf6f6ff..eb81baeb13b0 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -7002,6 +7002,12 @@ int stmmac_dvr_probe(struct device
> > *device,
> > >  		}
> > >  	}
> > >
> > > +	if (priv->plat->mdio_bus_data->has_xpcs) {
> > > +		ret = stmmac_xpcs_setup(priv->mii);
> > > +		if (ret)
> > > +			goto error_xpcs_setup;
> > > +	}
> > > +
> > 
> > I don't understand why this change is necessary?
> > 
> > The XPCS probing code was at the end of stmmac_mdio_register().
> > You moved the code right _after_ stmmac_mdio_register().
> > So the code flow is exactly the same.
> > 
> Yes, the code flow may look the same, but for intel platforms,
> we need to read the mdio ADHOC register to determine the link speed
> that is set in the BIOS, after reading the mdio ADHOC register value,
> we can determine the link speed and set the appropriate phy_interface
> for 1G/2.5G, where 2.5G uses the PHY_INTERFACE_MODE_2500BASEX
> and 1G uses the PHY_INTERFACE_MODE_SGMII.
> 
> The register reading function is added in between the mdio_register and
> xpcs_setup in patch 3 of the series

Ah, ok, I did not notice this bit:

@@ -7002,6 +7006,9 @@ int stmmac_dvr_probe(struct device *device,
 		}
 	}
 
+	if (priv->plat->speed_mode_2500)
+		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
+
 	if (priv->plat->mdio_bus_data->has_xpcs) {
 		ret = stmmac_xpcs_setup(priv->mii);
 		if (ret)

With the current placement, there seems to be indeed no way for the
platform-level code to set plat->phy_interface after the MDIO bus has
probed but before the XPCS has probed.

I wonder whether it might be possible to probe the XPCS completely
outside of stmmac_dvr_probe(); once that function ends you should have
all knowledge necessary to set plat->phy_interface all within the Intel
platform code. An additional benefit if you do this is that you no
longer need the has_xpcs variable - Intel is the only one setting it
right now, as far as I can see. What do you think?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
