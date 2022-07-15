Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89375586949
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 14:00:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E670C640FA;
	Mon,  1 Aug 2022 12:00:12 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A50BC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657871880; x=1689407880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8y338NQSmDBmmLrRO0DzkQ5IfgLAxLj3qXlNTQZXH2M=;
 b=nOzh3c0HNVz5B+6avC/Os4lxjO0XcjIDy4hDQ0B3HYq0XHCsG4TpuD5V
 IUWcXm1eb6wanOPqnmIOOYZZKq1e3x6b7VrO3lFwLzIpKc4KrjZj1ZyVj
 7YCdnSu2TBzmrA3VCGTr9TKwTRubTddi4P1TLtKJtKbLA+9DW7cQY9pqe
 1sKeYSCwFMc3zRRowiAQQgGNyPgbaWnbsslnHrH4/ZaqBst27iO9ZXmIL
 +eURt5UafsO0fnYLIaSa/mGJ+2E03dtdhNgQ/FWzufKh6xNxeTAGbSm5Q
 5Np108jQHDUeUg39Txn8ZgjgsDDmjPPzlCo9ScOCvRze+Lh1pgz/kE7kw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="347406289"
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; d="scan'208";a="347406289"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 00:57:57 -0700
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; d="scan'208";a="654236718"
Received: from junxiaochang.bj.intel.com ([10.238.135.52])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 00:57:35 -0700
From: Junxiao Chang <junxiao.chang@intel.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, netdev@vger.kernel.org
Date: Fri, 15 Jul 2022 15:47:01 +0800
Message-Id: <20220715074701.194776-1-junxiao.chang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Aug 2022 12:00:11 +0000
Cc: Joao.Pinto@synopsys.com, edumazet@google.com, f.fainelli@gmail.com,
 mcoquelin.stm32@gmail.com, cedric@bytespeed.nl, kuba@kernel.org,
 pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: fix dma queue left shift
	overflow issue
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

When queue number is > 4, left shift overflows due to 32 bits
integer variable. Mask calculation is wrong for MTL_RXQ_DMA_MAP1.

If CONFIG_UBSAN is enabled, kernel dumps below warning:
[   10.363842] ==================================================================
[   10.363882] UBSAN: shift-out-of-bounds in /build/linux-intel-iotg-5.15-8e6Tf4/
linux-intel-iotg-5.15-5.15.0/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:224:12
[   10.363929] shift exponent 40 is too large for 32-bit type 'unsigned int'
[   10.363953] CPU: 1 PID: 599 Comm: NetworkManager Not tainted 5.15.0-1003-intel-iotg
[   10.363956] Hardware name: ADLINK Technology Inc. LEC-EL/LEC-EL, BIOS 0.15.11 12/22/2021
[   10.363958] Call Trace:
[   10.363960]  <TASK>
[   10.363963]  dump_stack_lvl+0x4a/0x5f
[   10.363971]  dump_stack+0x10/0x12
[   10.363974]  ubsan_epilogue+0x9/0x45
[   10.363976]  __ubsan_handle_shift_out_of_bounds.cold+0x61/0x10e
[   10.363979]  ? wake_up_klogd+0x4a/0x50
[   10.363983]  ? vprintk_emit+0x8f/0x240
[   10.363986]  dwmac4_map_mtl_dma.cold+0x42/0x91 [stmmac]
[   10.364001]  stmmac_mtl_configuration+0x1ce/0x7a0 [stmmac]
[   10.364009]  ? dwmac410_dma_init_channel+0x70/0x70 [stmmac]
[   10.364020]  stmmac_hw_setup.cold+0xf/0xb14 [stmmac]
[   10.364030]  ? page_pool_alloc_pages+0x4d/0x70
[   10.364034]  ? stmmac_clear_tx_descriptors+0x6e/0xe0 [stmmac]
[   10.364042]  stmmac_open+0x39e/0x920 [stmmac]
[   10.364050]  __dev_open+0xf0/0x1a0
[   10.364054]  __dev_change_flags+0x188/0x1f0
[   10.364057]  dev_change_flags+0x26/0x60
[   10.364059]  do_setlink+0x908/0xc40
[   10.364062]  ? do_setlink+0xb10/0xc40
[   10.364064]  ? __nla_validate_parse+0x4c/0x1a0
[   10.364068]  __rtnl_newlink+0x597/0xa10
[   10.364072]  ? __nla_reserve+0x41/0x50
[   10.364074]  ? __kmalloc_node_track_caller+0x1d0/0x4d0
[   10.364079]  ? pskb_expand_head+0x75/0x310
[   10.364082]  ? nla_reserve_64bit+0x21/0x40
[   10.364086]  ? skb_free_head+0x65/0x80
[   10.364089]  ? security_sock_rcv_skb+0x2c/0x50
[   10.364094]  ? __cond_resched+0x19/0x30
[   10.364097]  ? kmem_cache_alloc_trace+0x15a/0x420
[   10.364100]  rtnl_newlink+0x49/0x70

This change fixes MTL_RXQ_DMA_MAP1 mask issue and channel/queue
mapping warning.

Fixes: d43042f4da3e ("net: stmmac: mapping mtl rx to dma channel")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=216195
Reported-by: Cedric Wassenaar <cedric@bytespeed.nl>
Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index fd41db65fe1df..af33390411346 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -219,6 +219,9 @@ static void dwmac4_map_mtl_dma(struct mac_device_info *hw, u32 queue, u32 chan)
 	if (queue == 0 || queue == 4) {
 		value &= ~MTL_RXQ_DMA_Q04MDMACH_MASK;
 		value |= MTL_RXQ_DMA_Q04MDMACH(chan);
+	} else if (queue > 4) {
+		value &= ~MTL_RXQ_DMA_QXMDMACH_MASK(queue - 4);
+		value |= MTL_RXQ_DMA_QXMDMACH(chan, queue - 4);
 	} else {
 		value &= ~MTL_RXQ_DMA_QXMDMACH_MASK(queue);
 		value |= MTL_RXQ_DMA_QXMDMACH(chan, queue);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
