Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A4481746
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Dec 2021 23:31:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BFD4C5E2CC;
	Wed, 29 Dec 2021 22:31:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1633C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Dec 2021 22:31:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5BA0AB81840;
 Wed, 29 Dec 2021 22:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086E3C36AEC;
 Wed, 29 Dec 2021 22:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640817108;
 bh=B4HVt5LABOlLWHuHdH8fZyS2jYElsURWkNBEs1eJcD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=frU5+fxE/J6Uql1O2WBDMETbgRbTR4pLU9XU7UX0asg9wlJZJLGZWbwANOMSQzO5A
 lR4u9baiD4O7s6ENK3x4IZTQB6tUEmUn+N2LdX54kvjjRzW1cnMhQp6O9tBqH+uBng
 4MzzeMcchs5qjCBqOQQYl31OQOtM5mK1DR17Vp38Y6cNyjDQOMh0S/RnVETIAq0TEW
 635PsES1z6RT4dyrOSC+7jzPWzAVmCb6aAMDjlMom1kPyzTWSf6u5QL62yW5hIxuU6
 smi1JiutLmqQRZCwBuuoJxCWBIm6lSiFX7/WIB4RbS+FooYV45VhqXJQcpA11NTBSj
 NvTSNIY8rEE0A==
From: Jakub Kicinski <kuba@kernel.org>
To: ast@kernel.org,
	daniel@iogearbox.net
Date: Wed, 29 Dec 2021 14:31:38 -0800
Message-Id: <20211229223139.708975-2-kuba@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229223139.708975-1-kuba@kernel.org>
References: <20211229223139.708975-1-kuba@kernel.org>
MIME-Version: 1.0
Cc: linux-hyperv@vger.kernel.org, alexandre.torgue@foss.st.com,
 chenhao288@hisilicon.com, ndagan@amazon.com, wei.liu@kernel.org,
 kys@microsoft.com, sthemmin@microsoft.com, decui@microsoft.com,
 moyufeng@huawei.com, joabreu@synopsys.com, Jakub Kicinski <kuba@kernel.org>,
 sgoutham@marvell.com, grygorii.strashko@ti.com, haiyangz@microsoft.com,
 akiyano@amazon.com, saeedb@amazon.com, peppe.cavallaro@st.com,
 shayagr@amazon.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 darinzon@amazon.com, sameehj@amazon.com, bpf@vger.kernel.org
Subject: [Linux-stm32] [PATCH bpf-next 1/2] net: add includes masked by
	netdevice.h including uapi/bpf.h
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

Add missing includes unmasked by the subsequent change.

Mostly network drivers missing an include for XDP_PACKET_HEADROOM.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: shayagr@amazon.com
CC: akiyano@amazon.com
CC: darinzon@amazon.com
CC: ndagan@amazon.com
CC: saeedb@amazon.com
CC: sgoutham@marvell.com
CC: kys@microsoft.com
CC: haiyangz@microsoft.com
CC: sthemmin@microsoft.com
CC: wei.liu@kernel.org
CC: decui@microsoft.com
CC: peppe.cavallaro@st.com
CC: alexandre.torgue@foss.st.com
CC: joabreu@synopsys.com
CC: mcoquelin.stm32@gmail.com
CC: grygorii.strashko@ti.com
CC: sameehj@amazon.com
CC: chenhao288@hisilicon.com
CC: moyufeng@huawei.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-hyperv@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-omap@vger.kernel.org
---
 drivers/net/ethernet/amazon/ena/ena_netdev.h       | 1 +
 drivers/net/ethernet/cavium/thunder/nicvf_queues.c | 1 +
 drivers/net/ethernet/microsoft/mana/mana_en.c      | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       | 1 +
 drivers/net/ethernet/ti/cpsw_priv.h                | 2 ++
 kernel/bpf/net_namespace.c                         | 1 +
 6 files changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.h b/drivers/net/ethernet/amazon/ena/ena_netdev.h
index 0c39fc2fa345..9391c7101fba 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.h
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.h
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/netdevice.h>
 #include <linux/skbuff.h>
+#include <uapi/linux/bpf.h>
 
 #include "ena_com.h"
 #include "ena_eth_com.h"
diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
index 50bbe79fb93d..4367edbdd579 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
@@ -10,6 +10,7 @@
 #include <linux/iommu.h>
 #include <net/ip.h>
 #include <net/tso.h>
+#include <uapi/linux/bpf.h>
 
 #include "nic_reg.h"
 #include "nic.h"
diff --git a/drivers/net/ethernet/microsoft/mana/mana_en.c b/drivers/net/ethernet/microsoft/mana/mana_en.c
index c1d5a374b967..2ece9e90dc50 100644
--- a/drivers/net/ethernet/microsoft/mana/mana_en.c
+++ b/drivers/net/ethernet/microsoft/mana/mana_en.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
 /* Copyright (c) 2021, Microsoft Corporation. */
 
+#include <uapi/linux/bpf.h>
+
 #include <linux/inetdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/ethtool.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4f5292cadf54..d42b6af32d6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -22,6 +22,7 @@
 #include <linux/net_tstamp.h>
 #include <linux/reset.h>
 #include <net/page_pool.h>
+#include <uapi/linux/bpf.h>
 
 struct stmmac_resources {
 	void __iomem *addr;
diff --git a/drivers/net/ethernet/ti/cpsw_priv.h b/drivers/net/ethernet/ti/cpsw_priv.h
index f33c882eb70e..74555970730c 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.h
+++ b/drivers/net/ethernet/ti/cpsw_priv.h
@@ -6,6 +6,8 @@
 #ifndef DRIVERS_NET_ETHERNET_TI_CPSW_PRIV_H_
 #define DRIVERS_NET_ETHERNET_TI_CPSW_PRIV_H_
 
+#include <uapi/linux/bpf.h>
+
 #include "davinci_cpdma.h"
 
 #define CPSW_DEBUG	(NETIF_MSG_HW		| NETIF_MSG_WOL		| \
diff --git a/kernel/bpf/net_namespace.c b/kernel/bpf/net_namespace.c
index 542f275bf252..868cc2c43899 100644
--- a/kernel/bpf/net_namespace.c
+++ b/kernel/bpf/net_namespace.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/bpf.h>
+#include <linux/bpf-netns.h>
 #include <linux/filter.h>
 #include <net/net_namespace.h>
 
-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
