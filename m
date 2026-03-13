Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMN3GOV5s2kZXAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 03:43:49 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CDA27CDAC
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 03:43:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AEC4C8F29C;
	Fri, 13 Mar 2026 02:43:48 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 346B9C8F29B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 02:43:47 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-50915e14cf6so13236111cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 19:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773369826; x=1773974626;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q9hCuzuHEN/sMOidNnhHLkJz/g4iSobaxo8mhYZkdNU=;
 b=Ksg0cIOH6+jc1ZDvgrZ1shc+HJAyHkotuqCDB5GcnZytXVqA34G+VOy1FCR4PJ499Y
 CQCQSSM5Y7mY9799ITz5GHjrwxCxtgv0y5GO5ATgG3yIPeKoWRqmI0mVhfQHtFHepfpB
 cG4aCp9qYFriBW4SDywBvoyAXEvyh1E/9PjAdTECwWEC8PVT+dg5DK/vdWblikGRnJm2
 mc/OVieynro2D9DWNn+xdZEJVrtUUry4dGa3IwEHmI5gSvlMB8wyjI4ZVgz4MHN2PhC2
 H9WH2j7NnVOz2hD78MPn11gBoIDuE30EXKS8gGzaSAzNAyxHCvPcjYOX+EBaJjoyiErr
 v0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773369826; x=1773974626;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q9hCuzuHEN/sMOidNnhHLkJz/g4iSobaxo8mhYZkdNU=;
 b=H4R3SE64hbKlGq1QAmGlbeGHxuiVNKJZLUbMNYqFop1lScPmMXnIThG3tNyIavRXk9
 MHSNtCF467aAEOUE8bzGhH3sokOkpblxV5Ss9ctJN9XXCaflM30bd3ugmTmI43yit3Ks
 i/JIi2Q8gmkHJYUU/H22YCj7sxWnuLjNAHxe8tJWOOwB3o2C8KpKFeOrGdHOI1fSQVaY
 +eHKVqG57efqRkJ+CBqOSJSaDIZTMkKVGJiWuN89rze7u/mfaOo54U6H9ZprzYWTfxRL
 JaN0o/lj414aQS7RLWZHURp6f+6F7r5AlcJnRrOvONS/iwfGcAiU1TjuuxKZ+32fdUq8
 x5ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM78DCq1fOBBKpqUiTy5Jph8oUeIsF95zlT4ZVGqPHp63Pc54edftMfxrQtJRc7Pxab0WvzQ8b0nYglw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz8tLR2sZd4BIE999mIJ27zk1brK7yDtc/OHoOq4HJDADKaGa/1
 qhH0xtKj3esU0yhbi4wCLCsSxsasYBiGmPDrjobOe3nBPaZLVLyON5sO
X-Gm-Gg: ATEYQzyjLqwmoXSGJOsMWZ8gEz8iAHMFI5dNkZt5ghQ7IrWdvcVOdri1zXJSBi5txmU
 Uy3uHGU36lJLsKOy2y7CYD1UCqfHxPFOA8GKE/Tg00yCIEvhH/hwcchm+FKujoFkIZEL2Rwvvpz
 4c4HNX+BKxkGvAWogZ6po1NVTK67B2EMI1jM09CGKlHeC1wh/i5kWoIugJ/2oWlMybC4Aj6jTYP
 6A+xXzxAbm7E8G5DLETdVae8+IBvBPUtSnTMME7SIos6s0HT+ALq03LSxbywBrRSkPej/Lvi+Fk
 2WycDP080LeCirhdFYHHKCKT/jWXemQ5VrZd5AzzeIS3RDkENI9BVmtUy+CJy6WaRTWGSI3uOl+
 sqpG7BdQ0tkiQClD1acBGtoWsE3rbjxp0Z2CoxUVcU3b5z4mgCjPRYCZVKBk9cLZ3If5zqcTKYk
 jdd1EeS5pZWXlQpqyWefrXl8U=
X-Received: by 2002:ac8:5fcb:0:b0:509:329e:bd5 with SMTP id
 d75a77b69052e-50957b909c8mr24981181cf.3.1773369825770; 
 Thu, 12 Mar 2026 19:43:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5093a0ea844sm53518871cf.17.2026.03.12.19.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 19:43:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 10:43:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <abN5Xn5GCa_UqCbO@inochi.infowork>
References: <20260312012232.373713-1-inochiama@gmail.com>
 <20260312012232.373713-4-inochiama@gmail.com>
 <20260312193801.61c30de4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260312193801.61c30de4@kernel.org>
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
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:inochiama@gmail.com,m:me@ziyao.cc,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:vladimir.oltean@nxp.com,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:richardcochran@gmail.com,m:dlan@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:rmk+kernel@armlinux.org.uk,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:quentin.schulz@cherry.de,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@
 kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
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
	NEURAL_HAM(-0.00)[-0.979];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,gmail.com,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,cqsoftware.com.cn,synopsys.com,nxp.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,bp.renesas.com,armlinux.org.uk,st.com,lists.linux.dev,gentoo.org,cherry.de,lunn.ch,dabbelt.com,altera.com,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: C8CDA27CDAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 07:38:01PM -0700, Jakub Kicinski wrote:
> Some nit picks only to be addressed in case the AI complaint on patch 1
> is legit..
> 
> On Thu, 12 Mar 2026 09:22:25 +0800 Inochi Amaoto wrote:
> > +config DWMAC_SPACEMIT
> > +	tristate "Spacemit dwmac support"
> > +	depends on OF && (ARCH_SPACEMIT || COMPILE_TEST)
> > +	select MFD_SYSCON
> > +	default m if ARCH_SPACEMIT
> 
> I know other STMMAC sub-drivers do it but isn't the defconfig for 
> the platform the right place to add this sort of default?
> 
> > +	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
> > +						    "spacemit,apmu", 2,
> > +						    offset);
> > +	if (IS_ERR(apmu))
> > +		return dev_err_probe(dev, PTR_ERR(apmu),
> > +				"Failed to get apmu regmap\n");
> 
> looks mis-aligned 

Yes, that's true. I will fix this.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
