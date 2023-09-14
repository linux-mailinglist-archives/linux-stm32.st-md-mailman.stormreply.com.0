Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFF17A0339
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 14:01:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72F9FC65E4F;
	Thu, 14 Sep 2023 12:01:45 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44138C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 12:01:44 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5008d16cc36so1514126e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 05:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694692903; x=1695297703;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=emkGVKouUJrBtnPp5Nr9/BB1K2zb2xXmCpPUHH1F+wU=;
 b=CkKUDBr2W8XbxkXkT/FobfI/mtkg8MKTPDxursKMamk012DmDZfoAoqPATkJCl8npg
 tiBYo3f5rOKPI9UtvLJf821zLVOqoE+xCo9JeobBdpuFm0XWocJhBXEC9SdVfrvp+dIL
 /muVEIjAJRLdvksixGLd0f03V3xKfVmhv7VCOdTaay7OGEo5Kl4Pt1XS558xDXLw6mja
 y9ETeOw7xDSWKdxQjHu4bJ++l8qfFUoKl8Ohgg9bzlslea2J3E9ZOmIoIwRQtpahLNFH
 K9Lx4W0FR377rlJJ/O7LM4AnUDm96E4adfd48pwS5gL378dVQaQNKS55SdIwyy7wWOOv
 RXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694692903; x=1695297703;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emkGVKouUJrBtnPp5Nr9/BB1K2zb2xXmCpPUHH1F+wU=;
 b=FIGcD8f9Xb4cBz0n0CHiNciUp2HPkHBU1eUvMyW0KN2LPnvsNivj5VgmR+zJVwKXVU
 ShH0K8l9dbnkHMJpBBgnVYXAS4uxbLe4+sAzWOWswpQA7/CmArSerAijI0oPkOJh1I97
 RrFujobCcvbjBDxy1cpY9NelxC1/oykyFYQYXVPG1X4kOJyhgAPk7kwql4jmx54j7JAi
 HDGe0h+OVDt5nnKB087NDmjGCIo7UzT7Zspge0L0NMD8CvWe1PfcftBqweIcvSDH6SWG
 o0wm2aIbgZnJm8EoWyS0cd7aIV3ABZ2NuFMdds/ckNUsXkAUie28BZlh3lr/mamJKXOt
 F1cw==
X-Gm-Message-State: AOJu0Yxj5CYZIUnaKoTcvpTnGX5DDtvAvkZOxmk/kxOmML7UtpKS7MEN
 Mp5z98mDj4sA+gh/RJImjHE=
X-Google-Smtp-Source: AGHT+IENInv5YwFRnvWNyYiTgsMpCzu2H4RJvhDItKFH9oeUIKP1yOl2JHQZNyXplyYJzDxN8iZ0Jg==
X-Received: by 2002:ac2:4e03:0:b0:502:d862:cc36 with SMTP id
 e3-20020ac24e03000000b00502d862cc36mr5091511lfr.53.1694692902396; 
 Thu, 14 Sep 2023 05:01:42 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 r13-20020ac25a4d000000b004ff9bfda9d6sm250304lfn.212.2023.09.14.05.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 05:01:41 -0700 (PDT)
Date: Thu, 14 Sep 2023 15:01:39 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <eqnbmp7zzu7hya5mqpf7oyhbbf4itx2z7x3xuiaibadb23l5cd@dixfkwnvqrah>
References: <E1qfiq8-007TOe-9F@rmk-PC.armlinux.org.uk>
 <DM4PR12MB5088F83CE829184956147E6BD3F1A@DM4PR12MB5088.namprd12.prod.outlook.com>
 <u7sabfdqk7i6wlv2j4cxuyb6psjwqs2kukdkafhcpq2zc766m3@m6iqexqjrvkv>
 <ZQCbB3qZlTvIM7rf@shell.armlinux.org.uk>
 <okbvyvjjww5mvwj2ogrphfsy66gx2bjn4fl27vywbl52gdgwe5@aps4umive6lk>
 <ZQHD16KIF4Z++w0I@shell.armlinux.org.uk>
 <ZQHFVmWPkamDGBAW@shell.armlinux.org.uk>
 <a2nsiguc6d64twnlbi3qlnsb35e3dyeahf366wora7rjwkl6cm@tnpgman6y23d>
 <ZQLk6kvggzlDUyS2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQLk6kvggzlDUyS2@shell.armlinux.org.uk>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Samin Guo <samin.guo@starfivetech.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: add platform
	library
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

On Thu, Sep 14, 2023 at 11:48:10AM +0100, Russell King (Oracle) wrote:
> On Thu, Sep 14, 2023 at 01:42:19PM +0300, Serge Semin wrote:
> > On Wed, Sep 13, 2023 at 03:21:10PM +0100, Russell King (Oracle) wrote:
> > > On Wed, Sep 13, 2023 at 03:14:47PM +0100, Russell King (Oracle) wrote:
> > > > On Wed, Sep 13, 2023 at 03:56:07AM +0300, Serge Semin wrote:
> > > > > On Tue, Sep 12, 2023 at 06:08:23PM +0100, Russell King (Oracle) wrote:
> > > > > > On Tue, Sep 12, 2023 at 12:32:40PM +0300, Serge Semin wrote:
> > > > > > > On Tue, Sep 12, 2023 at 07:59:49AM +0000, Jose Abreu wrote:
> > > > > > > > From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > > > > > Date: Mon, Sep 11, 2023 at 16:28:40
> > > > > > > > 
> > > > > > > > > Add a platform library of helper functions for common traits in the
> > > > > > > > > platform drivers. Currently, this is setting the tx clock.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > > > > > > ---
> > > > > > > 
> > > > > > > > >  drivers/net/ethernet/stmicro/stmmac/Makefile  |  2 +-
> > > > > > > > >  .../ethernet/stmicro/stmmac/stmmac_plat_lib.c | 29 +++++++++++++++++++
> > > > > > > > >  .../ethernet/stmicro/stmmac/stmmac_plat_lib.h |  8 +++++
> > > > > > > > 
> > > > > > > > Wouldn't it be better to just call it "stmmac_lib{.c,.h}" in case we need to add
> > > > > > > > more helpers on the future that are not only for platform-based drivers?
> > > > > > > 
> > > > > > > What is the difference between stmmac_platform.{c,h} and
> > > > > > > stmmac_plat_lib.{c,h} files? It isn't clear really. In perspective it
> > > > > > > may cause confusions like mixed definitions in both of these files.
> > > > > > > 
> > > > > > > Why not to use the stmmac_platform.{c,h} instead of adding one more
> > > > > > > file?
> > > > > > 
> > > > > 
> > > > > > Is stmmac_platform.{c,h} used by all the drivers that are making use of
> > > > > > this? I'm not entirely sure.
> > > > > > 
> > > > > > If it is, then yes, it can go in stmmac_platform.[ch]. If not, then I
> > > > > > don't think we'd want the bloat of forcing all of stmmac_platform.[ch]
> > > > > > onto drivers that only want to use this one function.
> > > > > 
> > > > > With a few exceptions almost all the STMMAC/DW*MAC glue drivers use
> > > > > the methods from the stmmac_platform.c module including the bits
> > > > > touched by your patchset. AFAICS semantically both stmmac_platform.c
> > > > > and stmmac_plat_lib.c look the same. They don't do anything on its own
> > > > > but provide some common methods utilized by the glue drivers for some
> > > > > platform-specific setups. So basically stmmac_platform.[ch] is already
> > > > > a library of the common platform methods. There is no need in creating
> > > > > another one.
> > > > 
> > > > I'm not questioning whether it should be merged, I'm questioning whether
> > > > all drivers that I'm touching make use of stmmac_platform.c, so your
> > > > long winded answer was entirely unnecessary. All you needed to do was
> > > > answer the question I asked, rather than teach me how to suck eggs.
> > > 
> > 
> > > So what about the name of the function? Are you happy that it's called
> > > "dwmac_set_tx_clk_gmii" rather than "stmmac_set_tx_clk_gmii" ?
> > 
> > Not really. I would suggest to preserve the local naming convention:
> > 1. Generic names have stmmac_ prefix.
> > 2. DW *MAC IP-core-specific names have dw(xg|xlg)?mac(100|1000|2|4|5)?_ prefixes.
> > Alas it was violated in some places (like norm_desc and enh_desc.c
> > files) but is still mainly preserved in the driver especially in the
> > stmmac_platform.c which is concerned in this case.
> 

> Thanks... so now I have you down as a single-issue reviewer - you spot
> something, you comment on it, and that's as far as you go. You don't
> seem to bother continuing the review and raising other points - which
> leads to lots of wasted time, and lots of patch set iterations, lots
> of email on mailing lists, etc.
> 
> Do you think you could review the other patches before I go to the
> trouble of spinning a v2 please?

Ok. One more note about this patch:

> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.c
> @@ -0,0 +1,29 @@
> +#include <linux/stmmac.h>
> +#include <linux/clk.h>
> +
> +#include "stmmac_plat_lib.h"
> +
> +int dwmac_set_tx_clk_gmii(struct clk *tx_clk, int speed)
> +{
> +       unsigned long rate;
> +
> +       switch (speed) {
> +       case SPEED_1000:
> +               rate = 125000000;
> +               break;

> +

It's not described in the kernel coding style, but normally the
switch-case operations are defined with no additional line separating
the cases (I guess it gets to be redundant due to the indentations
visually separating the parts anyway). I would have dropped the empty
lines here too especially seeing the stmmac core driver mainly follow
that implicit convention.

> +       case SPEED_100:
> +               rate = 25000000;
> +               break;

> +

ditto

> +       case SPEED_10:
> +               rate = 2500000;
> +               break;

> +

ditto

-Serge(y)

> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       return clk_set_rate(tx_clk, rate);
> +}
> +EXPORT_SYMBOL_GPL(dwmac_set_tx_clk_gmii);

...

> 
> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
