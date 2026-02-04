Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BZZAqzHgml9awMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 05:14:36 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F22AE1824
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 05:14:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40932C87EC6;
	Wed,  4 Feb 2026 04:14:35 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DEB0C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 04:14:33 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-5032e15525aso67928611cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Feb 2026 20:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770178472; x=1770783272;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kCf4lzrMziBndOsmo8GuusOdBN8cx0cDMD3sdQZPXW0=;
 b=Q0Lzg9xGLYNGB3fKS1Z0LTk7U6rhNN6vUdvA1Z84pDObaRLk6v3Dnz1KomOVBNIBfC
 YO0TvXw24og2H6zrSXysPh12ANBah+MXXwuRibnp9oIeLgNuavX/o9Jyt+Z9M5b3HGbH
 nZ2lfAA1pMrl9m8OqIra0frW5aDInhSU+s7A6xyQZ3IZfiiBMRvoF16K1E8Q9ULuaU9G
 HtHe9M1CCrvDSO3UjaK20VC2bC+hH7lXMgNWMQFyH1FZRKiENpVt4V3YQZ91pzainolb
 RbXZZDcAi60kuul95xV36tH2nn9xg2Qz32B+ETU0P5nOhj/HKpzvLVPWuw2SS724sfrR
 MjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770178472; x=1770783272;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kCf4lzrMziBndOsmo8GuusOdBN8cx0cDMD3sdQZPXW0=;
 b=FwVcnIrcCC2S9lvOLjgHTZOmKtoUW291eYy5ldvhUMg30wYDEK/SFxAJjv5GJEsjlI
 Z9ZqOGa8PySzPjWedv9fRagbrVTAd1d66d4r5u+/UOuBit7nLCwv9nAMoqaJo9C7TduZ
 Jzw22XdW13OBXN5dkSytLECqrh5N4axhpuMKuwby4iRFTTJEtgFO4nRESecZnDfqDsRN
 micSLw9fhXhh6faqPD5uWIXSpPEEkRgYYBuT0OCsEXb+/wnAakwkl4GMcKEEDcgU/7Z2
 +b+J6co70XDeSQZgtLPvmG4tR8w4gefmUEq5H+2Mkm6yVM6zTgX5J7GeZIBv2xhHEc6e
 Vkag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlRlk9ewJD1jx68QaJ/cmiXME6emAlTTGuneKcmrFnmXYp9sQ693duf4yefw0GXjJN4y85nTkknSDnXA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzcRVeqV1DMViwYghZruv5LnzbwdPO2QfbHeiN9+x9H6tlyqnRq
 BtBiiRULmJvm1HvX5eUbVEvdRgEe7SbeT+QngFB/RUNnf8PH6ybab0ku5GTchqyW
X-Gm-Gg: AZuq6aJ8gH9mTsEN7Rkbd0BA0biOHdWabveOoDZZL8ak/BO+TZU5bRbA6SmrAbK9eVb
 7NBR5VN+ZWi2p+z66CkPzOAPgYVEj6v96xcDxZ1cULgwz2HxYuG9kpAPhEbFl8SBlF3Xh/UGsY4
 RgivCZLx8zSdZ/gLDbfwY9M6N/l0V3wU59eWGXdp/CjesPZN1k8bJM3Pgtb6LkW8zU+q3QpqYq/
 HQ0HsfNL8scNHs+a/wFHHazMiKSYxDGksqGpIvmFkgISfArwBkZfoxTmPz00HDPAkxdKRKk261c
 HURNfail73Kk48fB0dcEprkAIzZIFCqzMfUYiXq/p1ye5uPrMbbpnHI/r6Ao3YDRS8jH6DFNvAC
 mRe4Frcmpopz6IoJZgnSD5A1RN7vrceUdaWy/VGrkVgP5CrbtdvKY0gZiqYiZSK7+C8aROFQ29c
 DDXLdx7oNheqaDEptUKKxu
X-Received: by 2002:a05:7301:7003:b0:2b7:32fe:4bbb with SMTP id
 5a478bee46e88-2b832895197mr603971eec.11.1770171121283; 
 Tue, 03 Feb 2026 18:12:01 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b832fafc2fsm746589eec.24.2026.02.03.18.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 18:12:00 -0800 (PST)
Date: Wed, 4 Feb 2026 10:11:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Inochi Amaoto <inochiama@gmail.com>
Message-ID: <aYKqh7SmoHO83Avr@inochi.infowork>
References: <20260130022705.1059214-1-inochiama@gmail.com>
 <20260130022705.1059214-2-inochiama@gmail.com>
 <aYIyuulFADU_j3V0@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYIyuulFADU_j3V0@shell.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/3] dt-bindings: net: Add
 support for Spacemit K3 dwmac
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,inochi.infowork:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 8F22AE1824
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 05:39:06PM +0000, Russell King (Oracle) wrote:
> On Fri, Jan 30, 2026 at 10:27:02AM +0800, Inochi Amaoto wrote:
> > +  clocks:
> > +    items:
> > +      - description: GMAC main clock
> 
> If you know what this is in terms of dwmac databook clock terms, it
> would be helpful to use it here. I suspect "application clock" would
> probably summarise it, that being the clock for the bus interfaces
> that dwmac provides to the host.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

That's a good point, In fact, I have no dwmac databook now. So if you
think it is fine, I will change this description to the "application
clock". Thanks.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
