Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F4059D3BE9E
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 06:05:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2578C36B3C;
	Tue, 20 Jan 2026 05:05:51 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23D26C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 05:05:51 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-1233b172f02so6114996c88.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 21:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768885549; x=1769490349;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gFedj4f11o/3T9vWUp8OttHw6rjgwlEi4dqKoM80zmU=;
 b=i6kDfxk2TDIFrwq/iDWTvIanB3/DEesd/w89iapiIzHDf9OPmEiUeHv3G9wPGEsbmg
 MPOuWsbz1QUIiIsASM05pOYNwFzl7b6flxgiHw/xSGSRV4gGMF8ZoJvWF66CPy4nb7nF
 0/kvSlmcV0VNR4yLnbmbenGyKk5fbhI2jG38A9Rx205/hhwMwi88b9tA2NOCGQEPxpDB
 6Ep3dlng+XUqlzPjckDbVYirqV6wDJkjd10lPVO3W+Tm2whL8TO1GoJ0kYrOyNfvAR63
 qe72h28HQHdJIPGJ4jvcShD1eU0B3BLZ4vJ0DSJayczmqJDDJQdjuuwt1Ao49Y23aqWi
 5FiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768885549; x=1769490349;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gFedj4f11o/3T9vWUp8OttHw6rjgwlEi4dqKoM80zmU=;
 b=lFXKGjdo49JfaSXnndhT8jEf7vgvJwZHHA4ruz9HSeJdWM/UUtJg4UlfpgWQpGGv6K
 IWzm5+gy4x51MDJ0CSr8SALKNS+KoOtrxH2CH5g5Zxxipf8OcQAEPQDkdm4K1epgEv11
 Ce68FpEo88C6Uxv1FX930nwSwGnFln84jIzStjZK+2Wkiu+f5UlwLCeq0XNwbilFIQkU
 eF6Hea0aiy+SDQ99aqdKRr0SAGY6HlJIuvhnSqEjBgxU8F/XE22+0qWbrHzh63qyyBP8
 /Lgg+tNDRBDJijTmzQtdQLe2tPOxW+BtXGtixPSbSAby1+GBScZsspxTK3SJ0ofgmR/M
 8TwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0lIDCy6nd4awWoPg8VRIdPRJvdEHcxD4o5Q8daPid+cLqE6cE14ayt/fXtXtIIEerpxEw/G4g7mws4g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxltrDOWkqZvMj7kFoVxA2joXLRduibVWIQqO+BwITMPXeoM8gV
 X1t4Xex1lZ8hgbjXmES8pmynOnRjwMkbNCYm91SPMIoSzg4y0JWRANPK
X-Gm-Gg: AY/fxX5QUwFTYbkJex5YohjjEUIDg1UHJB+/9PZyyfXO5Kvm2Vbeb/WsuqfQyXD7mpV
 h4rcNanY4BOe3HT+VYg/cxPis/xyJffwET4CrkTTPKGyW+AuYhBBnQm2woKDyp8hsxttpWpPeOF
 TotyUyjGrvA/zxJfkbYdavm+Kli4m+nsYWkj6H5p/oXZVa6nJmWyTmEAXzu8zgyMYI4dA1eyCnr
 aoONaEz6nPKiJBFwHrInXzj9O/O8hQJtJ/iDsiVLY4I6WLjTS7/cyWZGi19WF1FURRbN4ZocbXR
 Aquoel7Q0/0vk3boK2uMouPUDWV/npMThfgKow+mBSnd7tN+8hZ/fuHt2zShTfQSgNPtfSwtbHQ
 9oDlAlLT8grFRnWPSSsaEjS8safpO5ZuowgSvMVQK5HL5eNvq6mKj3oHx2VClxFmsKsXkKQHrsl
 yQokNWRIGqsbqhAyj5L+XV
X-Received: by 2002:a05:7022:672a:b0:119:e56b:98bf with SMTP id
 a92af1059eb24-1246aac3151mr600082c88.38.1768885549389; 
 Mon, 19 Jan 2026 21:05:49 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1244af10736sm19178432c88.14.2026.01.19.21.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 21:05:48 -0800 (PST)
Date: Tue, 20 Jan 2026 13:05:39 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Inochi Amaoto <inochiama@gmail.com>
Message-ID: <aW8MJpERR3TmsiKg@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW8LAFhCRWlMVemz@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aW8LAFhCRWlMVemz@shell.armlinux.org.uk>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
 Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>,
 Jose Abreu <joabreu@synopsys.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Yao Zi <ziyao@disroot.org>,
 Richard Cochran <richardcochran@gmail.com>,
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
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Add glue layer
 for Spacemit K3 SoC
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

On Tue, Jan 20, 2026 at 04:56:32AM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 20, 2026 at 12:36:08PM +0800, Inochi Amaoto wrote:
> > Adds Spacemit dwmac driver support on the Spacemit K3 SoC.
> 
> Some more information would be useful. E.g. describing why you need to
> fix the RGMII mode.
> 

OK. I will add this.

> > +/* ctrl register bits */
> > +#define PHY_INTF_RGMII			BIT(3)
> > +#define PHY_INTF_MII			BIT(4)
> > +
> > +#define WAKE_IRQ_EN			BIT(9)
> > +#define PHY_IRQ_EN			BIT(12)
> > +
> > +/* dline register bits */
> > +#define RGMII_RX_DLINE_EN		BIT(0)
> > +#define RGMII_RX_DLINE_STEP		GENMASK(5, 4)
> > +#define RGMII_RX_DLINE_CODE		GENMASK(15, 8)
> > +#define RGMII_TX_DLINE_EN		BIT(16)
> > +#define RGMII_TX_DLINE_STEP		GENMASK(21, 20)
> > +#define RGMII_TX_DLINE_CODE		GENMASK(31, 24)
> > +
> > +#define MAX_DLINE_DELAY_CODE		0xff
> > +
> > +struct spacemit_dwmac {
> > +	struct device *dev;
> > +	struct clk *tx;
> > +};
> 
> This structure seems unused.
> 

Yeah, I forgot this, will remove in the next version.

> > +
> > +/* Note: the delay step value is at 0.1ps */
> > +static const unsigned int k3_delay_step_10x[4] = {
> > +	367, 493, 559, 685
> > +};
> > +
> > +static int spacemit_dwmac_set_delay(struct regmap *apmu,
> > +				    unsigned int dline_offset,
> > +				    unsigned int tx_code, unsigned int tx_config,
> > +				    unsigned int rx_code, unsigned int rx_config)
> > +{
> > +	unsigned int mask, val;
> > +
> > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > +	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config) |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, rx_config) |
> > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> 
> These FIELD_PREP() fields look wrong. Did you mean to use DLINE_CODE
> both tx_config and tx_code, and did you mean to use TX_DLINE_CODE for
> rx_config ?
> 

This should be RGMII_TX_DLINE_CODE. This is a copy paste error, I
will fix it.

> > +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> > +	if (IS_ERR(plat_dat->clk_tx_i))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> > +				     "failed to get tx clock\n");
> 
> You set plat_dat->clk_tx_i, but you don't point
> plat_dat->set_clk_tx_rate at anything, which means the stmmac core
> does nothing with this.
> 

Yes, the vendor told me that the internal tx clock rate will be auto
changed when the speed rate is changed. So no software interaction
is needed.

> Given the last two points, has RGMII mode been tested on this
> hardware?
> 

In fact I only tested the rgmii-id, which does not change the internal
id. I will try the rgmii mode.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
