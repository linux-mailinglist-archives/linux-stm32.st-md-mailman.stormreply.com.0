Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D45A0467A
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 17:34:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C969CC78022;
	Tue,  7 Jan 2025 16:34:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C277C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 16:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dW89n42NmkpEIRJUxQQno3eIDg8+CSGSrGgZHeTnpZo=; b=xdTmUK86AuLgBEOEBUTvAmAlUS
 4hvp7u8bGFejhTcWLPu+4flofsd5I/4UF7vfEmaZ+xN789xk38q6zobdEC/ZyycSIZ2GWN+fxzHWJ
 yRS2PNIjrS7uInj/vcMppd2eCmcX6p9xpExcZg9fPYkiIuh4x1FeLy1v+7Vr9BaGKJbyVY/pHVP/H
 4hUkduFB2Ik5nsbO5xvemxojrWYvRoHBi20zT0vNJcuf78Vczy3mN5tjq3F8Lzj+YupAh5WgIOxb0
 1DSSFsCyjEfvznhijkpj/9OxrwfRrS8lTiVZiTYWK9tXJtMebuyxtkOx50D0Dked4yj8gm0/t1Qm8
 97f2+Tog==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60026)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tVCX3-0007qV-0K;
 Tue, 07 Jan 2025 16:34:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tVCX0-0005R5-28;
 Tue, 07 Jan 2025 16:34:14 +0000
Date: Tue, 7 Jan 2025 16:34:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <Z31XhoshqSd-a6pS@shell.armlinux.org.uk>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
 <0cf7eacd-6834-47d8-b370-cac5a7395d44@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0cf7eacd-6834-47d8-b370-cac5a7395d44@lunn.ch>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 03/17] net: stmmac: use
 correct type for tx_lpi_timer
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

On Mon, Jan 06, 2025 at 05:45:37PM +0100, Andrew Lunn wrote:
> On Mon, Jan 06, 2025 at 12:24:58PM +0000, Russell King (Oracle) wrote:
> > The ethtool interface uses u32 for tx_lpi_timer, and so does phylib.
> > Use u32 to store this internally within stmmac rather than "int"
> > which could misinterpret large values.
> > 
> > Since eee_timer is used to initialise priv->tx_lpi_timer, this also
> > should be unsigned to avoid a negative number being interpreted as a
> > very large positive number.
> > 
> > Also correct "value" in dwmac4_set_eee_lpi_entry_timer() to use u32
> > rather than int, which is derived from tx_lpi_timer, even though
> > masking with STMMAC_ET_MAX will truncate the sign bits. u32 is the
> > value argument type for writel().
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

FYI, because of splitting this patch, I've dropped your r-b when
posting v3.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
