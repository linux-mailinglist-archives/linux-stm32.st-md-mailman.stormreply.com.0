Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3872CA37349
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Feb 2025 10:35:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3D3FC78024;
	Sun, 16 Feb 2025 09:35:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36EC5C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739698536; x=1771234536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7QSiQ/PGeTRYR2BYQeKEXkxth7MQ0e1CJi58PXVL7KI=;
 b=i2zIyN4WlVoXOHHdCvBnGGEQ4X1fAZ4rsBVoU7yQNI5OAStIfSuqAKVf
 G51NjWwms6h1l3KpFJRYl1abKTSvuyEXLCoEEyEestJ+EPuk2y/aLf9IL
 7dNqFwvDjC8XA0Kf0FZPL4HCc2XgCGz1UWS+NOjMRSjoqbL83bmhXIatX
 b2NfY0+R+AqR7TXn/rIkF0oTkvD0rTu5YDnyZaAVrPWncmsb3a3L38xgc
 J7tDBkC2iuSymxzZTJ4mtBuloTnfcx+gZZyjWXKodfCGb1pLIif/zHfQt
 evpH5+fwtdkqMvKLBigaD+E96TwKtTgmdEuQvn0zH9bT1cgACdlokr+bc Q==;
X-CSE-ConnectionGUID: eSSyxnwIT+60fNjhDvXEoA==
X-CSE-MsgGUID: U9RIyuf6TTC7ZWexcpi7/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="51812322"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; d="scan'208";a="51812322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 01:35:34 -0800
X-CSE-ConnectionGUID: 9IilJGEORcKO33lhDuBN8A==
X-CSE-MsgGUID: k1mKu4kLQ4GMDxvNj6p4rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117999117"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.38])
 by fmviesa003.fm.intel.com with ESMTP; 16 Feb 2025 01:35:22 -0800
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
Date: Sun, 16 Feb 2025 17:34:30 +0800
Message-Id: <20250216093430.957880-6-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250216093430.957880-1-yoong.siang.song@intel.com>
References: <20250216093430.957880-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf-next v12 5/5] igc: Add launch time support
	to XDP ZC
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

Enable Launch Time Control (LTC) support for XDP zero copy via XDP Tx
metadata framework.

This patch has been tested with tools/testing/selftests/bpf/xdp_hw_metadata
on Intel I225-LM Ethernet controller. Below are the test steps and result.

Test 1: Send a single packet with the launch time set to 1 s in the future.

Test steps:
1. On the DUT, start the xdp_hw_metadata selftest application:
   $ sudo ./xdp_hw_metadata enp2s0 -l 1000000000 -L 1

2. On the Link Partner, send a UDP packet with VLAN priority 1 to port 9091
   of the DUT.

Result:
When the launch time is set to 1 s in the future, the delta between the
launch time and the transmit hardware timestamp is 0.016 us, as shown in
printout of the xdp_hw_metadata application below.
  0x562ff5dc8880: rx_desc[4]->addr=84110 addr=84110 comp_addr=84110 EoP
  rx_hash: 0xE343384 with RSS type:0x1
  HW RX-time:   1734578015467548904 (sec:1734578015.4675)
                delta to User RX-time sec:0.0002 (183.103 usec)
  XDP RX-time:   1734578015467651698 (sec:1734578015.4677)
                 delta to User RX-time sec:0.0001 (80.309 usec)
  No rx_vlan_tci or rx_vlan_proto, err=-95
  0x562ff5dc8880: ping-pong with csum=561c (want c7dd)
                  csum_start=34 csum_offset=6
  HW RX-time:   1734578015467548904 (sec:1734578015.4675)
                delta to HW Launch-time sec:1.0000 (1000000.000 usec)
  0x562ff5dc8880: complete tx idx=4 addr=4018
  HW Launch-time:   1734578016467548904 (sec:1734578016.4675)
                    delta to HW TX-complete-time sec:0.0000 (0.016 usec)
  HW TX-complete-time:   1734578016467548920 (sec:1734578016.4675)
                         delta to User TX-complete-time sec:0.0000
                         (32.546 usec)
  XDP RX-time:   1734578015467651698 (sec:1734578015.4677)
                 delta to User TX-complete-time sec:0.9999
                 (999929.768 usec)
  HW RX-time:   1734578015467548904 (sec:1734578015.4675)
                delta to HW TX-complete-time sec:1.0000 (1000000.016 usec)
  0x562ff5dc8880: complete rx idx=132 addr=84110

Test 2: Send 1000 packets with a 10 ms interval and the launch time set to
        500 us in the future.

Test steps:
1. On the DUT, start the xdp_hw_metadata selftest application:
   $ sudo chrt -f 99 ./xdp_hw_metadata enp2s0 -l 500000 -L 1 > \
     /dev/shm/result.log

2. On the Link Partner, send 1000 UDP packets with a 10 ms interval and
   VLAN priority 1 to port 9091 of the DUT.

Result:
When the launch time is set to 500 us in the future, the average delta
between the launch time and the transmit hardware timestamp is 0.016 us,
as shown in the analysis of /dev/shm/result.log below. The XDP launch time
works correctly in sending 1000 packets continuously.
  Min delta: 0.005 us
  Avr delta: 0.016 us
  Max delta: 0.031 us
  Total packets forwarded: 1000

Reviewed-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Reviewed-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 drivers/net/ethernet/intel/igc/igc.h      |  1 +
 drivers/net/ethernet/intel/igc/igc_main.c | 61 ++++++++++++++++++++++-
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc.h b/drivers/net/ethernet/intel/igc/igc.h
index b8111ad9a9a8..cd1d7b6c1782 100644
--- a/drivers/net/ethernet/intel/igc/igc.h
+++ b/drivers/net/ethernet/intel/igc/igc.h
@@ -579,6 +579,7 @@ struct igc_metadata_request {
 	struct xsk_tx_metadata *meta;
 	struct igc_ring *tx_ring;
 	u32 cmd_type;
+	u16 used_desc;
 };
 
 struct igc_q_vector {
diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 1bfa71545e37..3044392e8ded 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -2971,9 +2971,48 @@ static u64 igc_xsk_fill_timestamp(void *_priv)
 	return *(u64 *)_priv;
 }
 
+static void igc_xsk_request_launch_time(u64 launch_time, void *_priv)
+{
+	struct igc_metadata_request *meta_req = _priv;
+	struct igc_ring *tx_ring = meta_req->tx_ring;
+	__le32 launch_time_offset;
+	bool insert_empty = false;
+	bool first_flag = false;
+	u16 used_desc = 0;
+
+	if (!tx_ring->launchtime_enable)
+		return;
+
+	launch_time_offset = igc_tx_launchtime(tx_ring,
+					       ns_to_ktime(launch_time),
+					       &first_flag, &insert_empty);
+	if (insert_empty) {
+		/* Disregard the launch time request if the required empty frame
+		 * fails to be inserted.
+		 */
+		if (igc_insert_empty_frame(tx_ring))
+			return;
+
+		meta_req->tx_buffer =
+			&tx_ring->tx_buffer_info[tx_ring->next_to_use];
+		/* Inserting an empty packet requires two descriptors:
+		 * one data descriptor and one context descriptor.
+		 */
+		used_desc += 2;
+	}
+
+	/* Use one context descriptor to specify launch time and first flag. */
+	igc_tx_ctxtdesc(tx_ring, launch_time_offset, first_flag, 0, 0, 0);
+	used_desc += 1;
+
+	/* Update the number of used descriptors in this request */
+	meta_req->used_desc += used_desc;
+}
+
 const struct xsk_tx_metadata_ops igc_xsk_tx_metadata_ops = {
 	.tmo_request_timestamp		= igc_xsk_request_timestamp,
 	.tmo_fill_timestamp		= igc_xsk_fill_timestamp,
+	.tmo_request_launch_time	= igc_xsk_request_launch_time,
 };
 
 static void igc_xdp_xmit_zc(struct igc_ring *ring)
@@ -2996,7 +3035,13 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
 	ntu = ring->next_to_use;
 	budget = igc_desc_unused(ring);
 
-	while (xsk_tx_peek_desc(pool, &xdp_desc) && budget--) {
+	/* Packets with launch time require one data descriptor and one context
+	 * descriptor. When the launch time falls into the next Qbv cycle, we
+	 * may need to insert an empty packet, which requires two more
+	 * descriptors. Therefore, to be safe, we always ensure we have at least
+	 * 4 descriptors available.
+	 */
+	while (xsk_tx_peek_desc(pool, &xdp_desc) && budget >= 4) {
 		struct igc_metadata_request meta_req;
 		struct xsk_tx_metadata *meta = NULL;
 		struct igc_tx_buffer *bi;
@@ -3017,9 +3062,19 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
 		meta_req.tx_ring = ring;
 		meta_req.tx_buffer = bi;
 		meta_req.meta = meta;
+		meta_req.used_desc = 0;
 		xsk_tx_metadata_request(meta, &igc_xsk_tx_metadata_ops,
 					&meta_req);
 
+		/* xsk_tx_metadata_request() may have updated next_to_use */
+		ntu = ring->next_to_use;
+
+		/* xsk_tx_metadata_request() may have updated Tx buffer info */
+		bi = meta_req.tx_buffer;
+
+		/* xsk_tx_metadata_request() may use a few descriptors */
+		budget -= meta_req.used_desc;
+
 		tx_desc = IGC_TX_DESC(ring, ntu);
 		tx_desc->read.cmd_type_len = cpu_to_le32(meta_req.cmd_type);
 		tx_desc->read.olinfo_status = cpu_to_le32(olinfo_status);
@@ -3037,9 +3092,11 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
 		ntu++;
 		if (ntu == ring->count)
 			ntu = 0;
+
+		ring->next_to_use = ntu;
+		budget--;
 	}
 
-	ring->next_to_use = ntu;
 	if (tx_desc) {
 		igc_flush_tx_descriptors(ring);
 		xsk_tx_release(pool);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
