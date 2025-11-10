Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4ABC4745F
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Nov 2025 15:42:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 036CDC5A4C0;
	Mon, 10 Nov 2025 14:42:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BBE5C57B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Nov 2025 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pTHTnt47dLnvjBSkUPSimpdVNbseAt9gYfCc7cGjwZM=; b=Bg7eIF/nhX4f25nLvWrbk05hXu
 19ZiIrw2v7uwrhAks3/yHKlyo4RfB5fVVRH5snm1fNTylSIqs32z1Q1PzQy1ED4RdFgyuftQScOjR
 Wv8McRxhFq7arVI56mIh1XPaiMOnSMZ68dyPivUOo7jvsNZzgMva9PeT0qq6+41kNS/wSZ0lWI6q3
 lg9KQn7EqjUKzfEk5YIODMbWh2RTJNPh0UTe4mAG7kVu1JlLAr1Jv1JrlD+i8dT08UlVdRRHCrRH/
 ktUJjjJ3/jaDmas8otejsFlS3sWqFkCab2tW2JNXdQb+AqsYk5Lxum9+M4PR5PRmZxy2/7G/8G8Uj
 Aw3Kplrg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55342)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vIT6F-000000001Dg-1Zxp;
 Mon, 10 Nov 2025 14:42:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vIT6A-0000000023w-4AxZ; Mon, 10 Nov 2025 14:42:27 +0000
Date: Mon, 10 Nov 2025 14:42:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aRH50uVDX4_9O5ZU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amlogic@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac: convert meson8b
 to use stmmac_get_phy_intf_sel()
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

This series splits out meson8b from the previous 16 patch series
as that now has r-b tags.

This series converts meson8b to use stmmac_get_phy_intf_sel(). This
driver is not converted to the set_phy_intf_sel() method as it is
unclear whether there are ordering dependencies that would prevent
it. I would appreciate the driver author looking in to whether this
conversion is possible.

Technically v2, since these changes were posted as part of the 16
patch series. No changes other than r-b tags added.

 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 30 ++++++++--------------
 1 file changed, 10 insertions(+), 20 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
