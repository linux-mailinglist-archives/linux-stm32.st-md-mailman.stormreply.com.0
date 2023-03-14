Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A42306B91D0
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 12:38:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5615FC65E60;
	Tue, 14 Mar 2023 11:38:57 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51D6AC035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 11:38:56 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id t11so19606900lfr.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 04:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678793935;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gd+/D1mauSkZb0YeUtA3Fwrhf1kTYNf5H6shW8c9DGk=;
 b=i8DtvnAWLdcjjx1EkeFhNg73kVk+GcIZalysrZVQeglMsALIGdeMgvbmf1v/kDo9jQ
 dVbK9VpavPgWuMWgXddXV598kHjt4MpWsNup2RBWqIpl4KsnSuAdwAkblvQBkEolhbMO
 7ffuoB6nbQvurBptf5CrsoqmUwgF36u+vCFyIY5vXHrkexKvGRyKziX9e5xQGOuNMGn7
 wJVYYkieXzNri2Ly5r1EwLiOpKuxQQtS3F8I7ojAh0gIbg5x+/1d2Bn52PYpT482G1/F
 qnT9JbG/iGb4FzVWRHh5ukOo4rWPXVTU2oYhOMgL/Gd7aXj9/BBrcNoK34pHqGd/93Gn
 wvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678793935;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gd+/D1mauSkZb0YeUtA3Fwrhf1kTYNf5H6shW8c9DGk=;
 b=55quL0l0fhSgj6QnrXZJKtXguFR1nNz1RkWkjW07JmQpUC5/EikC4hK712VKeaVlEl
 yJc0xoRNuNrzlyMXhoQ2MOSqG0jnOSyp3xqrhxPYuSQGFiwUczk4JvAiTPiHO0G0ekR6
 Aqc3YagsUogUJuX1q8uvbGQTwOqvwcJ1DOhdeYBtY3rpyGGpDtwQ3EeEu2sxCsfcd6eS
 FokM7zQuUKPd1GcnY68TnQTyFdBUljkjKcZEkGVDzlw4a4NmsfU+opnYsKlk+IGK8asS
 5J362WEHhPV7HWrMpMnW/3iFZiosnKRE27jO+w0fCjWJVwiJL3q3eOP7Q1VyektHNbMI
 s8rA==
X-Gm-Message-State: AO0yUKWNt546W66QEG/1Q2fVa5pc2Gf52J3e56wQmKkWfDPsVBYTgHKW
 kml3KNiPAAIdwHb2tDgPgoM=
X-Google-Smtp-Source: AK7set/aEFZcvx3G3XImbxduxLVpd98MXCjNyOgm0Y7UZEaptGxI7Jhg4YmVr9xlvV7X7mVwoHdbYA==
X-Received: by 2002:ac2:485c:0:b0:4d1:7923:3b90 with SMTP id
 28-20020ac2485c000000b004d179233b90mr635370lfy.32.1678793935375; 
 Tue, 14 Mar 2023 04:38:55 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a056512007000b004db26660d86sm369785lfo.95.2023.03.14.04.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 04:38:54 -0700 (PDT)
Date: Tue, 14 Mar 2023 14:38:51 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Piotr Raczynski <piotr.raczynski@intel.com>
Message-ID: <20230314113851.g5qp5ee5eyzslac5@mobilestation>
References: <20230313224237.28757-1-Sergey.Semin@baikalelectronics.ru>
 <20230313224237.28757-14-Sergey.Semin@baikalelectronics.ru>
 <ZBAuWk9lnGjeuvKC@nimitz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZBAuWk9lnGjeuvKC@nimitz>
Cc: Andrew Lunn <andrew@lunn.ch>, Qing Zhang <zhangqing@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Eric Dumazet <edumazet@google.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Yang Yingliang <yangyingliang@huawei.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Christian Marangi <ansuelsmth@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net 13/13] net: dwmac-loongson: Perceive
 zero IRQ as invalid
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

On Tue, Mar 14, 2023 at 09:20:42AM +0100, Piotr Raczynski wrote:
> On Tue, Mar 14, 2023 at 01:42:37AM +0300, Serge Semin wrote:
> > Linux kernel defines zero IRQ number as invalid in case if IRQ couldn't be
> > mapped. Fix that for Loongson PCI MAC specific IRQs request procedure.
> > 
> 

> Looks a little odd but as I also checked and kernel does seem to treat
> zero as mapping failure instead of -WHATEVER.

See what Linus originally told about that:
https://lore.kernel.org/lkml/Pine.LNX.4.64.0701250940220.25027@woody.linux-foundation.org/

> 
> Fix looks fine.
> 
> Reviewed-by: Piotr Raczynski <piotr.raczynski@intel.com>

Thanks.

-Serge(y)

> 
> > Fixes: 30bba69d7db4 ("stmmac: pci: Add dwmac support for Loongson")
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > index a25c187d3185..907bdfcc07e9 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > @@ -127,20 +127,20 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
> >  	res.addr = pcim_iomap_table(pdev)[0];
> >  
> >  	res.irq = of_irq_get_byname(np, "macirq");
> > -	if (res.irq < 0) {
> > +	if (res.irq <= 0) {
> >  		dev_err(&pdev->dev, "IRQ macirq not found\n");
> >  		ret = -ENODEV;
> >  		goto err_disable_msi;
> >  	}
> >  
> >  	res.wol_irq = of_irq_get_byname(np, "eth_wake_irq");
> > -	if (res.wol_irq < 0) {
> > +	if (res.wol_irq <= 0) {
> >  		dev_info(&pdev->dev, "IRQ eth_wake_irq not found, using macirq\n");
> >  		res.wol_irq = res.irq;
> >  	}
> >  
> >  	res.lpi_irq = of_irq_get_byname(np, "eth_lpi");
> > -	if (res.lpi_irq < 0) {
> > +	if (res.lpi_irq <= 0) {
> >  		dev_err(&pdev->dev, "IRQ eth_lpi not found\n");
> >  		ret = -ENODEV;
> >  		goto err_disable_msi;
> > -- 
> > 2.39.2
> > 
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
