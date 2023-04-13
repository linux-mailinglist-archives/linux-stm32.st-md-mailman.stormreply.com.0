Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C93EF6E0522
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 05:26:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E861C65E4F;
	Thu, 13 Apr 2023 03:26:20 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1A26C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 03:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681356378; x=1712892378;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RjSH9E6OXfyTQYug3/UlEBpso7/A92OM8O59zWyTQIc=;
 b=X03GEDCy8nezQ7Mi1/CbVWIyvuY5j3l6M/iJTNEjlogK1pd08tHFGMU1
 bm33oP7F8cVde86qNvS6tTyVSW2ATNoI74St0MatKnj5kdFn6fGihnYDU
 ZTLyohjOWM9LuTDdP+iQYauhazZWS90xcbPOn3eKGaYep9Hm1QQSRdqn6
 gD0eqzZ+NpZzwoXN3f6VxTtoMLMqF6gd92OQFlZH7FkkZUkqb78kM/ySq
 w6Qnrva81eoU06vW56nGjwFWd7p+NHHtSGRNGe3LtrUOOnx9DiTeQgD90
 g/KKVnSFEjb27fFaRXgtYCiuljgLgX614k/0vWF4JB7NlRfdMPlpJfql1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332781615"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="332781615"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 20:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800597033"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="800597033"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2023 20:26:11 -0700
From: Song Yoong Siang <yoong.siang.song@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>,
 Alexander Duyck <alexanderduyck@fb.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>
Date: Thu, 13 Apr 2023 11:25:38 +0800
Message-Id: <20230413032541.885238-1-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 0/3] XDP Rx HWTS metadata for
	stmmac driver
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

Implemented XDP receive hardware timestamp metadata for stmmac driver.

This patchset is tested with tools/testing/selftests/bpf/xdp_hw_metadata.
Below are the test steps and results.

Command on DUT:
	sudo ./xdp_hw_metadata <interface name>

Command on Link Partner:
	echo -n xdp | nc -u -q1 <destination IPv4 addr> 9091
	echo -n skb | nc -u -q1 <destination IPv4 addr> 9092

Result for port 9091:
	0x55fdb5f006d0: rx_desc[3]->addr=1000000003bd000 addr=3bd100 comp_addr=3bd000
	rx_timestamp: 1677762474360150047
	rx_hash: 0
	0x55fdb5f006d0: complete idx=515 addr=3bd000

Result for port 9092:
	found skb hwtstamp = 1677762476.320146161

Changes since v3:
 * directly retrieve Rx HWTS in stmmac_xdp_rx_timestamp(), instead of reuse
   stmmac_get_rx_hwtstamp()

Changes since v2:
 * To reduce packet processing cost, get the Rx HWTS only when xmo_rx_timestamp()
   is called

Changes since v1:
 * Add static to stmmac_xdp_metadata_ops declaration

---

Song Yoong Siang (3):
  net: stmmac: introduce wrapper for struct xdp_buff
  net: stmmac: add Rx HWTS metadata to XDP receive pkt
  net: stmmac: add Rx HWTS metadata to XDP ZC receive pkt

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  7 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 80 ++++++++++++++++---
 2 files changed, 77 insertions(+), 10 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
