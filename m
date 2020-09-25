Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15765278432
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Sep 2020 11:38:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3E3DC3FAFF;
	Fri, 25 Sep 2020 09:38:52 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3A81C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 09:38:48 +0000 (UTC)
IronPort-SDR: BSrG4v8rJTQaJTgd9TJSSXcDDTwY2+orAt8sEAiq1vGsMinTuJzIPmebgMdfDJSnUld7SRptSA
 uJsnLbx9OQ1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="161562996"
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; d="scan'208";a="161562996"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 02:38:46 -0700
IronPort-SDR: UVYHkA+vVLvG0bs05VJZW5OxL9S6dps6B4bM8Uo+t3YxsbpK3IP8mFbOehDbvEBf6mdg4Npjod
 OoiLMayKkDww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; d="scan'208";a="455752636"
Received: from glass.png.intel.com ([172.30.181.92])
 by orsmga004.jf.intel.com with ESMTP; 25 Sep 2020 02:38:42 -0700
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 25 Sep 2020 17:40:40 +0800
Message-Id: <20200925094041.12038-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
Cc: Andrew Lunn <andrew@lunn.ch>, Mark Gross <mgross@linux.intel.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Seow Chen Yong <chen.yong.seow@intel.com>,
 Vijaya Balan Sadhishkhanna <sadhishkhanna.vijaya.balan@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Thierry Reding <treding@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/1] net: stmmac: Enable VLAN filter
	fail queue for Intel platform data
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

This is a follow-up on a earlier patch submission at:-
https://patchwork.ozlabs.org/patch/1275604/

Changes since the previous patch submission:
- Enable VLAN fail queue for Intel platform data (dwmac-intel).
- Steer the VLAN failed packet to the last Rx queue.


Chuah, Kim Tatt (1):
  net: stmmac: Add option for VLAN filter fail queue enable

 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |  5 +++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 15 +++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h      |  6 ++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 +++
 include/linux/stmmac.h                            |  2 ++
 7 files changed, 32 insertions(+), 2 deletions(-)

-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
