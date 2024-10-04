Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F2C9900C6
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 12:21:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7DCBC78024;
	Fri,  4 Oct 2024 10:21:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E13E3C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 10:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m9oh1PhzOsMruHoTr7GKJZbx7Eu50PYYTv0Q1dbO6m0=; b=zIciZWcJO5Ff0np2S4rzpG9bla
 0YQNLfdQ7+Au8zeF+eQ2ybzYjG6366+TQTvZllb5wG17MEb/60qUYiocwjFgkzlZJr38bt2c5ObPG
 WlAltHttNNHpaoW/UHhco0ZXq8pz7A/vj4cJVOrXS3Md9StvZkWX2d/pnB4DYxqmAZxC5rGAOSrhE
 WBAQkuYS+WwfmLnqhsy3xtLcuC2L+cfss3bnWHyr+m0XbBHKVto89mEWd4J5SO0diIhr8FMqWi1BQ
 xpcSd0gLAEoGZZnMe4q2SPdwiJ6luUjJltNxUW9O9Vs+wreLvUOeR40SZQO2Oj0dbwNLTLM6KVIGD
 d9l+TpGQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35160 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1swfQn-0001gt-1r;
 Fri, 04 Oct 2024 11:21:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1swfQj-006DfO-QQ; Fri, 04 Oct 2024 11:21:01 +0100
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1swfQj-006DfO-QQ@rmk-PC.armlinux.org.uk>
Date: Fri, 04 Oct 2024 11:21:01 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 05/13] net: pcs: xpcs: move
 definition of struct dw_xpcs to private header
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

There should be no reason for anything outside the XPCS code to know
the contents of struct dw_xpcs - this is a private structure to XPCS.
Move the definition to the private pcs-xpcs.h header, leaving a
declaration in the global pcs/pcs-xpcs.h

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.h   | 18 ++++++++++++++++++
 include/linux/pcs/pcs-xpcs.h | 18 +-----------------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.h b/drivers/net/pcs/pcs-xpcs.h
index fa05adfae220..1b546eae8280 100644
--- a/drivers/net/pcs/pcs-xpcs.h
+++ b/drivers/net/pcs/pcs-xpcs.h
@@ -123,6 +123,24 @@
 #define DW_XPCS_INFO_DECLARE(_name, _pcs, _pma)				\
 	static const struct dw_xpcs_info _name = { .pcs = _pcs, .pma = _pma }
 
+struct dw_xpcs_desc;
+
+enum dw_xpcs_clock {
+	DW_XPCS_CORE_CLK,
+	DW_XPCS_PAD_CLK,
+	DW_XPCS_NUM_CLKS,
+};
+
+struct dw_xpcs {
+	struct dw_xpcs_info info;
+	const struct dw_xpcs_desc *desc;
+	struct mdio_device *mdiodev;
+	struct clk_bulk_data clks[DW_XPCS_NUM_CLKS];
+	struct phylink_pcs pcs;
+	phy_interface_t interface;
+	bool need_reset;
+};
+
 int xpcs_read(struct dw_xpcs *xpcs, int dev, u32 reg);
 int xpcs_write(struct dw_xpcs *xpcs, int dev, u32 reg, u16 val);
 int xpcs_read_vpcs(struct dw_xpcs *xpcs, int reg);
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 868515f3cc88..b5b5d17998b8 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -21,8 +21,6 @@
 #define DW_AN_C37_1000BASEX		4
 #define DW_10GBASER			5
 
-struct dw_xpcs_desc;
-
 enum dw_xpcs_pcs_id {
 	DW_XPCS_ID_NATIVE = 0,
 	NXP_SJA1105_XPCS_ID = 0x00000010,
@@ -48,21 +46,7 @@ struct dw_xpcs_info {
 	u32 pma;
 };
 
-enum dw_xpcs_clock {
-	DW_XPCS_CORE_CLK,
-	DW_XPCS_PAD_CLK,
-	DW_XPCS_NUM_CLKS,
-};
-
-struct dw_xpcs {
-	struct dw_xpcs_info info;
-	const struct dw_xpcs_desc *desc;
-	struct mdio_device *mdiodev;
-	struct clk_bulk_data clks[DW_XPCS_NUM_CLKS];
-	struct phylink_pcs pcs;
-	phy_interface_t interface;
-	bool need_reset;
-};
+struct dw_xpcs;
 
 struct phylink_pcs *xpcs_to_phylink_pcs(struct dw_xpcs *xpcs);
 int xpcs_get_an_mode(struct dw_xpcs *xpcs, phy_interface_t interface);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
