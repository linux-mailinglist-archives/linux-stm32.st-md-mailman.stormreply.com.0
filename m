Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1079C78473D
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5D15C6DD76;
	Tue, 22 Aug 2023 16:25:21 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61D0DC6B45F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 07:20:19 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RRGYs3g7PzVkkh;
 Thu, 17 Aug 2023 15:18:09 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 15:20:15 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <lars.povlsen@microchip.com>,
 <Steen.Hegelund@microchip.com>, <daniel.machon@microchip.com>,
 <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
 <mcoquelin.stm32@gmail.com>, <horatiu.vultur@microchip.com>,
 <simon.horman@corigine.com>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Thu, 17 Aug 2023 15:19:39 +0800
Message-ID: <20230817071941.346590-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: ruanjinjie@huawei.com
Subject: [Linux-stm32] [PATCH net-next 0/2] net: Use helper function
	IS_ERR_OR_NULL()
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

Use IS_ERR_OR_NULL() instead of open-coding it
to simplify the code.

Ruan Jinjie (2):
  net: microchip: sparx5: Use helper function IS_ERR_OR_NULL()
  net: stmmac: Use helper function IS_ERR_OR_NULL()

 drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
