Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D627FF4BC
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Nov 2023 17:22:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23268C6B479;
	Thu, 30 Nov 2023 16:22:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF25DC6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 16:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701361327; x=1732897327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bXoVezPhVWKfoB3JGdgSXzPzDzpsCHhdUMolTMlscIk=;
 b=AIoj+ti15gDZ5siIm7dZHrPaYBG6bSXHN8jbqMZCH9sUVRdS0EBKMwrv
 5MFYd7xoS2IvdaJD1+A1EVROjk7RSQmKYkW7PtzOQhMfHyyLWOgRSzm09
 KSpzYrNiPeHXcaERR7BCyCvPRbMEAbjrz7iX8iLEN5xDzn0OLHLBNYkh6
 xu2agtJztXPJM1bu8e3AxL9Mzou5VEZmnO518XCXKWJUUHycDcdAtSIbs
 cx9YuYoZ9FTNns5aa3S7cwkTZu9P0GtEylBm9m6bPyujYoyosljSlukZ6
 99Q//7HKHD1sSDScZE/iD96A7YjrQYkMcFYFqfLKtomZBca98Mfg6TfD7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="383744642"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="383744642"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 08:22:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="803758703"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="803758703"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by orsmga001.jf.intel.com with ESMTP; 30 Nov 2023 08:21:55 -0800
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
Date: Fri,  1 Dec 2023 00:20:28 +0800
Message-Id: <20231130162028.852006-4-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130162028.852006-1-yoong.siang.song@intel.com>
References: <20231130162028.852006-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, Song Yoong Siang <yoong.siang.song@intel.com>,
 linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf-next 3/3] selftests/bpf: Add launch time
	to xdp_hw_metadata
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

This patch adds launch time support to xdp_hw_metadata. User can configure
the delta of HW launch time to HW RX-time by using "-l" argument.

This patch is tested with stmmac on Intel Tiger Lake platform. Refer to
result below, the delta between pre-determined launch time and actual
transmit time is around 24 us.

$ sudo ./xdp_hw_metadata enp0s30f4
...
xsk_ring_cons__peek: 1
0x55fcb80ce7a8: rx_desc[0]->addr=80100 addr=80100 comp_addr=80100 EoP
No rx_hash err=-95
HW RX-time:   1677764507059055964 (sec:1677764507.0591) delta to User RX-time sec:0.0002 (237.548 usec)
XDP RX-time:   1677764507059280741 (sec:1677764507.0593) delta to User RX-time sec:0.0000 (12.771 usec)
0x55fcb80ce7a8: ping-pong with csum=5619 (want 8626) csum_start=34 csum_offset=6
HW RX-time:   1677764507059055964 (sec:1677764507.0591) delta to HW Launch-time sec:1.0000 (1000000.000 usec)
0x55fcb80ce7a8: complete tx idx=0 addr=18
HW Launch-time:   1677764508059055964 (sec:1677764508.0591) delta to HW TX-complete-time sec:0.0000 (24.235 usec)
HW TX-complete-time:   1677764508059080199 (sec:1677764508.0591) delta to User TX-complete-time sec:0.0054 (5423.263 usec)
XDP RX-time:   1677764507059280741 (sec:1677764507.0593) delta to User TX-complete-time sec:1.0052 (1005222.721 usec)
HW RX-time:   1677764507059055964 (sec:1677764507.0591) delta to HW TX-complete-time sec:1.0000 (1000024.235 usec)
0x55fcb80ce7a8: complete rx idx=128 addr=80100

$ sudo ./xdp_hw_metadata enp0s30f4 -l 10000000
...
xsk_ring_cons__peek: 1
0x5626d54de7a8: rx_desc[0]->addr=80100 addr=80100 comp_addr=80100 EoP
No rx_hash err=-95
HW RX-time:   1677764655807717783 (sec:1677764655.8077) delta to User RX-time sec:0.0002 (240.571 usec)
XDP RX-time:   1677764655807942983 (sec:1677764655.8079) delta to User RX-time sec:0.0000 (15.371 usec)
0x5626d54de7a8: ping-pong with csum=5619 (want 8626) csum_start=34 csum_offset=6
HW RX-time:   1677764655807717783 (sec:1677764655.8077) delta to HW Launch-time sec:0.0100 (10000.000 usec)
0x5626d54de7a8: complete tx idx=0 addr=18
HW Launch-time:   1677764655817717783 (sec:1677764655.8177) delta to HW TX-complete-time sec:0.0000 (23.965 usec)
HW TX-complete-time:   1677764655817741748 (sec:1677764655.8177) delta to User TX-complete-time sec:0.0003 (291.792 usec)
XDP RX-time:   1677764655807942983 (sec:1677764655.8079) delta to User TX-complete-time sec:0.0101 (10090.557 usec)
HW RX-time:   1677764655807717783 (sec:1677764655.8077) delta to HW TX-complete-time sec:0.0100 (10023.965 usec)
0x5626d54de7a8: complete rx idx=128 addr=80100

Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 tools/testing/selftests/bpf/xdp_hw_metadata.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/xdp_hw_metadata.c b/tools/testing/selftests/bpf/xdp_hw_metadata.c
index 3291625ba4fb..ff1b2e5b0fce 100644
--- a/tools/testing/selftests/bpf/xdp_hw_metadata.c
+++ b/tools/testing/selftests/bpf/xdp_hw_metadata.c
@@ -13,6 +13,7 @@
  * - UDP 9091 packets trigger TX reply
  * - TX HW timestamp is requested and reported back upon completion
  * - TX checksum is requested
+ * - HW launch time is set for transmission
  */
 
 #include <test_progs.h>
@@ -61,6 +62,8 @@ int rxq;
 bool skip_tx;
 __u64 last_hw_rx_timestamp;
 __u64 last_xdp_rx_timestamp;
+__u64 last_launch_time;
+__u64 launch_time_offset = 1000000000; /* 1 second */
 
 void test__fail(void) { /* for network_helpers.c */ }
 
@@ -274,6 +277,8 @@ static bool complete_tx(struct xsk *xsk, clockid_t clock_id)
 	if (meta->completion.tx_timestamp) {
 		__u64 ref_tstamp = gettime(clock_id);
 
+		print_tstamp_delta("HW Launch-time", "HW TX-complete-time",
+				   last_launch_time, meta->completion.tx_timestamp);
 		print_tstamp_delta("HW TX-complete-time", "User TX-complete-time",
 				   meta->completion.tx_timestamp, ref_tstamp);
 		print_tstamp_delta("XDP RX-time", "User TX-complete-time",
@@ -371,6 +376,13 @@ static void ping_pong(struct xsk *xsk, void *rx_packet, clockid_t clock_id)
 	       xsk, ntohs(udph->check), ntohs(want_csum),
 	       meta->request.csum_start, meta->request.csum_offset);
 
+	/* Set launch time at launch_time_offset ns later than HW Rx-time */
+	meta->flags |= XDP_TXMD_FLAGS_LAUNCH_TIME;
+	last_launch_time = last_hw_rx_timestamp + launch_time_offset;
+	meta->request.launch_time = last_launch_time;
+	print_tstamp_delta("HW RX-time", "HW Launch-time",
+			   last_hw_rx_timestamp, meta->request.launch_time);
+
 	memcpy(data, rx_packet, len); /* don't share umem chunk for simplicity */
 	tx_desc->options |= XDP_TX_METADATA;
 	tx_desc->len = len;
@@ -595,6 +607,7 @@ static void print_usage(void)
 		"  -h    Display this help and exit\n\n"
 		"  -m    Enable multi-buffer XDP for larger MTU\n"
 		"  -r    Don't generate AF_XDP reply (rx metadata only)\n"
+		"  -l    Delta of HW launch time to HW RX-time in ns (default: 1s)\n"
 		"Generate test packets on the other machine with:\n"
 		"  echo -n xdp | nc -u -q1 <dst_ip> 9091\n";
 
@@ -605,7 +618,7 @@ static void read_args(int argc, char *argv[])
 {
 	int opt;
 
-	while ((opt = getopt(argc, argv, "chmr")) != -1) {
+	while ((opt = getopt(argc, argv, "chmrl:")) != -1) {
 		switch (opt) {
 		case 'c':
 			bind_flags &= ~XDP_USE_NEED_WAKEUP;
@@ -621,6 +634,9 @@ static void read_args(int argc, char *argv[])
 		case 'r':
 			skip_tx = true;
 			break;
+		case 'l':
+			launch_time_offset = atoll(optarg);
+			break;
 		case '?':
 			if (isprint(optopt))
 				fprintf(stderr, "Unknown option: -%c\n", optopt);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
