Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B5C41AA05
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Sep 2021 09:43:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B883CC5A4D0;
	Tue, 28 Sep 2021 07:43:57 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82B46C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 07:43:55 +0000 (UTC)
X-UUID: 83cac08256f941a6bd1d3a154a0a2aa2-20210928
X-UUID: 83cac08256f941a6bd1d3a154a0a2aa2-20210928
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1761110263; Tue, 28 Sep 2021 15:43:50 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 28 Sep 2021 15:43:49 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 28 Sep 2021 15:43:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Sep 2021 15:43:49 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Leon Yu <leoyu@nvidia.com>, "David S . Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>
Date: Tue, 28 Sep 2021 15:43:49 +0800
Message-ID: <20210928074349.24622-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210927104500.1505-1-macpaul.lin@mediatek.com>
References: <20210927104500.1505-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: stable@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul@gmail.com>,
 Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [Linux-stm32] backport commit ("31096c3e8b11 net: stmmac: don't
	attach interface until resume finishes") to linux-5.4-stable
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

Hi reviewers,

I suggest to backport 
commit "31096c3e8b11 net: stmmac: don't attach interface until resume finishes"
to linux-5.4 stable tree.

This patch fix resume issue by deferring netif_device_attach().

However, the patch cannot be cherry-pick directly on to stable-5.4.
A slightly change to the origin patch is required.
I'd like to provide the modification to stable-5.4 if it is needed.

commit: 31096c3e8b1163c6e966bf4d1f36d8b699008f84
subject: net: stmmac: don't attach interface until resume finishes
kernel version to apply to: Linux-5.4

Sorry for that I've send a wrong commit hash which is in my working tree
previously.

Thanks.
Macpaul Lin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
