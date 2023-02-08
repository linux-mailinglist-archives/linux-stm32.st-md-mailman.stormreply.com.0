Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D640768EFB4
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Feb 2023 14:27:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72D7DC6A5E8;
	Wed,  8 Feb 2023 13:27:40 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E763FC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=b+UE50I3cqS7Z7xe3M4khVDXZklYfj2TnH0XnO2ACAk=; b=DEDweJWY7X9s3HuPEk2ZtV/x+F
 JFS87RzT4Ra2WDBwsMsa5PGSjXHcjIuDyfz5PkcDxGUpRhSw7uGUkbfivVqS76GpD+UGk5aRoicgu
 0G5zV2woZAsKWj0sVFtP6mExGUbJuhYFJ5Bw0Qo5gzO2wtRilI0EK2gFQxhvyRzLcCTc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1pPkTb-004P9J-Vl; Wed, 08 Feb 2023 14:27:07 +0100
Date: Wed, 8 Feb 2023 14:27:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Guan Wentao <guanwentao@uniontech.com>
Message-ID: <Y+OjKx7aJ88xjqvK@lunn.ch>
References: <20230208112054.22965-1-guanwentao@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230208112054.22965-1-guanwentao@uniontech.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: get phydev->interface from
 mac for mdio phy init
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

On Wed, Feb 08, 2023 at 07:20:54PM +0800, Guan Wentao wrote:
> The phy->interface from mdiobus_get_phy is default from phy_device_create.
> In some phy devices like at803x, we need the correct value to init delay.
> Use priv->plat->interface to init if we know.

You commit message i missing a lot of details to make this easy to
review.

So you board is not using DT? And so there is not a DT node specifying
the phy-mode. You have some other way of getting the correct interface
mode into plat->interface. And since you don't have DT, you also have
some other mechanism to set plat->phy_addr to the address on the MDIO
bus. The code then directly gets the PHY from the MDIO bus, and calls
phylink_connect_phy() to connect the PHY. The old code used
phy_connect() which took an interface parameter but
phylink_connect_phy() does not. And that is your problem.

So your fix makes sense.

Please improve the commit message.

Please also take a look at
https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
You should set the email Subject: line to indicate which tree this
patch is for.

       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
