Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CA7A01DD
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 12:42:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93B63C6B46F;
	Thu, 14 Sep 2023 10:42:26 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C840BC6B462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 10:42:25 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-502934c88b7so1358613e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 03:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694688145; x=1695292945;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1ITCKmNSgnlKU8ryO32ZWr7oE65pMrNKWroKmW3MO18=;
 b=WkQdvoQzMh797TznYIRXGX5D5IzDFAAvgoI9W99THjcp7gKmZT+YPWm+8cCF51B992
 WtXZCcyCa4mPxztuNWlukjoNy35rBsFHuZjz8A7j/HU3BsVpHONanfH0HngKa4KtKnRZ
 ok79rqFqdwwn7yZ3XOc9Rv6qkH544gT4HEeKHM4ad6A19wViOm0KkYwxooQ1sI6Fb1Fd
 YpVCEI1b6gyoKRH0dU621Hu4hbVyXX4dOYRMLVJG30jjoWGOcJE7U5x01oNgzKenBG7j
 1jsmIIBE4Vsh85Zv+BtAq706DcNi5BwYaq5Q5aDslQaCvM4Yjb7mPg8MbXennFB6AbvP
 F1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694688145; x=1695292945;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ITCKmNSgnlKU8ryO32ZWr7oE65pMrNKWroKmW3MO18=;
 b=MyOJwHIHnCnE4GWrYUT5p6+M/SGZYh8RWcySgS5jKolL1y4tgbnU5ZPo0Wk4BcT/JZ
 OaZ3u2xCjnQhcfAJtPbmu67ou3SH1W63pJbEaszX2gPSS3UDS9UHvhBym+1tL7BdgyHj
 RW34XkobG5OO2mWyWeJSfECWnXoE+qS3a9fAsRrnKDflPm6IYCsZCjNEelj9d/ytHQI9
 lXwMKL/fLlIUerYPFqD1y62iaiLwmMa9zzUclnJIJu3ZyVLgMylPOVQqd2/o14JFuGGB
 4lZttlSqJai/qwrZaHlYffO07rAMhwfFCsjt94se3Toag4RYAllWSWbD5+GRgA7Agbh5
 N+Og==
X-Gm-Message-State: AOJu0YwuvltqZPGLs56Hy/36Kkxj84pVz+aLv+39PdtKtsMxTBa764i3
 i6SEGKWEjI8YZlfGEzbTQ4I=
X-Google-Smtp-Source: AGHT+IHg/+sCQeoJjEDHCBmloSZO6+xlCNL2zw0Hekm7iUGgLmI7GGT9hhLH3z7kOhMfwaa9vZPqiQ==
X-Received: by 2002:a19:790d:0:b0:4ff:a25b:bca1 with SMTP id
 u13-20020a19790d000000b004ffa25bbca1mr3542285lfc.33.1694688144490; 
 Thu, 14 Sep 2023 03:42:24 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a19550c000000b004fe432108absm226196lfe.182.2023.09.14.03.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 03:42:24 -0700 (PDT)
Date: Thu, 14 Sep 2023 13:42:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <a2nsiguc6d64twnlbi3qlnsb35e3dyeahf366wora7rjwkl6cm@tnpgman6y23d>
References: <E1qfiq8-007TOe-9F@rmk-PC.armlinux.org.uk>
 <DM4PR12MB5088F83CE829184956147E6BD3F1A@DM4PR12MB5088.namprd12.prod.outlook.com>
 <u7sabfdqk7i6wlv2j4cxuyb6psjwqs2kukdkafhcpq2zc766m3@m6iqexqjrvkv>
 <ZQCbB3qZlTvIM7rf@shell.armlinux.org.uk>
 <okbvyvjjww5mvwj2ogrphfsy66gx2bjn4fl27vywbl52gdgwe5@aps4umive6lk>
 <ZQHD16KIF4Z++w0I@shell.armlinux.org.uk>
 <ZQHFVmWPkamDGBAW@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQHFVmWPkamDGBAW@shell.armlinux.org.uk>
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

On Wed, Sep 13, 2023 at 03:21:10PM +0100, Russell King (Oracle) wrote:
> On Wed, Sep 13, 2023 at 03:14:47PM +0100, Russell King (Oracle) wrote:
> > On Wed, Sep 13, 2023 at 03:56:07AM +0300, Serge Semin wrote:
> > > On Tue, Sep 12, 2023 at 06:08:23PM +0100, Russell King (Oracle) wrote:
> > > > On Tue, Sep 12, 2023 at 12:32:40PM +0300, Serge Semin wrote:
> > > > > On Tue, Sep 12, 2023 at 07:59:49AM +0000, Jose Abreu wrote:
> > > > > > From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > > > Date: Mon, Sep 11, 2023 at 16:28:40
> > > > > > 
> > > > > > > Add a platform library of helper functions for common traits in the
> > > > > > > platform drivers. Currently, this is setting the tx clock.
> > > > > > > 
> > > > > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > > > > ---
> > > > > 
> > > > > > >  drivers/net/ethernet/stmicro/stmmac/Makefile  |  2 +-
> > > > > > >  .../ethernet/stmicro/stmmac/stmmac_plat_lib.c | 29 +++++++++++++++++++
> > > > > > >  .../ethernet/stmicro/stmmac/stmmac_plat_lib.h |  8 +++++
> > > > > > 
> > > > > > Wouldn't it be better to just call it "stmmac_lib{.c,.h}" in case we need to add
> > > > > > more helpers on the future that are not only for platform-based drivers?
> > > > > 
> > > > > What is the difference between stmmac_platform.{c,h} and
> > > > > stmmac_plat_lib.{c,h} files? It isn't clear really. In perspective it
> > > > > may cause confusions like mixed definitions in both of these files.
> > > > > 
> > > > > Why not to use the stmmac_platform.{c,h} instead of adding one more
> > > > > file?
> > > > 
> > > 
> > > > Is stmmac_platform.{c,h} used by all the drivers that are making use of
> > > > this? I'm not entirely sure.
> > > > 
> > > > If it is, then yes, it can go in stmmac_platform.[ch]. If not, then I
> > > > don't think we'd want the bloat of forcing all of stmmac_platform.[ch]
> > > > onto drivers that only want to use this one function.
> > > 
> > > With a few exceptions almost all the STMMAC/DW*MAC glue drivers use
> > > the methods from the stmmac_platform.c module including the bits
> > > touched by your patchset. AFAICS semantically both stmmac_platform.c
> > > and stmmac_plat_lib.c look the same. They don't do anything on its own
> > > but provide some common methods utilized by the glue drivers for some
> > > platform-specific setups. So basically stmmac_platform.[ch] is already
> > > a library of the common platform methods. There is no need in creating
> > > another one.
> > 
> > I'm not questioning whether it should be merged, I'm questioning whether
> > all drivers that I'm touching make use of stmmac_platform.c, so your
> > long winded answer was entirely unnecessary. All you needed to do was
> > answer the question I asked, rather than teach me how to suck eggs.
> 

> So what about the name of the function? Are you happy that it's called
> "dwmac_set_tx_clk_gmii" rather than "stmmac_set_tx_clk_gmii" ?

Not really. I would suggest to preserve the local naming convention:
1. Generic names have stmmac_ prefix.
2. DW *MAC IP-core-specific names have dw(xg|xlg)?mac(100|1000|2|4|5)?_ prefixes.
Alas it was violated in some places (like norm_desc and enh_desc.c
files) but is still mainly preserved in the driver especially in the
stmmac_platform.c which is concerned in this case.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
