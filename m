Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1778863D462
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Nov 2022 12:23:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C206DC65E58;
	Wed, 30 Nov 2022 11:23:57 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF449C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Nov 2022 11:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6301NlmXCNSuGpCf/dSPGEa9RRPWwBQpP9USBwW/W3w=; b=ZxodPxa0H9FYjpkK5W+h5nwe4k
 OnGIlGaXgUjCNF1ESuXI213S7MG/j0h/6QJqt0JhSC+s5f/6hWPJoUQbC8+yc5UHVV4Pb5Y5Jz5ul
 sRTKIYanacZtUuy2gQD7+QBFIn1xxej8FFFP/aPxXtNk5fSPyXmYb86ndLM742OLUi7YWeKTgBNLJ
 hzirRHzwLlRvI5G56896hxWj0o4KWFA7My5lgI2MQU2y+HxXQzJj1cnn3hIo/3qDIrOk+GpwzYGUn
 5Khv5vjKcvFHk+JjKTJzYBi9tNFt1E/qmcFaxm3mF4pmmC7vMR0zBMdCd/2feVUTaNdHHLxgxy3Dk
 HN13xWvA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35492)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1p0LBp-0001di-Kx; Wed, 30 Nov 2022 11:23:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1p0LBm-0002Rv-CO; Wed, 30 Nov 2022 11:23:42 +0000
Date: Wed, 30 Nov 2022 11:23:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Clark Wang <xiaoning.wang@nxp.com>
Message-ID: <Y4c9PlfEC17pVE08@shell.armlinux.org.uk>
References: <20221130111148.1064475-1-xiaoning.wang@nxp.com>
 <20221130111148.1064475-2-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130111148.1064475-2-xiaoning.wang@nxp.com>
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH 1/2] net: phylink: add sync flag mac_ready
 to fix resume issue with WoL enabled
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

On Wed, Nov 30, 2022 at 07:11:47PM +0800, Clark Wang wrote:
> Issue we met:
> On some platforms, mac cannot work after resumed from the suspend with WoL
> enabled.
> 
> The cause of the issue:
> 1. phylink_resolve() is in a workqueue which will not be executed immediately.
>    This is the call sequence:
>        phylink_resolve()->phylink_link_up()->pl->mac_ops->mac_link_up()
>    For stmmac driver, mac_link_up() will set the correct speed/duplex...
>    values which are from link_state.
> 2. In stmmac_resume(), it will call stmmac_hw_setup() after called the
>    phylink_resume(). stmmac_core_init() is called in function stmmac_hw_setup(),

... and that is where the problem is. Don't call phylink_resume() before
your hardware is ready to see a link-up event.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
