Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ4aJ494s2nDWwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 03:38:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3391127CD59
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 03:38:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E530AC8F29C;
	Fri, 13 Mar 2026 02:38:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7A1AC8F29B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 02:38:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0B8B2409CF;
 Fri, 13 Mar 2026 02:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268FAC116C6;
 Fri, 13 Mar 2026 02:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773369483;
 bh=cXgUEDCxpb0VJM5NocwDb3y+egwZEcpfq0JderV9xYo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HZmGErkudO/UsvBnemx/cgWFLZAevqTXjslEtTDHabT3yxPJIFMTX6Q7ygD4VcNO9
 d4ZrG9RBHupYbJglUOLEKhH2YmSgDCHSN2QxcrTxkBrQtKlHbhRQScs+xcc4HNr1O2
 vFJOmjJnM5rvMY6e8TZt1hNTI4L3NKSELZNOW8mYvwSkU0Aeaz3X3qWVskEfm1g34d
 9b+hsVvMuRKOnBDLs0BqDCDLy9059cwWrfQQ+eHylhVGC1K5uzQo76MwefIGxnnJkK
 D1YY8jw3tzyoHrpIBmdtMloiXb1A+qepUI/C4U8QK4TVdj0CQnqkfoOboUxvVi6aJ+
 byWPAXlZ+c2QQ==
Date: Thu, 12 Mar 2026 19:38:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <20260312193801.61c30de4@kernel.org>
In-Reply-To: <20260312012232.373713-4-inochiama@gmail.com>
References: <20260312012232.373713-1-inochiama@gmail.com>
 <20260312012232.373713-4-inochiama@gmail.com>
MIME-Version: 1.0
Cc: Yao Zi <me@ziyao.cc>, Longbin Li <looong.bin@gmail.com>,
 Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>,
 Jose Abreu <joabreu@synopsys.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Yixun Lan <dlan@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v9 3/4] net: stmmac: Add glue
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:inochiama@gmail.com,m:me@ziyao.cc,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:vladimir.oltean@nxp.com,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:richardcochran@gmail.com,m:dlan@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:rmk+kernel@armlinux.org.uk,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:quentin.schulz@cherry.de,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andre
 w@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,gmail.com,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,cqsoftware.com.cn,synopsys.com,nxp.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,bp.renesas.com,armlinux.org.uk,st.com,lists.linux.dev,gentoo.org,cherry.de,lunn.ch,dabbelt.com,altera.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 3391127CD59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some nit picks only to be addressed in case the AI complaint on patch 1
is legit..

On Thu, 12 Mar 2026 09:22:25 +0800 Inochi Amaoto wrote:
> +config DWMAC_SPACEMIT
> +	tristate "Spacemit dwmac support"
> +	depends on OF && (ARCH_SPACEMIT || COMPILE_TEST)
> +	select MFD_SYSCON
> +	default m if ARCH_SPACEMIT

I know other STMMAC sub-drivers do it but isn't the defconfig for 
the platform the right place to add this sort of default?

> +	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
> +						    "spacemit,apmu", 2,
> +						    offset);
> +	if (IS_ERR(apmu))
> +		return dev_err_probe(dev, PTR_ERR(apmu),
> +				"Failed to get apmu regmap\n");

looks mis-aligned 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
