Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B3F984B58
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Sep 2024 20:51:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A2E0C78002;
	Tue, 24 Sep 2024 18:51:01 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AD0AC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Sep 2024 18:50:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso9292682e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Sep 2024 11:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727203853; x=1727808653;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w8yljJUo8NRBugHKOFT0PM95Jmsv0H5pGe3vrsP2GKA=;
 b=UteT7PAeL7Qz/po0HXlZkB4/eY3+uXK6gmEK54AJnK1EYwbib4q3lBzbhXXEtLERcF
 hl3+0K9SP+4fdp3bUbA+sImFfWmvWfRlnuqtuYdJ/4hVjlqVOv1EjTa347BrD/Gacb0U
 yhi6wL4BxwNlxT51/vSo9+/NkCSpacS2r+yD3AZd8NFxYoSnixV9DGaEo9IaPgs2tOKc
 mVF1HdA+IsnRUDuHkiXeR/o3wUcYKCwjsLnYc/nAnRQ27aQv/oIM4hD6XVqravMTDGX2
 l/DZBXbsPjujtz6Bwy+kmSzU7X4xvIxMkBegncgvEgH1ZCvdMEBPKRXze/7KANNA3k3q
 nklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727203853; x=1727808653;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8yljJUo8NRBugHKOFT0PM95Jmsv0H5pGe3vrsP2GKA=;
 b=j+9UNSwD3KCi/TN0BEyH0Giy3y1KFn4uqBBPgK3mIbUNh7iYkwnwGusdFk7eYWWwMs
 zzzzm+5CjcNMcOZPVT7+LGhuEnuJMyrf50Yv8fBZw7GDezcxQ1DPAcV/KdTxb3rCx+S1
 gjwZgoZd16eP1VCcmoFTrv+2hEKJnctjoBDbnLCBgTh1IkjEClas/7rsplHOG08rz3go
 R5d5dpc2ITV90oBtzB14VksL7Sx0X+8TeOwwUPdwROKxVlcef5UOzZIwTTsHiwUZW+y7
 +DR+F/r+05J9EgiqS7Ct8/CfELAh3Pi6HVZAN8GKexo7W0ox6RfOZ6fL3EfZawgIM7SM
 HD6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD1cat3AES3UmnEXoa/gv6KBwsRabG5N+kDC3IDv03NTWs1sByvap8bx34a/KHjDLk8cdSfEBdL7G+wQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxmHFKvDQ5BCAEsIKC1BYmEjXr48lvp4l7kwZlg3YlmUxv8gjR3
 VTXq/EpcC1G+Lv7LCMysaWMaF2WAUPvMi9i6x02y+BrLnHeBqGcn
X-Google-Smtp-Source: AGHT+IHRriG35uTpaSEGDgrKzigcN/tN63RMLWMH004l8eZgH73DZXtYF7VLiK+XTKsI8w4Tw3a6Ew==
X-Received: by 2002:a05:6512:118d:b0:533:324a:9df6 with SMTP id
 2adb3069b0e04-53877530f3fmr60553e87.29.1727203852433; 
 Tue, 24 Sep 2024 11:50:52 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a864081fsm297694e87.161.2024.09.24.11.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 11:50:51 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:50:48 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <6nikxeiovzdrlxq5alpvhvgpkeky2gkevk6mczivfxsar3hoof@n2gxyrrten6m>
References: <20240923202602.506066-1-shenwei.wang@nxp.com>
 <fcu77iilcqssvcondsiwww3e2hlyfwq4ngodb4nomtqglptfwj@mphfr7hpcjsx>
 <PAXPR04MB918588AD97031D9548D24A9B89682@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PAXPR04MB918588AD97031D9548D24A9B89682@PAXPR04MB9185.eurprd04.prod.outlook.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Chuah Kim Tatt <kim.tatt.chuah@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Wong Vee Khee <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, dl-linux-imx <linux-imx@nxp.com>,
 "horms@kernel.org" <horms@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 net] net: stmmac: dwmac4: extend
 timeout for VLAN Tag register busy bit check
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

On Tue, Sep 24, 2024 at 06:13:27PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Serge Semin <fancer.lancer@gmail.com>
> > Sent: Tuesday, September 24, 2024 2:30 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: David S. Miller <davem@davemloft.net>; Eric Dumazet
> > <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> > <pabeni@redhat.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>;
> > horms@kernel.org; Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose
> > Abreu <joabreu@synopsys.com>; Ong Boon Leong <boon.leong.ong@intel.com>;
> > Wong Vee Khee <vee.khee.wong@intel.com>; Chuah Kim Tatt
> > <kim.tatt.chuah@intel.com>; netdev@vger.kernel.org; linux-stm32@st-md-
> > mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
> > imx@lists.linux.dev; dl-linux-imx <linux-imx@nxp.com>; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: [EXT] Re: [PATCH v3 net] net: stmmac: dwmac4: extend timeout for
> > VLAN Tag register busy bit check
> > >
> > > Overnight testing revealed that when EEE is active, the busy bit can
> > > remain set for up to approximately 300ms. The new 500ms timeout
> > > provides a safety margin.
> > >
> > > Fixes: ed64639bc1e0 ("net: stmmac: Add support for VLAN Rx filtering")
> > > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > 
> > > Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> > 
> > Please note, you can't add the R-b tag without explicitly getting one from the
> > reviewer/maintainer/etc. Please read the chapter "When to use Acked-by:, Cc:,
> > and Co-developed-by:" in Documentation/process/submitting-patches.rst
> > 
> 

> I apologize, Serge. 
> I made an error in how I utilized the r-b function here. My intention was to explicitly 
> include you in the next version of the patch.

No problem. Just remember you can't add the formal
Reviewed-by/Acked-by/etc tags to the patch until you _explicitly_ get
one from the reviewers. It means you must wait until the reviewers
send you an email message with the tag typed in the text. Thus you
must drop my tag from your v4 patch.

Here is an excerpt from the kernel doc regarding this:

"Be careful in the addition of tags to your patches, as only Cc: is appropriate
for addition without the explicit permission of the person named; using
Reported-by: is fine most of the time as well, but ask for permission if
the bug was reported in private."

(see Documentation/process/5.Posting.rst for details)

-Serge(y)

> 
> Thanks,
> Shenwei
> 
> > > ---
> > > Changes in V3:
> > >  - re-org the error-check flow per Serge's review.
> > >
> > > Changes in v2:
> > >  - replace the udelay with readl_poll_timeout per Simon's review.
> > >
> > > ---
> > >  .../net/ethernet/stmicro/stmmac/dwmac4_core.c  | 18
> > > +++++++++---------
> > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > > b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > > index a1858f083eef..0d27dd71b43e 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > > @@ -14,6 +14,7 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/ethtool.h>
> > >  #include <linux/io.h>
> > > +#include <linux/iopoll.h>
> > >  #include "stmmac.h"
> > >  #include "stmmac_pcs.h"
> > >  #include "dwmac4.h"
> > > @@ -471,7 +472,7 @@ static int dwmac4_write_vlan_filter(struct net_device
> > *dev,
> > >                                   u8 index, u32 data)  {
> > >       void __iomem *ioaddr = (void __iomem *)dev->base_addr;
> > > -     int i, timeout = 10;
> > > +     int ret;
> > >       u32 val;
> > >
> > >       if (index >= hw->num_vlan)
> > > @@ -487,16 +488,15 @@ static int dwmac4_write_vlan_filter(struct
> > > net_device *dev,
> > >
> > >       writel(val, ioaddr + GMAC_VLAN_TAG);
> > >
> > > -     for (i = 0; i < timeout; i++) {
> > > -             val = readl(ioaddr + GMAC_VLAN_TAG);
> > > -             if (!(val & GMAC_VLAN_TAG_CTRL_OB))
> > > -                     return 0;
> > > -             udelay(1);
> > 
> > > +     ret = readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
> > > +                              !(val & GMAC_VLAN_TAG_CTRL_OB),
> > > +                              1000, 500000); //Timeout 500ms
> > 
> > Please drop the comment at the end of the statement. First of all the
> > C++-style comments are discouraged to be used in the kernel code except
> > when in the block of the SPDX licence identifier, or when documenting structs in
> > headers. Secondly the tail-comments are discouraged either (see
> > Documentation/process/maintainer-tip.rst - yes, it's for tip-tree, but the rule see
> > informally applicable for the entire kernel). Thirdly the comment is pointless here
> > since the literal
> > 500000 means exactly that.
> > 
> > -Serge(y)
> > 
> > > +     if (ret) {
> > > +             netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> > > +             return -EBUSY;
> > >       }
> > >
> > > -     netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> > > -
> > > -     return -EBUSY;
> > > +     return 0;
> > >  }
> > >
> > >  static int dwmac4_add_hw_vlan_rx_fltr(struct net_device *dev,
> > > --
> > > 2.34.1
> > >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
