Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32070350373
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 17:31:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1734C5662E;
	Wed, 31 Mar 2021 15:31:45 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BBACC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 15:31:43 +0000 (UTC)
IronPort-SDR: dlX9NiP1uNauvYMoxqNtGWCB0IDoH64rIlYz+Ey+HWAQJRv+AZFb7rWx+eRplcw7smTlSObt0e
 Y+RmJmdqSvXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="256015138"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="256015138"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 08:31:38 -0700
IronPort-SDR: t2ElSMhwnt8Hm7hqczZh4uqwTpjrT0CnReQGioO25F9+uRM8nZaJ0EiW3QO6AW0NUOZbkxvh/h
 y9c5DTJJe8Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="455537071"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga001.jf.intel.com with ESMTP; 31 Mar 2021 08:31:32 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Date: Wed, 31 Mar 2021 23:35:41 +0800
Message-Id: <20210331153541.1892-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 KP Singh <kpsingh@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/6] stmmac: Add XDP support
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

This is the v3 patch series for adding XDP support to stmmac driver.

Summary of the changes in v3 (per feedback from Jakub Kicinski):-

4/6: Factor in XDP buffer header and tail adjustment by XDP prog.

5/6: Added 'nq->trans_start = jiffies' to avoid TX time-out for XDP_TX.

6/6: Added 'nq->trans_start = jiffies' to avoid TX time-out for
     ndo_xdp_xmit.

I retested this patch series on all the test steps listed in v1 and the
results look good as expected. I also used xdp_adjust_tail test app in
samples/bpf for checking out XDP head and tail adjustment introduced in
4/6 and the result below looks correct too.

 ########################################################################

DUT > root@intel-corei7-64:~ $ ./xdp_adjust_tail -i eth0 -P 400 -N
==========================
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          1 pkts
icmp "packet too big" sent:          1 pkts
icmp "packet too big" sent:          1 pkts
icmp "packet too big" sent:          2 pkts
icmp "packet too big" sent:          4 pkts
icmp "packet too big" sent:          6 pkts
icmp "packet too big" sent:          8 pkts
icmp "packet too big" sent:          9 pkts
icmp "packet too big" sent:         10 pkts
icmp "packet too big" sent:         10 pkts

LP > root@intel-corei7-64:~# ping 169.254.1.11 -s 300
PING 169.254.1.11 (169.254.1.11) 300(328) bytes of data.
308 bytes from 169.254.1.11: icmp_seq=1 ttl=64 time=1.17 ms
308 bytes from 169.254.1.11: icmp_seq=2 ttl=64 time=0.575 ms
308 bytes from 169.254.1.11: icmp_seq=3 ttl=64 time=0.582 ms
308 bytes from 169.254.1.11: icmp_seq=4 ttl=64 time=0.595 ms
308 bytes from 169.254.1.11: icmp_seq=5 ttl=64 time=0.585 ms
308 bytes from 169.254.1.11: icmp_seq=6 ttl=64 time=0.591 ms
308 bytes from 169.254.1.11: icmp_seq=7 ttl=64 time=0.599 ms
^C
--- 169.254.1.11 ping statistics ---
7 packets transmitted, 7 received, 0% packet loss, time 6103ms
rtt min/avg/max/mdev = 0.575/0.670/1.166/0.202 ms

LP >  root@intel-corei7-64:~# ping 169.254.1.11 -s 500
PING 169.254.1.11 (169.254.1.11) 500(528) bytes of data.
From 169.254.1.11 icmp_seq=1 Frag needed and DF set (mtu = 436)
From 169.254.1.11 icmp_seq=2 Frag needed and DF set (mtu = 436)
From 169.254.1.11 icmp_seq=3 Frag needed and DF set (mtu = 436)
From 169.254.1.11 icmp_seq=4 Frag needed and DF set (mtu = 436)
From 169.254.1.11 icmp_seq=5 Frag needed and DF set (mtu = 436)
From 169.254.1.11 icmp_seq=6 Frag needed and DF set (mtu = 436)

 ########################################################################

History of the previous patch series:

v2: https://patchwork.kernel.org/project/netdevbpf/list/?series=457757
v1: https://patchwork.kernel.org/project/netdevbpf/list/?series=457139

It will be great if community can help to test or review the v3 patch
series on your platform and provide me any new feedback if any.

Thank you very much.
Boon Leong

Ong Boon Leong (6):
  net: stmmac: set IRQ affinity hint for multi MSI vectors
  net: stmmac: make SPH enable/disable to be configurable
  net: stmmac: arrange Tx tail pointer update to
    stmmac_flush_tx_descriptors
  net: stmmac: Add initial XDP support
  net: stmmac: Add support for XDP_TX action
  net: stmmac: Add support for XDP_REDIRECT action

 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  35 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 529 +++++++++++++++---
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |  40 ++
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.h  |  12 +
 5 files changed, 537 insertions(+), 80 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
