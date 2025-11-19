Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9DCC6E3E0
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 12:34:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 149D6C62D37;
	Wed, 19 Nov 2025 11:34:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E62CC56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uEewVsMLAv2aDxqt0r1sf+yLOlZnw0JDZFJF1n58Zro=; b=pOSTqqYzG2omR7F+wWJF0cCRo+
 +VUDDo73jyRh/xEVBPRhdQQ6T9zGEhqtu67BbdJzQt9+x+Tm5vz70rsV0Q8SAuOy/qOGC0XGJyt9V
 yeEJV3XEgrvnb794NKTTMqgwEks9JO3cAKZfuEmzMgdON1v6C8yuMDU7Mrgn5pkwLrjEIl7yv2963
 sb/Jpwso5IKLEk9cYwUgbcDJOjs7b52fwlY71z3recyM2MxH2sr8w9JcHXtytdh5fcFo9sO1FkXNj
 9hUmy3TMGncEFkI6+bqK7veiMvUCWByE7BlxmGlGxOjd65F749xBkBq7nxg3SnWAR9aWu/02ThhFT
 x+nb8vgg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36316)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vLgS3-000000004an-22ey;
 Wed, 19 Nov 2025 11:34:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vLgS0-000000003NK-0l0S; Wed, 19 Nov 2025 11:34:16 +0000
Date: Wed, 19 Nov 2025 11:34:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: qcon-ethqos:
 "rgmii" accessor cleanups
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

This series cleans up the "rgmii" accessors in qcom-ethqos.

readl() and writel() return and take a u32 for the value. Rather than
implicitly casting this to an int, keep it as a u32.

Add set/clear functions to reduce the code and make it easier to read.

Finally, convert the open-coded poll loops to use the iopoll helpers.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 245 +++++++++------------
 1 file changed, 110 insertions(+), 135 deletions(-)
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
