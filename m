Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 936F1A13E55
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2025 16:55:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABC09C78F84;
	Thu, 16 Jan 2025 15:55:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 068AFC78F7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 15:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737042906; x=1768578906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ICih0Ufk2qozWYh8yyTBZShwHq7HyQ0ngswP80JK70E=;
 b=IDDE+PbiEH6QcG7sjUqJVX4DoGYX6oDyaBhu/h1hPMBg0vH3yrqOEgXu
 257MPrOe1hLAhSEvGo+mhLvLeIBbTDWljp6wsdM5gZ3tmkx068W0/uhab
 Pep3aNocQoc5OAyfgQfGGj1HEEggkfS8kYZBavGynMMupD+vyMfgTLm+t
 1cdayM+hN/OBzf2IBTJTCX/7LuRag8wrZgfYA9lW+Sb+fl2CfiVZGlsN0
 kbxnC75XVC1Sa0k/DbPvY1auQJ4zkADpTjLNqKMAHtD+9rnd1O8yc7VXD
 mCcWzg1mTpXW64BAX30W9Z50wQsuh+somoxMmXHMs/U/MdKi12HkcJM5z g==;
X-CSE-ConnectionGUID: o+Huzm+PTzejieP98Kl55w==
X-CSE-MsgGUID: 6wtRx9KKTtGWyd9xOQUJcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36715702"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="36715702"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 07:54:44 -0800
X-CSE-ConnectionGUID: A6aDFZfXSCiaA6ftxx7fMw==
X-CSE-MsgGUID: 4RASgV5XT8KLkYRLadx37A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="106113872"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.38])
 by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2025 07:54:34 -0800
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
Date: Thu, 16 Jan 2025 23:53:49 +0800
Message-Id: <20250116155350.555374-4-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116155350.555374-1-yoong.siang.song@intel.com>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf-next v6 3/4] net: stmmac: Add launch time
	support to XDP ZC
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

Enable launch time (Time-Based Scheduling) support to XDP zero copy via XDP
Tx metadata framework.

This patch is tested with tools/testing/selftests/bpf/xdp_hw_metadata on
Intel Tiger Lake platform. Below are the test steps and result.

Test Steps:
1. At DUT, start xdp_hw_metadata selftest application:
   $ sudo ./xdp_hw_metadata enp0s30f4 -l 1000000000 -L 1

2. At Link Partner, send an UDP packet with VLAN priority 1 to port 9091 of
   DUT.

When launch time is set to 1s in the future, the delta between launch time
and transmit hardware timestamp is equal to 16.963us, as shown in result
below:
  0x55b5864717a8: rx_desc[4]->addr=88100 addr=88100 comp_addr=88100 EoP
  No rx_hash, err=-95
  HW RX-time:   1734579065767717328 (sec:1734579065.7677) delta to User RX-time sec:0.0004 (375.624 usec)
  XDP RX-time:   1734579065768004454 (sec:1734579065.7680) delta to User RX-time sec:0.0001 (88.498 usec)
  No rx_vlan_tci or rx_vlan_proto, err=-95
  0x55b5864717a8: ping-pong with csum=5619 (want 0000) csum_start=34 csum_offset=6
  HW RX-time:   1734579065767717328 (sec:1734579065.7677) delta to HW Launch-time sec:1.0000 (1000000.000 usec)
  0x55b5864717a8: complete tx idx=4 addr=4018
  HW Launch-time:   1734579066767717328 (sec:1734579066.7677) delta to HW TX-complete-time sec:0.0000 (16.963 usec)
  HW TX-complete-time:   1734579066767734291 (sec:1734579066.7677) delta to User TX-complete-time sec:0.0001 (130.408 usec)
  XDP RX-time:   1734579065768004454 (sec:1734579065.7680) delta to User TX-complete-time sec:0.9999 (999860.245 usec)
  HW RX-time:   1734579065767717328 (sec:1734579065.7677) delta to HW TX-complete-time sec:1.0000 (1000016.963 usec)
  0x55b5864717a8: complete rx idx=132 addr=88100

Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 1d86439b8a14..c80462d42989 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -106,6 +106,8 @@ struct stmmac_metadata_request {
 	struct stmmac_priv *priv;
 	struct dma_desc *tx_desc;
 	bool *set_ic;
+	struct dma_edesc *edesc;
+	int tbs;
 };
 
 struct stmmac_xsk_tx_complete {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c81ea8cdfe6e..3a083e3684ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2445,9 +2445,20 @@ static u64 stmmac_xsk_fill_timestamp(void *_priv)
 	return 0;
 }
 
+static void stmmac_xsk_request_launch_time(u64 launch_time, void *_priv)
+{
+	struct stmmac_metadata_request *meta_req = _priv;
+	struct timespec64 ts = ns_to_timespec64(launch_time);
+
+	if (meta_req->tbs & STMMAC_TBS_EN)
+		stmmac_set_desc_tbs(meta_req->priv, meta_req->edesc, ts.tv_sec,
+				    ts.tv_nsec);
+}
+
 static const struct xsk_tx_metadata_ops stmmac_xsk_tx_metadata_ops = {
 	.tmo_request_timestamp		= stmmac_xsk_request_timestamp,
 	.tmo_fill_timestamp		= stmmac_xsk_fill_timestamp,
+	.tmo_request_launch_time	= stmmac_xsk_request_launch_time,
 };
 
 static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
@@ -2531,6 +2542,8 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		meta_req.priv = priv;
 		meta_req.tx_desc = tx_desc;
 		meta_req.set_ic = &set_ic;
+		meta_req.tbs = tx_q->tbs;
+		meta_req.edesc = &tx_q->dma_entx[entry];
 		xsk_tx_metadata_request(meta, &stmmac_xsk_tx_metadata_ops,
 					&meta_req);
 		if (set_ic) {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
