Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDdWDc1ncWmaGgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 00:57:01 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3AC5FBAD
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 00:57:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75815C35E3C;
	Wed, 21 Jan 2026 23:57:00 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF5A7C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 23:56:58 +0000 (UTC)
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-12448c4d404so445512c88.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 15:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769039817; x=1769644617;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jp0I2O5rvzmCmzT9e9dhaVxnINQFtm8fPyCPAakfKbA=;
 b=nhox8ZGwFw7rQjSMdE5igpQEooEmGPg68TcxdQ3nEYYNb7FW7J4Y+ChbwdVsuhMAVn
 0rxJNEX5LETkA+T0Z0OuhyFnC/nn6v1PbVRDv7+jSsR4M/uFgVcqjr/Lu08TcyNtVmHT
 jMmUL+anOLK4JbUL6O6OP7w1apdZSFYt9OwoDwx2zQrCsKAjIv7J9bz5oreU7VbEaaAd
 6oMixi55UVpL5jr/FuAjo1aRwwZwOF5yfJ4FD02grrEnG2vpVtwY5PigMrrCWMVUU278
 Z1PVmwnltnFbpbtX0/sR3i3axPMH074J9BYP8DWf5Le08UdHk5jphn/8OmAM2WdaUXUu
 yv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769039817; x=1769644617;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jp0I2O5rvzmCmzT9e9dhaVxnINQFtm8fPyCPAakfKbA=;
 b=qcPXh4zly+jPa67PLaULMkEoG7V8VhnnnL1vLVexhtCNvVyCvGYG/nKlvq3X6cvas5
 RaUB2FBZnC3yWBNUrx/WSqgHAkiWYjtswqk4CuJ1SgWc87JEcksRx82XKGkdT8+LEb1v
 2KrwsVWULvQM8sx7TYfGdyX9qLm07oKkwe6+daIM9Xjo1S3lau17f24wLSScWAHP39NC
 4NUM678t8y4fQhninskRQwhD05pIsf/mc8QiFkfp7/DkxPgxkYtpjg7BZBLaczNWR1cQ
 HYpcWzyC6ujCLhLVzkJ/jVn7pBiwFaAogeHTKwg7wWSGpwz4H0v9d4o+UkpRS68twhuq
 l77A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmgjRSb7zY2+JmHNZmUSGnjW5CPteJvRFYPLGNRrTQB/S8zTpGhj39JXS5zmGGkL+5op6HFSSS3Fo3vA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YylYCvtCiuaiKjbIBfrBr3XZceRpBHRCl7MeUyyE/JIt5Ube5YC
 ztMC52HvTXXAGkVmKqxxMXid/CREoYlONDSuLgAul7TV3jYixKe2HsI3
X-Gm-Gg: AZuq6aKdVVm77rKiTCNb69viNuRdPJ16Qax07ZHPwecokvvfIZbl8Kzsc4EcWfUMyvs
 BG4FwB0YqFl+FeXCWN5A/JjOOVBVUX3b/3qlyU2MfZmhaxjLIOa6SXOkl7EWgvtcsgVhV2hGgFK
 tyRVHjbJ73n1a82E+IEH01L2itSC7S+nMnLk4/E1F8D0CtIkGL3O1LvHzaxAK93uXZ6e7WBq8g0
 t1AUjqPSOeNcJZeH+yNFSv4z8kLPEPWQ8U+obI85MFoJGQkoQFPY/0P31i3UAXc6a0uPPZv4Awo
 ulNtC+tuXaWmdOwhsJIMU7DafcBkC6HTD0HfgCcUu7pudqytJve846U4S/YgyzJENI9dR4daqf7
 jtcSRWlaKokSTQxKUuZMPW4O41+U4EzsxhZ7NLcWqHDAhqzJrznZNvI7cosYgYTOgSiITxwZjCM
 MYvRdu3ubEqA==
X-Received: by 2002:a05:7022:4389:b0:122:33e:6d41 with SMTP id
 a92af1059eb24-1246aaac67cmr4335389c88.23.1769039816566; 
 Wed, 21 Jan 2026 15:56:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1244ac5842csm27914226c88.1.2026.01.21.15.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 15:56:56 -0800 (PST)
Date: Thu, 22 Jan 2026 07:56:45 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Inochi Amaoto <inochiama@gmail.com>
Message-ID: <aXFnmXIwSdKCS9Uc@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW8LAFhCRWlMVemz@shell.armlinux.org.uk>
 <aW8MJpERR3TmsiKg@inochi.infowork>
 <aXDAmDEpUArE1_en@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXDAmDEpUArE1_en@shell.armlinux.org.uk>
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
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:inochiama@gmail.com,m:vladimir.oltean@nxp.com,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:quentin.schulz@cherry.de,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:ziyao@disroot.org,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:yong.liang.choong@linux.intel.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:conor@kernel.org,m:krzk@ker
 nel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[armlinux.org.uk,gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
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
X-Rspamd-Queue-Id: BF3AC5FBAD
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 12:03:36PM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 20, 2026 at 01:05:39PM +0800, Inochi Amaoto wrote:
> > > > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > > > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > > > +	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config) |
> > > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, rx_config) |
> > > > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> > > 
> > > These FIELD_PREP() fields look wrong. Did you mean to use DLINE_CODE
> > > both tx_config and tx_code, and did you mean to use TX_DLINE_CODE for
> > > rx_config ?
> > > 
> > 
> > This should be RGMII_TX_DLINE_CODE. This is a copy paste error, I
> > will fix it.
> 
> Are you sure?
> 
> In that case, please change this to:
> 
> 	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config | tx_code |
> 					      rx_config | rx_code) |
> 	      RGMII_TX_DLINE_EN | RGMII_RX_DLINE_EN;
> 
> If that isn't what you meant, then your reply is wrong, and it seems
> you're confused, which makes me then question how reliable your
> replies are.
> 

That's wrong, I think I have reply it in a wrong way, it should be

RGMII_TX_DLINE_STEP -> tx_config
RGMII_TX_DLINE_CODE -> tx_code
RGMII_RX_DLINE_STEP -> rx_config
RGMII_RX_DLINE_CODE -> rx_code

The RGMII_[RX|TX]_DLINE_STEP register selects which step is used for
rx/tx delay. The RGMII_[RX|TX]_DLINE_CODE register provides the factor
used for calculating the delay. These register are computed in the
spacemit_dwmac_detected_delay_value(). And finally we can got a delay
with "code * step / 10 * 0.9" for both rx and tx.

> > > > +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> > > > +	if (IS_ERR(plat_dat->clk_tx_i))
> > > > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> > > > +				     "failed to get tx clock\n");
> > > 
> > > You set plat_dat->clk_tx_i, but you don't point
> > > plat_dat->set_clk_tx_rate at anything, which means the stmmac core
> > > does nothing with this.
> > > 
> > 
> > Yes, the vendor told me that the internal tx clock rate will be auto
> > changed when the speed rate is changed. So no software interaction
> > is needed.
> 
> Please do not assign a clock to clk_tx_i that is not the dwmac
> clk_tx_i input. clk_tx_i is a name used by the Synopsys DWMAC for a
> specific clock.
> 
> As you don't need to do anything with it other than to get and enable
> it, consider using just a local variable here.
> 

OK, I will use a local variable here.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
