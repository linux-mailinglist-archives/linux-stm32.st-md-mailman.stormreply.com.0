Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 004D250B7CA
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 14:59:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A493EC6049A;
	Fri, 22 Apr 2022 12:59:08 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FAD1C6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=N8vHuTwPATpwwlOw/DsH67ghNaVvbs3LtAD5h9mrBs0=; b=FkZysAF1vf7oMtSIe49s+Drqah
 QT72I2uYhUKJYYy8t+JhZQCTdP0HBm9GzVPy744j32ZD9nfwavIWrNMP+snINiiYj3zWgD5l+wr+D
 xWK3yh7YIaGzNYThvjigGHyvZUQna0BvABZYyOH2Ucx/iXK3RE7xpoSTiANOebh1sE7U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nhss6-00GyU2-09; Fri, 22 Apr 2022 14:58:50 +0200
Date: Fri, 22 Apr 2022 14:58:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <YmKmifSfqRdjOXSd@lunn.ch>
References: <20220422073505.810084-1-boon.leong.ong@intel.com>
 <20220422073505.810084-3-boon.leong.ong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422073505.810084-3-boon.leong.ong@intel.com>
Cc: linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/4] net: stmmac: introduce
 PHY-less setup support
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

On Fri, Apr 22, 2022 at 03:35:03PM +0800, Ong Boon Leong wrote:
> Certain platform uses PHY-less configuration whereby the MAC controller
> is connected to network switch chip directly over SGMII or 1000BASE-X.
> 
> This patch prepares the stmmac driver to support PHY-less configuration
> described above.

The normal way to do a PHY less setup is to use a fixed-PHY. It offers
the same API to the MAC as a real PHY but is fixed speed, dupex
etc. The MAC sees a PHY as usual, and you don't need anything special
in the MAC.

What you need to do is extend your DSD to list the fixed-link. See

https://www.kernel.org/doc/html/latest/firmware-guide/acpi/dsd/phy.html#mac-node-example-with-a-fixed-link-subnode

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
