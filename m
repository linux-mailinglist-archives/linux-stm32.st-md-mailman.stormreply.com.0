Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jsZZKYiaM2p/EAYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 09:13:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F6069E027
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 09:13:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=B94JaEpx;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC7EFC8F26E;
	Thu, 18 Jun 2026 07:13:11 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B04BC7A830
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 07:13:10 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-37cab825ec9so527200a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 00:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781766789; x=1782371589;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KU/eD8zFijZYAE4C8J5GszRlhYqC9pFtYnLR1rm99qs=;
 b=B94JaEpx9PerS5rb3s2B4FzWJ6Ds0SN4S7e3hnBlNDpZwFwCUGttHgdAhmKKNMsSKN
 I+qQ/KBDFX5WaAwwctwqHrkS+8S747414fxht/fc/rmhywrBBImMW+O11aJtcKA1HtN1
 WGH+UsDIJLAX2Xn5T+BBN24YJZ/DQz7QjpYxhpw6sPmdXlFd5NhnnB0VJW4yUA9xhwpt
 kWKxSTXUONgETJiXaXCgAdSidpDJZYlJCXHeUGtGPyMWThjM+oUCpV4FyEn2jS9/SxgQ
 1xDAQBF5Ihoo4ZNwpPwldzNy2shJywwqCkWogvxb5k0nyQIkHC6/dTHHMcKl+5ux25B+
 QGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781766789; x=1782371589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KU/eD8zFijZYAE4C8J5GszRlhYqC9pFtYnLR1rm99qs=;
 b=cPICJmn2mSSybqPdUg7pdpSNmDdp21gTX8sz7lq+gMOm5sx3lhpp5dvMl3aeT1iFfO
 7Wt6oyPmipUajiPErOrZbzymIXjY7KXCAuVNxIJSMaL/AL8UXa82afwOOlBhe6pzQszc
 rpF70bMs/GvSei4jVWGkSOYzQurcGQN8K79U3ijXrNkI94wZUOmh68IhYSsIYa2/xLhy
 Q1g7QTwWELUDQAMITf6P0vT7UsyTYReE55HLCxgk/HZwTJceKg1+dsnoLbjC+tB8TMNI
 42mNlwy78towEnHaxAhoBh2PzjMgOkkw69sjbittki5EnIKmKyNvqtf3Wbwy5aXjsRfl
 bELw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+oKHGaDYTLGcpbcVGDdIjoaPXeVjdLGcJUVn51cGm72cCQy4fF5WyFuBSIyrd0Qc6U6W0WMagDx/aWoQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxY9b/sVA3wk+2/nNNvpdaafJuY7L1ve7TANu53znWjD2/76JBZ
 MQcFroF8FqItAlybp1D7lV8bo9a9KrohOrOaZOJosinW+1GWVJ9vXSVe
X-Gm-Gg: Acq92OGKRqnQLZpbmE93qdPjFflTfwztDC1VhHoXYlHIMA5gOvX2UyUDBXsfslJQRr1
 5XiLpLCzQqEdZwmOvL/P5tl9ridnBz8JfG3U+tqZClphApLp0m70emCwDoyyy1CiR8dykFOJ+sM
 7LHoam0vFkiWY9NE/+FsCAvz1hIrEhJ36KzxwPxjnwSQ+H/lB67EnzajYIeiwW69ZDMfrYDs10q
 TbA+mRUBG4JMvYWNyytzSoKMjZ+mr7r/cNcq92kwfXDbBKZWZhX4ihUPBmv2AI5wM03Ee6M2hQB
 zZntkvhkMIwE8iGvIjdUBKK7wWBd8jgMF7OnTLG1XbyZB+3c0LuXoxE4/81b1z0LKaGKrehaEg9
 UC9E0GZZetkv3VpAc6pISeEBM4N87hF7GERX1LGH4h7WDMfkh5AWk7n1ygxAEQkp4
X-Received: by 2002:a05:6a20:c991:b0:3b4:65ac:e2e3 with SMTP id
 adf61e73a8af0-3b9e5b2381dmr3247768637.5.1781766788479; 
 Thu, 18 Jun 2026 00:13:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c889356266dsm3221211a12.6.2026.06.18.00.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 00:13:08 -0700 (PDT)
Date: Thu, 18 Jun 2026 15:12:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Yixun Lan <dlan@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <ajOZnO_dFg20VnEc@inochi.infowork>
References: <20260618064143.1102179-1-inochiama@gmail.com>
 <9b39829d-92b4-4ffa-be0b-b2b0f857f58e@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b39829d-92b4-4ffa-be0b-b2b0f857f58e@bootlin.com>
Cc: Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-spacemit: Fix
 wrong ctrl register definition
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maxime.chevallier@bootlin.com,m:inochiama@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dlan@kernel.org,m:rmk+kernel@armlinux.org.uk,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bootlin.com,gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,foss.st.com,armlinux.org.uk];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gentoo.org,vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39F6069E027

On Thu, Jun 18, 2026 at 09:03:21AM +0200, Maxime Chevallier wrote:
> Hi Inochi,
> 
> On 6/18/26 08:41, Inochi Amaoto wrote:
> > There register layout of the phy ctrl register has something wrong,
> > fix it to match the right layout
> > 
> > Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c    | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > index 223754cc5c79..6feffaa3ef3a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > @@ -18,10 +18,12 @@
> >  #include "stmmac_platform.h"
> >  
> >  /* ctrl register bits */
> > -#define CTRL_PHY_INTF_RGMII		BIT(3)
> > -#define CTRL_PHY_INTF_MII		BIT(4)
> > -#define CTRL_WAKE_IRQ_EN		BIT(9)
> > -#define CTRL_PHY_IRQ_EN			BIT(12)
> > +#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
> > +#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
> > +#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
> > +#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
> > +#define CTRL_PHY_IRQ_EN			BIT(9)
> > +#define CTRL_WAKE_IRQ_EN		BIT(12)
> 
> Looks like you're fixing 2 things there :
> 
>  -> Wake on Lan probably didn't work before, as the wake irq was apparently wrong.

I guess the vendor firmware and uboot may do something for it, 
but the irq is wrong actually.

>  -> The MII mode selection apparently also changes, but maybe you don't have a
>     MII board around to test this ?
> 

Actually, the only board of the K3 is the pico-itx board, and it only has
a RGMII phy. I even doube the spacemit vendor has not tested the MII phy
well....

> Is it possible you address these issues independently (i.e. split this in 2 patches) ?
> That way, if we ever revert one, we won't re-break the other thing that was broken.
> 
> 

Yes, it is fine for me to split it. I will send it in a few days.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
