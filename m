Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDhzLtKtb2nxEwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 17:31:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7847937
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 17:31:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9E73C56612;
	Tue, 20 Jan 2026 11:43:49 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D903C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 11:43:48 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-2b6a93d15ddso5084913eec.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 03:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768909427; x=1769514227;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KEeKRKNgnXmWzaKf1C0tW6uj5QVjxVimCmm99Tj3C3c=;
 b=d3U0ygGtF8lRfWffofh3B5jf4vMuWh0ANcKs7GkemUXiW+/ECyvB+Xl5oRU/Ej8kCu
 6l4eJxXKKJFL96sahjN6kzdawyErl7wOPNv8cdY2qPma3xG39FNKCI2CmoiTg3+blOLu
 2utYc7X2xJfSeVRGlfL9W0FKXwKAl2AWC32WqxHLBEZdTAbyO6MLq7jgodn+RrqPV/lP
 U7MIW6IYELi07AjEw9Ursg2/6R0rwxzn7+5+XqAVrmlwugaz78LB9PQChxHywOROgD0Y
 UWn9DfplRd12qO7exG3BvN3P1vBQ0Tz/x/oOL7FLH4bON67TuJ0+1eQsAaVjP+Hdcmko
 TVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768909427; x=1769514227;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEeKRKNgnXmWzaKf1C0tW6uj5QVjxVimCmm99Tj3C3c=;
 b=gnQKUcuLiI4MJ0cu6OlV1Xn4eT8Qv0uO+x5sZu42gKgwTmIaXqiuXCvHyb7YdTYGFN
 4miRAL8kURSSOmzD8ORl0XTrPzn8aahMnY3OGF/xQNjvl/nkYjGa33tqPcP9rSCl6NWx
 IGzo1zqVa9YoIjpD/TCOH6jv2XOfvdNTzDJ08Zo+AmhTssRYRr1k1Tjpb25NnLt/SRTH
 CJw9EiqMsOvl6NdYzVcCjEvuYVXvtWtK/kcu5awt+b3iKxz8WSP8vDO3MWC9NE6qw60E
 mjDXVeG8z2Ig4PMnUoMeEfgC+EPxpZsynnGQmXXJKJQjZMbVfA53F1EaacpbnNFYe4BE
 8hRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Tn8XKRVBCBTYlW8CRv33zSuignuoaAAAtkspPmJ55kUaIGP6J2nnN6LjqwHZnsC1Mr4wcl6ZGqIVjw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yziba94s9YlushCol50L2FCfnoBUM/ldwp2VvjO+Akss1acIoDL
 C7NR40U9skKhB2QaZv/s9fb/JPTttS1cSAXay6XjA185i//OwJYYRmOQ
X-Gm-Gg: AZuq6aIxUYkEaqERLLpQupy1rEeC48I63Hf1MJmkMbRYxw9n6y8s8TK8lOVMegnJq/7
 SfiVAnegVOIizrsecaEWMUjJwNWbrpyMbkQ2JlJ0yXpAy8HIzQkjmLO//rQMAdcGvG7G/D91guj
 bfK9mtBOFcUyeGYqlM71c1etEMqOnMOPg2ddOZhifQ3vcRNy1sAcy4KHuKse5iN5DqjYqjFurni
 7GXKdYIo0gkAwsN89nQVTlAxi5DdevNfGuJaDKf4HvQ1J4iUxoC2PAbUE6B9EVsQnWRCgAu7bP6
 iJsu+WIvL2kV8FgkvX5NheH2c61FaPmY9jJpx366MNMqjXZZJS7Xz2miprvJyWUTRbZHdZGEJjH
 MdSD8mqBxWyqa6g6XP8Aaz2E1wHJw4FJk8IbyKK4Ie/AbMzwzKoUtfBQG5yEAozeVsi6T1Ka/TJ
 vHY/tyhL6gFw==
X-Received: by 2002:a05:7301:2b05:b0:2b0:5929:4d1f with SMTP id
 5a478bee46e88-2b6fd7add4emr884545eec.33.1768909426655; 
 Tue, 20 Jan 2026 03:43:46 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6b34c11dasm18506224eec.2.2026.01.20.03.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 03:43:46 -0800 (PST)
Date: Tue, 20 Jan 2026 19:43:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Yao Zi <me@ziyao.cc>
Message-ID: <aW9p9By1ZW5i4iWw@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW9jbqBSgkiLLw8r@pie> <aW9m8YOVO1ClIQOd@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aW9m8YOVO1ClIQOd@shell.armlinux.org.uk>
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
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>, "David S. Miller" <davem@davemloft.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:me@ziyao.cc,m:vladimir.oltean@nxp.com,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:quentin.schulz@cherry.de,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:ziyao@disroot.org,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:yong.liang.choong@linux.intel.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:inochiama@gmail.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:conor@kernel.
 org,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,inochi.infowork:mid]
X-Rspamd-Queue-Id: 59A7847937
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 11:28:49AM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 20, 2026 at 11:13:50AM +0000, Yao Zi wrote:
> > On Tue, Jan 20, 2026 at 12:36:08PM +0800, Inochi Amaoto wrote:
> > > +static int spacemit_dwmac_probe(struct platform_device *pdev)
> > > +{
> > 
> > ...
> > 
> > > +	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps", &tx_delay);
> > > +	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps", &rx_delay);
> > 
> > According to of.h, of_property_read_u32, which in turn calls
> > of_property_read_u32_array, could fail with -ENODATA if there's no value
> > associated with the property. Should the case be handled?
> 
> You cut too much. This had:
> 
> 	unsigned int tx_delay = 0;
> 	unsigned int rx_delay = 0;
> 
> at the start of the function.
> 
> of_property_read_u32_array() says:
> 
>  * @out_values: pointer to return value, modified only if return value is 0.
> 
> and of_property_read_u32() passes &tx_delay or &rx_delay to this. Thus,
> if any error occurs, these will be zero. In other words, a missing
> property is equivalent to setting these to zero, which is entirely
> reasonable.
> 
> However, "unsigned int" _may_ be type equivalent to "u32", but really
> these should be "u32" if of_property_read_u32_array() is used.
> 

Good catch! I always treat "unsigned int" to "u32" implictly, I will 
change to u32 for as an precise type.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
