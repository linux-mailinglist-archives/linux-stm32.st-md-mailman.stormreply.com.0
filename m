Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6014A48B31
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 23:17:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D1D4CFAC45;
	Thu, 27 Feb 2025 22:17:13 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3B6ACFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 22:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=EE25XAsvhnFPgPLYy6dng4+2igaG0tj5/voU58VKW+w=; b=UUs1oId+Z3hGUPkm+ucjt98CV+
 psoOP9GEioeCf4nrItaN615xIiMApAJvd2LS7kYvsgooKqOJEYq88LAKDYnTOTXDlckJgd7IWUam4
 WPdVee/CYkaIWtTHsTHsRAxVGygdj9D6COxC0358AIPapodzCVBFqc3M3VZBfvHDcy0s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tnmBm-000jkS-MQ; Thu, 27 Feb 2025 23:17:06 +0100
Date: Thu, 27 Feb 2025 23:17:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <dca35d31-e9af-4453-be2d-cae3a86a8ac9@lunn.ch>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRo-0057SL-Dz@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tnfRo-0057SL-Dz@rmk-PC.armlinux.org.uk>
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 3/5] net: stmmac: remove
 unnecessary stmmac_mac_set() in stmmac_release()
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

On Thu, Feb 27, 2025 at 03:05:12PM +0000, Russell King (Oracle) wrote:
> stmmac_release() calls phylink_stop() and then goes on to call
> stmmac_mac_set(, false). However, phylink_stop() will call
> stmmac_mac_link_down() before returning, which will do this work.
> Remove this unnecessary call.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
