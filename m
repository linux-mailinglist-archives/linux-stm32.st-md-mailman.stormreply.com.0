Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067AA16283
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Jan 2025 16:13:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F26DC71280;
	Sun, 19 Jan 2025 15:13:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54074C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jan 2025 15:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+BKApviZbKOtFG0ErRA2dV5y3fesSYbnNbVtybZaCtU=; b=pbECHzt3CWWowzwNxNLHPHRLqG
 0A3VY0/MxcS8EmxS7lO3wqSIAKucmP87CDuP8pos4U/1KN/4tClv4YrDUjQl2UhYsTnZ3AiKAyhtg
 LqbHGhMPUXClOqKAmyDN6TJlCago8EJOs+GAVq9S1+C88HEft9Xew0TG3mnJUwpTMCqO3x2oO8Qf4
 wODyDaRbAh1ATDOM47YVjVxMpxFcW93N5hV/FYHZmcdw3NzeSYJXUEeu/I8Dsr4iEYy7fq4jmX6os
 QA7LXPQcpIY9+aisNHz3XKlnJuNM+NdeQRAS5zaQeKVjw/lTvKxeWY289B2rLHBOd60ev3eJyMtpS
 xprBzxIA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45824)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tZWzZ-0005Kg-20;
 Sun, 19 Jan 2025 15:13:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tZWzV-0001xB-2z;
 Sun, 19 Jan 2025 15:13:33 +0000
Date: Sun, 19 Jan 2025 15:13:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Oleksandr Makarov [GL]" <Oleksandr.Makarov@qsc.com>
Message-ID: <Z40WnTc09OOnCZ3p@shell.armlinux.org.uk>
References: <BLAPR16MB392407EDC7DFA3089CC42E3CF0BE2@BLAPR16MB3924.namprd16.prod.outlook.com>
 <CANn89iL_p_pQaS=yjA2yZd2_o4Xp0U=J-ww4Ztp0V3DY=AufcA@mail.gmail.com>
 <BLAPR16MB392430582E67F952C115314CF0BE2@BLAPR16MB3924.namprd16.prod.outlook.com>
 <BLAPR16MB3924BB32CE2982432BAE103FF0622@BLAPR16MB3924.namprd16.prod.outlook.com>
 <BLAPR16MB3924E3DF8703DDCBC1C033BBF0E42@BLAPR16MB3924.namprd16.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BLAPR16MB3924E3DF8703DDCBC1C033BBF0E42@BLAPR16MB3924.namprd16.prod.outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] BUG: UDP Packet Corruption Issue with stmmac
 Driver on Linux 5.15.21-rt30
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

On Sun, Jan 19, 2025 at 12:46:54PM +0000, Oleksandr Makarov [GL] wrote:
> I bisected kernel from 6.12, where the issue with trimming fragmented UDP packets was fixed, down to 5.15.21.
> 
> I have identified that commit  "47f753c1108e287edb3e27fad8a7511a9d55578e net: stmmac: disable Split Header (SPH) for Intel platforms" is fixing the problem.

It sounds like you're saying that it's been fixed on mainline, but the
fix hasn't been backported to 5.15.21. Well, it won't ever be. 5.15.21
is one instance of the 5.15-stable kernel tree, and the 5.15-stable
tree is now at 5.15.176.

Try moving your stable kernel forward. If you're locked in to 5.15.21
by an upstream vendor, then you need to complain to them.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
