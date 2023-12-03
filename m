Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 627728025AA
	for <lists+linux-stm32@lfdr.de>; Sun,  3 Dec 2023 17:51:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1472FC6C841;
	Sun,  3 Dec 2023 16:51:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E3CBC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Dec 2023 16:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701622317; x=1733158317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lTyXJMsSPVluiy97P4qSM7nDpEehwOMAB+SjdzyXSkI=;
 b=MM9ysIeUBufiVmfs4nW+oLbmOjNTBYv/TEJnps30dZxQ4dD9sWtRllDv
 siF+0ZmNb+2qEgHeQP+y2gQ0yASu2xm5ltKtfTZzceLRDiheVQOejeTIJ
 c85PNTvU9gcBCKVq4r0CfG4S8T/3y49j1f58EnpRXMROwuRprerBrtf6h
 1sX5xuad/4C7LLWECYqnJUrYxDnLBuT3GmWxCfzE8jVCdaKZg+bXjtTaQ
 +lqY/pZTM6P/U8v6w8GeGub3ixH+MVfPK1F0J8ZQZdJYIq8ff1gXBknL/
 mQexPe+YPxal7tY70b+G9IatCrJUP2t/OrWq3FrSoD8eqCJM7BIlKAnvr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="706801"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="706801"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 08:51:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="799345384"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; d="scan'208";a="799345384"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by orsmga008.jf.intel.com with ESMTP; 03 Dec 2023 08:51:44 -0800
From: Song Yoong Siang <yoong.siang.song@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Topel <bjorn@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Willem de Bruijn <willemb@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon,  4 Dec 2023 00:51:26 +0800
Message-Id: <20231203165129.1740512-1-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, Song Yoong Siang <yoong.siang.song@intel.com>,
 linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf-next v3 0/3] xsk: TX metadata Launch Time
	support
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

This series expands XDP TX metadata framework to include ETF HW offload.

Changes since v1: (Willem)
- rename Time-Based Scheduling (TBS) to Earliest TxTime First (ETF)
- rename launch-time to txtime

Changes since v2: (Jesper & Willem)
- rename to use launch time
- change the default launch time in xdp_hw_metadata apps from 1s to 0.1s
  because some NICs do not support such a large future time.

v1: https://patchwork.kernel.org/project/netdevbpf/cover/20231130162028.852006-1-yoong.siang.song@intel.com/
v2: https://patchwork.kernel.org/project/netdevbpf/cover/20231201062421.1074768-1-yoong.siang.song@intel.com/

Song Yoong Siang (3):
  xsk: add Launch Time HW offload to XDP Tx metadata
  net: stmmac: add Launch Time support to XDP ZC
  selftests/bpf: add Launch Time request to xdp_hw_metadata

 Documentation/netlink/specs/netdev.yaml       |  4 ++++
 Documentation/networking/xsk-tx-metadata.rst  |  4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
 include/net/xdp_sock.h                        | 10 ++++++++++
 include/net/xdp_sock_drv.h                    |  1 +
 include/uapi/linux/if_xdp.h                   |  9 +++++++++
 include/uapi/linux/netdev.h                   |  3 +++
 net/core/netdev-genl.c                        |  2 ++
 net/xdp/xsk.c                                 |  3 +++
 tools/include/uapi/linux/if_xdp.h             |  9 +++++++++
 tools/include/uapi/linux/netdev.h             |  3 +++
 tools/net/ynl/generated/netdev-user.c         |  1 +
 tools/testing/selftests/bpf/xdp_hw_metadata.c | 19 ++++++++++++++++++-
 14 files changed, 82 insertions(+), 1 deletion(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
