Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA66B70C3
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 09:02:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC7C6C6A5E7;
	Mon, 13 Mar 2023 08:02:17 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58FBAC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 08:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678694536; x=1710230536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CbmVrutLLkAOwM9+nT109OGKvK1HNt/MtMNebpcvudY=;
 b=cMfNLqCpW6Y+0agQklX1InpLloun1/aPAUiHUvakuptllq/0HdzQDRMM
 07WMSwCg0X1UXJWhqH+sq1VWNsMKXvnr3SpLga8FcskM4+kRjSCX5xa51
 nBp6whZNDHEXzaFndjlVRrEaPLAOaxbXyr0OJrfZ3N68U3MIXO8rVJErT
 puSQyP9LjBrGCHwQd0oIVVtxFk1rQK5ihh6NMbkiT6H+D3Q78rVp9cOm2
 G2JFY/PzTzb6df6iJ7ccTsXWND++LE5FIXJo707XK2es9gSXPSLTRMSq4
 vTa7S+fkfWwRN/E08iVJQL39cYk6MwUHsPR6TBBAr8G3UdTDajvAkFKzr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="337107361"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="337107361"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="747517964"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="747517964"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2023 01:02:04 -0700
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 13 Mar 2023 16:01:33 +0800
Message-Id: <20230313080135.2952774-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net 0/2]  Fix PHY handle no longer parsing
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
no longer attach to the MAC properly.

This patch series fixes the issue and maintains fixed-link capability.

Michael Sit Wei Hong (2):
  net: stmmac: fix PHY handle parsing
  net: stmmac: move fixed-link support fixup code

 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 11 ---------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 23 +++++++++++++++++--
 2 files changed, 21 insertions(+), 13 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
