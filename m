Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC25A903BD4
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 14:25:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E690C712A3;
	Tue, 11 Jun 2024 12:25:19 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F05D7C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 12:25:18 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52c815e8e9eso3002426e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718108718; x=1718713518;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ouUDY8YSEz1j3+98PcGq5EBB+OR8gX6mhTmbMAzRrc=;
 b=ANaFB33+j1KnH8jYCrXDNONlrPv7YP0M0/IkC7msg+BxRDGQ7YC0CBxsG5g7e/yKHb
 2xz98bY0rKbu34D9IAb+QRdsx+NJd2N7nn5Qw+1eWXUZLqgKtKCGLKHkyRf517Cs3Z3/
 kOffUo9+Ru+WibFETEwpn5zcMAQ9++ec8BbInHeixZNvZuPta0U2QQmjYO6WJcLbD+mT
 3ChlcD4PMppriMHvJZDkk2RiHwTzcKFxazFwC+RG69+Qv4sh52aQABOVQN6Vuhb6dVpZ
 Xx2HdzyjuBa2COaLEfZfLxO5mR+r1vRLNd8CF/Yi34HXjMyH+MAoeIkjAXd/6sHyBfqT
 nyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718108718; x=1718713518;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ouUDY8YSEz1j3+98PcGq5EBB+OR8gX6mhTmbMAzRrc=;
 b=pYc7LX0XHIh3tRE+4oa/PlWE+zK9s38L/ZFVOUnSWM+4Pd34K3dC9zePdi0CRV+/JY
 FcNZ4K/txLAEtwmOXItFcjkq8oVOYDWIvi5EYvIl6XIvahRGlfwqNDPyS2OCUmHN5W73
 PBr9Ngpdm/K1NmNWaPewr98szOzAEToNzAYBBi+7+93wZ4iG0+wS+0AWIhezoAsSOJll
 Jh9S3nMTyKmReTGSood+TjHTFX85H+6vJ+owguznaYMcS9yl+IYf8Hq3PfK0Vx3VMHPn
 1jQMtCXDPejpmWbrZTFTyQIYKytsn/KcX1HfLDrODvK7sSYRvnyqV/A9UG5EsXbFy0gT
 AgZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBI3LVHrZuLQaxnVpRgqQbrSDLRl+x+Kd4NrpS5wZAYsoE+cO8qrlTphkvP9cp3+FULw2nKJ9Et+GF063yYRV2Rkz2mVzt/oBFagINI8dx3Y2xuE4uRtgG
X-Gm-Message-State: AOJu0YwKvjRPLr2OGiW1IfW5lAssUSQ+5esulcdznmMZckJ4wcoWRo+C
 wyvH5Yk8YhNGsp1ij1WTXu+wfbE3Ym2/j2BS05Pn02KLzIVo7ig3
X-Google-Smtp-Source: AGHT+IHUeXd4dGJsML6XnF4lPZt0zfn3VqlZQB2A0tzQ+ohLCNYXePxOv2iTbHbu+AlL2/Jv1CHLoQ==
X-Received: by 2002:a05:6512:28a:b0:52c:7a2d:5d5d with SMTP id
 2adb3069b0e04-52c7a2d5f56mr5474366e87.3.1718108717840; 
 Tue, 11 Jun 2024 05:25:17 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c82c37a25sm1380037e87.149.2024.06.11.05.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 05:25:17 -0700 (PDT)
Date: Tue, 11 Jun 2024 15:25:14 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Andrew Halaney <ahalaney@redhat.com>
Message-ID: <dz34gg4atjyha5dc7tfgbnmsfku63r7faicyzo3odkllq3bqin@hho3kj5wmaat>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0Ov-00EzBu-BC@rmk-PC.armlinux.org.uk>
 <6n4xvu6b43aptstdevdkzx2uqblwabaqndle2omqx5tcxk4lnz@wm3zqdrcr6m5>
 <ZmbFK2SYyHcqzSeK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZmbFK2SYyHcqzSeK@shell.armlinux.org.uk>
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

Hi Russell, Andrew

On Mon, Jun 10, 2024 at 10:19:39AM +0100, Russell King (Oracle) wrote:
> On Wed, Jun 05, 2024 at 03:05:43PM -0500, Andrew Halaney wrote:
> > On Fri, May 31, 2024 at 12:26:25PM GMT, Russell King (Oracle) wrote:
> > > @@ -335,8 +303,12 @@ static int dwmac1000_irq_status(struct mac_device_info *hw,
> > >  

> > >  	dwmac_pcs_isr(ioaddr, GMAC_PCS_BASE, intr_status, x);
> > >  
> > > -	if (intr_status & PCS_RGSMIIIS_IRQ)
> > > -		dwmac1000_rgsmii(ioaddr, x);
> > > +	if (intr_status & PCS_RGSMIIIS_IRQ) {
> > > +		/* TODO Dummy-read to clear the IRQ status */
> > > +		readl(ioaddr + GMAC_RGSMIIIS);
> > 
> > This seems to me that you're doing the TODO here? Maybe I'm
> > misunderstanding... maybe not :)
> 
> Please trim your replies.
> 
> These two lines come from Serge - please ask him why it's marked as a
> TODO. I assume he has a reason. Thanks.

The statement below the "TODO..." comment was supposed to be a
quick-fix of the interrupts flood happening due to the uncleared
RGSMIIIS IRQ flag. Of course dummy-reading in the IRQ handler with no
action required to handle the IRQ wouldn't be the best solution
(despite of having the phylink_pcs_change() called), especially seeing there
is the dwmac_pcs_isr() method, which name implies the PCS IRQ
handling. At least we could have incremented the
stmmac_extra_stats::irq_rgmii_n counter in there. So what I meant TODO here was
to move the RGSMIIIS IRQ handling in dwmac_pcs_isr().

I know that the dwmac_pcs_isr() method has been created around the
cross-IP-cores PCS implementation, but as I mentioned several times
the tx_config_reg[15:0] part of the
GMAC_RGSMIIIS/MAC_PHYIF_Control_Status registers is the same on both
DW GMAC and DW QoS Eth:
tx_config_reg[0]:   LNKMOD
tx_config_reg[1:2]: LNKSPEED
tx_config_reg[3]:   LNKSTS
tx_config_reg[4]:   JABTO (Jabber Timeout, specific to SMII)
tx_config_reg[5]:   FALSCARDET (False Carrier Detected, specific to SMII)

Should we have a DW IP-core-specific getter like
stmmac_ops::pcs_get_config_reg() which would return the
tx_config_reg[15:0] field then we could have cleared the IRQ by just
calling it, we could have had the fields generically
parsed in the dwmac_pcs_isr() handler and in the
phylink_pcs_ops::pcs_get_state(). Thus the entire struct
phylink_pcs_ops definition could be moved to the stmmac_pcs.c module
simplifying the DW GMAC and DW QoS Eth hardware-dependent code.

In this regard there is another change which would be required (and
frankly would make the code simpler). Instead of passing the
CSRs-base address to the
dwmac_pcs_isr()/dwmac_pcs_config()/dwmac_pcs_get_state() methods, we
could pre-define the PCS registers base address as it's done for the
PTP/MMC/EST implementation in the driver. Here is the brief change
description:
1. add stmmac_regs_off::pcs_off field (hwif.h)
2. add stmmac_priv::pcsaddr field (stmmac.h)
3. initialize the stmmac_regs_off::pcs_off field for the DW GMAC and
DW QoS Eth IP-cores in the stmmac_hw array (hwif.c)
4. initialize the stmmac_priv::pcsaddr field in the stmmac_hwif_init()
method as it's done for stmmac_priv::{ptpaddr,mmcaddr,estaddr}.
5. use the PCS-base address in the stmmac_pcs.c module.

As a result (unless I've missed something) we'll be able to move
almost the entire internal PCS implementation to the stmmac_pcs.c
module (except the tx_config_reg[] data getter).

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
