Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD09NtzGgml9awMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 05:11:08 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71844E17F1
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 05:11:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 007E8C87EC6;
	Wed,  4 Feb 2026 04:11:08 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FAB2C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 04:11:06 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-8c531473fdcso831847685a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Feb 2026 20:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770178265; x=1770783065;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rs6BBarzwmD2Zm1TSaGTp7E5XeDaUo3g+3j+s/whg7M=;
 b=nlHNQPKgoLtUpsRFk75GXQkcUapK3L48jtXpfNjgKX5OKNtbiQBrI4CgoODmfJkBiK
 g+xbhl2TmYE0iztc8SqeIaVmpwrYYP13YEXnsb+YHDsNstqFJVs6EEEyky/TtmNd+DAa
 HfAUnGv7VUVdJtNrdUTQyBcINnV+q4wtG/nD32WAGUHQMLSy3HqPQCdKNvP5BnImF7DI
 Ydsjv19iova0vYBpxkXFXlpCYWuUKY0uFCM7FUwpDnRKUo0tmGyJlpT6f1AkAEcC3b79
 MPxm3lXtkt8Y/pnNOqklEZjWngBuyhWF9bqVzpL3OXBcK/BsTf+jAXRO/1SAytIA1Hzd
 n6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770178265; x=1770783065;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rs6BBarzwmD2Zm1TSaGTp7E5XeDaUo3g+3j+s/whg7M=;
 b=M3xNnpt9J0CekxQy2+aEWtJR2PL+V0WyejUIraFejHfttMTEa+E88JFWbFgx2yTZvD
 PtKB+ZM3AvfPzHGV6sapgJVWhAXn7S+pad6/zo3vS3mGIt81ACxc8WF//+KvipRS9Ral
 6vNSqv8BQ+DMCSRLE6e1dacM5HPc8Fy+BnfzKy6zaexyOcCijwbfvqPAoeefpDVJz0ZT
 B6POtby96CScx6BuiPyFWIDtffSAVH5FF0dza1auXO5pWLwVDXF2Gzgb3+UGggC8v0yC
 yl/zz7MIDjB4fnQX2fZ8KdDXifRKM9UCYzxqYd/7gEROpOh7Wu4Aermcj4dNlQelYMzm
 9k4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa+MNTkY2GEeKSOXNTgGFeHX8qZVzEdmIORyART53W/hKv1QklEkXKsP6Ld3xCMw2OSR+2yiw1eFQprg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyVOMV2Hbys2ZiZqSu7DtdvanVkNHEN7k5egpB3Sy0PAYPwDvz9
 jzJ4WILsI6/rV0btlEDGKhQ+PzMr+XEf876EOw5LYlSTBVFLsIFdxYUH
X-Gm-Gg: AZuq6aKcCrlDdNXoOJdQkMK/kS6HCqXU/7JcwlUpfv+LN18Ltbcs9qK+3dJGPGLl/X/
 Fs4q7/Fqo2m/RyPMflfHWR9Napnr2fOHl59vqNIZd7FWct7/151CkZKWrsBkFvQXBdf8JVZEsPl
 rjbeCiEtWhXgRAuSzmOywHVcyzMRQSFxfeFj6pUI99KiwR7W9HP4ego7ymokrgIQ6Sg3eTCThn4
 O+PVBI4HiXpy67dywBE9+kCT4JeNe/1McMbMcy/CUWsssL9W08nDSNYI+ZJwgKUhtCR5z9jVd0t
 zOGsB0obP1oevs5OKyh2VoI6aiMyM8nGOm0F47TSlTp8IWzbC3j9bPDM4KJumCYnF7cgZPaqsJV
 TphZCJNii/2UWg08L8Z2feyoRCoGDMr3E6osM95gLrXWNdF0uZrtn3+Tbw8RyFuUhO5FpFPfqw1
 hhY3alDmboFA==
X-Received: by 2002:a05:7022:f103:b0:119:e56b:91f2 with SMTP id
 a92af1059eb24-126f47daa76mr613066c88.35.1770171313127; 
 Tue, 03 Feb 2026 18:15:13 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b832feacc6sm940814eec.35.2026.02.03.18.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 18:15:12 -0800 (PST)
Date: Wed, 4 Feb 2026 10:14:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Inochi Amaoto <inochiama@gmail.com>
Message-ID: <aYKq4qlgCDo42rnw@inochi.infowork>
References: <20260130022705.1059214-1-inochiama@gmail.com>
 <20260130022705.1059214-4-inochiama@gmail.com>
 <aYI00Exytbgbnuzp@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYI00Exytbgbnuzp@shell.armlinux.org.uk>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Longbin Li <looong.bin@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Yao Zi <ziyao@disroot.org>, Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, Zhi Li <lizhi2@eswincomputing.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v4 3/3] net: stmmac: Add glue
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:inochiama@gmail.com,m:quentin.schulz@cherry.de,m:looong.bin@gmail.com,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:ziyao@disroot.org,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:lizhi2@eswincomputing.com,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquel
 instm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[armlinux.org.uk,gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[cherry.de,gmail.com,vger.kernel.org,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,cqsoftware.com.cn,synopsys.com,redhat.com,eecs.berkeley.edu,disroot.org,bp.renesas.com,st.com,lists.linux.dev,gentoo.org,lunn.ch,dabbelt.com,altera.com,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[inochi.infowork:mid,armlinux.org.uk:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 71844E17F1
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 05:48:00PM +0000, Russell King (Oracle) wrote:
> On Fri, Jan 30, 2026 at 10:27:04AM +0800, Inochi Amaoto wrote:
> > +/* ctrl register bits */
> > +#define CTRL_PHY_INTF_RGMII		BIT(3)
> > +#define CTRL_PHY_INTF_MII		BIT(4)
> > +#define CTRL_WAKE_IRQ_EN		BIT(9)
> > +#define CTRL_PHY_IRQ_EN			BIT(12)
> 
> Thanks for updating these.
> 
> > +static int spacemit_dwmac_update_ifconfig(struct plat_stmmacenet_data *plat_dat,
> > +					  struct stmmac_resources *stmmac_res,
> > +					  struct regmap *apmu,
> > +					  unsigned int ctrl_offset)
> > +{
> > +	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII | CTRL_WAKE_IRQ_EN;
> > +	unsigned int val = 0;
> > +
> > +	switch (plat_dat->phy_interface) {
> > +	case PHY_INTERFACE_MODE_MII:
> > +		val = CTRL_PHY_INTF_MII;
> > +		break;
> > +
> > +	case PHY_INTERFACE_MODE_RMII:
> > +		break;
> > +
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		val = CTRL_PHY_INTF_RGMII;
> > +		break;
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (stmmac_res->wol_irq >= 0)
> > +		val |= CTRL_WAKE_IRQ_EN;
> > +
> > +	return regmap_update_bits(apmu, ctrl_offset, mask, val);
> 
> I would suggest that this is split into two parts - first, this is
> renamed and reduced to just controlling CTRL_WAKE_IRQ_EN.
> 
> Next, a function hooked into plat_dat->set_phy_intf_sel which sets
> the CTRL_PHY_INTF_RGMII and CTRL_PHY_INTF_MII bits as appropriate.
> Note that this function is passed the dwmac's own phy_intf_sel
> value from common.h which will be PHY_INTF_SEL_GMII_MII,
> PHY_INTF_SEL_RGMII or PHY_INTF_SEL_RMII for you.
> 
> It would also be good to have plat_dat->get_interfaces populated
> using phy_interface_set_rgmii(), and __set_bit(PHY_INTERFACE_MODE_MII)
> and __set_bit(PHY_INTERFACE_MODE_RMII) to indicate to phylink which
> interface modes are permissable.
> 
> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

Thanks for your detailed guide, I will try to switch to these helper
apis in the next version.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
