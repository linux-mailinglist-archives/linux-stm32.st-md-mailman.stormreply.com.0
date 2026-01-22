Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BigEotvcWkPHAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 01:30:03 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFD15FF06
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 01:30:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 818BFC349C4;
	Thu, 22 Jan 2026 00:30:02 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5470C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 00:30:00 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-2b70abe3417so889714eec.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 16:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769041798; x=1769646598;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aLRvrHf0GT+SLm7VDguQ+pvYrJH4LqQuaP1lqxnXl2s=;
 b=PCh/+PAjnwFPskBOW9eoipMmuS6EOi5eUEULRuPPmGIGeQo41R9sbtJoYB5Yqv0C8g
 areowtki90IEnG2tU2ndh8ctS/55g/shJAevQPJ1s9JxlAzRc/ijqkLMQGev86SR0r7u
 w4uEiwPuKNKgchSGFrthJerMGHjzck1hfvzg4M2j73qwlNeMX/87+5iKXlIh+2/ibMPF
 eOebV5CBA81fU9oE9oCYIB8PLeNjvFUqqzdF2ej9NyqVr6GThnu54UQiaVB2Lxz6zx3b
 sHiZF9VuUHMC29HQkjvw0161HgR3CXf6cxyPbzziV0L7sis+giUv8EPchYww9roL6YTy
 hVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769041798; x=1769646598;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aLRvrHf0GT+SLm7VDguQ+pvYrJH4LqQuaP1lqxnXl2s=;
 b=j2Jf8z6eh+mjCQj1DH9wyQ2puxahzl68NQB0zELAYVcQBtUbjcEPt6hSFCmbQ+iZFr
 KDdnPqiQN2QyhsZBSAzc7knSGuHJ3fghLm6eJk1LB8EDWO/jHlw6geDNmBrFXpfN8tzr
 3nvz8bPzUZKz301gli3xEs5+gkGn7y9tgpneFLGv8zkinnu++dIghkJhrmNUnVdIeUdW
 d5ToAfPHYKL9xqY2jLdc81ETJIDnDktBrqE5rwLi4Tc5SxTNjAqMgFsMvfydl7ow8O+1
 lzxirLYdt9+k1YpFRFGG8R+XdLdwyQLnUEXXeaB6wKISfFppQxn6S4HyRq/ikaihYSfQ
 uBZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBqc7G/RZWX9iDyMhrCNyNpMYmuYCAyDtJPCTCCrlasEuZK5of61sggwwxLoUhV2yIOtkCUlemMG+ZpA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxxy23urAIrZxY/Jk/F+SxUATSGpS1a2DmGcjPHO3dU7IZ8q8Wm
 jFu7CCIOJXLE3iLxW2pC/IjJ4iSw6nV9hURT5dVgg6SSIONqtPMk01rj
X-Gm-Gg: AZuq6aJhDPNviDwuG1ICb29G4XWgwn/3Hd8KydtVJrtrVV3smzod8NoBqhgu3ElTOUw
 e9cQ38YtMbtX4/jPcNUr+atP7FFdOAEjcr7qf08v7RiaAcc+OvoxTe5+IWF9RNXX8d5SftYySvp
 uOm4oshKv5m9tIxepYTOzwLcKhnkcK/2XuOcXri80eUHMKPC0KNpaFrpWz+xqJaWXvv/O7ByDo4
 rgQuALTgV01wpjpO6XMcx+zEabdQPbG/HQdGMJjvZkgoTe0GVZj9iEBLTulsOrrn228n+WmiCmN
 aM9OS8kBVwMh+0NDu7Ca2xXWsNDHxiCsLPPgUIQPueR5a/PtgBCSL703fBVPmnGXgIlrGuheGzy
 8QjBnAeyeXc2zOiokWa4LjAuUzs2wOjJRV9yHB9dVyvBiKut8A/b1esRJdsEyEjJWWLZqGYAx/v
 Wpk2VcV63ZMb050hB5AL4j
X-Received: by 2002:a05:7300:324b:b0:2b0:580b:856c with SMTP id
 5a478bee46e88-2b6b41005a9mr13294371eec.28.1769041796817; 
 Wed, 21 Jan 2026 16:29:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1244ac6c2besm29548495c88.5.2026.01.21.16.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 16:29:56 -0800 (PST)
Date: Thu, 22 Jan 2026 08:29:46 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Inochi Amaoto <inochiama@gmail.com>
Message-ID: <aXFvWzw1BlooyG7s@inochi.infowork>
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
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:inochiama@gmail.com,m:vladimir.oltean@nxp.com,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:jernej.skrabec@gmail.com,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:quentin.schulz@cherry.de,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:ziyao@disroot.org,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:yong.liang.choong@linux.intel.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:
 jernejskrabec@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[armlinux.org.uk,gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
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
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DFFD15FF06
X-Rspamd-Action: no action

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
> 
> > +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> > +	if (IS_ERR(plat_dat->clk_tx_i))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> > +				     "failed to get tx clock\n");
> 
> As stated on the previous series, please don't abuse clk_tx_i for
> soemthing that isn't the dwmac's clk_tx_i signal.
> 

I have seen this comments, I will switch to a local variable in the
next version

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
