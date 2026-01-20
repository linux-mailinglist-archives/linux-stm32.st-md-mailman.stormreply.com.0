Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AcuOaasb2miEwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 17:26:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA1D4774F
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 17:26:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E022C3F944;
	Tue, 20 Jan 2026 11:40:04 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09148C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 11:40:02 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2b6f5a9cecaso1356123eec.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 03:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768909201; x=1769514001;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QeACF3mv4Ishn0NV7RQhnzhSMHx1UMVLhYGwPqoV7AE=;
 b=E67MIrrrBn5A9NwDHADeRC+BYMsxNu4YUM7lGda/BAj+bRab5xohe+r8npeN3qYti3
 c6XouLmbb354IoBcTX+fO86jIbYRNpIwdwX2lYRJH2xwLVG1NdlFDjyYX6Fpp4La0J7i
 1rs3v/ftJDqYv6M4VLHGmlhgkKAkTVBxIjIQO1cC1yPQ4IVgI430KiUinoep4vFu544x
 OeKUlWLVxYXoKbhjZ95zX+8dxJeYCIMHTKmtiIcKjb8YzMGbNNXPYOfRYulYI14mpJss
 MRe1QugOlFhptDYE3Km9c541halaXO4+UU1vRwTCQi1hEkNGPB3tktImRqsTo0y5+Qm6
 eTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768909201; x=1769514001;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QeACF3mv4Ishn0NV7RQhnzhSMHx1UMVLhYGwPqoV7AE=;
 b=exKYJCd2MRLh7e4qW5Dc3Q+fu+XN7+OCrFTfHPMtxtMRJRTO6cmq1YLaIrmcpWc9wh
 cdI3kDtRDuPC0aBbmM3yuSaYdp4sJtXwQ24IME2O7jM3W5MnCDQssnAHXBEZpeyHJwBV
 MX1/YR1yxDfQ0Wp9NVx/iTQ4X0xjAhbxHAzkGeJPgKbMDK/TtAgst5IzMnl2edyWAYWV
 3IBz3PiPo+k3EqB6XntrjribHRbuIIFmKj8Gf49aFVg2cwu6XaQCqWgWJ2REJ+HmxVfV
 11cMW3E5ZanWzodv+zsIAVEJIO/EWaLiBqy/U2cJfne5NLIOiJj/IjEwjQM1AfqTs4zf
 rRAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHinT0W2KOdTakzwZiXBuR6cLn4qbATm1qlgbKZqHGroDNT+4fD9ekzDXwOAxOoCJqk997fXxmlJ9IWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxpzuYmydgCxuWaNYlzchSgVDm6mEKVYQp136kNGuln8QBxMRJC
 hVi50RpWrioSXOAge1DdeWR3XU3xg54a4DZx7KFMnLfEfx+pJiuLa37c
X-Gm-Gg: AZuq6aJTbBoUN2wGd1rrH2UwdszkNU8QgaO4Ev1iTvM/9raImjXqbPJPKqyrUdhgbHG
 rWcnZnN8kvQqV1xgyfJpC7y7HbojO78sp7GJ28tWbFwEd05hbLO1GbTcqxWmcIeCs3xajhSoS8P
 Hiuw+AVOF8sc+qsGq++sac4G9yoVDc4t0LwR8V5NYMGiTHnw9k/Nhl2NILh0K0Ym/HksBPhBJZQ
 SsIZxM+aG6XXI+OrORNrsEz63eIE9KwudcaC4ZU+SoksenOJNi+d4eit80lA8pW7npYphqDX7r1
 WY8LNW8WH0lTXJqxsm+IHPprzGjT/FULskEcG3x7zif7koSGTQYnrQHeVt8v2fDpWT+hB2H8eao
 iG8/7mtm4Lk5WjH+gaLYsWnvJY4n2fIkd9YEa7589l4mGRRuG/Wzubh4ztWxUdv13M2feoyeKyH
 6kfEN37Gc4ag==
X-Received: by 2002:a05:7300:2315:b0:2ae:5967:db5d with SMTP id
 5a478bee46e88-2b6fd746cacmr1048269eec.13.1768909200775; 
 Tue, 20 Jan 2026 03:40:00 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6beeb4b9csm17558900eec.30.2026.01.20.03.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 03:40:00 -0800 (PST)
Date: Tue, 20 Jan 2026 19:39:49 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yao Zi <me@ziyao.cc>, Inochi Amaoto <inochiama@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@gentoo.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>
Message-ID: <aW9ou-lsQQ5dVzqW@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-2-inochiama@gmail.com>
 <aW9fL7r0AM0flALJ@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aW9fL7r0AM0flALJ@pie>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] dt-bindings: net: Add
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
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:me@ziyao.cc,m:inochiama@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@gentoo.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:rmk+kernel@armlinux.org.uk,m:siyanteng@cqsoftware.com.cn,m:ziyao@disroot.org,m:vladimir.oltean@nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:yong.liang.choong@linux.intel.com,m:maxime.chevallier@bootlin.com,m:wens@kernel.org,m:weishangjuan@eswincomputing.com,m:boon.khai.ng@altera.com,m:quentin.schulz@cherry.de,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-
 arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[ziyao.cc,gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gentoo.org,foss.st.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,armlinux.org.uk,cqsoftware.com.cn,disroot.org,nxp.com,bp.renesas.com,linux.intel.com,bootlin.com,eswincomputing.com,altera.com,cherry.de,st.com,synopsys.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 8AA1D4774F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 10:55:43AM +0000, Yao Zi wrote:
> On Tue, Jan 20, 2026 at 12:36:06PM +0800, Inochi Amaoto wrote:
> > The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> > MAC (version 5.40a) with some extra clock.
> > 
> > Add necessary compatible string for this device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
> >  .../bindings/net/spacemit,k3-dwmac.yaml       | 107 ++++++++++++++++++
> >  2 files changed, 110 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> 
> ...
> 
> > diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> > new file mode 100644
> > index 000000000000..58dd98f79e8a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> 
> ...
> 
> > +  clocks:
> > +    minItems: 3
> > +    items:
> > +      - description: GMAC main clock
> > +      - description: PTP clock
> > +      - description: TX clock
> > +      - description: PHY clock
> 
> Why does the MAC require "phy" clock? Shouldn't this be handled in PHY
> driver instead, or I get its meaning wrong?
> 

IIRC, the "phy" clock is used to pass the phy from the mac core, I will
double check if it is possible to connect to the phy directly.

> Also, I don't see "phy" clock is acquired anywhere in the driver. Is it
> really necessary for the MAC?
> 

This is a mistake, I remove this by accident, if it is necessary, I
will add this in the next version.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
