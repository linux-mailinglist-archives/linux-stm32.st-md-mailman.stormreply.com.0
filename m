Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1916C797A
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Mar 2023 09:17:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9765CC6A606;
	Fri, 24 Mar 2023 08:17:56 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62827C6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 08:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679645875; x=1711181875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uYiuGbXVPcmzIv1+ZIORk/VpkKy9DBccDcXlcJ5iQFM=;
 b=GJ5PmoG/Kq7rPdB9lBYhNpYAXq5JB0KSDjTVylMhSkPM5qPx1Ux5oRsd
 GC1cH0X+Mvu2Y//mi1L5vSN8LAok3cMBklkG9MV76cSKKbpmW4TVU9dyj
 Lbrn5b6pg2XeDWxWAeDDVXlNZVbdBKYS6/2/mzte32J6851Eke4KiWy8Z
 CLLlyzReqr5rSfyF3AV6oi5OGfCxa+5dhvzuJaM/UlXA1TK2Eb/Qv9Z9A
 srDKMWtip29TDI3ctoDqYmgENyztJPHMC5WP9Wa7pN2PHjjd3b10AhZlg
 7BnWfNIcUHd1EaQ7rDsS0sKStwDaqAzzJT+kunQTzygTFRTgv4NTs/Zl3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="320116058"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="320116058"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="928574687"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="928574687"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga006.fm.intel.com with ESMTP; 24 Mar 2023 01:17:33 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk
Date: Fri, 24 Mar 2023 16:16:53 +0800
Message-Id: <20230324081656.2969663-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net v3 0/3] Fix PHY handle no longer parsing
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

After the fixed link support was introduced, it is observed that PHY
no longer attach to the MAC properly. So we introduce a helper
function to determine if the MAC should expect to connect to a PHY
and proceed accordingly.

Michael Sit Wei Hong (3):
  net: phylink: add phylink_expects_phy() method
  net: stmmac: check if MAC needs to attach to a PHY
  net: stmmac: remove redundant fixup to support fixed-link mode

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  4 +++-
 drivers/net/phy/phylink.c                         | 13 +++++++++++++
 include/linux/phylink.h                           |  1 +
 4 files changed, 17 insertions(+), 2 deletions(-)

v2: Initialize fwnode before using the variable
v3: Introduced phylink_expects_phy() method as suggested by Russell King
    remove xpcs_an_inband fixup instead of moving the fixed-link check
    as suggested by Andrew Lunn
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
