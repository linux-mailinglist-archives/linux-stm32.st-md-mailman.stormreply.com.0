Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC25FE5D1
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 01:12:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E55DDC64112;
	Thu, 13 Oct 2022 23:12:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A013C640FF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 23:12:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C43B661975;
 Thu, 13 Oct 2022 23:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC34C433D6;
 Thu, 13 Oct 2022 23:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665702751;
 bh=P6mYHp+DRLjwROKc+7ypL5XLojBKKdpSLTvsOv75fHk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TweiAsVFd5CLBV+95vW5XPlNulUSZX73E9zrdjUTc2FVRzeH6N2UwruvHV7pKvn2J
 zQEZHg2pAC+0dSpuBxzg/j6vFpAHTEtT70yCJAr+yT9n8VLbVxs/Y8n8MlkWDyxQXQ
 YIAVwHE9fC0WKp3npgpM+WzLb7X6Ps37mp83MPTVtMt5J6NQfPzarBEzl+Zs+QG/TT
 7Y0urrDeXo8CDAz/t7VrZCUVASC7uKD+4p0XGqXKrPzyIPqWO1nRxXT3hP2ucFxSkz
 /ZB4i/cPHydyQO6zpTzlMIUXrY5JQRALSrPUIlOAynuplqZhLRcQze1rJE8lB6J/m2
 qwI7u1kpHZRgg==
Date: Thu, 13 Oct 2022 16:12:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <20221013161229.73471c88@kernel.org>
In-Reply-To: <PAXPR04MB9185C63C94CE032DCEE60AE689259@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20221013133904.978802-1-shenwei.wang@nxp.com>
 <20221013133904.978802-2-shenwei.wang@nxp.com>
 <2c861748-b881-f464-abd1-1a1588e2a330@gmail.com>
 <PAXPR04MB9185C63C94CE032DCEE60AE689259@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, <imx@lists.linux.dev>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"          <linux-arm-kernel@lists.infradead.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	imx@lists.linux.dev, Russell King <linux@armlinux.org.uk>,
	Eric Dumazet <edumazet@google.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"linux-stm32@st-md-mailman.stormreply.com\"          <linux-stm32@st-md-mailman.stormreply.com>,  " linux-arm-kernel@lists.infradead."org," Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH v5 1/2] net: phylink: add
 mac_managed_pm in phylink_config structure
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

On Thu, 13 Oct 2022 19:28:45 +0000 Shenwei Wang wrote:
> > Fixes: 47ac7b2f6a1f ("net: phy: Warn about incorrect
> > mdio_bus_phy_resume() state"
> >   
> 
> That was my original format. But it met the following warning when ran checkpatch.pl script:
> 
> ./scripts/checkpatch.pl 0001-net-phylink-add-mac_managed_pm-in-phylink_config-str.patch 
> WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: e6a39ffcfe22 ("net: stmmac: Enable mac_managed_pm phylink config")'
> #20: 
> Fixes: 47ac7b2f6a1f ("net: phy: Warn about incorrect
> 
> That's why I changed to the current tag format.

It needs to be all on one line:

Fixes: 47ac7b2f6a1f ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")

But I don't see 47ac7b2f6a1f in my trees, are you sure that's 
the upstream commit id?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
