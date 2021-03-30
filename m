Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D4234DE91
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 04:45:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA60BC5719E;
	Tue, 30 Mar 2021 02:45:50 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39E6CC56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 02:45:48 +0000 (UTC)
IronPort-SDR: Ubc6qLShjfeG1drKRkSiy0+SSGW11gNnrv08Dl5EfbFX4F5pj/XqT5vIaamdTOXd/nCp8074TS
 fZzfjeh69Gkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="188404897"
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; d="scan'208";a="188404897"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 19:45:46 -0700
IronPort-SDR: dsfpKMTEoglPzqdA/0WtM8HzPVOVV2WzHnUOlY79mVuxd8/WWMmC5caoFlJE4Gn5TKm1Hykle+
 Se7fg3I7Oj3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; d="scan'208";a="606598450"
Received: from glass.png.intel.com ([10.158.65.59])
 by fmsmga006.fm.intel.com with ESMTP; 29 Mar 2021 19:45:41 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Date: Tue, 30 Mar 2021 10:49:43 +0800
Message-Id: <20210330024949.14010-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 KP Singh <kpsingh@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/6] stmmac: Add XDP support
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

Hi,

This is the v2 patch series for adding XDP support to stmmac driver.

Summary of the changes in v2:

1/6: Move IRQ affinity hint from dwmac-intel.c into stmmac_main.c inside
     stmmac_request_irq_multi_msi() and clear the IRQ affinity hint in
     stmmac_free_irq().
     Tested the patch with reloading the driver and confirmed that there
     is kernel warning during free_irq().

3/6: Fix build warning of unused variable found in
     https://patchwork.hopto.org/static/nipa/457321/12170149/build_32bit/stderr

4/6: Fix build warnig of unused variable found by lkp

There is no other patch changes in v2 for 2/6, 5/6 and 6/6 and the summary
for their changes are in v1 patch series:

 https://patchwork.kernel.org/project/netdevbpf/list/?series=457321

The v2 patch series are retested with the test steps listed in v1 and
the results looks good as per v1 patch series. The test are executed with
preempt-rt build and it also requires a fix that was sent to ML here:

 https://patchwork.kernel.org/project/netdevbpf/list/?series=457139

It will be great if community help test out these v2 patch series on your
platform and provide me feedback.

Thank you very much,
Boon Leong

Ong Boon Leong (6):
  net: stmmac: set IRQ affinity hint for multi MSI vectors
  net: stmmac: make SPH enable/disable to be configurable
  net: stmmac: arrange Tx tail pointer update to
    stmmac_flush_tx_descriptors
  net: stmmac: Add initial XDP support
  net: stmmac: Add support for XDP_TX action
  net: stmmac: Add support for XDP_REDIRECT action

 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  35 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 521 +++++++++++++++---
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |  40 ++
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.h  |  12 +
 5 files changed, 530 insertions(+), 79 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
