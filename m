Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pw81K3MLLWrWZgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Jun 2026 09:49:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A067E05F
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Jun 2026 09:49:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=lunn.ch header.s=20171124 header.b=IQpKBRcq;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (strict)" header.from=lunn.ch (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB484C8F297;
	Sat, 13 Jun 2026 07:49:06 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F3D9C712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jun 2026 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ijozv1/zYB/1FW5r3iA6BSCWEsMm1mHuR8XAqmCPWx4=; b=IQpKBRcqQLSbefm3KDuxhfWcFc
 BgLCoBRK4g/QV7+3gQR1kTDZyHg3RUkT0NcxAdhym2ecnyz7JtlbTzqr/rVGg3fbKd4Dv5KM4aBmG
 BtIjToxReUvu8qIlJIKCuzKB8oKl7oarePJmPKIP0sco0QIbFQ1XdAbyZjytECiCpw80=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1wYJ6k-007RqY-AP; Sat, 13 Jun 2026 09:48:46 +0200
Date: Sat, 13 Jun 2026 09:48:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <30229cfe-b395-4d0f-81ef-eb780ac26599@lunn.ch>
References: <20260610012727.848-1-lizhi2@eswincomputing.com>
 <20260610012937.911-1-lizhi2@eswincomputing.com>
 <eaa645fc-be06-4a15-8c2f-6e82129c4715@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eaa645fc-be06-4a15-8c2f-6e82129c4715@bootlin.com>
Cc: edumazet@google.com, lizhi2@eswincomputing.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 ningyu@eswincomputing.com, lee@kernel.org, pritesh.patel@einfochips.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, aou@eecs.berkeley.edu, horms@kernel.org,
 rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v8 3/6] net: stmmac: eic7700:
 make RGMII delay properties optional
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maxime.chevallier@bootlin.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:lee@kernel.org,m:pritesh.patel@einfochips.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:horms@kernel.org,m:rmk+kernel@armlinux.org.uk,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[google.com,eswincomputing.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,ghiti.fr,einfochips.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F4A067E05F

On Wed, Jun 10, 2026 at 10:26:50AM +0200, Maxime Chevallier wrote:
> Hi,
> 
> On 6/10/26 03:29, lizhi2@eswincomputing.com wrote:
> > From: Zhi Li <lizhi2@eswincomputing.com>
> > 
> > Make rx-internal-delay-ps and tx-internal-delay-ps optional in the
> > EIC7700 DWMAC driver.
> > 
> > The driver previously required both properties to be present and would
> > fail probe when they were missing. This restricts valid hardware
> > configurations where RGMII timing is instead provided by the PHY or
> > board design.
> > 
> > Update the driver to treat missing delay properties as zero delay,
> > allowing systems without explicit MAC-side delay tuning to operate
> > correctly.
> > 
> > This aligns the driver behavior with the updated device tree binding
> > and provides a safe default configuration when MAC-side delay
> > programming is not required.
> > 
> > Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> > index 4ac979d874d6..ec99b597aeaf 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> > @@ -165,9 +165,6 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
> >  		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
> >  		dwc_priv->eth_clk_dly_param |=
> >  				 FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
> > -	} else {
> > -		return dev_err_probe(&pdev->dev, -EINVAL,
> > -			"missing required property rx-internal-delay-ps\n");
> >  	}
> >  
> >  	/* Read tx-internal-delay-ps and update tx_clk delay */
> > @@ -187,9 +184,6 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
> >  		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_TX_ADJ_DELAY;
> >  		dwc_priv->eth_clk_dly_param |=
> >  				 FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, val);
> > -	} else {
> > -		return dev_err_probe(&pdev->dev, -EINVAL,
> > -			"missing required property tx-internal-delay-ps\n");
> >  	}
> 
> I think then you need to handle RGMII, RGMII_ID, RGMII_RXID and RGMII_TXID,
> by using default delays for these (usually around 2ns), as here all delays
> will be set to 0, regardless of the RGMII mode in use.

No. By default, the MAC adds 0ns delay, and passes the phy-mode to the
PHY. It will then add the 2ns delay. It is possible to use the
tx-internal-delay-ps and rx-internal-delay-ps in the MAC to add small
tuning delays, but not the full 2ns.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
