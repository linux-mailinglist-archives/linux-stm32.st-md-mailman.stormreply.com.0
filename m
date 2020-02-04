Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C01D151FB9
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2020 18:43:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5768BC36B0C;
	Tue,  4 Feb 2020 17:43:29 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 743B4C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2020 17:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YkN8EICzEFNet3xsTGFEzCoFMZb0DnoCsILuNX9tis8=; b=t2tBPBb+2JKDwwrM0AfTALYPGt
 3oEGx2P5EMacRxNuchFRj5zXvINXH73V5ZOHHacc/OUNKDErReuozxsGC6zauB4WsDrQT8Ad0Rquj
 s1w3V02NrpptvykNnflDazp37e7pZBDbUk53WK5eXbKBSv2LPgcmaTFzCl+bDegKKKzs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1iz2EI-0000gR-CJ; Tue, 04 Feb 2020 18:43:18 +0100
Date: Tue, 4 Feb 2020 18:43:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Message-ID: <20200204174318.GB1364@lunn.ch>
References: <BN8PR12MB3266714AE9EC1A97218120B3D30B0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20200127114600.GU25745@shell.armlinux.org.uk>
 <20200127140038.GD13647@lunn.ch>
 <20200127140834.GW25745@shell.armlinux.org.uk>
 <20200127145107.GE13647@lunn.ch>
 <20200127161132.GX25745@shell.armlinux.org.uk>
 <20200127162206.GJ13647@lunn.ch>
 <c3e863b8-2143-fee3-bb0b-65699661d7ab@gmail.com>
 <BN8PR12MB3266B69DA09E1CC215843C3CD30A0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20200204172603.GS25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204172603.GS25745@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [RFC net-next 6/8] net: phylink: Configure
 MAC/PCS when link is up without PHY
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

> There, there is one MAC, but there are multiple different PCS - one
> for SGMII and 1000base-X, another for 10G, another for 25G, etc.
> These PCS are accessed via a MDIO adapter embedded in each of the
> MAC hardware blocks.

Hi Russell

Marvell mv88e6390X switches are like this is a well. There is a PCS
for SGMII and 1000Base-X, and a second one for 10G. And it dynamically
swaps between them depending on the port mode, the so called cmode.

So a generic solution is required, and please take your time to build
one.

> It's not production-ready yet, but I will continue working on it
> over the coming week.

I'm happy to test when you are ready.

Thanks for working on this,

       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
