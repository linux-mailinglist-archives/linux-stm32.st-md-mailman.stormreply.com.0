Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C10A5EDBB
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 09:13:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E90D3C78F83;
	Thu, 13 Mar 2025 08:13:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A142C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KNWRjxoA9JsYQRCUVG8bkf0reIJyoWkhEVKiEfrJEN4=; b=Y8K6rmu/SDHkEIdnY6m360zt81
 8kzPwsNJQ4rc5IACAg6B5ZDIV5DFMtvgcp7InuiR5xaNzbzQiiXN7ZGThD8agyyGt35Rg7S7bl3ZI
 jvkMah64c+1BwKawt0hM12P7VXqqjbSgvWRzOTygixRoM/83PLiORN5nYX15gO0gROoDaNH9GMcUr
 oEk4oT0grTn5KIxWUEQVn3SDrCEXbCU0sK8a7BOBD7VWB6PKcsz7JSXW8gA6Xva1qsUzaZ6GqdpmM
 /7e1ry+fVNsDUGSRYMVzkgqNYl97VhCmWX9AR1xZihatto/Vd+hhFSSxJxUS2DQvYKTcpx52dr9TG
 6QyXQYGQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56136)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tsdge-0006fC-1T;
 Thu, 13 Mar 2025 08:13:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tsdgZ-0005QW-1c;
 Thu, 13 Mar 2025 08:12:59 +0000
Date: Thu, 13 Mar 2025 08:12:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <Z9KTixM7_vc_GFe-@shell.armlinux.org.uk>
References: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: avoid
 unnecessary work in stmmac_release()/stmmac_dvr_remove()
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

On Mon, Mar 10, 2025 at 12:31:32PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This small series is a subset of a RFC I sent earlier. These two
> patches remove code that is unnecessary and/or wrong in these paths.
> Details in each commit.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 -----
>  1 file changed, 5 deletions(-)

Hi Jakub,

Why is this series showing in patchwork, but not being subjected to
any nipabot tests?

There's also "net: phylink: expand on .pcs_config() method
documentation" which isn't being subjected to nipabot tests.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
