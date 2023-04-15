Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0206E2F50
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Apr 2023 08:45:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23ABAC6A611;
	Sat, 15 Apr 2023 06:45:43 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3725AC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 06:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681541141; x=1713077141;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XPf0NWZspgmTmraWV1B8of1VGZ27Uk2q/PwjqH0foXk=;
 b=Cf0u20txhQadr3j6YFovnIOTrVjohKFqZBCAa8gV7MBC8GBfBRdMPmM5
 A8LLIthynX24ejOWQJvuCVqdccHU1ZS9GOuKB96raJhna6lQgzCNS5m1V
 5jpw8qrpUjTeFfoX6lypITxzVWjoqQdnfRNxA7KVG+ZLIlvlJY3aRBZES
 OngxPuH2RewZSl3bgfFpnoQn2Ibo1S5jLqz2QrTBdQXFWZjpeHZIwOY7/
 gWlCwagK/ykaXy/7Srrmu4NUQqmOfbOHdLKq7xLfQz9cBUWNpa3Om+asf
 LCmrvkgqmiGbl3wyZwL9MANV8TfJCp22qzGy5n1YzARcoyG0XRxnE3+nO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="343379260"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="343379260"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 23:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="754727538"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="754727538"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by fmsmga008.fm.intel.com with ESMTP; 14 Apr 2023 23:45:33 -0700
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
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Jacob Keller <jacob.e.keller@intel.com>
Date: Sat, 15 Apr 2023 14:45:00 +0800
Message-Id: <20230415064503.3225835-1-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 0/3] XDP Rx HWTS metadata for
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
	poll: 1 (0) skip=1 fail=0 redir=1
	xsk_ring_cons__peek: 1
	0x55f69f65f6d0: rx_desc[0]->addr=100000000008000 addr=8100 comp_addr=8000
	rx_timestamp: 1677762069053692631
	No rx_hash err=-95
	0x55f69f65f6d0: complete idx=8 addr=8000

Result for port 9092:
	poll: 1 (0) skip=2 fail=0 redir=1
	found skb hwtstamp = 1677762071.937207680

changelog:
v5 -> v6: improve field naming of struct stmmac_xdp_buff

v4 -> v5: remove zeroing operation on ctx variable

v3 -> v4: directly retrieve Rx HWTS in stmmac_xdp_rx_timestamp(), instead
	  of reuse stmmac_get_rx_hwtstamp()

v2 -> v3: To reduce packet processing cost, get the Rx HWTS only when
	  xmo_rx_timestamp() is called

v1 -> v2: Add static to stmmac_xdp_metadata_ops declaration

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
