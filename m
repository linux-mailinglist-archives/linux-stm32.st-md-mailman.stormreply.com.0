Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BCE6B8B9A
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 08:02:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81F55C6904A;
	Tue, 14 Mar 2023 07:02:41 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6515C65043
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 07:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678777359; x=1710313359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ubItdxoh/248YMHvdWaraBjhtcicig7y7gOG+S5DDsA=;
 b=RVkS6onE2w4wRFFLlvydqRCqNrc38RxhP8PnXCJPYkynXHHw6ZwG8MBa
 Gy3wKuqdv/Pf8g8kIWVGOL8HVXHEOLL59n04RQcqjjt6nnD5zZISRxc8h
 tLXmExkCtoB2bnpHsRKnXBFbh5d4qBi1CpXoxklN+TTAHZQuNAU1wJegr
 yoAUNzonefkb6o2evq6+zVc8UdJ4sZU+xaBIs7hrsrrIsTiwHhcDg6Cj6
 CYzLuHHwQ/i8rEhUO6/aWRyErzEK54pZbfH09EgXtGhRL7wZoZjvo62mT
 xIKM33YRcGrmp7xG+9ogEsnhzfAmvn+xsBsEQEIlaJUE8fWmuJHtpnC4p w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334828403"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="334828403"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 00:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="656226732"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="656226732"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga006.jf.intel.com with ESMTP; 14 Mar 2023 00:02:29 -0700
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
Date: Tue, 14 Mar 2023 15:02:06 +0800
Message-Id: <20230314070208.3703963-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net v2 0/2] Fix PHY handle no longer parsing
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
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 24 +++++++++++++++++--
 2 files changed, 22 insertions(+), 13 deletions(-)

v2: Initialize fwnode before using the variable
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
