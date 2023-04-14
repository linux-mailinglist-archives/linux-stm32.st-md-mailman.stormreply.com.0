Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AAB6E1BA5
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Apr 2023 07:27:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55C46C69066;
	Fri, 14 Apr 2023 05:27:37 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EBA9C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 05:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681450056; x=1712986056;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5n/0mu42zjwQFiX1Bk2YBnMsraHX2+ZdlcxSeNpwlQA=;
 b=ddvHrH6tKC9KRQkieOKjBC6oI4sES3IfKfyn/GYisnFgbhKPnBBbTvbv
 3W8kayIt+NZbMa7MVPFYDFNlUvMMLiRMOfW9seDZ2H8NPR2vOEh0E918Y
 exNXpSz5Giwsgxa3fmO//JCta38XtypCc4+SA7Itdt+zqiFn+O5z+K08B
 8AgdbGzYhvDyfs4sf5mxtJSfEHbHPIRiyJ6fj/h2VgnouWeeuO+s+/wtB
 YxKMazjSjb5rcaJ99xKCMdOIwL6fY3+gR36RCaoDRmpDGOlKlmV9Fjlta
 vg4A43wVTqIrl8ta+d/wlfRkVEReVFupfAxf5ygYio3VgFTimSerd/oun A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="333152656"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="333152656"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 22:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="692234132"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="692234132"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by fmsmga007.fm.intel.com with ESMTP; 13 Apr 2023 22:27:28 -0700
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
Date: Fri, 14 Apr 2023 13:26:48 +0800
Message-Id: <20230414052651.1871424-1-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 0/3] XDP Rx HWTS metadata for
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

changelog:
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
