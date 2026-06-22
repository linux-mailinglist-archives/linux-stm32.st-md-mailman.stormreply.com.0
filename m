Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XcZuEu6bOGrTeQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 04:20:30 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D216AC0B7
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 04:20:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A206C9AE2F;
	Mon, 22 Jun 2026 02:20:29 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [13.75.44.102])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFCF3C5A4DF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2026 02:20:27 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Mon, 22 Jun 2026 10:19:50 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Mon, 22 Jun 2026 10:19:50 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <30229cfe-b395-4d0f-81ef-eb780ac26599@lunn.ch>
References: <20260610012727.848-1-lizhi2@eswincomputing.com>
 <20260610012937.911-1-lizhi2@eswincomputing.com>
 <eaa645fc-be06-4a15-8c2f-6e82129c4715@bootlin.com>
 <30229cfe-b395-4d0f-81ef-eb780ac26599@lunn.ch>
MIME-Version: 1.0
Message-ID: <512b77d5.993b.19eed207fc9.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TAJkCgDHW3DHmzhqEvksAA--.8326W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEGDGo4EpcWfAACs2
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 ningyu@eswincomputing.com, lee@kernel.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 aou@eecs.berkeley.edu, horms@kernel.org, rmk+kernel@armlinux.org.uk,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 palmer@dabbelt.com, mcoquelin.stm32@gmail.com, pjw@kernel.org,
 davem@davemloft.net
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
X-Spamd-Result: default: False [2.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:lee@kernel.org,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:horms@kernel.org,m:rmk+kernel@armlinux.org.uk,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,einfochips.com,eswincomputing.com,ghiti.fr,bootlin.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85D216AC0B7




> -----Original Messages-----
> From: "Andrew Lunn" <andrew@lunn.ch>
> Send time:Saturday, 13/06/2026 15:48:46
> To: "Maxime Chevallier" <maxime.chevallier@bootlin.com>
> Cc: lizhi2@eswincomputing.com, devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ningyu@eswincomputing.com, linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com, horms@kernel.org, lee@kernel.org
> Subject: Re: [PATCH net-next v8 3/6] net: stmmac: eic7700: make RGMII delay properties optional
> 
> On Wed, Jun 10, 2026 at 10:26:50AM +0200, Maxime Chevallier wrote:
> > Hi,
> > 
> > On 6/10/26 03:29, lizhi2@eswincomputing.com wrote:
> > > From: Zhi Li <lizhi2@eswincomputing.com>
> > > 
> > > Make rx-internal-delay-ps and tx-internal-delay-ps optional in the
> > > EIC7700 DWMAC driver.
> > > 
> > > The driver previously required both properties to be present and would
> > > fail probe when they were missing. This restricts valid hardware
> > > configurations where RGMII timing is instead provided by the PHY or
> > > board design.
> > > 
> > > Update the driver to treat missing delay properties as zero delay,
> > > allowing systems without explicit MAC-side delay tuning to operate
> > > correctly.
> > > 
> > > This aligns the driver behavior with the updated device tree binding
> > > and provides a safe default configuration when MAC-side delay
> > > programming is not required.
> > > 
> > > Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c | 6 ------
> > >  1 file changed, 6 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> > > index 4ac979d874d6..ec99b597aeaf 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> > > @@ -165,9 +165,6 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
> > >  		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
> > >  		dwc_priv->eth_clk_dly_param |=
> > >  				 FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
> > > -	} else {
> > > -		return dev_err_probe(&pdev->dev, -EINVAL,
> > > -			"missing required property rx-internal-delay-ps\n");
> > >  	}
> > >  
> > >  	/* Read tx-internal-delay-ps and update tx_clk delay */
> > > @@ -187,9 +184,6 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
> > >  		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_TX_ADJ_DELAY;
> > >  		dwc_priv->eth_clk_dly_param |=
> > >  				 FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, val);
> > > -	} else {
> > > -		return dev_err_probe(&pdev->dev, -EINVAL,
> > > -			"missing required property tx-internal-delay-ps\n");
> > >  	}
> > 
> > I think then you need to handle RGMII, RGMII_ID, RGMII_RXID and RGMII_TXID,
> > by using default delays for these (usually around 2ns), as here all delays
> > will be set to 0, regardless of the RGMII mode in use.
> 
> No. By default, the MAC adds 0ns delay, and passes the phy-mode to the
> PHY. It will then add the 2ns delay. It is possible to use the
> tx-internal-delay-ps and rx-internal-delay-ps in the MAC to add small
> tuning delays, but not the full 2ns.
> 
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287
> 

Thanks for the earlier discussion and for helping clarify the eth0
design.

I'm preparing a v9 of the series. The next revision will address the
issues reported by Sashiko review, mainly DT binding schema and DTS
warnings.

Before I post v9, I'd like to check whether you have any concerns or
suggestions regarding the driver changes.

Thanks,
Zhi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
