Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3365748EF34
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 18:25:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC949C5F1F4;
	Fri, 14 Jan 2022 17:25:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45AE1C5E2AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=JwoliXcJ7ab5c8+F4xKeDTkJ6noi7Vx/K/CQ+XG7ErE=; b=Ez6nvfIec49hV3Dsh4GUYRqhWB
 fGpwDEyw3EXhakHWRoPB9/BpJ9jUnYqugH6S98n+/OQIr1a2ts414G0cdMTQb1mGeBlx5eD1U2mNz
 A3GK7IJTX7datZmfZaoYS9A4Ue3fDF8a08l7vgZVKs5nk1PsjR9haYe5qtzTXDJcQXcY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1n8QKb-001Qx9-N6; Fri, 14 Jan 2022 18:25:41 +0100
Date: Fri, 14 Jan 2022 18:25:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Message-ID: <YeGyFabsBAfzvnU+@lunn.ch>
References: <20220114040755.1314349-1-kai.heng.feng@canonical.com>
 <20220114040755.1314349-2-kai.heng.feng@canonical.com>
 <YeF18mxKuO4/4G0V@lunn.ch>
 <CAAd53p5R2y-2JhWx3wp2=aBypJO=iV7fFS99eAgk6q7KBZMFMA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAd53p5R2y-2JhWx3wp2=aBypJO=iV7fFS99eAgk6q7KBZMFMA@mail.gmail.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 Russell King <linux@armlinux.org.uk>, joabreu@synopsys.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 peppe.cavallaro@st.com, Ivan Bornyakov <i.bornyakov@metrotek.ru>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] stmmac: intel: Honor phy LED set by
 system firmware on a Dell hardware
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

> > This is a PHY property. Why is the MAC involved?
> 
> This is inspired by commit a93f7fe13454 ("net: phy: marvell: add new
> default led configure for m88e151x") which passes the flag from MAC to
> PHY.

But in this case, the MAC does not care what the LEDs are. The
platform wants them left alone, not the MAC.

> > Please also think about how to make this generic, so any ACPI based
> > system can use it, with any PHY.

...

> So the only approach I can think of is to use DMI match directly in PHY driver.

In the phylib core. And the core then asks the specific PHY driver to
not touch the LED configuration. It is then generic.

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
