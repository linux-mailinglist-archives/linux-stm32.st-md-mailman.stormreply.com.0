Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373946EAFC
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Dec 2021 16:20:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4E9CC5F1EB;
	Thu,  9 Dec 2021 15:20:37 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85A72C5F1E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Dec 2021 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639063236; x=1670599236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5y3Z4EkW334cjNowzU2gLjSyCO8Fgi+Y+RpaLAHWjAw=;
 b=g8a/fPdSJ/035UMjlwZpLF/hyDnJhk0X1gQQWphexTOGvfbZY70lQpCR
 J5uyMxyE9VqNjHFbunDFxrakwn/TJ4jxm0R3MOJDTTiEp7VM9P+EDM2j8
 wiBhr8qGVawnAcJshgxUCqUVGof/AUvSBUAprY/2Nh4oVSAShpr+oFnXd
 Cfcwjh4MEcB1yGWCLn2fb+eMkVjilNIC8REbNNBR24qyXYLoB9AjhpRvj
 XWaoT+LcImrk+R7+0oex2lxG2rlQgn4aQ06UyBr1ffvP2pFCQGqmxHKem
 CppdLbuOOI67EnQ7C+6fbxC20fIcmkzIFWo4JW6JUdSThl08YyarqpLAG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="225387701"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="225387701"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="601585418"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Dec 2021 07:20:31 -0800
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alexandre.torgue@foss.st.com,
 Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>
Date: Thu,  9 Dec 2021 23:16:29 +0800
Message-Id: <20211209151631.138326-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: add EthType Rx
	Frame steering
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

Patch 1/2: Fixes issue in tc filter delete flower for VLAN priority
           steering. Patch has been sent to 'net' ML. Link as follow:

https://patchwork.kernel.org/project/netdevbpf/patch/20211209130335.81114-1-boon.leong.ong@intel.com/

Patch 2/2: Patch to add LLDP and IEEE1588 EtherType RX frame steering
           in tc flower that is implemented on-top of patch 1/2.

Below are the test steps for checking out the newly added feature:-

# Setup traffic class and ingress filter
$ IFDEVNAME=eth0
$ tc qdisc add dev $IFDEVNAME ingress
$ tc qdisc add dev $IFDEVNAME root mqprio num_tc 8 \
     map 0 1 2 3 4 5 6 7 0 0 0 0 0 0 0 0 \
     queues 1@0 1@1 1@2 1@3 1@4 1@5 1@6 1@7 hw 0

# Add two VLAN priority based RX Frame Steering
$ tc filter add dev $IFDEVNAME parent ffff: protocol 802.1Q \
     flower vlan_prio 1 hw_tc 1
$ tc filter add dev $IFDEVNAME parent ffff: protocol 802.1Q \
     flower vlan_prio 2 hw_tc 2

# For LLDP
$ tc filter add dev $IFDEVNAME parent ffff: protocol 0x88cc \
     flower hw_tc 5

# For PTP
$ tc filter add dev $IFDEVNAME parent ffff: protocol 0x88f7 \
     flower hw_tc 6

# Show the ingress tc filters
$ tc filter show dev $IFDEVNAME ingress

filter parent ffff: protocol ptp pref 49149 flower chain 0
filter parent ffff: protocol ptp pref 49149 flower chain 0 handle 0x1 hw_tc 6
  eth_type 88f7
  in_hw in_hw_count 1
filter parent ffff: protocol LLDP pref 49150 flower chain 0
filter parent ffff: protocol LLDP pref 49150 flower chain 0 handle 0x1 hw_tc 5
  eth_type 88cc
  in_hw in_hw_count 1
filter parent ffff: protocol 802.1Q pref 49151 flower chain 0
filter parent ffff: protocol 802.1Q pref 49151 flower chain 0 handle 0x1 hw_tc 2
  vlan_prio 2
  in_hw in_hw_count 1
filter parent ffff: protocol 802.1Q pref 49152 flower chain 0
filter parent ffff: protocol 802.1Q pref 49152 flower chain 0 handle 0x1 hw_tc 1
  vlan_prio 1
  in_hw in_hw_count 1

# Delete tc filters
$ tc filter del dev $IFDEVNAME parent ffff: pref 49149
$ tc filter del dev $IFDEVNAME parent ffff: pref 49150
$ tc filter del dev $IFDEVNAME parent ffff: pref 49151
$ tc filter del dev $IFDEVNAME parent ffff: pref 49152

Thanks,
BL

Ong Boon Leong (2):
  net: stmmac: fix tc flower deletion for VLAN priority Rx steering
  net: stmmac: add tc flower filter for EtherType matching

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  20 ++
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 189 +++++++++++++++++-
 2 files changed, 205 insertions(+), 4 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
