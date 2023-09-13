Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC6979DD46
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Sep 2023 02:56:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54101C6B475;
	Wed, 13 Sep 2023 00:56:12 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18FD9C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Sep 2023 00:56:11 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2bcc331f942so5161161fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 17:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694566570; x=1695171370;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TKovJZqebXJbOFUyHFPe+N2WMCwxRV8QMx9N79j3g7c=;
 b=BQtBCVEEIzLT+H4qtAwEJBd0+tZCCeX+B5fGkZmgws4ZBjR5wNv+5822y3vfTtIThV
 CfOyprLRqg2bcouytw+fg9eMabqm6ZGzbLaIgMWTlXiM1ak9dsIY2oJdydNEjl4DX0/S
 jY3no0UGtzlifQmkad6ktyM/22GKFtHXVvcqz9BeRSCrOhy5Y0q+eYJ996AHEUpbqeKt
 mabdqchs52ihs2e+axZ5GkiTAhVvWdw3PRbsZsrtZutUnG1Lq07OXYlFhOHJbMRb7lIP
 JSioSCuAs7yJ2+ZHWTLiKkfMqWZxLoLPOa6wDUbjk2rnVDydBcFUpibCASQB857Xfqow
 cavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694566570; x=1695171370;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TKovJZqebXJbOFUyHFPe+N2WMCwxRV8QMx9N79j3g7c=;
 b=Qj4oSoVE+dLhn2pnBtr3B+H7ei/BL9onR/FPLgMj8DLPQVUCtBMdYiO8jkKF+yDpuV
 /bWZAljuO1gjXCYQtXELETqtGF1P/v25UuzJr9n6nTuMUwg55G6RwnYBIXAlhzOscN4P
 evwTTji+SC6M3VLaK2rgcOPUGIpnQoEfLa1gYCUn0yKFLrFrgXZ/O5LdHw9m6a7Fbb1s
 BXGneJjg1Q60tPG0l3JF+4qgjddnFO065lmg6uuhshtZ2mUICFNIrEv5hxQVvw2YX/Wm
 QOndoLryBbvr7QVw7V/dHm5KN4y+SDxMr+zcAs/gH1yQNEbrtCe9bOneACrHPTFdGh6v
 mqQw==
X-Gm-Message-State: AOJu0YyINbUP354M6FS8ecuJbUhrOZMhhhEaOVUjPPTQdEBCrQ29VY/g
 BWO8kutrNt3SuPRqyxHb930=
X-Google-Smtp-Source: AGHT+IHUrxU60J1tom9TqtgSJejIbp2hGaIwb6cddhpFYE26qISZmBLljXKw2AjEbpsbuPyzWyUTEg==
X-Received: by 2002:a2e:6812:0:b0:2bc:ff6c:3018 with SMTP id
 c18-20020a2e6812000000b002bcff6c3018mr370809lja.21.1694566569782; 
 Tue, 12 Sep 2023 17:56:09 -0700 (PDT)
Received: from mobilestation ([95.79.219.206])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a2e2c0a000000b002b836d8c839sm2151252ljs.40.2023.09.12.17.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 17:56:09 -0700 (PDT)
Date: Wed, 13 Sep 2023 03:56:07 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <okbvyvjjww5mvwj2ogrphfsy66gx2bjn4fl27vywbl52gdgwe5@aps4umive6lk>
References: <E1qfiq8-007TOe-9F@rmk-PC.armlinux.org.uk>
 <DM4PR12MB5088F83CE829184956147E6BD3F1A@DM4PR12MB5088.namprd12.prod.outlook.com>
 <u7sabfdqk7i6wlv2j4cxuyb6psjwqs2kukdkafhcpq2zc766m3@m6iqexqjrvkv>
 <ZQCbB3qZlTvIM7rf@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQCbB3qZlTvIM7rf@shell.armlinux.org.uk>
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

On Tue, Sep 12, 2023 at 06:08:23PM +0100, Russell King (Oracle) wrote:
> On Tue, Sep 12, 2023 at 12:32:40PM +0300, Serge Semin wrote:
> > On Tue, Sep 12, 2023 at 07:59:49AM +0000, Jose Abreu wrote:
> > > From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > Date: Mon, Sep 11, 2023 at 16:28:40
> > > 
> > > > Add a platform library of helper functions for common traits in the
> > > > platform drivers. Currently, this is setting the tx clock.
> > > > 
> > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > ---
> > 
> > > >  drivers/net/ethernet/stmicro/stmmac/Makefile  |  2 +-
> > > >  .../ethernet/stmicro/stmmac/stmmac_plat_lib.c | 29 +++++++++++++++++++
> > > >  .../ethernet/stmicro/stmmac/stmmac_plat_lib.h |  8 +++++
> > > 
> > > Wouldn't it be better to just call it "stmmac_lib{.c,.h}" in case we need to add
> > > more helpers on the future that are not only for platform-based drivers?
> > 
> > What is the difference between stmmac_platform.{c,h} and
> > stmmac_plat_lib.{c,h} files? It isn't clear really. In perspective it
> > may cause confusions like mixed definitions in both of these files.
> > 
> > Why not to use the stmmac_platform.{c,h} instead of adding one more
> > file?
> 

> Is stmmac_platform.{c,h} used by all the drivers that are making use of
> this? I'm not entirely sure.
> 
> If it is, then yes, it can go in stmmac_platform.[ch]. If not, then I
> don't think we'd want the bloat of forcing all of stmmac_platform.[ch]
> onto drivers that only want to use this one function.

With a few exceptions almost all the STMMAC/DW*MAC glue drivers use
the methods from the stmmac_platform.c module including the bits
touched by your patchset. AFAICS semantically both stmmac_platform.c
and stmmac_plat_lib.c look the same. They don't do anything on its own
but provide some common methods utilized by the glue drivers for some
platform-specific setups. So basically stmmac_platform.[ch] is already
a library of the common platform methods. There is no need in creating
another one.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
