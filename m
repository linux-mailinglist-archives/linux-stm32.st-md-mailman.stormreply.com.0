Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFE43A49D3
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 22:06:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 498A5C5978A;
	Fri, 11 Jun 2021 20:06:02 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22422C59785
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 20:06:00 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b11so38458607edy.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 13:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9J82lfUtfOhld0+zQlTxDsuWpTNh0bxTBpmDmOlV2PA=;
 b=Alta6xDeTN7DRmmYxXL3IQ/X8sdytpS/n+GrYjjCG+93ybbRgoiTbtUlTuwrejXkS3
 37KscVpgba9Ajo8v4+ukFvsZdgCV3Eis4Y8B2w5+VmiMXmZSBqKI9yPFFwf6B3oaCvb0
 3XD+BX8twxmcSQJsUYyiRU+SvtCuan0UyDTDNXa0B/ASWbIOsHWj7WKXT0EZSUZKwZmx
 SVp8EzuSGVTqS4NY+MMh6HXNZEDfePGudBMp55S89oUIJHkuW0RfXCYZ8dsBNKJKJAVh
 Wx6dfaNXWSt91P3JjBsFl+UbfBuuy7yvPpt5gOWoAHBzCq4zRxb/RGNMCMWOO5grSWhb
 +hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9J82lfUtfOhld0+zQlTxDsuWpTNh0bxTBpmDmOlV2PA=;
 b=X33mDSrGNQVp0s03Cvu4icBpT/kzloEpt4/9SDgWdxiHPFOLECNgh+BQk9vHgWh427
 BdC/pOK/9fMYDZ3d+mL5s7Q0YPWE6btOzbULnRfMwEYYdadkLt+znA7D3+BwpA4BMaVM
 IXfun2Ys/yy1rDAn8U+GMu7hgZu9IPIYyRrAgov0tKMJ0T8O06SWwTH6GlgD1RNPjNL2
 zirqPL0X3Jthh8012kQvYRVEeDwLfIlbawmOIZCX4sDL5OY+e3TiSdJpI7MiLWvBit5n
 yYtz2rmWCn+6h6U0cQ1d53dfcwsO7l6SaOqvjmyz7DLGHzMK//eCO3/0Wv3MgfgQgV4I
 vkEw==
X-Gm-Message-State: AOAM531wmksMV6azJaWUjfZGjDVUxqrvASuw6lg8yOdYkeV5cr7Yaw13
 juokurZ0urUGNMnjAZvo+PA=
X-Google-Smtp-Source: ABdhPJxNlEpITTIafXz9TBGJwWkEwcqI6EwN3AZjuzC31TaR/L75yoR1cwbJcMlwbIx7aX9G5kR7UQ==
X-Received: by 2002:a50:ec08:: with SMTP id g8mr5549553edr.376.1623441959700; 
 Fri, 11 Jun 2021 13:05:59 -0700 (PDT)
Received: from localhost.localdomain ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id w2sm2392084ejn.118.2021.06.11.13.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:05:59 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org
Date: Fri, 11 Jun 2021 23:05:27 +0300
Message-Id: <20210611200531.2384819-10-olteanv@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611200531.2384819-1-olteanv@gmail.com>
References: <20210611200531.2384819-1-olteanv@gmail.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v3 net-next 09/13] net: pcs: xpcs: export
	xpcs_do_config and xpcs_link_up
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

The sja1105 hardware has a quirk in that some changes require a switch
reset, which loses all configuration. When the reset is initiated,
everything needs to be reprogrammed, including the MACs and the PCS.
This is currently done in sja1105_static_config_reload() - we manually
call sja1105_adjust_port_config(), sja1105_sgmii_pcs_config() and
sja1105_sgmii_pcs_force_speed() which are all internal functions.

There is a desire for sja1105 to use the common xpcs driver, and that
means that the equivalents of those functions, xpcs_do_config() and
xpcs_link_up() respectively, will no longer be local functions.

Forcing phylink to retrigger a resolve somehow, say by doing dev_close()
followed by dev_open() is not really an option, because the CPU port
might have a PCS as well, and there is no net device which we can close
and reopen for that. Additionally, the dev_close/dev_open sequence might
force a renegotiation of the copper-side link for SGMII ports connected
to a PHY, and this is undesirable as well, because the switch reset is
much quicker than a PHY autoneg, so we would have a lot more downtime.

The only solution I see is for the sja1105 driver to keep doing what
it's doing, and that means we need to export the equivalents from xpcs
for sja1105_sgmii_pcs_config and sja1105_sgmii_pcs_force_speed, and call
them directly in sja1105_static_config_reload(). This will be done
during the conversion patch.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v2->v3: none
v1->v2: none

 drivers/net/pcs/pcs-xpcs.c   | 10 ++++++----
 include/linux/pcs/pcs-xpcs.h |  4 ++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index b66e46fc88dc..63fda3fc40aa 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -757,8 +757,8 @@ static int xpcs_config_2500basex(struct dw_xpcs *xpcs)
 	return xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_MMD_CTRL, ret);
 }
 
-static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
-			  unsigned int mode)
+int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
+		   unsigned int mode)
 {
 	const struct xpcs_compat *compat;
 	int ret;
@@ -797,6 +797,7 @@ static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(xpcs_do_config);
 
 static int xpcs_config(struct phylink_pcs *pcs, unsigned int mode,
 		       phy_interface_t interface,
@@ -945,8 +946,8 @@ static void xpcs_link_up_sgmii(struct dw_xpcs *xpcs, unsigned int mode,
 		pr_err("%s: xpcs_write returned %pe\n", __func__, ERR_PTR(ret));
 }
 
-static void xpcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
-			 phy_interface_t interface, int speed, int duplex)
+void xpcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
+		  phy_interface_t interface, int speed, int duplex)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 
@@ -955,6 +956,7 @@ static void xpcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
 	if (interface == PHY_INTERFACE_MODE_SGMII)
 		return xpcs_link_up_sgmii(xpcs, mode, speed, duplex);
 }
+EXPORT_SYMBOL_GPL(xpcs_link_up);
 
 static u32 xpcs_get_id(struct dw_xpcs *xpcs)
 {
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index dae7dd8ac683..add077a81b21 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -27,6 +27,10 @@ struct dw_xpcs {
 };
 
 int xpcs_get_an_mode(struct dw_xpcs *xpcs, phy_interface_t interface);
+void xpcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
+		  phy_interface_t interface, int speed, int duplex);
+int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
+		   unsigned int mode);
 void xpcs_validate(struct dw_xpcs *xpcs, unsigned long *supported,
 		   struct phylink_link_state *state);
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
