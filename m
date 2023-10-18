Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9827CD577
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 09:25:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15525C6C838;
	Wed, 18 Oct 2023 07:25:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8A50C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 07:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pfDXC/yC0D6NPEvRRuSAl/CZ8bNfgEG2WS3sXs6JgQI=; b=itHVHO6qdF0/oBOpNP2MkKT1WL
 1uP9xdCDFUbl9CFtGrTDBbdzdG76VR2w8LixuCBhUG4npS9LPnNSikeWkzBN6/DS0AMhtIVPMVCRv
 SDVsFN6B/qtqKeu3xfJhdlcnasMmlzDpuGXvDUoZXDKgb6H9v6PleaBcSXMlb1I03APmSACupT5rc
 bk+QPKs3P9s003vom8RzslevvNI6EK2RAa79YYSrH2xsvZWQk4i2wPv0kT5tmYPfMphtGTejsiXL1
 2mM9BDfOJ0lsP8rX36uSmCV1YCEK0IHgKdsHKLSnVM3voDNQo2XV8CtGs30VoaR1RZKnK7Ljf8Obr
 ENVCla3g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41020)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qt0vU-0004eT-2c;
 Wed, 18 Oct 2023 08:25:10 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qt0vS-0007bb-KT; Wed, 18 Oct 2023 08:25:06 +0100
Date: Wed, 18 Oct 2023 08:25:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Gan, Yi Fang" <yi.fang.gan@intel.com>
Message-ID: <ZS+IUo5q/AnYm1Gb@shell.armlinux.org.uk>
References: <20231018023137.652132-1-yi.fang.gan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231018023137.652132-1-yi.fang.gan@intel.com>
Cc: Song Yoong Siang <yoong.siang.song@intel.com>, linux-kernel@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: update MAC
 capabilities when tx queues are updated
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

On Wed, Oct 18, 2023 at 10:31:36AM +0800, Gan, Yi Fang wrote:
> From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> 
> Upon boot up, the driver will configure the MAC capabilities based on
> the maximum number of tx and rx queues. When the user changes the
> tx queues to single queue, the MAC should be capable of supporting Half
> Duplex, but the driver does not update the MAC capabilities when it is
> configured so.
> 
> Using the stmmac_reinit_queues() to check the number of tx queues
> and set the MAC capabilities accordingly.

There is other setup elsewhere in the driver that fiddles with this in
stmmac_phy_setup(). Maybe provide a helper function so that this
decision making can be made in one function called from both these
locations, so if the decision making for HD support changes, only one
place needs changing?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
