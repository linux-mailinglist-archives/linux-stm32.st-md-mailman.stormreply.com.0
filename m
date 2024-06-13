Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD7A907DE8
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2024 23:14:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E5E2C78012;
	Thu, 13 Jun 2024 21:14:30 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25EFCC712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 21:14:22 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52bc1261e8fso1809926e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718313261; x=1718918061;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ftEGjGiodNUlNFLJ4s9QwQPCpcz2rKKpzG6CDOWGl3g=;
 b=ZUFf0gGWLvu2mxuSRZHOrK7rHmVHKOSUqjpGMY/0FePRwfxG92LvyWjEQVh+H19Es+
 hK1f9DmwYl7tJi6l4yaV3WAmFZwQrwQHonLRcbIpboprM5CzAQPuj6BU9OZ/Na8Njfba
 QfO6yrE88kIqqUX3Boh1Qiz5sx9vfIajtJQMmN4sYe5UPoPJ7uf/vAhrLO/AOMeyqZsU
 7LtF+YhsR7vvRQib4nHAj+QYfMZNj82n9DRPE2QHwTDtjzep2ICwkcaufeva0H+3hMmU
 +cnvb6j3TKIhqBQ9M23LVbZk6BlLUp1v/LSpcT8CWnpZSgDCSRAM56rWffZO/wmSQE1H
 DV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718313261; x=1718918061;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ftEGjGiodNUlNFLJ4s9QwQPCpcz2rKKpzG6CDOWGl3g=;
 b=DDVeCCL0MDJAm8V1ipyuDWG/lY/qfCtk1lweRvIx61Kzcmger1lEiNsg++tCedDSH/
 ACePIyumBLsRX7YURu9uDTV0UHjiQWpg1uFNt2s4gUKSUFkMdOO4c0H/MqqL0B0T4vI4
 ou50csneKSBTBQNPk+Qxwde0m45jvBsFhuXd+KTmmMZZoG8GDG0Mock2S20AQVOuHkNk
 GnTq9nnzCVCf24Y5yRjumYVLbz3M/VqoxNfh+Ku0YNO5391NHNGyRech8rAqTeGlrR5u
 w7rqz3uX8GKQd7YjOP+s/fahYuTbn4gQOjv63wRUHAdo6ARyRu69VG+MMoQoJODRXDn7
 DdSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh8LqjqaJxjeV+F/J94Euw1Xs6sJ/ZRntkUbZ3y4rmErpcg3rBqbYLuSaC5R3kwm4FqHQN7bRS+LovC1eWGWNLfwzTWOi1FglZ1L0trNHCsvNYKCeAi1OO
X-Gm-Message-State: AOJu0Yxi69C0qM0swxtll1D1g3kDXqq1mi1ayVV/YgE+P05ku+MxCHTw
 xhQjKHGzc04QTghDenjhXRzcuJkEs+PCYHaN0/bpjq9Hx76cZqSR
X-Google-Smtp-Source: AGHT+IEbCbfAirRfes3utvk8rWHRVwbD5jpakBi8HtcODlseSZ85GzCYwowhe0K+tBCGyjoZUtXdwQ==
X-Received: by 2002:a19:911e:0:b0:52c:8215:574 with SMTP id
 2adb3069b0e04-52ca6e6dc1amr473331e87.38.1718313260821; 
 Thu, 13 Jun 2024 14:14:20 -0700 (PDT)
Received: from mobilestation ([176.213.10.53])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2826269sm340392e87.61.2024.06.13.14.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 14:14:20 -0700 (PDT)
Date: Fri, 14 Jun 2024 00:14:18 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <doeizqmec22tqez5zwhysppmm2vg2rhzp2siy5ogdncitbtx5b@mycxnahybvlp>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0Ov-00EzBu-BC@rmk-PC.armlinux.org.uk>
 <6n4xvu6b43aptstdevdkzx2uqblwabaqndle2omqx5tcxk4lnz@wm3zqdrcr6m5>
 <ZmbFK2SYyHcqzSeK@shell.armlinux.org.uk>
 <dz34gg4atjyha5dc7tfgbnmsfku63r7faicyzo3odkllq3bqin@hho3kj5wmaat>
 <ZmobWwS5UapbhdmT@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZmobWwS5UapbhdmT@shell.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 3/8] net: stmmac:
 dwmac1000: convert sgmii/rgmii "pcs" to phylink
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

On Wed, Jun 12, 2024 at 11:04:11PM +0100, Russell King (Oracle) wrote:
> On Tue, Jun 11, 2024 at 03:25:14PM +0300, Serge Semin wrote:
> > Hi Russell, Andrew
> >
> > Should we have a DW IP-core-specific getter like
> > stmmac_ops::pcs_get_config_reg() which would return the
> > tx_config_reg[15:0] field then we could have cleared the IRQ by just
> > calling it, we could have had the fields generically
> > parsed in the dwmac_pcs_isr() handler and in the
> > phylink_pcs_ops::pcs_get_state().
> 

> pcs_get_state() is not supposed to get some cached state,

It won't.

> but is
> supposed to return the real state at the time that it is called.

The idea is to implement the tx_config_reg[15:0] getter for DW GMAC
and DW QoS Eth. It will return the current link status retrieved from
the GMAC_RGSMIIIS and GMAC_PHYIF_CONTROL_STATUS registers. Like this:

GMAC:
u16 dwmac1000_pcs_get_config_reg(struct stmmac_priv *priv)
{
	return readl(priv->ioaddr + GMAC_RGSMIIIS);
}

DW QoS Eth:
u16 dwmac1000_pcs_get_config_reg(struct stmmac_priv *priv)
{
	return readl(priv->ioaddr + GMAC_PHYIF_CONTROL_STATUS) >> 16;
}

Then the dwmac_pcs_isr() can be updated as follows:

static inline void dwmac_pcs_isr(void __iomem *ioaddr, u32 reg,
                                 unsigned int intr_status,
                                 struct stmmac_extra_stats *x)
{
	...

	if (intr_status & PCS_RGSMIIIS_IRQ) {
		x->irq_rgmii_n++;
		/* The next will clear the PCS_RGSMIIIS_IRQ IRQ
		 * status. (It is done instead of dummy-reading the
		 * GMAC_RGSMIIIS/GMAC_PHYIF_CONTROL_STATUS registers
		 * in the DW GMAC/QoS Eth IRQ handlers.)
		 */
		(void)stmmac_pcs_get_config_reg(priv);
	}
}

Similarly the dwmac_pcs_get_state() method can now use the
stmmac_pcs_get_config_reg() function to retrieve the link state and
parse the data in a generic manner. Thus everything what is currently
done in dwmac1000_mii_pcs_get_state() and dwmac4_mii_pcs_get_state()
could be moved to dwmac_pcs_get_state(). By providing a single
STMMAC-driver callback stmmac_ops::pcs_get_config_reg(), we'll be able
to define the phylink_pcs_ops::{pcs_validate,pcs_config,pcs_get_state}
methods in the stmmac_pcs.c file.

> 
> There's a good reason for this - dealing with latched-low link failed
> indications, it's necessary that pcs_get_state() reports that the link
> failed if _sometime_ between the last time it was called and the next
> time the link has failed.
> 
> So, I'm afraid your idea of simplifying it doesn't sound to me like a
> good idea.

No caching or latched link state indications. Both the GMAC_RGSMIIIS
and GMAC_PHYIF_CONTROL_STATUS registers contain the actual link state
retrieved the PHY. stmmac_pcs_get_config_reg() will just return the
current link state.

Perhaps my suggestion might haven't been well described. Providing the
patches with the respective changes shall better describe what was
meant. So in a few days I'll submit an incremental patch(es) with the
proposed modifications for your series.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
