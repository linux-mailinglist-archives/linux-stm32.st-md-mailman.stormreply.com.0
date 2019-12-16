Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E2611FE17
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2019 06:40:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25795C36B0C;
	Mon, 16 Dec 2019 05:40:14 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22257C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 05:40:11 +0000 (UTC)
X-UUID: c3d5781ffd744501a25a5760812467eb-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=bU3pTXiHaPfq2d8vyXK1ujCYPstVOHhLasLwvoHqrcE=; 
 b=dkjyBgHX9GK+nfB9qN6gnzbjraaH9bQQgURwOUqdKMuVPklV8DipuYxS/VK9WkWbtrYZRm8SC2ZtcuqQOiBLTC/C6+3W1c2Vl97H5yDaoKQPCu8w8rzofK9xBzTQrHnGoxd43wRBEO5HLNvIBw0MpKlReBlYPTTIJyDsiLAP6Rw=;
X-UUID: c3d5781ffd744501a25a5760812467eb-20191216
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 770036410; Mon, 16 Dec 2019 13:40:07 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 13:40:28 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 16 Dec 2019 13:39:20 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Date: Mon, 16 Dec 2019 13:39:56 +0800
Message-ID: <20191216053958.26130-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, yt.shen@mediatek.com,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [v2,
	PATCH 0/2] net-next: stmmac: dwmac-mediatek: add more support for
	RMII
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

changes in v2:
 PATCH 1/2 net-next: stmmac: mediatek: add more support for RMII
        As Andrew's comments, add the "rmii_internal" clock to the list of clocks.

 PATCH 2/2 net-next: dt-binding: dwmac-mediatek: add more description for RMII
        document the "rmii_internal" clock in dt-bindings
        rewrite the sample dts in dt-bindings.

v1:
This series is for support RMII when MT2712 SoC provides the reference clock.

Biao Huang (2):
  net-next: stmmac: mediatek: add more support for RMII
  net-next: dt-binding: dwmac-mediatek: add more description for RMII

 .../bindings/net/mediatek-dwmac.txt           | 33 ++++---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 89 +++++++++++++------
 2 files changed, 83 insertions(+), 39 deletions(-)

--
2.24.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
