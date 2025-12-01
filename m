Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDAFC98234
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 16:55:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D4C5C2909A;
	Mon,  1 Dec 2025 15:55:36 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43648C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=VTEiKyqnmpUyfKxvjtjoMwds4d2cP+VOremdDYjxN14=; b=MJqNBU9jtl/amP4JSRy7O4++9+
 btazn7HSDXfN6POHrEsydPVxIK8vtRn/pcrN5i/818rW83TX8lk8E4U7PI0sIvcEm+rQzYvw6Mwfm
 eQj6EEWt9c7s0tnSNbBwr7BFCqAFh6VewGz7n7AFmAYjD6dhZGwPGL+J+PVN2UiqT1Vw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vQ6FF-00FaUH-DN; Mon, 01 Dec 2025 16:55:21 +0100
Date: Mon, 1 Dec 2025 16:55:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <05db9d3e-88fa-42db-8731-b77039c60efa@lunn.ch>
References: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 00/15] net: stmmac: rk:
	cleanups galore
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

> One of the interesting things is that this appears to deal with RGMII
> delays at the MAC end of the link, but there's no way to tell phylib
> that's the case. I've not looked deeply into what is going on there,
> but it is surprising that the driver insists that the delays (in
> register values?) are provided, but then ignores them depending on the
> exact RGMII mode selected.

Yes, many Rockchip .dts files use phy-mode = 'rgmii', and then do the
delays in the MAC. I've been pushing back on this for a while now, and
in most cases, it is possible to set the delays to 0, and use
'rgmii-id'.

Unfortunately, the vendor version of the driver comes with a debugfs
interface which puts the PHY into loopback, and then steps through the
different delay values to find the range of values which result in no
packet loss. The vendor documentation then recommends
phy-mode='rgmii', and set the delays to the middle value for this
range. So the vendor is leading developers up the garden path.

These delay values also appear to be magical. There has been at least
one attempt to reverse engineer the values back to ns, but it was not
possible to get consistent results across a collection of boards.

       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
