Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25882A268F6
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2025 01:50:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 953E9C78F7F;
	Tue,  4 Feb 2025 00:50:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2CC2C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2025 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738630234; x=1770166234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I34wLFfDKiKppl9dNuTu7winWO1kua0VyXa1LB4IcCk=;
 b=c9oa/IdQmrqMWVhZAewdsRUBdSmrio3IMJCJA0EMedcm8mNRhVDXbty+
 4phsHVkfwMzZj1Ki9WiGtJ/98KpwM4/BgmrnQBHztLXO1bgJVwHrztm9X
 68BSk1VDuamJqgFPV0PUrj2OtTWHpRvrLf6vNRqffnJfxHChExZ5h+hEE
 XUg/3kyd0WuZDVIrkrYMZMnQvE48qSd6+H0oURYbj/1TyKvow/kPsgMV+
 FRwK95zvddnDIsZ/89yeO2L8uhfv77RPg6ab2Glga1iCHYYG9H5ad7G/y
 E67AAnIc0s/tFLzHOzNY1fnQkoTWfQD6DMV+e9KY150PtNUnZl+QnBt+e g==;
X-CSE-ConnectionGUID: Q0VoCZ81TRi6C/RDO3p5HQ==
X-CSE-MsgGUID: icq/qvIvT8+9tNBrOkFqgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39296590"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="39296590"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 16:50:32 -0800
X-CSE-ConnectionGUID: 5PFqK48GQBa3ivuaNH/6NQ==
X-CSE-MsgGUID: SbvIf5rIQrSmuhOx1Q+D/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115605701"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.38])
 by orviesa005.jf.intel.com with ESMTP; 03 Feb 2025 16:50:19 -0800
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
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Bouska Zdenek <zdenek.bouska@siemens.com>
Date: Tue,  4 Feb 2025 08:49:06 +0800
Message-Id: <20250204004907.789330-5-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204004907.789330-1-yoong.siang.song@intel.com>
References: <20250204004907.789330-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf-next v7 4/5] igc: Refactor empty packet
	insertion into a reusable function
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

Refactor the code for inserting an empty packet into a new function
igc_insert_empty_packet(). This change extracts the logic for inserting
an empty packet from igc_xmit_frame_ring() into a separate function,
allowing it to be reused in future implementations, such as the XDP
zero copy transmit function.

This patch introduces no functional changes.

Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 drivers/net/ethernet/intel/igc/igc_main.c | 42 ++++++++++++-----------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 56a35d58e7a6..c3edd8bcf633 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -1566,6 +1566,26 @@ static bool igc_request_tx_tstamp(struct igc_adapter *adapter, struct sk_buff *s
 	return false;
 }
 
+static void igc_insert_empty_packet(struct igc_ring *tx_ring)
+{
+	struct igc_tx_buffer *empty_info;
+	struct sk_buff *empty;
+	void *data;
+
+	empty_info = &tx_ring->tx_buffer_info[tx_ring->next_to_use];
+	empty = alloc_skb(IGC_EMPTY_FRAME_SIZE, GFP_ATOMIC);
+	if (!empty)
+		return;
+
+	data = skb_put(empty, IGC_EMPTY_FRAME_SIZE);
+	memset(data, 0, IGC_EMPTY_FRAME_SIZE);
+
+	igc_tx_ctxtdesc(tx_ring, 0, false, 0, 0, 0);
+
+	if (igc_init_tx_empty_descriptor(tx_ring, empty, empty_info) < 0)
+		dev_kfree_skb_any(empty);
+}
+
 static netdev_tx_t igc_xmit_frame_ring(struct sk_buff *skb,
 				       struct igc_ring *tx_ring)
 {
@@ -1603,26 +1623,8 @@ static netdev_tx_t igc_xmit_frame_ring(struct sk_buff *skb,
 	skb->tstamp = ktime_set(0, 0);
 	launch_time = igc_tx_launchtime(tx_ring, txtime, &first_flag, &insert_empty);
 
-	if (insert_empty) {
-		struct igc_tx_buffer *empty_info;
-		struct sk_buff *empty;
-		void *data;
-
-		empty_info = &tx_ring->tx_buffer_info[tx_ring->next_to_use];
-		empty = alloc_skb(IGC_EMPTY_FRAME_SIZE, GFP_ATOMIC);
-		if (!empty)
-			goto done;
-
-		data = skb_put(empty, IGC_EMPTY_FRAME_SIZE);
-		memset(data, 0, IGC_EMPTY_FRAME_SIZE);
-
-		igc_tx_ctxtdesc(tx_ring, 0, false, 0, 0, 0);
-
-		if (igc_init_tx_empty_descriptor(tx_ring,
-						 empty,
-						 empty_info) < 0)
-			dev_kfree_skb_any(empty);
-	}
+	if (insert_empty)
+		igc_insert_empty_packet(tx_ring);
 
 done:
 	/* record the location of the first descriptor for this packet */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
