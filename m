Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22191A3F6F7
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Feb 2025 15:15:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6A24C7A839;
	Fri, 21 Feb 2025 14:15:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D16EBC7A837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 14:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZN090mxAPz84RAmjDf1ffqgTe4ng9t/Mi1/ZHq++UpE=; b=0/Sbe6zBOF5wWfA8ZGcllkkHOu
 tAQPGfV0LWLk2aLeX2iOW3NchjXJWQjzLAX652zVJ8XRPNZc6RRylLZVEzVtOfzgC9GgS5bxFd0WC
 TyG0hSJXiSZSnId8QQCxJVWSdnr1ccNyBUxwUx0Wsbxx/C06VxWuEhNFProVooYVF1ShrIV7i1MK8
 An9WxG+DHPwaJGy8aCFnKRKK0unAJjNtjvSfjl1/AKDj+Ie8ttmp2B+12n5mUEaV0gG5nJ5hFmGEM
 ln+zk/UrQfwec/G+KuVUJakLk7zIqlAG/lv3zM2UoOrSb/ooFhNywzerlCXYNVMnb2+tfUS8S9WuJ
 ZhqypXRQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33718)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tlToH-0004nV-1b;
 Fri, 21 Feb 2025 14:15:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tlToD-00023s-0v;
 Fri, 21 Feb 2025 14:15:17 +0000
Date: Fri, 21 Feb 2025 14:15:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, Drew Fustini <drew@pdp7.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-riscv@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Fu Wei <wefu@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: thead: clean up
	clock rate setting
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

Hi,

This series cleans up the thead clock rate setting to use the
rgmii_clock() helper function added to phylib.

The first patch switches over to using the rgmii_clock() helper,
and the second patch cleans up the verification that the desired
clock rate is achievable, allowing the private clock rate
definitions to be removed.

 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 28 ++++++++---------------
 1 file changed, 9 insertions(+), 19 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
