Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GGQO6BJr2krTgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 23:28:49 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F18224238F
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 23:28:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E8FEC8F280;
	Mon,  9 Mar 2026 22:28:48 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C22EC0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 22:28:46 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-899fa9610bbso136604896d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773095325; x=1773700125;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uelqhot/SS82mnivEOGwZ5YeQ/ZVb2Ub9laQIz/Sv+M=;
 b=GtfilOYbc6gpSO+EreN5AACCnuNAN4KIlZv4DQlh/kJOH7TC6ldsMeBemlFICVY/um
 dddTp9E/vh0RPIk24EEP67P5FYJdJoOtJC8XNWQz4WPPCi9+LAC+wHwSjysbW6wMwXpz
 xoivAhKjJZjg4yDRj9/zIaxuW1cDoDkxkm/1kOA4kDaXWKDc9/VVbnYqAd0mnHcLWMOd
 aPnBceyDVtv1PtWOajP1QYa31Hj97U9341ONGl9klrDBzICYlRKgGSSHXtK3OUSfzmEO
 47CFB5KWklAuiLfJ0GSn5IhPpOIICrqGDWDAw4Sh5h2CpXWV2WP7IxkI6oJv2LPmNVC1
 /LHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773095325; x=1773700125;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uelqhot/SS82mnivEOGwZ5YeQ/ZVb2Ub9laQIz/Sv+M=;
 b=R0rB88VS/a77JVbFPeD9osOapM8NZjPLisXbOIlGbJD9+Bdj1YNMQCpAF5kQYyOUOI
 0kXdzZsi2l6Q00v42KE80Y1dfK43JV9odxuZAP827E26YWcWy7wUqzlYqCPLZuCUEWGh
 0cdYRYBMM3tcqLYSet4YfC3JQWxRvT6sAsfzEGfTAteGQxC9YAfg7zSjBUiGcBHPcZiX
 SB4JPpTNfiq/DFsXtZZvZoJsq/kBgFrfT7/QTzN8/Aywea2pOJ530xaBMmvjFgSHmEFC
 hZowC2TH5aM3WjyN/f/DhpbuBW3QQvaGfzXN0YpTjrh7JfKKA8JEusKQDJP5mSKz+YlB
 Hiww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsCgpBaWMFVOIVZOIzW1F97L4nHVNQYr+IEjn2pOGsG4DWwPt5neUMjveIsT9TvVWNZTedWKZCuChAxQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzOSgH6DExz5OfcMrBejsZeHoNPEIi7gml0keN8M/AQzyNaEtrk
 rLeN29SOwAlpd43E1D3H49HsRTkDBrC570D6EC/ltNEG6cVElnzgQRoH
X-Gm-Gg: ATEYQzzVy3CwSIMrsoiL+4aHpgRO9v8yM+uI350BBSdohwLbDDLQC+MoKPFN1gdfmZp
 Gsp5AWvTeZOcwYe6QypEFDjKyYI0aegZeL2e+2IZ50Y5Qj9I2VADM5F+qNvWQ4JOHcxPOLs2rJ+
 1LSqmZ3Cgsga5P9/qaEjfJmO5X4RScFE998fDgjyVlo+omQdaGZBr5BMev8qrhDZft6zRMddNB9
 ZaJ/eHAbh27O5RNybrn58AccOhbrgcc+WYOfBl3qaFkGhcC/9GZeL1OJMkeqT2czGYB/KKibAxX
 gpysaZ+nc1yyflR4J9dgMVT7XIyjOth0XUWChLYf9/PG/X5pb6vbkwF8rWVl13d9GFwcAe6X1Wt
 qY7oScwDbKueJSu1KAp2Ko+2LVN9MxbGg0MfYskEWNDEHHmg4rYatJMVhVK+1mmnHRFEo9vRXZI
 mnZVQUy+QtSWTwqmYGXcakHjM=
X-Received: by 2002:a05:6214:e4c:b0:897:255:d5c2 with SMTP id
 6a1803df08f44-89a30a4d3cdmr192944066d6.26.1773095325119; 
 Mon, 09 Mar 2026 15:28:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a57a1e68esm6918006d6.2.2026.03.09.15.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 15:28:44 -0700 (PDT)
Date: Tue, 10 Mar 2026 06:28:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Inochi Amaoto <inochiama@gmail.com>
Message-ID: <aa9JCWpJ_EJbUzXV@inochi.infowork>
References: <20260309004305.315018-1-inochiama@gmail.com>
 <20260309004305.315018-4-inochiama@gmail.com>
 <aa61v7MQoYq10Jes@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa61v7MQoYq10Jes@shell.armlinux.org.uk>
Cc: Yao Zi <me@ziyao.cc>, Longbin Li <looong.bin@gmail.com>,
 Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>,
 Jose Abreu <joabreu@synopsys.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Yixun Lan <dlan@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v8 3/3] net: stmmac: Add glue
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
X-Rspamd-Queue-Id: 8F18224238F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:inochiama@gmail.com,m:me@ziyao.cc,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:vladimir.oltean@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:richardcochran@gmail.com,m:dlan@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:quentin.schulz@cherry.de,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,m:andrew@lunn.ch
 ,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[armlinux.org.uk,gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.973];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,gmail.com,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,cqsoftware.com.cn,synopsys.com,nxp.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,bp.renesas.com,st.com,lists.linux.dev,gentoo.org,cherry.de,lunn.ch,dabbelt.com,altera.com,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,inochi.infowork:mid,stormreply.com:url,stormreply.com:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:57:51AM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 09, 2026 at 08:42:44AM +0800, Inochi Amaoto wrote:
> > +static int spacemit_dwmac_update_irq_config(struct spacmit_dwmac *dwmac,
> > +					    struct stmmac_resources *stmmac_res)
> > +{
> > +	unsigned int mask = CTRL_WAKE_IRQ_EN;
> > +	unsigned int val = stmmac_res->wol_irq >= 0 ? CTRL_WAKE_IRQ_EN : 0;
> 
> This looks like the last thing I can spot that needs to be addressed.
> netdev wants to see "reverse christmas tree" local variable
> declarations.
> 
> Please reverse the order of these two declarations to achieve that.
> 
> With that fixed:
> 
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks!
> 

Great, after some lookup, I find the variables in function 
spacemit_set_phy_intf_sel() are also needed to reversed.
I will also fix this in the next version.

Regards,
Inochi

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
