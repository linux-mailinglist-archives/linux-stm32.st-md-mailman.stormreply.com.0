Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF7F777B93
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 17:05:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 506AFC6B469;
	Thu, 10 Aug 2023 15:05:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8788BC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691679949; x=1723215949;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z+1vviIBmgueRkTK+vn9A1VWVZa0pIGPVtXHtItRiqE=;
 b=ijanVspxrBErkaRyHHGxzjl5dSYSx61jd4f7cipuMjRxw9+t5llseJGP
 f/7f5uBACozPXt8U+yHE3lxZcOgjRk9eOYLIOfaw3eta+4b6HV5esANXm
 f2MQFukQFTlI1DbwV8qljaDxYRHoJSQiPkpiQZqomG9LWm5UTZuns5ihG
 xQmorep1/W+2IWc9VEQdYRJ56Btxi9Nfj3Qy4kSN56en63+XW0tyZYfRw
 NrVfa1J31snhdKN4qCt5e9fVcJxvWuoPeFF2VRq8HKoXm9mPj1VI6ccgq
 aldSaR3OCR4USJ+jSjKL5LwrUicPhTA1QJOadw4Ez8wXZXKxfLNBzf9wY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="368901623"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="368901623"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 08:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="978821424"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="978821424"
Received: from pglc00052.png.intel.com ([10.221.207.72])
 by fmsmga006.fm.intel.com with ESMTP; 10 Aug 2023 08:03:38 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Date: Thu, 10 Aug 2023 23:03:26 +0800
Message-Id: <20230810150328.19704-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 0/2] Tx coe sw fallback for
	unsupported queues
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
Some DWMAC IPs support tx coe only for few initial tx queues, starting 
from tx queue 0. This patchset adds support for tx coe sw fallback for 
those queue that doesn't support tx coe. Also, add binding for
snps,tx-queues-with-coe property.

Rohan G Thomas (2):
  dt-bindings: net: snps,dwmac: Tx queues with coe
  net: stmmac: Tx coe sw fallback

 .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  4 ++++
 include/linux/stmmac.h                        |  1 +
 5 files changed, 29 insertions(+)

-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
