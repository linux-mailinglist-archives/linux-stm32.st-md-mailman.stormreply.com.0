Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDA93DBBC5
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jul 2021 17:11:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 168D8C57B6F;
	Fri, 30 Jul 2021 15:11:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69BA8C57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z+rTA/ObrOOYDpgQnhNyZXPSqPg3dMUwZ39219bYFYE=; b=pQPFmm2qtpvBeXzSGuCG99sBt
 GnAGGc3nmRVTeaMDX0ptT6QyXrrsVMC3YPYeq7BbDYWf8LSVVStBzyo6PeSlpHP+cwLMLs3qSokbY
 mWVW9W+CkFnNLGC7lAPqURjvqzPxwLAbpEXxHTWw6x6HFYF4CIbXoKjwYDNZcKnwaCWOK6rc90HuS
 sZW4F72+P1xJiu4DYVhAA3M0ymOAPljHsawH26xKEUOHD+LU375LfiP64tg7wKuZ2eH8TXDJ+huH1
 4va2I0Pw4fD/9S82qUiZFZtrmkP7CAExq+cFks2Vxkn9QZUWvKvob+NvqphJgs4j7V4WCirUcRJIE
 zAnmj/2Ww==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46762)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1m9UAZ-0002eP-Rr; Fri, 30 Jul 2021 16:11:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1m9UAX-00005c-3y; Fri, 30 Jul 2021 16:11:25 +0100
Date: Fri, 30 Jul 2021 16:11:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Walker <danielwa@cisco.com>
Message-ID: <20210730151124.GH22278@shell.armlinux.org.uk>
References: <20210729234443.1713722-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210729234443.1713722-1-danielwa@cisco.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Balamurugan Selvarajan <balamsel@cisco.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jakub Kicinski <kuba@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xe-linux-external@cisco.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC-PATCH] net: stmmac: Add KR port support.
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

On Thu, Jul 29, 2021 at 04:44:42PM -0700, Daniel Walker wrote:
> From: Balamurugan Selvarajan <balamsel@cisco.com>
> 
> For KR port the mii interface is a chip-to-chip
> interface without a mechanical connector. So PHY
> inits are not applicable. In this case MAC is
> configured to operate at forced speed(1000Mbps)
> and full duplex. Modified driver to accommodate
> PHY and NON-PHY mode.

Can we clarify exactly what you are talking about here. What does
"KR port" refer to? What protocol is spoken by this port? Is it
1000BASE-KX (1000BASE-X over backplane)? Does it include 10GBASE-KR?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
