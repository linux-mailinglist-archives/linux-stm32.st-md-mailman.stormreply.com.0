Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D45A9A2F9
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 09:12:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3150BC78032;
	Thu, 24 Apr 2025 07:12:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60EDBC7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 07:12:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3975143A4E;
 Thu, 24 Apr 2025 07:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745478750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CGBKQP0ozZgi8SSFu8gigr2mI4CbgnOZryTHhEPMZd8=;
 b=CbCZT+Rdeqcs/wB6DjINTQ7gct4Pv/v0ovBacHSLBoggDrnVKL9cYb9y0QYiK/Jj0UjGi5
 j1k6aEKBDyY4DXp+Oeg9rEQjQr7qUYQb0eaPp3ceSnBB4+b9OL8jewRrWX7KCjDKJNqTNt
 +nJnLE02xC7P36rwG0DJJnc4KWUvtlIJydXrw8O8LO4SkT/poQoDS1IyTu6NF7ycoy6u9S
 G6LmCYrXwkSxOPeXGTRukAqfQk9RPkkCNDxwpWu4U2MtB8TQGVjL/zapprBDBiBFOuJUYc
 SZ/z0c+VSTQ2t8Ve0QcaEIir5dFn2k7Y46HPt/RlgW00qkVU14t89GVMXkyWNg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Date: Thu, 24 Apr 2025 09:12:19 +0200
Message-ID: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeekkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefhleeihefgffeiffdtffeivdehfeetheekudekgfetffetveffueeujeeitdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtoheplhhinhhugiesrghrmhhli
 hhnuhigrdhorhhgrdhukhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/3] net: stmmac: socfpga:
	1000BaseX support and cleanups
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

Hi everyone,

This V3 is simply a re-send of V2, targeting net-next instead of net as
the V2 did by mistake.

No other changes besides a rebase on net-next were made.

This small series sorts-out 1000BaseX support and does a bit of cleanup
for the Lynx conversion.

Patch 1 makes sure that we set the right phy_mode when working in
1000BaseX mode, so that the internal GMII is configured correctly.

Patch 2 removes a check for phy_device upon calling fix_mac_speed(). As
the SGMII adapter may be chained to a Lynx PCS, checking for a
phy_device to be attached to the netdev before enabling the SGMII
adapter doesn't make sense, as we won't have a downstream PHY when using
1000BaseX.

Patch 3 cleans an unused field from the PCS conversion.

Changes in V3:
 - None besides targeting net-next instead of net

Changes in V2: 
 - Added Russell's review tags
 - Reworked patch 2 to check for phy_interface when configuring the
   adapter, as suggested by Russell.

V1: https://lore.kernel.org/netdev/20250422094701.49798-1-maxime.chevallier@bootlin.com/
V2: https://lore.kernel.org/netdev/20250423104646.189648-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (3):
  net: stmmac: socfpga: Enable internal GMII when using 1000BaseX
  net: stmmac: socfpga: Don't check for phy to enable the SGMII adapter
  net: stmmac: socfpga: Remove unused pcs-mdiodev field

 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c   | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
