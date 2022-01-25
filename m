Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B920649A795
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jan 2022 04:24:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 524FDC5F1D5;
	Tue, 25 Jan 2022 03:24:19 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEC8BC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 03:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643081057; x=1674617057;
 h=from:to:cc:subject:date:message-id;
 bh=BqpKz/iORHV93aKuPrxht0whdEK91qzqUrqhI+YPHgI=;
 b=gwlc3M+yUCdUkMLfEfj85usrz1k6/AH/NR40QsT7MdTAZa7SeeIWzrhr
 GGKJqdFAC8n+K+xl8Scpf3iRDx3YKR7FvaOq8+DoXCetB/vv55S41UiJQ
 2jEfFKM5rq1vfeY9EMapdiLRYHRe7P4CsiKdeo9l2ttt5+3kB0jjwzdle
 sS1JEltybu3gIj+Cr44447BymuFQ0XhNbludot+DwPi66KJ76N3H9uBk9
 gj/k+ac0Jttstay4huiE1vq73c8WLA7mNxU1Kp37ir8cdVYhlwP9yEjV9
 zJsRsrfAwEFcGuQSP2NPirombeiU0dPpAKOqCteQWKz5BkrJNkaYIxZjE w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="245042092"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="245042092"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 19:24:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="532293049"
Received: from mismail5-ilbpg0.png.intel.com ([10.88.229.13])
 by fmsmga007.fm.intel.com with ESMTP; 24 Jan 2022 19:24:09 -0800
From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 25 Jan 2022 11:23:22 +0800
Message-Id: <20220125032324.4055-1-mohammad.athari.ismail@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, mohammad.athari.ismail@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 25 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  3 ---
 2 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
