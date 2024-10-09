Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 298BB99654B
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2024 11:28:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE9E0C71290;
	Wed,  9 Oct 2024 09:28:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C040C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 09:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9/hOAet8dyoHvwrQgFKsUrBGRXMZB9FOFRUuwdCgNxA=; b=OJdldgua3myo4n3W6ysB0O44lM
 +Y4e1m5eWFSu692CAlBJUXC5FtA10mzFXsbAugHvDvigHHjhTkhDUQsqRwPS+fDAZRc3iecd0iZZY
 eECQfjuVPAXUyfyLhhSPnRWxAnV/YT984CmMAoe3WNRqGirfNedCjbfDJ4SyTdZL+EdetjWROhcfZ
 pyxr6LVyCz8ZRhQvEyqj3sS9yVNPsR3WnuCJVsqYtbljMqjyBznXux64haA1gWC1ngLZIrO3tID76
 yAjP835qglfa0NxXuBnicUXi03kjUazFRaqUYhm5K1Mcre31nA2aCob+sCmhca0osyDF8DasurcFx
 yUJxHYhw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41634)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sySym-0000Hb-2W;
 Wed, 09 Oct 2024 10:27:36 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1sySyg-0006B1-1r;
 Wed, 09 Oct 2024 10:27:30 +0100
Date: Wed, 9 Oct 2024 10:27:30 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZwZMglQLdg-5XPwm@shell.armlinux.org.uk>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
 <vjmounqvfxzqpdsvzs5tzlqv7dfb4z2nect3vmuaohtfm6cn3t@qynqp6zqcd3s>
 <rxv7tlvbl57yq62obsqtgr7r4llnb2ejjlaeausfxpdkxgxpyo@kqrgq2hdodts>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <rxv7tlvbl57yq62obsqtgr7r4llnb2ejjlaeausfxpdkxgxpyo@kqrgq2hdodts>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
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

On Wed, Oct 09, 2024 at 03:02:46AM +0300, Serge Semin wrote:
> On Sat, Oct 05, 2024 at 02:40:42AM GMT, Serge Semin wrote:
> > Hi
> > 
> > On Fri, Oct 04, 2024 at 11:19:57AM GMT, Russell King (Oracle) wrote:
> > > This is the second cleanup series for XPCS.
> > > 
> > > ...
> > 
> > If you don't mind I'll test the series out on Monday or Tuesday on the
> > next week after my local-tree changes concerning the DW XPCS driver
> > are rebased onto it.
> 
> As promised just finished rebasing the series onto the kernel 6.12-rc2
> and testing it out on the next HW setup:
> 
> DW XGMAC <-(XGMII)-> DW XPCS <-(10Gbase-R)-> Marvell 88x2222
> <-(10gbase-r)->
> SFP+ DAC SFP+
> <-(10gbase-r)->
> Marvell 88x2222 <-(10gbase-r)-> DW XPCS <-(XGMII)-> DW XGMAC
> 
> No problem has been spotted.
> 
> Tested-by: Serge Semin <fancer.lancer@gmail.com>

Thanks. However, it looks like patchwork hasn't picked up your
tested-by. Maybe it needs to be sent in reply to the cover message
and not in a sub-thread?

https://patchwork.kernel.org/project/netdevbpf/list/?series=895512

Maybe netdev folk can add it?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
