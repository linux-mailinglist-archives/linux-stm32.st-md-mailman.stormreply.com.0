Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 585959C5883
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 14:04:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A8A0C78F83;
	Tue, 12 Nov 2024 13:04:21 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF867C78F63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 13:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Yf/24sbBNDDoh13fZUjInsCA81I5s6NjSfUou39GZzo=; b=KudzVD96WhjqBFINviWDdpHa6r
 QGLsRhhmFYz5h85UzqrcF02t1lkbdDuRRYsT3Q2Kl+pCCe6QtmwqBIEqC9lQOjC+sGFMP+4BzUKTY
 SC2IQPSlOkMeqSssJLj70NqRqqan6sJtPQ5ABS9U1t3sl6t2W/NlfOlUa4ZkuPVvfv0Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tAqYt-00D1ky-CZ; Tue, 12 Nov 2024 14:04:03 +0100
Date: Tue, 12 Nov 2024 14:04:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <71b6be0e-426f-4fb4-9d28-27c55d5afa51@lunn.ch>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
 <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
 <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net v1 1/2] net: phy: Introduce
 phy_update_eee() to update eee_cfg values
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

On Tue, Nov 12, 2024 at 12:03:15PM +0100, Heiner Kallweit wrote:
> On 12.11.2024 08:24, Choong Yong Liang wrote:
> > The commit fe0d4fd9285e ("net: phy: Keep track of EEE configuration")
> > introduced eee_cfg, which is used to check the existing settings against
> > the requested changes. When the 'ethtool --show-eee' command is issued,
> > it reads the values from eee_cfg. However, the 'show-eee' command does
> > not show the correct result after system boot-up, link up, and link down.
> > 
> 
> In stmmac_ethtool_op_get_eee() you have the following:
> 
> edata->tx_lpi_timer = priv->tx_lpi_timer;
> edata->tx_lpi_enabled = priv->tx_lpi_enabled;
> return phylink_ethtool_get_eee(priv->phylink, edata);
> 
> You have to call phylink_ethtool_get_eee() first, otherwise the manually
> set values will be overridden. However setting tx_lpi_enabled shouldn't
> be needed if you respect phydev->enable_tx_lpi.

I agree with Heiner here, this sounds like a bug somewhere, not
something which needs new code in phylib. Lets understand why it gives
the wrong results.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
