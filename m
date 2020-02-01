Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1C150227
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2020 09:00:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E636FC36B0C;
	Mon,  3 Feb 2020 08:00:42 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E76EC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Feb 2020 02:04:03 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j4so4556300pgi.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 18:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ro9iu9VNOuWviWh4OwZbe94+Deahhttu3CMtreUHnJg=;
 b=qld644UZy5MSMdAtQDkFv4eR5rOeOIeuYYfxUs23Icnpl5o/mtxhvzILGSb2z3jyMK
 c4iUPxDxY0Yui24NWEKH6kWwdJHWBYIaJbb+XuE5HNcq0q1qMCIs1vanew6u6v1GhJw9
 T2PcbubEr4HNdp7sRw4LVM3gfCDjNnqxxPI5MEdEgxq/gTu7B14se15UnnzgPmYO7Y1F
 Onh2bVuPh9sw+R1MxRUdtJ3k/kMPZ9sED/MwqC3dx7ii9eVo7Fg0SxP6ejCYvW5RGAcO
 xRR9sNJU9jPBC74vhh33HTE/r8mAT9q+SVPXs4nUv4T2HKAfxu1oG4uYc+5fw45hAwru
 Ohgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ro9iu9VNOuWviWh4OwZbe94+Deahhttu3CMtreUHnJg=;
 b=sGyKqIpWmSO4BDIM+9HeO3FU9je/LB95P+U26LzuIUz/Tp8oPC0kT8A+LqSHO/FBf7
 1iUtfFfsXhkeg+5dHarx4gMD2ACHPXW0PaKwaGwKAI835KVPoM4SAFUoUOF3O4KeofQI
 sZZE1HX+Ez+QgADxoCx2wxuIRC1cofTAgaA3QqLaL11ArQNHhUwg+HBlG84xXQ9jm8Jj
 qZFxKx5M/oCd/4/3C91S8pBYcSoPFpb+tve1vmNgVe6gUA5nqcUQ0ccl1cHvCAzlrSvU
 wI7PJLFzH9zpcuPZhjMe9CBcFpIrmsY63D4abm3rp+mJpulWHiAsiknsFPOCqS/2M6yw
 OasQ==
X-Gm-Message-State: APjAAAXgLZsqU/FP7qE8OpfLvdZk8vRpqJ7ufpWXkh3i87SCdBQhXNNL
 a30hqNICNz6/mwZFEyvJaQ0=
X-Google-Smtp-Source: APXvYqx+2t7NY80ATnmYXbW5lMP4yKLfBufkJ9KD/yZ72OykzVDh9Voe5Bf4K1yXya/3K/FKiTxm4w==
X-Received: by 2002:a63:8e:: with SMTP id 136mr13129030pga.319.1580522641354; 
 Fri, 31 Jan 2020 18:04:01 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id p3sm11744575pfg.184.2020.01.31.18.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 18:04:00 -0800 (PST)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: davem@davemloft.net, peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com
Date: Fri, 31 Jan 2020 18:01:24 -0800
Message-Id: <20200201020124.5989-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:00:42 +0000
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Delete txtimer in suspend()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

When running v5.5 with a rootfs on NFS, memory abort may happen in
the system resume stage:
 Unable to handle kernel paging request at virtual address dead00000000012a
 [dead00000000012a] address between user and kernel address ranges
 pc : run_timer_softirq+0x334/0x3d8
 lr : run_timer_softirq+0x244/0x3d8
 x1 : ffff800011cafe80 x0 : dead000000000122
 Call trace:
  run_timer_softirq+0x334/0x3d8
  efi_header_end+0x114/0x234
  irq_exit+0xd0/0xd8
  __handle_domain_irq+0x60/0xb0
  gic_handle_irq+0x58/0xa8
  el1_irq+0xb8/0x180
  arch_cpu_idle+0x10/0x18
  do_idle+0x1d8/0x2b0
  cpu_startup_entry+0x24/0x40
  secondary_start_kernel+0x1b4/0x208
 Code: f9000693 a9400660 f9000020 b4000040 (f9000401)
 ---[ end trace bb83ceeb4c482071 ]---
 Kernel panic - not syncing: Fatal exception in interrupt
 SMP: stopping secondary CPUs
 SMP: failed to stop secondary CPUs 2-3
 Kernel Offset: disabled
 CPU features: 0x00002,2300aa30
 Memory Limit: none
 ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

It's found that stmmac_xmit() and stmmac_resume() sometimes might
run concurrently, possibly resulting in a race condition between
mod_timer() and setup_timer(), being called by stmmac_xmit() and
stmmac_resume() respectively.

Since the resume() runs setup_timer() every time, it'd be safer to
have del_timer_sync() in the suspend() as the counterpart.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ff1cbfc834b0..5836b21edd7e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4974,6 +4974,7 @@ int stmmac_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	u32 chan;
 
 	if (!ndev || !netif_running(ndev))
 		return 0;
@@ -4987,6 +4988,9 @@ int stmmac_suspend(struct device *dev)
 
 	stmmac_disable_all_queues(priv);
 
+	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
+		del_timer_sync(&priv->tx_queue[chan].txtimer);
+
 	/* Stop TX/RX DMA */
 	stmmac_stop_all_dma(priv);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
