Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E80D99909F7
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 19:07:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97658C7802B;
	Fri,  4 Oct 2024 17:07:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 743CCC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 17:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eUrKQlJ9GoNgsouFhKisvL8cCNUjhZWHkUqj1luPv0k=; b=10BfuADdrTE40KbDRPsbAYzSOP
 PMZKWKf/RlunKhpplrrK4F7nCnK+wGCFV9rf/WL3AOA3bOseBmAvikuCX4N14wKV3Mh/gHWiHs3+7
 aXlvycwEU4b3yAQ+hvxEI10lAMRmVSg9G93bnDb7UpswOUJMnK9d0XNw95+gA2FH19VyOnqbcM+BL
 zGY6M1XBKOccsqFqfhryncFnBNo7hk7olRv/XoGIgcRzjWIe743f+cYq+VuDs7aRHIQrhK6nk2D+g
 CADbICk/HrNFBE90qvzoz6AI7UtjmKhAJs6mOYTxD1jde0oK6FN9i8geeqD4n/cmhbAImyILHWS7+
 Zht+57SA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33080)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1swlll-0002Kb-2O;
 Fri, 04 Oct 2024 18:07:09 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1swllg-0001KS-0J;
 Fri, 04 Oct 2024 18:07:04 +0100
Date: Fri, 4 Oct 2024 18:07:03 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <ZwAgtwKKD8rsBL-_@shell.armlinux.org.uk>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
 <20241004111940.xbtssgeggp5mcprl@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241004111940.xbtssgeggp5mcprl@skbuf>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 00/13] net: pcs: xpcs: cleanups
	batch 2
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

On Fri, Oct 04, 2024 at 02:19:40PM +0300, Vladimir Oltean wrote:
> On Fri, Oct 04, 2024 at 11:19:57AM +0100, Russell King (Oracle) wrote:
> >  drivers/net/pcs/pcs-xpcs-nxp.c                    |  24 +-
> 
> I want to test this on the SJA1110, but every XPCS cleanup series day is
> a new unpacking day. I have to take the board out of a box and make sure
> it still works. It might take a while.

Sorry about that - if netdev didn't have the "15 patches max" then I
would've posted it as one series which would've saved you the
additional work.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
