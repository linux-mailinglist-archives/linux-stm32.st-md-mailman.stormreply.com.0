Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GiwxKhIWVGqghwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 00:32:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC897462EA
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 00:32:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=lXh78jh6;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0109AC8F271;
	Sun, 12 Jul 2026 22:32:50 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61AE0C7BF8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jul 2026 22:32:48 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-38759bcd877so1998393a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jul 2026 15:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783895567; x=1784500367;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=2kQZPoHSijeo1tUSaMcbyM3cWe1NTKRtsDQpKGYRUEs=;
 b=lXh78jh6RTSYVTJ15qHx78wy/onm/JQuHksmv4AsEhxTsBg3l97w+RoEeefkr4w3Q6
 MeVircihXHPxVrfTjmhGrylN/hizPEi11IZ8fZJr43p1Gk6b6hpzH/Gs+AugFQsUZ2Wy
 pQqI4D1yGFNK9jr428GNTlBbuhb2uIiCQ6qqi/K2p7jkgkhWq204Nt1fNBENURP+Djgw
 IcpRNYMHXQYIkwB+vvwzbDHr04S9UeO3MK77rSf0WuqPmaqmgnSOI+ItjXWXc9KIpfYs
 PxQzbNgad1aejpXEeR/JIOtPn7nX8nXbzzpIeUi/2IhU1+W7qrHf/FjuodDU6bHJ9per
 H31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783895567; x=1784500367;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2kQZPoHSijeo1tUSaMcbyM3cWe1NTKRtsDQpKGYRUEs=;
 b=pkXrC/iksYshHtVlktzUZWNwA4riAXBjAZf01MUOAlzgsxO9uJ3CxdJnP9dke6xDZt
 pPKwBeVW1Jm1gp8S+zLhHkpj8wj7ir69X+3VvCE/BXV74Qa+br6T4h61nZWUDzNaJVEx
 FGGZmBfWKvv6q3VwCOe3Tjbvxz9MfJMb2AC/UMuutMYKgO6oitxz8bjcknTCgwRDByEr
 iolZ1byPYrqYTCvRtRNDkVKyP97YA8ujQuC5CzoEZ66waIol3hUc4aZWv6Pxlc7IaoXD
 /lFDKHLdju+vQvdEmkvPEP2X9HrBnd2JdUeIK9DcJ+vFLdhNbFFqcWZ8ko5KnwhUEpbN
 lZWQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpzLn9hUbMJFNe73hKQRPImKkZgOdCSJvCby80qCppVd5XLeGHG+jgWYVboQ9PfEWRt8e3rLa4zyuNBoQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy6yAErXndI9QPx+ST4MHgtRy9jFZ0wnZrbQ+RTUIXJXee85tXy
 xOBJAX3zBoqCAevEpRteP0XkNF0XirL6HchkWdaOyeHb3aXWN0DSJNjj
X-Gm-Gg: AfdE7ckzwv1mUUnNOtBeetoRItO14c347IZtpp8SYeympMwlH2NDfnZi1kcIg6FijqN
 8vlTB6/4YnJ79uBYAs2DcSZzUK9jmlDU48Fb4iZp/AYEoENzjaZ2UbReDpeaa46Efd20x0k2ku/
 Hk6ICs1ksOMVDQmaGTNHavslaETl/GA+siDjHZ/eQpRKPibcm4i17MX68PLuoV/8TUa4HWmvfDy
 6biiNzWQ0I4ma71Fl3rYOIonYjYnSX6lGzSxLmXUN86cHXw70JSiT411agBsWvWj2riJ0O/xdY/
 gmYB769S1bjzXQqoNhdc5rOdL8H29SOM9XJxgGCAv7f9JXCCJmhdvYC1q2bIv6m68JTV+rFxH5n
 CadBSa8Qs7B+z/XAOMMICsBlyD0khBwKUl4eenBDcxeoTfLQBrq58lOkl8I9ac1U/
X-Received: by 2002:a17:90a:da86:b0:387:e0bb:5800 with SMTP id
 98e67ed59e1d1-38dc7ba7310mr5970904a91.39.1783895566751; 
 Sun, 12 Jul 2026 15:32:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311747f7293sm61166210eec.3.2026.07.12.15.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 15:32:46 -0700 (PDT)
Date: Mon, 13 Jul 2026 06:32:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yixun Lan <dlan@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <alQVg3QqoIdwGEmR@inochi.infowork>
References: <20260712045233.800748-1-inochiama@gmail.com>
 <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
Cc: E Shattow <e@freeshell.de>, netdev@vger.kernel.org,
 Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] Failed to reinit phy of spacemit-dwmac when
	reset-gpio is present
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maxime.chevallier@bootlin.com,m:inochiama@gmail.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:davem@davemloft.net,m:kuba@kernel.org,m:pabeni@redhat.com,m:dlan@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:e@freeshell.de,m:netdev@vger.kernel.org,m:gaohan@iscas.ac.cn,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bootlin.com,gmail.com,lunn.ch,google.com,davemloft.net,kernel.org,redhat.com,foss.st.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,inochi.infowork:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FC897462EA

On Sun, Jul 12, 2026 at 10:55:51AM +0200, Maxime Chevallier wrote:
> Hi Inochi,
> 
> On 7/12/26 06:52, Inochi Amaoto wrote:
> > TL;DR:
> > 
> > The DWMAC on Spacemit K3 is failled to register phy after the reload
> > the driver module (rmmod then insmod). Because the reset-gpio is
> > asserted while unloading the driver and is not desserted before reading
> > the c22 id, which leads to a fault.
> 
> You're not the first one facing this type of issues, this is a long standing
> source of issues. The problem is partially hidden by the fact that often times
> the bootloader deals with the PHY reset (like the case you're facing)
> 
> Take a look at these discussions :
> 
> https://lore.kernel.org/netdev/cover.1761732347.git.buday.csaba@prolan.hu/
> 
> and maybe more intersting, Russell suggested an approach on how we could potentially
> address this here :
> 
> https://lore.kernel.org/all/aTBeVTlsElGXUCSN@shell.armlinux.org.uk/
> 
> 

Yeah, I have found these links, but it is something more than I want,
so I think I should deal with this carefully. I will have a try if I
have enough time, but currently I will send this workaround to dlan
to solve the problem....

Regards,
Inochi


> > ---
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -196,7 +196,8 @@ &eth0 {
> > 
> >  	mdio {
> >  		phy0: phy@1 {
> > -			compatible = "ethernet-phy-ieee802.3-c22";
> > +			compatible = "ethernet-phy-id001c.c916",
> > +				     "ethernet-phy-ieee802.3-c22";
> 
> Indeed that's merely a workaround :(
> 
> Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
