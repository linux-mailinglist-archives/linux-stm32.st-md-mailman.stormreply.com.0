Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +POZFShVcWkNEwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 23:37:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1815EE96
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 23:37:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 835C8C349C4;
	Wed, 21 Jan 2026 22:37:27 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64654C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 22:37:25 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2b720bb90d0so379244eec.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 14:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769035044; x=1769639844;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pgjMJi+m/42Lvq5w641HEHT7p6jawBc1Rvrn2olmX9o=;
 b=nGgx+y6Aa9UJfQSff6hUn66LvKzcF69uTOceC+U4+OQIeWG8AkCwYWjjYxik4k27Nk
 MR7yXo0CAg1V2pMzm7m2h6uZoAvAUPBxkRaqnNsxLb5RNze1SSjtZMjakKKfwNuxrYdb
 U9Vm54nVFNMiD2E5m+5YwOhdEsbfkNMiPR7DlP7eKLiqkoBTuAooZVZAi7jTdK9CfBxA
 gmkV62wf34E9hbMeyO5Wt3ryKoyPseABABJPtRoAFDuDqXT/fJjcGtk3HMTSOuqs2dI2
 +VwpN+vLJMeUP1L47e1vFqvFQ22M8wpoNV/Qb2A8ZI35M5lJQiNJTo+G9VO8mnlJoRfN
 AtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769035044; x=1769639844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgjMJi+m/42Lvq5w641HEHT7p6jawBc1Rvrn2olmX9o=;
 b=D2uj20ze5Ogf3DmJgfUcTjDRSV8yhK6nXpRN91T6TBf3EC8yLrTIk/rSllrOiAETKe
 p4VuS9vjiDjlst+Tub91PSAfZK1A44KFcASS/FbxYtwCG/ZBqmkZYTXl8hLvR5SPXIhY
 zMRWTd282uaJzkQisBH0PSJ1DzEvfAyCoR/yscoaxFQAFeiE5E40i4Jw2gtDu1oVTZ4z
 vjaqPuxijQaSkI+wV96K/j11Sd52w0OVgVNDE2N3M82uUX834IOX1A9geIPSF1LyLpVw
 z0NwpqyXkFtWuL/dh5Ur/91ks5ksyfm/SBMNn7piuDGQTPOiRnZjYoOd9B/Xp4n7n+JR
 quww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPgKsaqxOovgXZONcSGU604qMaaaKnLYsXD0Z9PoA2Y5ENe8viaAwR/TPFhXAsBZU3Mqhl8LiuH8c8WA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwZbdILnTaBWwIWslBuCKu1HF1Zo0/A0gyEz8aXhzfNOcU+rPc9
 MSM2zyFqyNq0MGjXARaZjKOxGO70VrdzW452MjRyzUN1/+DblQj5XGBz
X-Gm-Gg: AZuq6aIdaEk1HyAE/PzJ7s045p62lukJk7THoPeLrebKnFtoahHPaJGl2NTkHm55e4N
 HzuiFMJlo4JcZ7Pvn9rCoLcc55sam0tdzbGip6ePT9qX+4Ris1qmaV9tHRZprJA+mJTDgJ/iBU5
 rqfbeVr49l1WN0LEJ4u19EnjZGATw1SSAbFGaN7FB66FDWRkW/xacmsc+avARWCcBZ4doCAVIEz
 U1L/LN7nqWNKtShNbieY7pfOx+plLpcC9UqgldGSXIHjpWWszfXYFwL1uww1jdYxzZOtVWtvve+
 un6ugC8+40Qn15mACnOtlEHpCKntTmWI+XduVwsYhq4c4dXzUZSwVQcU0YSv9CbNLdKBdCKdxyp
 bghNnyWN+0xptazVevUFhpQ6xT/exXxYedCOqKApYm00tbZaLTyQcHEytj5nUuiGeOGffPFJJPT
 IeEsg/gLNH8A==
X-Received: by 2002:a05:7300:8b14:b0:2ae:5555:4880 with SMTP id
 5a478bee46e88-2b6b4713257mr14102244eec.13.1769035043476; 
 Wed, 21 Jan 2026 14:37:23 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b70d7f729bsm6725736eec.16.2026.01.21.14.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 14:37:23 -0800 (PST)
Date: Thu, 22 Jan 2026 06:37:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aXFVAoChTPZhjnGu@inochi.infowork>
References: <20260121071315.940130-1-inochiama@gmail.com>
 <20260121071315.940130-4-inochiama@gmail.com>
 <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
 <73bf2977-ad1a-45fa-9b06-5df083c060a8@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73bf2977-ad1a-45fa-9b06-5df083c060a8@lunn.ch>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:linux@armlinux.org.uk,m:vladimir.oltean@nxp.com,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:jernej.skrabec@gmail.com,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:quentin.schulz@cherry.de,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:ziyao@disroot.org,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:yong.liang.choong@linux.intel.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:inochiama@gmail.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:pjw@kernel.org,m:davem@davemloft.net,m:looon
 gbin@gmail.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,cqsoftware.com.cn,synopsys.com,cherry.de,redhat.com,vger.kernel.org,eecs.berkeley.edu,disroot.org,bp.renesas.com,linux.intel.com,st.com,lists.linux.dev,gentoo.org,lunn.ch,dabbelt.com,altera.com,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: CD1815EE96
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 02:45:24PM +0100, Andrew Lunn wrote:
> On Wed, Jan 21, 2026 at 12:05:30PM +0000, Russell King (Oracle) wrote:
> > On Wed, Jan 21, 2026 at 03:13:11PM +0800, Inochi Amaoto wrote:
> > > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > > +	val = FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
> > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > > +	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
> > > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> > 
> > So your reply where you basically stated that all the RGMII.*DLINE.*
> > constants here should be the same was nonsense. How can we trust your
> > replies?
> > 
> > > +static int spacemit_dwmac_fix_delay(struct plat_stmmacenet_data *plat_dat,
> > > +				    struct regmap *apmu,
> > > +				    unsigned int dline_offset,
> > > +				    unsigned int tx_delay, unsigned int rx_delay)
> > > +{
> > > +	bool mac_rxid = rx_delay != 0;
> > > +	bool mac_txid = tx_delay != 0;
> > > +	unsigned int rx_config = 0;
> > > +	unsigned int tx_config = 0;
> > > +	int rx_code;
> > > +	int tx_code;
> > > +
> > > +	plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > > +								  mac_txid,
> > > +								  mac_rxid);
> > 
> > Maybe Andrew can confirm, but this function was to fix up existing
> > broken DT, and shouldn't be used by brand new drivers.
> 
> Hi Russell, thanks for pointing this out.
> 
> This function should not be used in this case. MAC drivers in general
> only add small delays, in order to do fine tuning. The PHY adds the
> 2ns delay. There are however some MACs who cannot disable their 2ns
> delay, or have historically been broken, and add 2ns delay. In such
> cases, the phy_interface passed to the PHY needs masking, to indicate
> the PHY should not add the 2ns delays. That is what this function
> does.
> 
> Please don't call it. Pass phy_interface as is to the PHY.
> 

Great, I will remove this call and pass the phy_interface.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
