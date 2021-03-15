Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D17233AAB4
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 06:23:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21D6FC57B77;
	Mon, 15 Mar 2021 05:23:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3BF2C57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 05:23:42 +0000 (UTC)
IronPort-SDR: /H4UInc2LFQq00xX1tAGfdRi1iH+fZw2kOVAhdIDVQTdPTOkaD2VLI6HcVZknsTCL8cgpotuLY
 Bv57XUQsi9Zg==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="274079730"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="274079730"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2021 22:23:42 -0700
IronPort-SDR: ZQekACZLCCbayptBTtxJY464w9G+pFikbNcAw6O5O/v7WBuvbeKoaKqvSJoV3Uv+KiIpKxg/nG
 AgjvyHCkZBWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="373313769"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga006.jf.intel.com with ESMTP; 14 Mar 2021 22:23:38 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King i <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Mon, 15 Mar 2021 13:27:08 +0800
Message-Id: <20210315052711.16728-4-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315052711.16728-1-boon.leong.ong@intel.com>
References: <20210315052711.16728-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Fugang Duan <fugang.duan@nxp.com>, Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/6] net: phylink: make
	phylink_parse_mode() support non-DT platform
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

Certain platform does not support DT, so we make phylink_parse_mode() to
allow non-DT platform to use it to setup in-band AN advertising.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/phy/phylink.c | 5 +++--
 include/linux/phylink.h   | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index dc2800beacc3..96d8e88b4e46 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -271,8 +271,9 @@ static int phylink_parse_mode(struct phylink *pl, struct fwnode_handle *fwnode)
 		pl->cfg_link_an_mode = MLO_AN_FIXED;
 	fwnode_handle_put(dn);
 
-	if (fwnode_property_read_string(fwnode, "managed", &managed) == 0 &&
-	    strcmp(managed, "in-band-status") == 0) {
+	if ((fwnode_property_read_string(fwnode, "managed", &managed) == 0 &&
+	     strcmp(managed, "in-band-status") == 0) ||
+	    pl->config->ovr_an_inband) {
 		if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
 			phylink_err(pl,
 				    "can't use both fixed-link and in-band-status\n");
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index d81a714cfbbd..fd2acfd9b597 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -64,6 +64,7 @@ enum phylink_op_type {
  * @pcs_poll: MAC PCS cannot provide link change interrupt
  * @poll_fixed_state: if true, starts link_poll,
  *		      if MAC link is at %MLO_AN_FIXED mode.
+ * @ovr_an_inband: if true, override PCS to MLO_AN_INBAND
  * @get_fixed_state: callback to execute to determine the fixed link state,
  *		     if MAC link is at %MLO_AN_FIXED mode.
  */
@@ -72,6 +73,7 @@ struct phylink_config {
 	enum phylink_op_type type;
 	bool pcs_poll;
 	bool poll_fixed_state;
+	bool ovr_an_inband;
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
