Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7069EB05AE4
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 15:09:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24244C349C0;
	Tue, 15 Jul 2025 13:09:45 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 640C7C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=16c8+dR6HK0YJK9HdtebFuRBOksx/FzCYGCA1VXItEE=; b=LxVtsJyka2iWGcioJGwDwlizsr
 L4EoRNpGscSylpareAM6ksRdtJVRFOsui0skpA2/emISSuak68BrHCOwSX67AqvNVMsbZRfVt0T1x
 1GK7n791vGtFiKvcyV7KK6VVRcHhKCBcOhznASGSpV5vB2jBFhfT7ss8ERvpNv/FdH60=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ubfPJ-001a2l-Pl; Tue, 15 Jul 2025 15:09:17 +0200
Date: Tue, 15 Jul 2025 15:09:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Message-ID: <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703092015.1200-1-weishangjuan@eswincomputing.com>
 <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
 <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, ningyu@eswincomputing.com, 0x1207@gmail.com,
 kuba@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 dfustini@tenstorrent.com, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com, inochiama@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 2/2] ethernet: eswin: Add eic7700
	ethernet driver
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

> > > +	dwc_priv->dly_param_1000m[0] = EIC7700_DELAY_VALUE0;
> > > +	dwc_priv->dly_param_1000m[1] = EIC7700_DELAY_VALUE1;
> > > +	dwc_priv->dly_param_1000m[2] = EIC7700_DELAY_VALUE0;
> > > +	dwc_priv->dly_param_100m[0] = EIC7700_DELAY_VALUE0;
> > > +	dwc_priv->dly_param_100m[1] = EIC7700_DELAY_VALUE1;
> > > +	dwc_priv->dly_param_100m[2] = EIC7700_DELAY_VALUE0;
> > > +	dwc_priv->dly_param_10m[0] = 0x0;
> > > +	dwc_priv->dly_param_10m[1] = 0x0;
> > > +	dwc_priv->dly_param_10m[2] = 0x0;
> > 
> > What are the three different values for?
> > 
> 
> Let me clarify the purpose of the three elements in each dly_param_* array:
>   dly_param_[x][0]: Delay configuration for TXD signals
>   dly_param_[x][1]: Delay configuration for control signals (e.g., TX_EN, RX_DV, RX_CLK)
>   dly_param_[x][2]: Delay configuration for RXD signals

Maybe add a #define or an enum for the index.

Do these delays represent the RGMII 2ns delay?

> > {
> > > +		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
> > > +				  &dwc_priv->dly_param_1000m[1]);
> > > +		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
> > > +				  &dwc_priv->dly_param_100m[1]);
> > > +		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
> > > +				  &dwc_priv->dly_param_10m[1]);
> > > +	} else {
> > > +		dev_dbg(&pdev->dev, " use default dly\n");
> > 
> > What is the default? It should be 0ps. So there is no point printing
> > this message.
> > 
> 
> The default value is EIC7700_DELAY_VALUE1

But what does EIC7700_DELAY_VALUE1 mean? It should mean 0ps? But i'm
not sure it does.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
