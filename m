Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE58702FA
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Mar 2024 14:41:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70C19C6B45E;
	Mon,  4 Mar 2024 13:41:13 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78068C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=2RW00RRdJ6/9wrHmluqjDPjlTXkXPk/qAZGZtAc5LPI=; b=ORLEHsLxjgg68h8f3PfgQQvANt
 d1VjRjf9sezt5tDvz/VlOumWsegsoZkBZXiXB85yh7QHLJKiQqWU1mowD0afmlsHJcSnGsArJN72M
 qCUG1QThw5k85wPg/dsv1/edDr/SlXwYN9/bvImRxWjCyMebatRRUtg9wNq5FwYMoZ/A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rh8ZJ-009KLR-47; Mon, 04 Mar 2024 14:41:25 +0100
Date: Mon, 4 Mar 2024 14:41:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <b5e2a507-d3ad-449b-9da7-6767efd6d886@lunn.ch>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-3-8dac30230050@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240301-rxc_bugfix-v5-3-8dac30230050@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/7] net: stmmac: don't rely
 on lynx_pcs presence to check for a PHY
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

On Fri, Mar 01, 2024 at 04:35:00PM +0100, Romain Gantois wrote:
> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> When initializing attached PHYs, there are some cases where we don't expect
> any PHY to be connected. The logic uses conditions based on various local
> PCS configuration, but also calls-in phylink_expects_phy() via
> stmmac_init_phy(), which is enough to ensure we don't try to initialize a
> PHY when using a Lynx PCS, as long as we have the phy_interface set to a
> 802.3z mode and are using inband negociation.
> 
> Drop the lynx check, making the stmmac generic code more pcs_lynx-agnostic.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [rgantois: commit log]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
