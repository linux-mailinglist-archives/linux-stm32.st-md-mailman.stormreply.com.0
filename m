Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF2INJzYcGkOaAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 14:46:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8A457BFE
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 14:46:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07E34C35E3C;
	Wed, 21 Jan 2026 13:46:04 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CD7DC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 13:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=GA0E+2lExoLTrBoxDpukALnUWndmDpxiv7DFZKJpltk=; b=5b+lJUiFPwVO4dTWd/qFReIVHI
 7f99yyhyqXgdhUMCdDHEPQCqc1MLMgQKanORtkFU4U6RCDNpUqvSXjBSwcTdCc7xJv69ahZoiVGVN
 k8+LEDN5Wjx8rpjwbhFUTfrwdpdMpHdB3asxlQfgxxUCsjamsFoUEg21HcN8Scc4H/oo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1viYWS-003p7S-MM; Wed, 21 Jan 2026 14:45:24 +0100
Date: Wed, 21 Jan 2026 14:45:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <73bf2977-ad1a-45fa-9b06-5df083c060a8@lunn.ch>
References: <20260121071315.940130-1-inochiama@gmail.com>
 <20260121071315.940130-4-inochiama@gmail.com>
 <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
 Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Jose Abreu <joabreu@synopsys.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Yao Zi <ziyao@disroot.org>, Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Add glue
 layer for Spacemit K3 SoC
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:vladimir.oltean@nxp.com,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:jernej.skrabec@gmail.com,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:quentin.schulz@cherry.de,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:ziyao@disroot.org,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:yong.liang.choong@linux.intel.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:inochiama@gmail.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:
 jernejskrabec@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,cqsoftware.com.cn,synopsys.com,cherry.de,redhat.com,vger.kernel.org,eecs.berkeley.edu,disroot.org,bp.renesas.com,linux.intel.com,st.com,lists.linux.dev,gentoo.org,lunn.ch,dabbelt.com,altera.com,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 6C8A457BFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 12:05:30PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 21, 2026 at 03:13:11PM +0800, Inochi Amaoto wrote:
> > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > +	val = FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > +	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
> > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> 
> So your reply where you basically stated that all the RGMII.*DLINE.*
> constants here should be the same was nonsense. How can we trust your
> replies?
> 
> > +static int spacemit_dwmac_fix_delay(struct plat_stmmacenet_data *plat_dat,
> > +				    struct regmap *apmu,
> > +				    unsigned int dline_offset,
> > +				    unsigned int tx_delay, unsigned int rx_delay)
> > +{
> > +	bool mac_rxid = rx_delay != 0;
> > +	bool mac_txid = tx_delay != 0;
> > +	unsigned int rx_config = 0;
> > +	unsigned int tx_config = 0;
> > +	int rx_code;
> > +	int tx_code;
> > +
> > +	plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > +								  mac_txid,
> > +								  mac_rxid);
> 
> Maybe Andrew can confirm, but this function was to fix up existing
> broken DT, and shouldn't be used by brand new drivers.

Hi Russell, thanks for pointing this out.

This function should not be used in this case. MAC drivers in general
only add small delays, in order to do fine tuning. The PHY adds the
2ns delay. There are however some MACs who cannot disable their 2ns
delay, or have historically been broken, and add 2ns delay. In such
cases, the phy_interface passed to the PHY needs masking, to indicate
the PHY should not add the 2ns delays. That is what this function
does.

Please don't call it. Pass phy_interface as is to the PHY.

       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
