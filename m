Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF7350C4A
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 04:08:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50636C58D5C;
	Thu,  1 Apr 2021 02:08:14 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78BC3C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 02:08:10 +0000 (UTC)
IronPort-SDR: oUHFfksVNjmffVZaPNUItwpCYMlx4ZMMxoDmAY1aTo/27Wsmq0JaOiiiEBcC7Lm1PXOz9yKNUh
 DRu+PFaotH7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="188875083"
X-IronPort-AV: E=Sophos;i="5.81,295,1610438400"; d="scan'208";a="188875083"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 19:07:48 -0700
IronPort-SDR: ePneGV3mI4UPzr+IRRbvKpXyIARqNnqPyq9j3+RUSTUg4WOex6YemwffIcuVEaXdT+lKIlcIi3
 PyMFBUhizDBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,295,1610438400"; d="scan'208";a="528004184"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga004.jf.intel.com with ESMTP; 31 Mar 2021 19:07:30 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Date: Thu,  1 Apr 2021 10:11:11 +0800
Message-Id: <20210401021117.13360-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 KP Singh <kpsingh@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 0/6] stmmac: Add XDP support
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

This is the v4 patch series for adding XDP native support to stmmac.

Changes in v4:
5/6: Move TX clean timer setup to the end of NAPI RX process and
     group it under stmmac_finalize_xdp_rx().
     Also, fixed stmmac_xdp_xmit_back() returns STMMAC_XDP_CONSUMED
     if XDP buffer conversion to XDP frame fails.

6/6: Move xdp_do_flush(0 into stmmac_finalize_xdp_rx() and combine
     the XDP verdict of XDP TX and XDP REDIRECT together.

I retested the patch series on the 'xdp2' and 'xdp_redirect' related to
changes above and found the result to be satisfactory.

History of previous patch series:
v3: https://patchwork.kernel.org/project/netdevbpf/cover/20210331154135.8507-1-boon.leong.ong@intel.com/
v2: https://patchwork.kernel.org/project/netdevbpf/list/?series=457757
v1: https://patchwork.kernel.org/project/netdevbpf/list/?series=457139

It will be great if community can help to test or review the v4 series
and provide me any input if any.

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
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 539 +++++++++++++++---
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |  40 ++
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.h  |  12 +
 5 files changed, 547 insertions(+), 80 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
