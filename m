Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B7D18617D
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2020 03:17:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DAE8C36B0B;
	Mon, 16 Mar 2020 02:17:46 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFCDAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2020 02:17:44 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g6so7269051plt.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2020 19:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qWjBZjkx/KY8oeosSpB9MAxoMYpT7Z/9Dd9HUziHQCo=;
 b=TGqbQ6O1HzIXJAmUYkTcbObT8QAmErwTVdiAxeK7pZ4bDCI/CJ6m6H8xDzUP9gz0+i
 fSCRDMrYZhHgvU9DLCpfWsQSHZO7Nn7OtKE2CBchARrdH7O39In+Zfodd1y1ZSRtj93E
 R3bVRUQyv1JPlang3KriuWWgp0LjMks4SJKtbIcueuV+fX/T1x++8AWlSR/p7K3wQLnA
 tnTbJSpaPsPfQuPjctU9EzmBPo363wshN7EhePGon5nhS9kh3aT/SRJs2cfjhkVl3i8n
 pjKgydM/sfBWG9mNJOFv0mrdM1EOws14tO37iMVZeXDpLzi7YNgDhfsLdoZB+93jusqP
 6VdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qWjBZjkx/KY8oeosSpB9MAxoMYpT7Z/9Dd9HUziHQCo=;
 b=ISxOTj4agU4jt3B3IWzJ0IKamdjcCy7ADDApZHvVAF2dWNfeQQx6ZEBw9Hf7gyymd3
 ZOAU3Xp/FpxKQLuCrraFaXyPXi+7yGVPcY7BNsBuvfD9+yV1doJenXqU2aaxDU946c3I
 NAwfR6cHuSh1swNXHJ39LizGhH23N8IuYW/GPn0maAYGNLmoVhkRStgK/RfE71AbMOVe
 ua3r/d5BajtHQtqLvbrazmAGWXPtlyjo3qUNrvXay/102t/muSln/ShIQvBxxu21Lr1F
 Bfvl+PpsEwhc9PishID+jtGMjUYK94RtuHf1vx1CTf4Ar43SI0FQvZZ7fPEmVaTh1NCo
 qJzA==
X-Gm-Message-State: ANhLgQ0opjOqoO3O8toXfaz/jfModcUS6qLLvk85PsJNraLW814u1wie
 haNqcXXy3WhKcKr1I5O9GCM=
X-Google-Smtp-Source: ADFU+vvSlXruOq6QGZEaPnd9d+OEhOdhxSx/jKZA5JkbYveY8eFrZeTezL22IYW2GE+BrhiktXdAsw==
X-Received: by 2002:a17:902:bb92:: with SMTP id
 m18mr24764047pls.46.1584325063169; 
 Sun, 15 Mar 2020 19:17:43 -0700 (PDT)
Received: from localhost (216.24.188.11.16clouds.com. [216.24.188.11])
 by smtp.gmail.com with ESMTPSA id s25sm4830589pgv.70.2020.03.15.19.17.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Mar 2020 19:17:42 -0700 (PDT)
Date: Mon, 16 Mar 2020 10:17:40 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20200316021740.GA3024@nuc8i5>
References: <20200315150301.32129-1-zhengdejin5@gmail.com>
 <20200315150301.32129-2-zhengdejin5@gmail.com>
 <20200315182504.GA8524@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315182504.GA8524@lunn.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/2] net: stmmac: use
 readl_poll_timeout() function in init_systime()
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

On Sun, Mar 15, 2020 at 07:25:04PM +0100, Andrew Lunn wrote:

Hi Andrew and David :

> On Sun, Mar 15, 2020 at 11:03:00PM +0800, Dejin Zheng wrote:
> > The init_systime() function use an open coded of readl_poll_timeout().
> > Replace the open coded handling with the proper function.
> > 
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > ---
> > v1 -> v2:
> > 	- no changed.
> > 
> >  .../net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> > index 020159622559..2a24e2a7db3b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> > @@ -10,6 +10,7 @@
> >  *******************************************************************************/
> >  
> >  #include <linux/io.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/delay.h>
> >  #include "common.h"
> >  #include "stmmac_ptp.h"
> > @@ -53,8 +54,8 @@ static void config_sub_second_increment(void __iomem *ioaddr,
> >  
> >  static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
> >  {
> > -	int limit;
> >  	u32 value;
> > +	int err;
> >  
> >  	writel(sec, ioaddr + PTP_STSUR);
> >  	writel(nsec, ioaddr + PTP_STNSUR);
> > @@ -64,13 +65,10 @@ static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
> >  	writel(value, ioaddr + PTP_TCR);
> >  
> >  	/* wait for present system time initialize to complete */
> > -	limit = 10;
> > -	while (limit--) {
> > -		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSINIT))
> > -			break;
> > -		mdelay(10);
> > -	}
> > -	if (limit < 0)
> > +	err = readl_poll_timeout(ioaddr + PTP_TCR, value,
> > +				 !(value & PTP_TCR_TSINIT),
> > +				 10000, 100000);
> > +	if (err)
> >  		return -EBUSY;
> 
> Hi Dejin
> 
> It is normal to just return whatever error code readl_poll_timeout()
> returned.
> 
> 	Andrew

You are right. I will modify it. Thanks!

BR,
Dejin

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
