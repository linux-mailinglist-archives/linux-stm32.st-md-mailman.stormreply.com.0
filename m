Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A913B545A8D
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 05:34:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BB9EC5F1D7;
	Fri, 10 Jun 2022 03:34:51 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5046EC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 03:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654832089; x=1686368089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VsECB4rGQ9AOMk/R4KLPANHo0BZNISsxKzENHkPxCnY=;
 b=mOKIcACQGxWZgAFx/hfhBOg9nJn/KHP53CmZytHTxZgvPKV6+3QuySiR
 rRtpmPDlPMopjFNtEMpNpC88eiaDdK00rY5VFdU0IXalZayS2pyxxC8lT
 e8+/RziNd7Lc1dx3HUxBX9vfnVllsTtrBUZanlCM5cvJUTUbkuSr1K+/d
 g8maMUYwlWDjZdwGo0nJlmEQ7qdftZe+PFOoD+yRy5WifWjWDObNlPMmB
 wt4BJXMCfWFwooN/i63L8TojNJB3I6aARZhsAxZhQLiMGQs7U1wFWLDzQ
 +1Yi42s4x0dHQbzwh0iGJspew7N7RaY3SaL2jfXjgzG0NGVnTmGYTpduf A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278304348"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="278304348"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 20:34:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="585971638"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by fmsmga007.fm.intel.com with ESMTP; 09 Jun 2022 20:34:44 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri, 10 Jun 2022 11:29:39 +0800
Message-Id: <20220610032941.113690-5-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610032941.113690-1-boon.leong.ong@intel.com>
References: <20220610032941.113690-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Emilio Riva <emilio.riva@ericsson.com>,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 4/6] net: phylink: unset
	ovr_an_inband if fixed-link is selected
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

If "fixed-link" DT or ACPI _DSD subnode is selected, it should take
precedence over the value of ovr_an_inband passed by MAC driver.

Fixes: ab39385021d1 ("net: phylink: make phylink_parse_mode() support non-DT platform")
Tested-by: Emilio Riva <emilio.riva@ericsson.com>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/phy/phylink.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 066684b8091..566852815e0 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -609,8 +609,10 @@ static int phylink_parse_mode(struct phylink *pl, struct fwnode_handle *fwnode)
 	const char *managed;
 
 	dn = fwnode_get_named_child_node(fwnode, "fixed-link");
-	if (dn || fwnode_property_present(fwnode, "fixed-link"))
+	if (dn || fwnode_property_present(fwnode, "fixed-link")) {
 		pl->cfg_link_an_mode = MLO_AN_FIXED;
+		pl->config->ovr_an_inband = false;
+	}
 	fwnode_handle_put(dn);
 
 	if ((fwnode_property_read_string(fwnode, "managed", &managed) == 0 &&
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
