Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBED80035A
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 06:53:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE978C6B47D;
	Fri,  1 Dec 2023 05:53:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCC93C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 05:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701410005; x=1732946005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rNUFphnEkQB+qWot/63Nna2HVEbtWnhUjyaz1RNUd68=;
 b=bmNFjFW2QPTl0Pa+20nrQugc9DTwF+4z+vhgf7w1ix20sJh4WiddjPV5
 uaXBYfLuPSChx35Y8KBkpg5EisxPuPBSESQ6RazBep3MCgGiZcL9yACbx
 vgLkExsqUg2GZvCc6odruXOz21ar+SGnnbeiDA7zx++40965EyBgYy34l
 Y2NrMnMZ7k4xum3eVy+djdBoGUf07Ng8X4jhUGLghXoY41yuZmuBzyA/W
 IQc/5bJTFtYb9jIc8ZFxhbUgyDk+MlVNARE9OADEW7ZI9esqmEhzvjSV2
 Xg4uD00WaXCuwvOoFCRW2lZHXRspPGiY5QJHzUMM8l+fxYi8wNYuWlktX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="373623989"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="373623989"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 21:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="763004522"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="763004522"
Received: from ppgyli0104.png.intel.com ([10.126.160.64])
 by orsmga007.jf.intel.com with ESMTP; 30 Nov 2023 21:53:04 -0800
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Fri,  1 Dec 2023 13:52:49 +0800
Message-Id: <20231201055252.1302-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, bpf@vger.kernel.org,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac: EST
	implementation
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
This patchset extends EST interrupt handling support to DWXGMAC IP
followed by refactoring of EST implementation. Added a separate
module for EST and moved all EST related functions to the new module.

Also added support for EST cycle-time-extension.

changelog v2:
* Refactor EST implementation as suggested by Serge and Jakub
* Added support for EST cycle-time-extension

Rohan G Thomas (3):
  net: stmmac: xgmac: EST interrupts handling
  net: stmmac: Refactor EST implementation
  net: stmmac: Add support for EST cycle-time-extension

 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |   4 -
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 137 ---------------
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  51 ------
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  16 --
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  53 ------
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  21 +++
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  22 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   1 +
 .../net/ethernet/stmicro/stmmac/stmmac_est.c  | 165 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_est.h  |  64 +++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |   4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   8 +-
 15 files changed, 276 insertions(+), 275 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h

-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
