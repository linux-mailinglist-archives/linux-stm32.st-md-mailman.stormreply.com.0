Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FA46CFF8F
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Mar 2023 11:15:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D810BC6A5F2;
	Thu, 30 Mar 2023 09:15:09 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59D62C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Mar 2023 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680167707; x=1711703707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g22zFmNySSWgZmeT+/AthuzFeH0QQevQ7c24N5MEm5U=;
 b=RyI2oA7JTHrx16ePOZsgrKrQYXnCNz9LTRG6MFbwD48pQfyUXYLQvGxV
 E+Psw1giW3VOJ8DmaYuh8dvCEMPiyJzW8rBKQ3fc1pN8Szr7W/SmBnPhV
 iAc0tPFbxNn4Proa9nfIAhxDFQFkQc29cf8haUV3J8FcR2Bhef/fCHWru
 mso/sWtKTOhc4t9dqt2xLMp+xWjG7R4pbE130xfNb0mHOSYEdxcXH8eMi
 wJzDPndyUFSuKer0oeX8Ar6WGgp8CDI2KLO7XQu1VDkfrKX4wqTCpvuoJ
 DNTOGwq1GGhTh76w43SV/RrQgAiWLc5b2XlMQtk5o7DlXmRzzPC0U7f3K g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="325038862"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="325038862"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 02:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="678125351"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="678125351"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 02:14:47 -0700
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
 linux@armlinux.org.uk, hkallweit1@gmail.com, andrew@lunn.ch
Date: Thu, 30 Mar 2023 17:14:01 +0800
Message-Id: <20230330091404.3293431-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net v5 0/3] Fix PHY handle no longer parsing
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

 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  1 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 +++-
 drivers/net/phy/phylink.c                     | 19 +++++++++++++++++++
 include/linux/phylink.h                       |  1 +
 4 files changed, 23 insertions(+), 2 deletions(-)

v2: Initialize fwnode before using the variable
v3: Introduced phylink_expects_phy() method as suggested by Russell King
    remove xpcs_an_inband fixup instead of moving the fixed-link check
    as suggested by Andrew Lunn
v4: Modify phylink_expects_phy() to check for more complete set of
    conditions when no PHY is needed and return false if met.
v5: Enhance phylink_expects_phy() description.
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
