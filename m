Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1720364056
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Apr 2021 13:20:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79980C57196;
	Mon, 19 Apr 2021 11:20:59 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 946B3C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 11:20:58 +0000 (UTC)
IronPort-SDR: kit/XGO0umceitgTgy+62DKVNn3aQ4TJuWINO/b8xL3kJdFUxhRuHnr79TSQigvBmFmRZGb5p0
 kQoUqRZ7m8PQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="193185710"
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; d="scan'208";a="193185710"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 04:20:56 -0700
IronPort-SDR: gG9C6LbgTpQvO1pgi3EUWUtteiHAWMr3es6AOL9cOIY9BL44ntzJSGacgAPQMcVOriHIa6Wfu3
 F5yC971w9myg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; d="scan'208";a="390630159"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 19 Apr 2021 04:20:55 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.59])
 by linux.intel.com (Postfix) with ESMTP id 669915808CA;
 Mon, 19 Apr 2021 04:20:53 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 19 Apr 2021 19:25:30 +0800
Message-Id: <20210419112530.20395-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: fix memory leak
	during driver probe
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

On driver probe, kmemleak reported the following memory leak which was
due to allocated bitmap that was not being freed in stmmac_dvr_probe().

unreferenced object 0xffff9276014b13c0 (size 8):
  comm "systemd-udevd", pid 2143, jiffies 4294681112 (age 116.720s)
  hex dump (first 8 bytes):
    00 00 00 00 00 00 00 00                          ........
  backtrace:
    [<00000000c51e34b2>] stmmac_dvr_probe+0x1c0/0x440 [stmmac]
    [<00000000b530eb41>] intel_eth_pci_probe.cold+0x2b/0x14e [dwmac_intel]
    [<00000000b10f8929>] pci_device_probe+0xd2/0x150
    [<00000000fb254c74>] really_probe+0xf8/0x410
    [<0000000034128a59>] driver_probe_device+0x5d/0x150
    [<00000000016104d5>] device_driver_attach+0x53/0x60
    [<00000000cb18cd07>] __driver_attach+0x96/0x140
    [<00000000da9ffd5c>] bus_for_each_dev+0x7a/0xc0
    [<00000000af061a88>] bus_add_driver+0x184/0x1f0
    [<000000008be5c1c5>] driver_register+0x6c/0xc0
    [<0000000052b18a9e>] do_one_initcall+0x4d/0x210
    [<00000000154d4f07>] do_init_module+0x5c/0x230
    [<000000009b648d09>] load_module+0x2a5a/0x2d40
    [<000000000d86b76d>] __do_sys_finit_module+0xb5/0x120
    [<000000002b0cef95>] do_syscall_64+0x33/0x40
    [<0000000067b45bbb>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Cc: Ong Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9f396648d76f..d1ca07c846e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7035,6 +7035,7 @@ int stmmac_dvr_probe(struct device *device,
 error_hw_init:
 	destroy_workqueue(priv->wq);
 	stmmac_bus_clks_config(priv, false);
+	bitmap_free(priv->af_xdp_zc_qps);
 
 	return ret;
 }
@@ -7077,6 +7078,7 @@ int stmmac_dvr_remove(struct device *dev)
 		stmmac_mdio_unregister(ndev);
 	destroy_workqueue(priv->wq);
 	mutex_destroy(&priv->lock);
+	bitmap_free(priv->af_xdp_zc_qps);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
