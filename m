Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07746607692
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Oct 2022 13:56:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD483C6411C;
	Fri, 21 Oct 2022 11:56:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01DD9C64108
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Oct 2022 11:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666353391; x=1697889391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rtll0/nGhqW301uS5yfdR9R0zXk9od1cA+YGVzH/vYA=;
 b=nYR9Ton3Q27bvb27SRnAWefou/MbyaYhm6yIxhpF7PIUt6QcL9trIra4
 R3ikfJ+WZrBC0157h8p63b8UjnqlXuAgxbI3PFej/WhWL16WmhJhVU6OW
 UnAzupFlAf0QKIllvqKORq9LW0mo0MjPS5FuXclArcAprng5VakRmEtEi
 ytpnqWJGTTU8/4Epwd1IIyIPobTvBkceaLWbg8WAKkB4dzfU7BCsT+bPw
 hRHhB3FFUfgFkMW2HVqAo7xo2mz5hh2Kwu4z7PGgDkV3BTJT7NGKMorjk
 uYLcrTzS/1/4IhdKls1gZnG0Ff1REQ2SFbk1sa1vhStwWE3GVZfVdVK1x g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305722080"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="305722080"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 04:56:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="632891119"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="632891119"
Received: from junxiaochang.bj.intel.com ([10.238.135.52])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 04:56:25 -0700
From: Junxiao Chang <junxiao.chang@intel.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, Joao.Pinto@synopsys.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 21 Oct 2022 19:47:10 +0800
Message-Id: <20221021114711.1610797-1-junxiao.chang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: junxiao.chang@intel.com
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: fix unsafe MTL DMA
	macro
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

Macro like "#define abc(x) (x, x)" is unsafe which might introduce
side effects. Each MTL RxQ DMA channel mask is 4 bits, so using
(0xf << chan) instead of GENMASK(x + 3, x) to avoid unsafe macro.

Fixes: d43042f4da3e ("net: stmmac: mapping mtl rx to dma channel")
Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 71dad409f78b0..3c1490408a1c3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -333,7 +333,7 @@ enum power_event {
 #define MTL_RXQ_DMA_MAP1		0x00000c34 /* queue 4 to 7 */
 #define MTL_RXQ_DMA_Q04MDMACH_MASK	GENMASK(3, 0)
 #define MTL_RXQ_DMA_Q04MDMACH(x)	((x) << 0)
-#define MTL_RXQ_DMA_QXMDMACH_MASK(x)	GENMASK(11 + (8 * ((x) - 1)), 8 * (x))
+#define MTL_RXQ_DMA_QXMDMACH_MASK(x)	(0xf << 8 * (x))
 #define MTL_RXQ_DMA_QXMDMACH(chan, q)	((chan) << (8 * (q)))
 
 #define MTL_CHAN_BASE_ADDR		0x00000d00
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
