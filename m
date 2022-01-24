Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EB2497C9B
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 11:01:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D259C5F1D6;
	Mon, 24 Jan 2022 10:01:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6CBEC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 10:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643018511; x=1674554511;
 h=from:to:cc:subject:date:message-id;
 bh=CEeh4xZDN8H9We8iBFhj6xkPm9szH5elbIbkobbgreE=;
 b=icib5VsD/0bUlLy6n6+N2CYiUvTg7WvNsOZFhJJDbL5WQ1Zbv0AWmKUS
 siu7T+Fp24ArUMXYZx79QQjCzQtsOXOQDhlX+oJg6FvJmQOmykp5HjX2/
 c2twaLiOA/xNZH9Xr3oG7QvikZYbQjwKBwKk+53CJrqwtS2xKU06l077O
 s4ukC12Y8HSaJJziO3513bt+8m18OcklKWbOVmBB3458sf0w8jHZu0xdy
 WY/biHzPztpjsmyMruThaRYgyYHqewNrhLUKUqxOpWiEEpDf7BHhEDyGr
 oa0Vaf6e5S4RdOLT+ewq253H31bquzn/xn6UFqvd9jF7hFOgo6QvHa03V g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="225990607"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="225990607"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 02:00:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="519886910"
Received: from mismail5-ilbpg0.png.intel.com ([10.88.229.13])
 by orsmga007.jf.intel.com with ESMTP; 24 Jan 2022 02:00:36 -0800
From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>,
 Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 24 Jan 2022 17:59:49 +0800
Message-Id: <20220124095951.23845-1-mohammad.athari.ismail@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: netdev@vger.kernel.org, mohammad.athari.ismail@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net 0/2] Fix PTP issue in stmmac
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

This patch series to fix PTP issue in stmmac related to:
1/ PTP clock source configuration during initialization.
2/ PTP initialization during resume from suspend.

Mohammad Athari Bin Ismail (2):
  net: stmmac: configure PTP clock source prior to PTP initialization
  net: stmmac: skip only stmmac_ptp_register when resume from suspend

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++++++++---------
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  3 ---
 2 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
