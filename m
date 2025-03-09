Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60321A5834C
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Mar 2025 11:48:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23429C78F6C;
	Sun,  9 Mar 2025 10:48:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADE3FC78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Mar 2025 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741517295; x=1773053295;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DBW4RiV1hA2krrTYWGgrezOQYwadpmAnsmYLouK0N2Y=;
 b=R54Hr8n36Ru1Ma9wrClR/SW4nOQNObWHMLfeXO8RD/bNRdJT9Bdq5H57
 3+xGMqAOJkhTntnWDkhu5I/aqpDYXKD/Ox55cRAaEzNTcorh/3FbsKfrt
 K3YLYxNYviMil5Rir2NS1KKsJND9TFS+QOrtijDdL/qH1sXEYvIg62d3m
 FT1jEwai3xhGG7Wcl+gFXX8cwYZqyeR83uDXBRDQ36S7iaOy/u9XjmZRw
 7pW6rKbzGN1J/9NQpUj2rfCeUK1U630EW/kmLC9EEMulOEs0r4xeDqDHe
 4RCup2NvqUsdFEosk7zRYarURiDmOnnST1WD0XPCoLSuDtj4epOl7TpIk Q==;
X-CSE-ConnectionGUID: OB+/ySo7T5OimOdMmU/mWw==
X-CSE-MsgGUID: +RyqY9qJSFymEiRMwTtNEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42636096"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; d="scan'208";a="42636096"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 03:48:13 -0700
X-CSE-ConnectionGUID: yJsTG5OWTBy0cmy9I6COow==
X-CSE-MsgGUID: i23RBoWlS6OYZpjedHoAYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; d="scan'208";a="124655092"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
 by orviesa003.jf.intel.com with ESMTP; 09 Mar 2025 03:48:05 -0700
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Sun,  9 Mar 2025 06:46:40 -0400
Message-Id: <20250309104648.3895551-7-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
References: <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH iwl-next v9 06/14] igc: use FIELD_PREP and
	GENMASK for existing TX packet buffer size
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

In preparation for an upcoming patch that will modify the TX buffer size
in  TSN mode, replace IGC_TXPBSIZE_TSN and IGC_TXPBSIZE_DEFAULT
implementation with new macros that utilizes FIELD_PREP and GENMASK for
clarity.

The newly introduced macros follow the naming from the i226 SW User Manual
for easy reference.

I've tested IGC_TXPBSIZE_TSN and IGC_TXPBSIZE_DEFAULT before and after the
refactoring, and their values remain unchanged.

Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc_defines.h | 23 ++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_defines.h b/drivers/net/ethernet/intel/igc/igc_defines.h
index b6744ece64f0..b180e1497cc5 100644
--- a/drivers/net/ethernet/intel/igc/igc_defines.h
+++ b/drivers/net/ethernet/intel/igc/igc_defines.h
@@ -398,10 +398,29 @@
 
 /* RXPBSIZE default value for Express and BMC buffer */
 #define IGC_RXPBSIZE_EXP_BMC_DEFAULT	0x000000A2
-#define IGC_TXPBSIZE_DEFAULT		0x04000014 /* TXPBSIZE default */
 #define IGC_RXPBS_CFG_TS_EN		0x80000000 /* Timestamp in Rx buffer */
 
-#define IGC_TXPBSIZE_TSN	0x04145145 /* 5k bytes buffer for each queue */
+/* Mask for TX packet buffer size */
+#define IGC_TXPB0SIZE_MASK		GENMASK(5, 0)
+#define IGC_TXPB1SIZE_MASK		GENMASK(11, 6)
+#define IGC_TXPB2SIZE_MASK		GENMASK(17, 12)
+#define IGC_TXPB3SIZE_MASK		GENMASK(23, 18)
+/* Mask for OS to BMC packet buffer size */
+#define IGC_OS2BMCPBSIZE_MASK		GENMASK(29, 24)
+/* TX Packet buffer size in KB */
+#define IGC_TXPB0SIZE(x)		FIELD_PREP(IGC_TXPB0SIZE_MASK, (x))
+#define IGC_TXPB1SIZE(x)		FIELD_PREP(IGC_TXPB1SIZE_MASK, (x))
+#define IGC_TXPB2SIZE(x)		FIELD_PREP(IGC_TXPB2SIZE_MASK, (x))
+#define IGC_TXPB3SIZE(x)		FIELD_PREP(IGC_TXPB3SIZE_MASK, (x))
+/* OS to BMC packet buffer size in KB */
+#define IGC_OS2BMCPBSIZE(x)		FIELD_PREP(IGC_OS2BMCPBSIZE_MASK, (x))
+/* Default value following I225/I226 SW User Manual Section 8.3.2 */
+#define IGC_TXPBSIZE_DEFAULT ( \
+	IGC_TXPB0SIZE(20) | IGC_TXPB1SIZE(0) | IGC_TXPB2SIZE(0) | \
+	IGC_TXPB3SIZE(0) | IGC_OS2BMCPBSIZE(4))
+#define IGC_TXPBSIZE_TSN ( \
+	IGC_TXPB0SIZE(5) | IGC_TXPB1SIZE(5) | IGC_TXPB2SIZE(5) | \
+	IGC_TXPB3SIZE(5) | IGC_OS2BMCPBSIZE(4))
 
 #define IGC_DTXMXPKTSZ_TSN	0x19 /* 1600 bytes of max TX DMA packet size */
 #define IGC_DTXMXPKTSZ_DEFAULT	0x98 /* 9728-byte Jumbo frames */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
