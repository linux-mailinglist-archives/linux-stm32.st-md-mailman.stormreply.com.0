Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDF5995BEF
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2024 02:03:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 811DBC7128A;
	Wed,  9 Oct 2024 00:03:01 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65999C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 00:02:54 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5398939d29eso7675677e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Oct 2024 17:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728432173; x=1729036973;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yxwtbH453mr49OxFcpLGTroCcnxd3uo1nzwIRj8mAjY=;
 b=ggfuDgepkpWvuKo2Mq6ExO3a3r5FxDjO5q/m4pPEX7UEdrJi3Fv0+pIN1QKzv7b9sV
 IFIiLX8W4lYsSM9d9UvyOnyrwDQ/K2nffOByiHOdGNlhzmiipyB/dS3lOJPykaQZAbqN
 zObBYwkhrKfjeOsB+ohWSV3NRa7mCLIq9IUNoSfdyCIgq5MOe8q6l+4KDp3L0v7d+jBk
 q3lFVnuluvqOWAcxdu31483tOR9I3sXTC1+Z0Kr2r1YDruXhEHqt1xoDEEOJYyfkxiZM
 HGvFOX4XWaJXd9VVlPSDqz2ZqAyw0sF+nZXVMnG6uVo2su0BSCtRIc8O1f73N69MOGgt
 Gzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728432173; x=1729036973;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yxwtbH453mr49OxFcpLGTroCcnxd3uo1nzwIRj8mAjY=;
 b=acghQeGZJtI0/90QACrInSRnf3jHXw7aXvYfJsU8f2t+3qqQSikvBI20wKFkXWD3Gu
 tqWKWy8pmMCWFbrwGU+oj80w71BRMS6/AGADhJFZhPlZJK8KnWB9guBwOgzgqaULE/bI
 QCwFTtevJoPib8Nx6OWzi4VxKCRVCAbRkP+CrSRNQZRtvgJdabeQ/QLxDuImMxY1T8zN
 RoQMNSjYp0llsBRXeX8tcmr3NEe1+B07NHxFxp4lxQ8FfJtW2kEpD87veNL3fehV7PBG
 kEJb1CCj0NYyE6OdftN6H/8KNbnReEnadY6kefzWmVVr+QBrNL4FQ0pauLhLkij24p/2
 AaIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH16h5xwkbLLTTX6x+VBsfYyelhj30W+DZ1Dv7XJnEYdeoOK6EXQ+qWtW1ZP761WbVcJPgGmSnoF5E4Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxbRcIiMGcWyu+NyV1bxN6jpkYgKRw6FlTWWEy/NLSiyvmn/Iax
 2HbhylGXrDdiUn9bxWsyWERRAQffEznq2B7FpIAGf5rFS+Hyfb5H
X-Google-Smtp-Source: AGHT+IFfScSg3RqS13Zl0PHySDZWYYC+q7HHP6edX40rKGP/tQPnLvRLh2CIs9u4G9RZhlvjAnDbSA==
X-Received: by 2002:ac2:4e08:0:b0:533:46cc:a736 with SMTP id
 2adb3069b0e04-539c49481b2mr207653e87.37.1728432173098; 
 Tue, 08 Oct 2024 17:02:53 -0700 (PDT)
Received: from mobilestation ([85.249.16.95]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff2346csm1365785e87.210.2024.10.08.17.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 17:02:51 -0700 (PDT)
Date: Wed, 9 Oct 2024 03:02:46 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Message-ID: <rxv7tlvbl57yq62obsqtgr7r4llnb2ejjlaeausfxpdkxgxpyo@kqrgq2hdodts>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
 <vjmounqvfxzqpdsvzs5tzlqv7dfb4z2nect3vmuaohtfm6cn3t@qynqp6zqcd3s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <vjmounqvfxzqpdsvzs5tzlqv7dfb4z2nect3vmuaohtfm6cn3t@qynqp6zqcd3s>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 00/13] net: pcs: xpcs: cleanups
	batch 2
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

On Sat, Oct 05, 2024 at 02:40:42AM GMT, Serge Semin wrote:
> Hi
> 
> On Fri, Oct 04, 2024 at 11:19:57AM GMT, Russell King (Oracle) wrote:
> > This is the second cleanup series for XPCS.
> > 
> > ...
> 
> If you don't mind I'll test the series out on Monday or Tuesday on the
> next week after my local-tree changes concerning the DW XPCS driver
> are rebased onto it.

As promised just finished rebasing the series onto the kernel 6.12-rc2
and testing it out on the next HW setup:

DW XGMAC <-(XGMII)-> DW XPCS <-(10Gbase-R)-> Marvell 88x2222
<-(10gbase-r)->
SFP+ DAC SFP+
<-(10gbase-r)->
Marvell 88x2222 <-(10gbase-r)-> DW XPCS <-(XGMII)-> DW XGMAC

No problem has been spotted.

Tested-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> -Serge(y)
> 
> > 
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |   2 +-
> >  drivers/net/pcs/pcs-xpcs-nxp.c                    |  24 +-
> >  drivers/net/pcs/pcs-xpcs-wx.c                     |  56 ++-
> >  drivers/net/pcs/pcs-xpcs.c                        | 445 +++++++++-------------
> >  drivers/net/pcs/pcs-xpcs.h                        |  26 +-
> >  include/linux/pcs/pcs-xpcs.h                      |  19 +-
> >  6 files changed, 237 insertions(+), 335 deletions(-)
> > 
> > -- 
> > RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> > FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
