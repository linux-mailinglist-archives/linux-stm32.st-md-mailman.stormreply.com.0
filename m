Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C89B57A2E38
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Sep 2023 08:33:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71222C6B47C;
	Sat, 16 Sep 2023 06:33:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A5B0C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Sep 2023 06:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694846008; x=1726382008;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XNwP6iy06WtQIeeb2YYjHa0FD0axMwuKvWJRYdYZ9sI=;
 b=GY3jSgjZGeizv/k7V4K9BzbdTUYE3QM4eLyRwTArLw8H+3/hlI6DSxI1
 ECAJ3BKGUMUljfCr8F2hSLbxvdNXcCCykicJhZ4fwqWPcyDPBI5X4HEfS
 g5mkbwONYiL2RON6yWUMp3R36b4+fm9bPbhRBkVGvfb3w1Zz5n2+w03K9
 FOTompWktqTK4kj+xU9CGaO5rNN+uWEdwKLwX9lU8Uq5ougnM+V97y5qe
 yI3QKYs0E6TSw2h8Vl0eCYEy8O1XbJi5WT2kQgKJUptCT40qD7rdt8qKp
 n6BnTRjj79qRbh0Kogkuvb8bvmaLEd08vhprDTwqS/kGL1co3UlxNKal5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="359637789"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; d="scan'208";a="359637789"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 23:33:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="780351376"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; d="scan'208";a="780351376"
Received: from pglc00032.png.intel.com ([10.221.207.52])
 by orsmga001.jf.intel.com with ESMTP; 15 Sep 2023 23:33:14 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, fancer.lancer@gmail.com
Date: Sat, 16 Sep 2023 14:33:10 +0800
Message-Id: <20230916063312.7011-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 0/2] net: stmmac: Tx coe sw
	fallback
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
DW xGMAC IP can be synthesized such that it can support tx checksum
offloading only for a few initial tx queues. Also as Serge pointed
out, for the DW QoS IP, tx coe can be individually configured for
each tx queue. This patchset adds support for tx coe sw fallback for
those queues that don't support tx coe. Also, add binding for
snps,coe-unsupported property.

changelog v7:
* Updated commit message.
* Add blank lines around newly added dt binding.

changelog v6:
* Reworked patchset to cover DW QoS Ethernet IP also.

changelog v5:
* As rightly suggested by Serge, reworked redundant code.

changelog v4: 
* Replaced tx_q_coe_lmt with bit flag.

changelog v3: 
* Resend with complete email list.

changelog v2: 
* Reformed binding description.
* Minor grammatical corrections in comments and commit messages.

Rohan G Thomas (2):
  dt-bindings: net: snps,dwmac: Tx coe unsupported
  net: stmmac: Tx coe sw fallback

 Documentation/devicetree/bindings/net/snps,dwmac.yaml |  5 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 10 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  3 +++
 include/linux/stmmac.h                                |  1 +
 4 files changed, 19 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
