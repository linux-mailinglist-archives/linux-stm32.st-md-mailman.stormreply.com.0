Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PBvKQAucGniWwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 02:38:08 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 491804F2F2
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 02:38:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0606C3F944;
	Wed, 21 Jan 2026 01:38:07 +0000 (UTC)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C121C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 01:38:05 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-121bf277922so8486562c88.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 17:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768959484; x=1769564284;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=A5yAAJyzuotg25Ij3sl9iHvHzE6qHnmlHIRrb6J8qac=;
 b=ZVRmYC1yuzYS/hSNIyQCgj+rHbYiwqU8CI9lzMBG5zseXA6K2Vsc2fT4aAg2ojbONW
 D2DSzZz/TB6o9bU5BqguUKjxpE+eksfXcsWdt8TODd0dW6SQTP0bGRSPiWX5D0Kx5YCf
 PxY4aSPZP/HKbhVY1CuCi1q6yHYNFmhUezbWixA/q0YL3ADsD8Cyd/5iHrG4b5eJ8xKU
 NAFLYOErxWVNrMbn4xZKI8ooynhTxrKRMdmk0zDjCO2NHkb37yWOUyA6CVuLTgSMJAAv
 MXuqJwKRkQ7PWs+p/LjyVgG/yTpa5MWVTGOVpq83UKQoTSmD6GTM1DCcNAGu9P51v+mQ
 rjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768959484; x=1769564284;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A5yAAJyzuotg25Ij3sl9iHvHzE6qHnmlHIRrb6J8qac=;
 b=cLOmlhPOd3wmIYphOjk0K/5bs8bhFUK25fhOmMZAnat+692t2P8DX208bZunnF6Y/c
 HJ1D+Rhp6qof36OiCMv+OIZCubZ7gkCAiQ3bdfsISI7SyCTtIcMHU+AeRKp/IT2W+1j5
 +ejvs7asu1+ya/kj/g3/KzPTBzBCeh5zJOYytYOPb0pRL1W7FH94ZUZ7QQppO176plYd
 pgyU1K4oH0znOUdGw9qnrmE2J0hoDDtr0iz8hMAO6dkj9iF/+ukxt1otrE9VbAHcXgAE
 sbxU2I3RYgysYb6/rZyNk1eh2pgp1xOfZB7VFqZ6wbP0L3yz4K0PxoU2Dcd5yRqt+G24
 aFxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3VpiNe4XTUS63/Vjjl7UHmevg68bzwkNyCYworm8+hPsLAbRfEOSlsZs5oX9xv3ZS38ynnuK8hLMwDA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxnMXuHZwxXXv04fE2CeWbTgZT29eeNo4iskUzgLSrE1YkGCPWh
 BArT1Hkp+kVpII9JeHH2wrs0ybC2WeFSJQ/wCcL0qRClrF0MdzELDhiq
X-Gm-Gg: AZuq6aKr4AuJ60FIEjyreuRGfR3JQkTurxxjQm2PDfojMRwXgzGNCj2mgeelgd9KOje
 A54Ouw9+3Ot5FJK8p/2Ef+eomMmH+MyoBhM0ebxRd8mYF5tf7TT9uC5J/wQIbX/CPzpCCi10D6Y
 fi96PXvyUu960MVkXwQkdj+7CpTMYCPlPdmVSnWj/imftzk01TUP5HxiWuEtfxuxTxGa0Kd2uDf
 KioiTZKk8Nuy4bjzB7Zs5fEx6+MxZs7cfyQey/2h2IqbuYJr4hucAK9n2r3LC4e9A2JqbecK3W/
 lDDVPBrsRwS3e0CzMMZWdduK637RZRhXIY6H84v69CMNgoC5fh2Bc207FjZl/LCDa7x5jT+vmEp
 fSPwLzasVaiGFHTcj0MgjLDY0I+zLYnWo+bXubDJVnxiR7PKW7UK+JtIE8RtlaXm+YWFskdVCAj
 F5KJtLlhz/LQ==
X-Received: by 2002:a05:7301:2b84:b0:2b7:f12:9503 with SMTP id
 5a478bee46e88-2b70f1295ccmr1043461eec.30.1768959484158; 
 Tue, 20 Jan 2026 17:38:04 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b7047b099bsm3361798eec.31.2026.01.20.17.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 17:38:03 -0800 (PST)
Date: Wed, 21 Jan 2026 09:37:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <aXAtMZJorEBiK2R-@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <f8e4c5ec-94b1-4da0-8a40-976770514828@lunn.ch>
 <aXACRN7BaumIySp3@inochi.infowork>
 <cd5c882e-1632-4623-92d3-8a433c8ccdbb@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd5c882e-1632-4623-92d3-8a433c8ccdbb@lunn.ch>
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
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:inochiama@gmail.com,m:vladimir.oltean@nxp.com,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:quentin.schulz@cherry.de,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:ziyao@disroot.org,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:rmk+kernel@armlinux.org.uk,m:yong.liang.choong@linux.intel.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:conor
 @kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,cqsoftware.com.cn,synopsys.com,cherry.de,redhat.com,vger.kernel.org,eecs.berkeley.edu,disroot.org,bp.renesas.com,armlinux.org.uk,linux.intel.com,st.com,lists.linux.dev,gentoo.org,lunn.ch,dabbelt.com,altera.com,davemloft.net];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,inochi.infowork:mid]
X-Rspamd-Queue-Id: 491804F2F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 02:29:23AM +0100, Andrew Lunn wrote:
> On Wed, Jan 21, 2026 at 06:36:01AM +0800, Inochi Amaoto wrote:
> > On Tue, Jan 20, 2026 at 02:56:26PM +0100, Andrew Lunn wrote:
> > > > +/* Note: the delay step value is at 0.1ps */
> > > > +static const unsigned int k3_delay_step_10x[4] = {
> > > > +	367, 493, 559, 685
> > > > +};
> > > 
> > > Am i reading it correctly that RGMII delays are limited to these four
> > > values?
> > > 
> > > If so, please add this list to the DT binding.
> > > 
> > 
> > No, these value are just adjustment interval, and it is also
> > controlled by another code register, the final delay is calculated
> > by the following formula:
> > 
> > delay = delay_step * delay_code * 0.9;
> > 
> > So the delay configuration needs to be calculated instead of
> > directly assigned.
> 
> O.K.
> 
> So what is the actual range? Can is do 1000ps? 2000ps? 3000ps? Should
> there be a basic range check to avoid dumb typos?

It can have a pretty big ranges, and I was told the total delay is fine
to work between [1200, 2800]. I guess it is fine for us to check the
upper limit?

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
