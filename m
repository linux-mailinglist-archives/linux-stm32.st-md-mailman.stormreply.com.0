Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE629E513
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 08:52:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8142C424BA;
	Thu, 29 Oct 2020 07:52:05 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87DD3C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 06:50:49 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20201029065039euoutp0299d0b109f091b06b18e57233b39f98ca~CY_HgXmj_2829328293euoutp028
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 06:50:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20201029065039euoutp0299d0b109f091b06b18e57233b39f98ca~CY_HgXmj_2829328293euoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1603954239;
 bh=rjGb/q462jUGsbZXYDSlLsq4C4w7bm1hZhL3PvZ+/BM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=r/lCmMLMuGcI83b9fdXB6ovIz8k9UpakiNdqgUTvpQWNxI0LQrmqZgDRZ1gd5hfPp
 qHoB6GWi9e3GGoYDLW4Jt7O54ToMMMCSasaDzGqAOHJ2/fpR3JimBG7P+W5tJNosLN
 F3V7F1j64SXvCxixOU1fWyOcqJvk/W/UkWxsYUkA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201029065029eucas1p29b582baa057f56bdb985b2abfbe82279~CY9_-FYLi1895718957eucas1p2J;
 Thu, 29 Oct 2020 06:50:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C8.F4.05997.5366A9F5; Thu, 29
 Oct 2020 06:50:29 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201029065029eucas1p225422e700c29e2e84e227cb14ea6de52~CY9_VDseT1895718957eucas1p2I;
 Thu, 29 Oct 2020 06:50:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201029065029eusmtrp22ce663c51f905affd41e4ea57631a3f5~CY9_UbynI1500715007eusmtrp2R;
 Thu, 29 Oct 2020 06:50:29 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-06-5f9a66350d91
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 40.12.06017.5366A9F5; Thu, 29
 Oct 2020 06:50:29 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201029065028eusmtip132fe6b1f2a2cab9fcf9a0c9a6dfaee5f~CY991AjZj1932419324eusmtip1w;
 Thu, 29 Oct 2020 06:50:28 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Thu, 29 Oct 2020 07:50:16 +0100
Message-Id: <20201029065016.4781-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSWUwTURTN68y004bqOJDwgihJiRpNBAFJBsEF9WPcEo1/RigFhiWypUNb
 ISYShKrVYGURJW4pCgipIJQqBIVWgY9K2QLiAgmhIFUhGCqbYG0Z0L9zz7nnnpubiyNkIeaD
 J6dlMvI0WYqEL0KNHYvdu0MTyqR77F9DqBc2C6BstTo+db87D6VGdNMY1WMswKj6sUGM0gza
 MEr/blhAPVzRY5TzeyM4JKINzz7y6KayYQFd3mLn0fXV1/l0w5PLdIGhGtCmN0H0+MJrhDa0
 zoLTwnOiiHgmJVnJyAMPxIiSrDW+GfnkxaJP77EcMLpRA4Q4JPbCp7YGVANEOElUAVg+cgtz
 CyThALBCw3DCLICNlk5k3VG4XIlxQiWAoyVLAq5wOcb0bQJ3F58IgpopDd8teBG1AN7WTa+G
 IMQygH2WldVZnsR++LZ9HnVjlNgGK3N6eW4sJiLgh5ctfC7PD9bUtSFuMySuCqDaMQ044Sis
 mNDyOOwJv3UaBBz2hc6mRzzOcMW1oFUv4IqbAPbn3l1zh8Mv1iVXBO7aaSesbQ7k6EjYe2MB
 uGlIbIBDU5vcNOKChcZShKPF8Jqa5Lq3w7LO5/9iTT19azeiobXdwucOGQWrbPmoFmwt+5/1
 GIBq4M0o2NREhg1OY1QBrCyVVaQlBsSlp9YD16dY/nQ6XoHm5VgzIHAg8RD3fL4nJTGZks1K
 NQOIIxIv8eEuSzQpjpdlZTPydKlckcKwZrAZRyXe4hCdPYokEmWZzAWGyWDk6yoPF/rkALZl
 oiTvxGzTFnP22TP+C4tduTzkUmFfbM9UKc834XeRw2uueFLYNdF/cofqjspYRMYLPIpDi7pj
 4oLVqg5tmDN2SRc6Mzc4Lw3XqxWn7IsPfmTO+A0MKaOXx21D1uORx8LOa02PtD8H8hV1piP7
 svwHrL8wpbN1svbgvMGGSlA2SRa0C5Gzsr8YqrsmJQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsVy+t/xu7qmabPiDTYs5LDY+OQ0o8WT9YvY
 LOacb2GxuLfoHavFhW19rBabHl9jtei69oTVYu2Ru+wW8/6uZbX4/3orowOXx5aVN5k8ds66
 y+6xeM9LJo9NqzrZPDYvqffo27KK0ePgPkOPpz/2Mnts2f+ZMYAzSs+mKL+0JFUhI7+4xFYp
 2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j3GqZglahism3zrA2MD7k72Lk
 5JAQMJGY9Gc5axcjF4eQwFJGiZbdbewQCRmJk9MaWCFsYYk/17rYIIo+MUps+PuCESTBJmAo
 0fUWIiEisJFRYvriTywgDrNAA5PElGWzmEGqhAVsJQ4f/c4CYrMIqEosb7jIBGLzCthIXN++
 hw1ihbzE6g0HmCcw8ixgZFjFKJJaWpybnltspFecmFtcmpeul5yfu4kRGMrbjv3csoOx613w
 IUYBDkYlHt4Lt2fGC7EmlhVX5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQoynQ8onM
 UqLJ+cA4yyuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwJg2S277
 1dt1/VOkstc1mZ1clPj/Wce58CgR5chjn5k4uo1auWfYcLVX359u+el7HJP1JMfDyxTmxVSd
 1r2dL8Ou3SE94+KWrVOfS9zM3P337TT9PBGZs2IdjC6MrOLmu6Y+kBFWF7sxq7UhM3JF3Dnx
 Nvvea0ZfW8tqkoMdF3b5TYzmvn1uphJLcUaioRZzUXEiAPs3eml7AgAA
X-CMS-MailID: 20201029065029eucas1p225422e700c29e2e84e227cb14ea6de52
X-Msg-Generator: CA
X-RootMTR: 20201029065029eucas1p225422e700c29e2e84e227cb14ea6de52
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201029065029eucas1p225422e700c29e2e84e227cb14ea6de52
References: <CGME20201029065029eucas1p225422e700c29e2e84e227cb14ea6de52@eucas1p2.samsung.com>
X-Mailman-Approved-At: Thu, 29 Oct 2020 07:52:04 +0000
Cc: Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Linux-stm32] [PATCH] net: stmmac: Fix channel lock initialization
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

Commit 0366f7e06a6b ("net: stmmac: add ethtool support for get/set
channels") refactored channel initialization, but during that operation,
the spinlock initialization got lost. Fix this. This fixes the following
lockdep warning:

meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
INFO: trying to register non-static key.
the code is fine but needs lockdep annotation.
turning off the locking correctness validator.
CPU: 1 PID: 331 Comm: kworker/1:2H Not tainted 5.9.0-rc3+ #1858
Hardware name: Hardkernel ODROID-N2 (DT)
Workqueue: kblockd blk_mq_run_work_fn
Call trace:
 dump_backtrace+0x0/0x1d0
 show_stack+0x14/0x20
 dump_stack+0xe8/0x154
 register_lock_class+0x58c/0x590
 __lock_acquire+0x7c/0x1790
 lock_acquire+0xf4/0x440
 _raw_spin_lock_irqsave+0x80/0xb0
 stmmac_tx_timer+0x4c/0xb0 [stmmac]
 call_timer_fn+0xc4/0x3e8
 run_timer_softirq+0x2b8/0x6c0
 efi_header_end+0x114/0x5f8
 irq_exit+0x104/0x110
 __handle_domain_irq+0x60/0xb8
 gic_handle_irq+0x58/0xb0
 el1_irq+0xbc/0x180
 _raw_spin_unlock_irqrestore+0x48/0x90
 mmc_blk_rw_wait+0x70/0x160
 mmc_blk_mq_issue_rq+0x510/0x830
 mmc_mq_queue_rq+0x13c/0x278
 blk_mq_dispatch_rq_list+0x2a0/0x698
 __blk_mq_do_dispatch_sched+0x254/0x288
 __blk_mq_sched_dispatch_requests+0x190/0x1d8
 blk_mq_sched_dispatch_requests+0x34/0x70
 __blk_mq_run_hw_queue+0xcc/0x148
 blk_mq_run_work_fn+0x20/0x28
 process_one_work+0x2a8/0x718
 worker_thread+0x48/0x460
 kthread+0x134/0x160
 ret_from_fork+0x10/0x1c

Fixes: 0366f7e06a6b ("net: stmmac: add ethtool support for get/set channels")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 220626a8d499..d833908b660a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4757,6 +4757,7 @@ static void stmmac_napi_add(struct net_device *dev)
 
 		ch->priv_data = priv;
 		ch->index = queue;
+		spin_lock_init(&ch->lock);
 
 		if (queue < priv->plat->rx_queues_to_use) {
 			netif_napi_add(dev, &ch->rx_napi, stmmac_napi_poll_rx,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
