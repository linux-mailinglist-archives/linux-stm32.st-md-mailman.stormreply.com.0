Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A542F9A8
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2019 11:43:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FF29C55589
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2019 09:43:37 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57BEFC55586
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2019 09:43:35 +0000 (UTC)
X-UUID: eff625b68e9d47159bc7e970190f24aa-20190530
X-UUID: eff625b68e9d47159bc7e970190f24aa-20190530
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 139862312; Thu, 30 May 2019 17:43:25 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 30 May 2019 17:43:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 30 May 2019 17:43:24 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>
Date: Thu, 30 May 2019 17:43:14 +0800
Message-ID: <1559209398-3607-1-git-send-email-biao.huang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
Cc: andrew@lunn.ch, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com,
 biao.huang@mediatek.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 yt.shen@mediatek.com, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND,
	PATCH 0/4] complete dwmac-mediatek driver and fix flow control issue
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

Sorry for not adding David Miller to the mailist, so resend this series.

This series mainly complete dwmac-mediatek driver:                              
        1. add power on/off operations for dwmac-mediatek.                      
        2. disable rx watchdog to reduce rx path reponding time.                
        3. change the default value of tx-frames from 25 to 1, so               
           ptp4l will test pass by default.                                     
                                                                                
and also fix the issue that flow control won't be disabled any more             
once being enabled.                                                             
                                                                                
Biao Huang (4):                                                                 
  net: stmmac: dwmac-mediatek: enable Ethernet power domain                     
  net: stmmac: dwmac-mediatek: disable rx watchdog                              
  net: stmmac: modify default value of tx-frames                                
  net: stmmac: dwmac4: fix flow control issue                                   
                                                                                
 drivers/net/ethernet/stmicro/stmmac/common.h       |    2 +-                   
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |   19 ++++++++++++++++++-  
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |    8 ++++++--             
 3 files changed, 25 insertions(+), 4 deletions(-)                              
                                                                                
--                                                                              
1.7.9.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
