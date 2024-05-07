Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1F38BD8E0
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 03:21:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90BCBC5E2D2;
	Tue,  7 May 2024 01:21:06 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44F27C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 01:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=fYpJZptr+CFQVFJZql4DSBtvy01u2b9drswZ42yZ9Oo=; b=fzY+tXi/UsTDExwmPFhCAbXewZ
 lsK2vDYSdz8FqNFQQ2eZPjxsNprlfX6702/O/6xy5Arh+dlo2hBmw2Ui9DScqeAr14sC1VYM46qTA
 tCw9c1tY2CDe1anO5oki7aDzMmeYzrDyVahiOOFXkl05vbBaB7DDml4QjMZ6M1NE+UAE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1s49Vi-00EoGZ-0X; Tue, 07 May 2024 03:20:50 +0200
Date: Tue, 7 May 2024 03:20:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Message-ID: <33b28b54-dd25-4ec2-a3b2-89c223e16057@lunn.ch>
References: <20240506123248.17740-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240506123248.17740-1-ansuelsmth@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH] net: stmmac: dwmac-ipq806x:
 account for rgmii-txid/rxid/id phy-mode
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

On Mon, May 06, 2024 at 02:32:46PM +0200, Christian Marangi wrote:
> Currently the ipq806x dwmac driver is almost always used attached to the
> CPU port of a switch and phy-mode was always set to "rgmii" or "sgmii".
> 
> Some device came up with a special configuration where the PHY is
> directly attached to the GMAC port and in those case phy-mode needs to
> be set to "rgmii-id" to make the PHY correctly work and receive packets.
> 
> Since the driver supports only "rgmii" and "sgmii" mode, when "rgmii-id"
> (or variants) mode is set, the mode is rejected and probe fails.
> 
> Add support also for these phy-modes to correctly setup PHYs that requires
> delay applied to tx/rx.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
