Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C88A4905E37
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2024 00:04:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EBE4C71290;
	Wed, 12 Jun 2024 22:04:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76387C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2024 22:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kcM7+sEl2fFtdltwBxi9L6LdwhXB7vjNBltenta4eBs=; b=CcbBKjLiXhLREV1DtlLUuXLQWG
 Lkgv/zS+RKzvgZr6Hp9nxNfB7O0+apKF7edBOOYqoMJHuKsgbfjED2tFL98Cv5769y2JLYcaOM81M
 J+CyhYO///NBcralWWbtz/j1gRfMPOq4owKPgPDIC5dW9jSAFKJOnuYTVhFK6y4a4+5tUuwntPyh0
 PIDf0oZCPiroRD0Ta/yi3NosUmU8eRttqUZLeBX3ItcKhlOnmA0gLRCbeO6BlBNCRXjnhVrl/M8ut
 oOG2K/KjuuiHK6GQ71EtgGLqBcF+g6t/eBsuEoAYRpupTDiDcgaxqriq2I6CG6QN2ih+zb74CexwC
 8/SJ0O/g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38598)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sHW4h-000580-2f;
 Wed, 12 Jun 2024 23:04:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sHW4h-0000bC-Bq; Wed, 12 Jun 2024 23:04:11 +0100
Date: Wed, 12 Jun 2024 23:04:11 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZmobWwS5UapbhdmT@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0Ov-00EzBu-BC@rmk-PC.armlinux.org.uk>
 <6n4xvu6b43aptstdevdkzx2uqblwabaqndle2omqx5tcxk4lnz@wm3zqdrcr6m5>
 <ZmbFK2SYyHcqzSeK@shell.armlinux.org.uk>
 <dz34gg4atjyha5dc7tfgbnmsfku63r7faicyzo3odkllq3bqin@hho3kj5wmaat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dz34gg4atjyha5dc7tfgbnmsfku63r7faicyzo3odkllq3bqin@hho3kj5wmaat>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 3/8] net: stmmac:
 dwmac1000: convert sgmii/rgmii "pcs" to phylink
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

On Tue, Jun 11, 2024 at 03:25:14PM +0300, Serge Semin wrote:
> Hi Russell, Andrew
>
> Should we have a DW IP-core-specific getter like
> stmmac_ops::pcs_get_config_reg() which would return the
> tx_config_reg[15:0] field then we could have cleared the IRQ by just
> calling it, we could have had the fields generically
> parsed in the dwmac_pcs_isr() handler and in the
> phylink_pcs_ops::pcs_get_state().

pcs_get_state() is not supposed to get some cached state, but is
supposed to return the real state at the time that it is called.

There's a good reason for this - dealing with latched-low link failed
indications, it's necessary that pcs_get_state() reports that the link
failed if _sometime_ between the last time it was called and the next
time the link has failed.

So, I'm afraid your idea of simplifying it doesn't sound to me like a
good idea.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
