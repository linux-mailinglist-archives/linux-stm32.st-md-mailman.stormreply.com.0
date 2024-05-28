Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAE78D1CA8
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 15:20:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8CA1C6B47E;
	Tue, 28 May 2024 13:20:01 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 317A1C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 13:19:54 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2e95afec7e6so34480621fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716902393; x=1717507193;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4lsS6UWs3Vq43Zsc//O5k/DxSvkmM/xM5dPhYo3OcQk=;
 b=maaKUpgyTqqzppi83tc1Mlb+cFUN0OJnCi3uQ5ABHc8eHxSLd+9kKqcafvd0AuRPz6
 4MTBP5gT3ljA8vN7wznl3c1KOtwS8mgpCgv0Njh9YdqDQBvYwN7qXdOp9poLMKXm8jxQ
 etYDzlqlwJkxtg9cima5O1FM/18GuBoAb9mOAuOq0p0MYVV8OfmORyw3Q9OWCh67YnGY
 vRsaIz2GCNaQ4CIu/BtzwdeUOt/3vNGhlD51/vArtpdFPhGuDdoUFvsV94+pTRy7pLMK
 VPiKvUCkDvH8oJSeiPjqU/JqWo5fhVzVbOlY1noY+WXbSeX02iZnkWMLcv/VJDqDfvGo
 tEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716902393; x=1717507193;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lsS6UWs3Vq43Zsc//O5k/DxSvkmM/xM5dPhYo3OcQk=;
 b=IQR8waGFYVcjvVNTTNCaTR91O385sJfDcOAIIv4lOlsAZn1QvpkAqu7Eb9cel/IWtQ
 WXzGys6TEfRIvBDhxN/05uXFC4ZLQJ0ordF7O7//qEhTlto47lBM08v/twIyqbTvA/q5
 7u2nl4FBc7NUWQQBhRqT9pJwFH7Lf/nsvBo/aKm50DMfdbRMVSsf/tDrGtfhRKCcHx3Q
 hS2P5+yi1Fi1poMQrkmjJafHTRHyzXK6pfpyFE1r9tED0oCVUctMp3vyRsjEWehcgnaY
 gErDXRladbCC/DtqdbqTLI7krZSzkFiemn61bVTIDEWFl18cHy0VFWrDjY4Dr9SlTw5n
 rRoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd8xXEuaZTsO+9ukFcT4wr912fc8lvQ0cHtLFXIv6RrRWOomCGFF5V6mbjIhv1i5jZIdFh25S/9Ls9K/VA0SZ+Oz54+at/SDngfEn/gtMoOuJQNF5cRBOL
X-Gm-Message-State: AOJu0YzM1ycMpiOegbGa4pDpu+xC7tCfTWhT47xy/77miQ/5InDpIbnv
 Yd3zMi7PKbJ9w5pD/kFZA6vqOs2VK0/ZZbPsEDN+bszXnHhuDztM
X-Google-Smtp-Source: AGHT+IHZcnC5BdWmLAQ1pEXAqgf9x+btzizPqon18tqiGfOweOD0mKmJiT+90UQPwurV17XYK8aGGg==
X-Received: by 2002:a2e:a3d2:0:b0:2d4:535a:e7a with SMTP id
 38308e7fff4ca-2e95a1058e2mr38060261fa.24.1716902393172; 
 Tue, 28 May 2024 06:19:53 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcc4aa9sm22543531fa.9.2024.05.28.06.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 06:19:52 -0700 (PDT)
Date: Tue, 28 May 2024 16:19:49 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <ukszpirecb3pwnz5bbmy7wl44ujh6t2ewrnodmrye5kjmonsz2@pgf5b2oy5n3p>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
 <20240524210304.9164-1-fancer.lancer@gmail.com>
 <20240524210304.9164-2-fancer.lancer@gmail.com>
 <ZlNoLHoHjt3BsFde@shell.armlinux.org.uk>
 <ZlN4tkY8fNM8/D8p@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZlN4tkY8fNM8/D8p@shell.armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Byungho An <bh74.an@samsung.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 2/3] net: stmmac: Activate
 Inband/PCS flag based on the selected iface
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

On Sun, May 26, 2024 at 07:00:22PM +0100, Russell King (Oracle) wrote:
> On Sun, May 26, 2024 at 05:49:48PM +0100, Russell King (Oracle) wrote:
> > On Sat, May 25, 2024 at 12:02:58AM +0300, Serge Semin wrote:
> > > The HWFEATURE.PCSSEL flag is set if the PCS block has been synthesized
> > > into the DW GMAC controller. It's always done if the controller supports
> > > at least one of the SGMII, TBI, RTBI PHY interfaces. If none of these
> > > interfaces support was activated during the IP-core synthesize the PCS
> > > block won't be activated either and the HWFEATURE.PCSSEL flag won't be
> > > set. Based on that the RGMII in-band status detection procedure
> > > implemented in the driver hasn't been working for the devices with the
> > > RGMII interface support and with none of the SGMII, TBI, RTBI PHY
> > > interfaces available in the device.
> > > 
> > > Fix that just by dropping the dma_cap.pcs flag check from the conditional
> > > statement responsible for the In-band/PCS functionality activation. If the
> > > RGMII interface is supported by the device then the in-band link status
> > > detection will be also supported automatically (it's always embedded into
> > > the RGMII RTL code). If the SGMII interface is supported by the device
> > > then the PCS block will be supported too (it's unconditionally synthesized
> > > into the controller). The later is also correct for the TBI/RTBI PHY
> > > interfaces.
> > > 
> > > Note while at it drop the netdev_dbg() calls since at the moment of the
> > > stmmac_check_pcs_mode() invocation the network device isn't registered. So
> > > the debug prints will be for the unknown/NULL device.
> > 
> > Thanks. As this is a fix, shouldn't it be submitted for the net tree as
> > it seems to be fixing a bug in the driver as it stands today?
> > 
> > Also, a build fix is required here:
> > 
> > > -	if (priv->dma_cap.pcs) {
> > > -		if ((interface == PHY_INTERFACE_MODE_RGMII) ||
> > > -		    (interface == PHY_INTERFACE_MODE_RGMII_ID) ||
> > > -		    (interface == PHY_INTERFACE_MODE_RGMII_RXID) ||
> > > -		    (interface == PHY_INTERFACE_MODE_RGMII_TXID)) {
> > > -			netdev_dbg(priv->dev, "PCS RGMII support enabled\n");
> > > -			priv->hw->pcs = STMMAC_PCS_RGMII;
> > > -		} else if (interface == PHY_INTERFACE_MODE_SGMII) {
> > > -			netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
> > > -			priv->hw->pcs = STMMAC_PCS_SGMII;
> > > -		}
> > > -	}
> > > +	if (phy_interface_mode_is_rgmii(interface))
> > > +		priv->hw.pcs = STMMAC_PCS_RGMII;
> > > +	else if (interface == PHY_INTERFACE_MODE_SGMII)
> > > +		priv->hw.pcs = STMMAC_PCS_SGMII;
> > 
> > Both of these assignments should be priv->hw->pcs not priv->hw.pcs.
> > 
> > I think there's also another bug that needs fixing along with this.
> > See stmmac_ethtool_set_link_ksettings(). Note that this denies the
> > ability to disable autoneg, which (a) doesn't make sense for RGMII
> > with an attached PHY, and (b) this code should be passing the
> > ethtool op to phylink for it to pass on to phylib so the PHY can
> > be appropriately configured for the users desired autoneg and
> > link mode settings.
> > 
> > I also don't think it makes any sense for the STMMAC_PCS_SGMII case
> > given that it means Cisco SGMII - which implies that there is also
> > a PHY (since Cisco SGMII with inband is designed to be coupled with
> > something that looks like a PHY to send the inband signalling
> > necessary to configure e.g. the SGMII link symbol replication.
> > 
> > In both of these cases, even if the user requests autoneg to be
> > disabled, that _shouldn't_ affect internal network driver links.
> > This ethtool op is about configuring the externally visible media
> > side of the network driver, not the internal links.
> 

> I have a concern about this patch. Have you considered dwmac-intel with
> its XPCS support, where the XPCS is used for Cisco SGMII and 1000base-X
> support. Does the dwmac-intel version of the core set
> priv->dma_cap.pcs? If it doesn't, then removing the test on this will
> cause a regression, since in Cisco SGMII mode, we end up setting
> priv->hw->pcs to SYMMAC_PCS_SGMII where we didn't before. As
> priv->flags will not have STMMAC_FLAG_HAS_INTEGRATED_PCS, this will
> enable all the "integrated PCS" code paths despite XPCS clearly
> intending to be used for Cisco SGMII.
> 
> I'm also wondering whether the same applies to the lynx PCS as well,
> or in the general case if we have any kind of external PCS.
> 
> Hence, I think this probably needs to be:
> 
> 	if (phy_interface_mode_is_rgmii(interface))
> 		priv->hw->pcs = STMMAC_PCS_RGMII;
> 	else if (interface == PHY_INTERFACE_MODE_SGMII && priv->dma_cap.pcs)
> 		priv->hw->pcs = STMMAC_PCS_SGMII;
> 
> At least this is what unpicking the awful stmmac code suggests (and I
> do feel that my point about the shocking state of this driver is proven
> as details like this are extremely difficult to unpick, and not
> unpicking them correctly will lead to regressions.) Therefore, I would
> suggest that it would be wise if you also double-checked this.

Double-checked that part. Indeed this is what I forgot to take into
account. (Just realized I had a glimpse thought about checking the DW
xGMAC/XPCS for supporting the SGMII interface, but the thought got
away from my mind forgotten.) DW XPCS can be synthesized with having
the GMII/MII interface connected to the MAC and SGMII downstream
interface over a single 1000Base-X lane.

In anyway AFAICS that case has nothing to do with the PCS embedded
into the DW GMAC or DW QoS Eth synthesized with the SGMII support. DW
XGMAC has no embedded PCS, but could be attached to the separate DW
XPCS device.

About the correct implementation. Right, priv->dma_cap.pcs indicates
that there is an embedded PCS and the flag can be set for DW GMAC or DW
QoS Eth only. Although I would change the order:

       if (phy_interface_mode_is_rgmii(interface))
               priv->hw->pcs = STMMAC_PCS_RGMII;
       else if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII)
               priv->hw->pcs = STMMAC_PCS_SGMII;

since priv->dma_cap.pcs is a primary flag. If it isn't set the
interface will be irrelevant.

Alternative solution could be to use the has_gmac/has_gmac4 flags
instead. That will emphasize that the embedded PCS is expected to be
specific for the DW GMAC and DW QoS Eth IP-cores:

       if (phy_interface_mode_is_rgmii(interface))
               priv->hw->pcs = STMMAC_PCS_RGMII;
       else if ((priv->plat.has_gmac || priv->plat.has_gmac4) &&
		interface == PHY_INTERFACE_MODE_SGMII)
               priv->hw->pcs = STMMAC_PCS_SGMII;

-Serge(y)

> 
> If my analysis is correct, then my changes to stmmac_mac_select_pcs()
> are also wrong.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
