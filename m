Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41357901DEF
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 11:16:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E840BC7800B;
	Mon, 10 Jun 2024 09:16:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE749C6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cm5RXgxrGyPx0HOxnj0oADHLpbubFzGyui01dq/eV+M=; b=aYT+xqOMm+MujVFCcpmFNmy578
 TZcFmLK5hZ+5E2C1Yxnh9/hB8Uscvw7lDygmSQiSEZSVQN8veiUgHamVOpCSvvmTQqRoLno+P7SXe
 Pa3TgT7KxaDVZ2Hr4pKozzH/9l84aU20hSSHxgboUyKaqkng7Sv3G+bCzr04bU/A0Wt18IpiEBtai
 QoHMnocJlztKS2UgS6JiYXMqiLg5N7qC+hBQyutJFjyzeDYZ3CXQSrlJfIFodTTEyHw4rId6s2LCx
 N4RwKLvxQxHcsQqd81urbHiD8FW7D7xTGULLFdXCPZ37COcquJ/MmVyBOvc6RqoHTi8FaG91mC/6e
 QGgnIsAw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59778)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sGb8e-0001DJ-2T;
 Mon, 10 Jun 2024 10:16:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sGb8e-0006lD-BD; Mon, 10 Jun 2024 10:16:28 +0100
Date: Mon, 10 Jun 2024 10:16:28 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <ZmbEbIQY+6c/qadI@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0Ol-00EzBh-3f@rmk-PC.armlinux.org.uk>
 <gyiomer5eqxtq7q7zo5lwtokvdugs4jlb3nux3ry6xf5j27wtp@wl6s643vbn75>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <gyiomer5eqxtq7q7zo5lwtokvdugs4jlb3nux3ry6xf5j27wtp@wl6s643vbn75>
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 1/8] net: stmmac: add
 infrastructure for hwifs to provide PCS
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

On Wed, Jun 05, 2024 at 02:57:34PM -0500, Andrew Halaney wrote:
> On Fri, May 31, 2024 at 12:26:15PM GMT, Russell King (Oracle) wrote:
> > @@ -310,6 +315,9 @@ struct stmmac_ops {
> >  	void (*core_init)(struct mac_device_info *hw, struct net_device *dev);
> >  	/* Update MAC capabilities */
> >  	void (*update_caps)(struct stmmac_priv *priv);
> > +	/* Get phylink PCS (for MAC */
> 
> nit: unclosed parenthesis

Please learn to trim your review replies so your patch submitters don't
have to waste time scroll through lots of useless context. This has
been part of good netiquette for decades. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
