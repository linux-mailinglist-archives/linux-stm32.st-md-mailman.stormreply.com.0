Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2F679D738
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 19:08:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBEA7C6B46F;
	Tue, 12 Sep 2023 17:08:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4B0BC6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 17:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=okqCnYbVQy91IAARHaNw8z0HLkZIzOCxSpKxVhlRnDE=; b=ikwUZiOidDIBI0VTVnEZezBfPj
 X2vSR01jJ6MEKD9FSvtk2tVycPlBwXdDNVb8nMyFbVlW+GCQ9cKJqzuXDyQ1SEvStlISB3iY4zFyO
 nArg86HQoEAOCulQDUCN3Tzn+Nt9su/nwR37Su4OI3k7TlPHeeRkAanZSJyzurAF28GVg+yrgHSsd
 5WQcUXmyZDRGF0k6FRVDgJowMJzgah+XOVdj+UjeeEsMcWqT0e8Bn8L2TcefZVHYz5nwhmRxf9Qbw
 Rcwqp1/FwfrBkyDVBKLW5Gvm1TSGdGiPNm1K/Lcec55E8JPSfbuzOyD2YN+x4ZsYXMhCH1TKrAapn
 JyeT2wGQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50484)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qg6sG-0001Ud-27;
 Tue, 12 Sep 2023 18:08:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qg6sB-0002sJ-PK; Tue, 12 Sep 2023 18:08:23 +0100
Date: Tue, 12 Sep 2023 18:08:23 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZQCbB3qZlTvIM7rf@shell.armlinux.org.uk>
References: <E1qfiq8-007TOe-9F@rmk-PC.armlinux.org.uk>
 <DM4PR12MB5088F83CE829184956147E6BD3F1A@DM4PR12MB5088.namprd12.prod.outlook.com>
 <u7sabfdqk7i6wlv2j4cxuyb6psjwqs2kukdkafhcpq2zc766m3@m6iqexqjrvkv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <u7sabfdqk7i6wlv2j4cxuyb6psjwqs2kukdkafhcpq2zc766m3@m6iqexqjrvkv>
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

On Tue, Sep 12, 2023 at 12:32:40PM +0300, Serge Semin wrote:
> On Tue, Sep 12, 2023 at 07:59:49AM +0000, Jose Abreu wrote:
> > From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > Date: Mon, Sep 11, 2023 at 16:28:40
> > 
> > > Add a platform library of helper functions for common traits in the
> > > platform drivers. Currently, this is setting the tx clock.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> 
> > >  drivers/net/ethernet/stmicro/stmmac/Makefile  |  2 +-
> > >  .../ethernet/stmicro/stmmac/stmmac_plat_lib.c | 29 +++++++++++++++++++
> > >  .../ethernet/stmicro/stmmac/stmmac_plat_lib.h |  8 +++++
> > 
> > Wouldn't it be better to just call it "stmmac_lib{.c,.h}" in case we need to add
> > more helpers on the future that are not only for platform-based drivers?
> 
> What is the difference between stmmac_platform.{c,h} and
> stmmac_plat_lib.{c,h} files? It isn't clear really. In perspective it
> may cause confusions like mixed definitions in both of these files.
> 
> Why not to use the stmmac_platform.{c,h} instead of adding one more
> file?

Is stmmac_platform.{c,h} used by all the drivers that are making use of
this? I'm not entirely sure.

If it is, then yes, it can go in stmmac_platform.[ch]. If not, then I
don't think we'd want the bloat of forcing all of stmmac_platform.[ch]
onto drivers that only want to use this one function.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
