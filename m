Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C789A62E2E
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 04:36:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFC14C6C346
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 02:36:51 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F2F2C6C342
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2019 02:36:50 +0000 (UTC)
X-UUID: 40d671520f5b410e8d94f18279514482-20190709
X-UUID: 40d671520f5b410e8d94f18279514482-20190709
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 851567057; Tue, 09 Jul 2019 10:36:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 10:36:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 10:36:34 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>, <andrew@lunn.ch>
Date: Tue, 9 Jul 2019 10:36:21 +0800
Message-ID: <20190709023623.8358-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
Cc: jianguo.zhang@mediatek.com, boon.leong.ong@intel.com,
 biao.huang@mediatek.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 yt.shen@mediatek.com, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2 net-next] fix out-of-boundary issue and
	add taller hash table support
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

Fix mac address out-of-boundary issue in net-next tree.
and resend the patch which was discussed in
https://lore.kernel.org/patchwork/patch/1082117
but with no further progress.

Biao Huang (2):
  net: stmmac: dwmac4: mac address array boudary violation issue
  net: stmmac: add support for hash table size 128/256 in dwmac4

 drivers/net/ethernet/stmicro/stmmac/common.h  |  7 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 51 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++
 5 files changed, 43 insertions(+), 26 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
