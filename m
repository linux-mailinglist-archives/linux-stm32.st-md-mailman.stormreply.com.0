Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6DEA10AB4
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 16:28:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA097C78031;
	Tue, 14 Jan 2025 15:28:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 619A8C7802D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736868479; x=1768404479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wfW+D7uuuxP7VqSbz87w5FQ8HJPsOVE1x+y5siIbAlw=;
 b=iwcUvHqQzTnUuAa4adoNw2wkmt4qy+WqqdDhvLrJNIw9p7LGj/bP8fwf
 u2MwxdNLPH2+ohAw61hMt7omtwEgoAcujpIzfn3CpKFvoo5mmVbeHvP6i
 H7y24CtGz0VrM4mtkg2pBZ6vM9tfjqWJy8cUYYjVI6fL+C5cFt3F/LDdo
 ZjdbKb3T9XrrWGZ3uPcBwf7PrsZ5CsInQK7yt1BPzYc3K5F4hsBYFSLLT
 Cbl0Nhus+/FVLncoNA5VR0Nps2r1S02dVFmtAWTV8S5dP9d88kWErs4fy
 wQQ1tPh3oOgszXXnQsgWCeXsGvtqwsAVMyiF0xcx14OMvv8HAxZL8x/HD g==;
X-CSE-ConnectionGUID: s69SP7utTtSiJFmTDWu0Ag==
X-CSE-MsgGUID: hX6Og6bbTZGPXS7LmvPJEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37325285"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="37325285"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:27:51 -0800
X-CSE-ConnectionGUID: rXA+4DBWTH60NfgSXSaN8w==
X-CSE-MsgGUID: yOAduwkgTpy9/jMT+EcTPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142117505"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.38])
 by orviesa001.jf.intel.com with ESMTP; 14 Jan 2025 07:27:39 -0800
From: Song Yoong Siang <yoong.siang.song@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Willem de Bruijn <willemb@google.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Topel <bjorn@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Joe Damato <jdamato@fastly.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Mina Almasry <almasrymina@google.com>, Daniel Jurgens <danielj@nvidia.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Mykola Lysenko <mykolal@fb.com>, Martin KaFai Lau <martin.lau@linux.dev>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>
Date: Tue, 14 Jan 2025 23:27:14 +0800
Message-Id: <20250114152718.120588-1-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf-next v5 0/4] xsk: TX metadata Launch Time
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

This series expands the XDP TX metadata framework to allow user
applications to pass per packet 64-bit launch time directly to the kernel
driver, requesting launch time hardware offload support. The XDP TX
metadata framework will not perform any clock conversion or packet
reordering.

Please note that the role of Tx metadata is just to pass the launch time,
not to enable the offload feature. Users will need to enable the launch
time hardware offload feature of the device by using the respective
command, such as the tc-etf command.

Although some devices use the tc-etf command to enable their launch time
hardware offload feature, xsk packets will not go through the etf qdisc.
Therefore, in my opinion, the launch time should always be based on the PTP
Hardware Clock (PHC). Thus, i did not include a clock ID to indicate the
clock source.

To simplify the test steps, I modified the xdp_hw_metadata bpf self-test
tool in such a way that it will set the launch time based on the offset
provided by the user and the value of the Receive Hardware Timestamp, which
is against the PHC. This will eliminate the need to discipline System Clock
with the PHC and then use clock_gettime() to get the time.

Please note that AF_XDP lacks a feedback mechanism to inform the
application if the requested launch time is invalid. So, users are expected
to familiar with the horizon of the launch time of the device they use and
not request a launch time that is beyond the horizon. Otherwise, the driver
might interpret the launch time incorrectly and react wrongly. For stmmac
and igc, where modulo computation is used, a launch time larger than the
horizon will cause the device to transmit the packet earlier that the
requested launch time.

Although there is no feedback mechanism for the launch time request
for now, user still can check whether the requested launch time is
working or not, by requesting the Transmit Completion Hardware Timestamp.

Changes since v1:
- renamed to use Earliest TxTime First (Willem)
- renamed to use txtime (Willem)

Changes since v2:
- renamed to use launch time (Jesper & Willem)
- changed the default launch time in xdp_hw_metadata apps from 1s to 0.1s
  because some NICs do not support such a large future time.

Changes since v3:
- added XDP launch time support to the igc driver (Jesper & Florian)
- added per-driver launch time limitation on xsk-tx-metadata.rst (Jesper)
- added explanation on FIFO behavior on xsk-tx-metadata.rst (Jakub)
- added step to enable launch time in the commit message (Jesper & Willem)
- explicitly documented the type of launch_time and which clock source
  it is against (Willem)

Changes since v4:
- change netdev feature name from tx-launch-time to tx-launch-time-fifo
  to explicitly state the FIFO behaviour (Stanislav)
- improve the looping of xdp_hw_metadata app to wait for packet tx
  completion to be more readable by using clock_gettime() (Stanislav)
- add launch time setup steps into xdp_hw_metadata app (Stanislav)

v1: https://patchwork.kernel.org/project/netdevbpf/cover/20231130162028.852006-1-yoong.siang.song@intel.com/
v2: https://patchwork.kernel.org/project/netdevbpf/cover/20231201062421.1074768-1-yoong.siang.song@intel.com/
v3: https://patchwork.kernel.org/project/netdevbpf/cover/20231203165129.1740512-1-yoong.siang.song@intel.com/
v4: https://patchwork.kernel.org/project/netdevbpf/cover/20250106135506.9687-1-yoong.siang.song@intel.com/

Song Yoong Siang (4):
  xsk: Add launch time hardware offload support to XDP Tx metadata
  selftests/bpf: Add launch time request to xdp_hw_metadata
  net: stmmac: Add launch time support to XDP ZC
  igc: Add launch time support to XDP ZC

 Documentation/netlink/specs/netdev.yaml       |   4 +
 Documentation/networking/xsk-tx-metadata.rst  |  62 +++++++++
 drivers/net/ethernet/intel/igc/igc_main.c     |  78 +++++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  13 ++
 include/net/xdp_sock.h                        |  10 ++
 include/net/xdp_sock_drv.h                    |   1 +
 include/uapi/linux/if_xdp.h                   |  10 ++
 include/uapi/linux/netdev.h                   |   3 +
 net/core/netdev-genl.c                        |   2 +
 net/xdp/xsk.c                                 |   3 +
 tools/include/uapi/linux/if_xdp.h             |  10 ++
 tools/include/uapi/linux/netdev.h             |   3 +
 tools/testing/selftests/bpf/xdp_hw_metadata.c | 121 +++++++++++++++++-
 14 files changed, 298 insertions(+), 24 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
