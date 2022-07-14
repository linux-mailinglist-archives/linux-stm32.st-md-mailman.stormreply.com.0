Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B935744BB
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jul 2022 08:00:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9F1CC640FE;
	Thu, 14 Jul 2022 06:00:24 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CE31C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jul 2022 06:00:23 +0000 (UTC)
X-UUID: 38d780fcad1d432babaf4905bbf1effd-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:ef59268c-cf53-4920-9f4b-67217ab792ca, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:100
X-CID-INFO: VERSION:1.1.8, REQID:ef59268c-cf53-4920-9f4b-67217ab792ca, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:100
X-CID-META: VersionHash:0f94e32, CLOUDID:20dd75d7-5d6d-4eaf-a635-828a3ee48b7c,
 C
 OID:425824298e3e,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 38d780fcad1d432babaf4905bbf1effd-20220714
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 422873143; Thu, 14 Jul 2022 14:00:17 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 14 Jul 2022 14:00:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 14 Jul 2022 14:00:16 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Thu, 14 Jul 2022 14:00:11 +0800
Message-ID: <20220714060014.18958-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
Cc: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Jisheng Zhang <jszhang@kernel.org>, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net v5 0/3] stmmac: dwmac-mediatek: fix clock
	issue
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

changes in v5:
1. add reivewd-by as Matthias's comments.
2. fix "warning: unused variable 'ret' [-Wunused-variable]" as Jakub's comments

changes in v4:
1. improve commit message and test ko insertion/remove as Matthias's comments.
2. add patch "net: stmmac: fix pm runtime issue in stmmac_dvr_remove()" to
   fix vlan filter deletion issue.
3. add patch "net: stmmac: fix unbalanced ptp clock issue in suspend/resume flow"
   to fix unbalanced ptp clock issue in suspend/resume flow.

changes in v3:
1. delete mediatek_dwmac_exit() since there is no operation in it,
as Matthias's comments.

changes in v2:
1. clock configuration is still needed in probe,
and invoke mediatek_dwmac_clks_config() instead.
2. update commit message.

v1:
remove duplicated clock configuration in init/exit.

Biao Huang (3):
  stmmac: dwmac-mediatek: fix clock issue
  net: stmmac: fix pm runtime issue in stmmac_dvr_remove()
  net: stmmac: fix unbalanced ptp clock issue in suspend/resume flow

 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 49 ++++++++-----------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++-----
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  8 ++-
 3 files changed, 39 insertions(+), 40 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
