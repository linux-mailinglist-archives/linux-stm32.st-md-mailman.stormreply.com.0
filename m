Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B1CA86D71
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Apr 2025 16:10:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28CA7C78F77;
	Sat, 12 Apr 2025 14:10:10 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8D97C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CYbTQ2OjNT5HQZlq54gRg5Ekmk2v67BRStp4jn6gpZU=; b=1y1+5saT66vFlxhIPYmjDaHQuZ
 dI5B8IDr5xlLlM/VX7I9KL5h+x3Qnk85E6Bne6SRKCSDFbLg6wXr/qAXMdgUsail8kqEmwukZY0Lb
 zao3rtGUJOkMPhfe3o0DfuGcb9jRbO5dD1onIZkzrtuKiPzlCfjD6yeeLjah/eWCcQjrnJ3GbcbTQ
 Zq5keSSLE1cHrJqsEBfhI6SgUUTuQSmBWfrmDJvCOd58lY2+0bxoDseUPH12JotQleYghX246k2dz
 Z0vyoKPem3QPsSsiaYlxP88NEyjfOuwgk0hCs9g0EAr+Xl05dKvUyi4mbJo3R0/GGrnFbcArST+Mx
 9tAmNiQA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46152)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u3bYT-0004Zy-13;
 Sat, 12 Apr 2025 15:09:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u3bYN-0005iw-23;
 Sat, 12 Apr 2025 15:09:51 +0100
Date: Sat, 12 Apr 2025 15:09:51 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/4] net: stmmac: qcom-ethqos:
	simplifications
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

Remove unnecessary code from the qcom-ethqos glue driver.

Start by consistently using -> serdes_speed to set the speed of the
serdes PHY rather than sometimes using ->serdes_speed and sometimes
using ->speed.

This then allows the removal of ->speed in the second patch.

There is no need to set the maximum speed just because we're using
2500BASE-X - phylink already knows that 2500BASE-X can't support
faster speeds.

This then makes qcom_ethqos_speed_mode_2500() redundant as it's
setting the interface mode to the value that was determined in the
switch statement that already determined that the interface mode
had this value.

Not tested on hardware.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 43 ++++++++--------------
 1 file changed, 15 insertions(+), 28 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
