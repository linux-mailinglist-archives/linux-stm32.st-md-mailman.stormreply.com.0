Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2901C33E60A
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Mar 2021 02:28:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D20C2C57B79;
	Wed, 17 Mar 2021 01:28:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3601AC57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Mar 2021 01:28:55 +0000 (UTC)
IronPort-SDR: szokB6kOD+17RnTluPThbbwOK8tCvPXpXulY3KMG/QP0lgbPq2N1FoMnW2PWT6GAbv5WWey2/z
 /N1tYTRbx+RQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="168638584"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="168638584"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 18:28:53 -0700
IronPort-SDR: XFkO0W416w+dXTE9Buk9yXsw/G0I5PpohdJeptwReNVAW0ombMWJwvJuXSdUGlSsQfxWL5CkVS
 zUgC2P4s4lYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="605493928"
Received: from glass.png.intel.com ([10.158.65.59])
 by fmsmga005.fm.intel.com with ESMTP; 16 Mar 2021 18:28:48 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 17 Mar 2021 09:32:46 +0800
Message-Id: <20210317013247.25131-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/1] stmmac: add PCH and PSE PTP
	clock setting
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

Intel mGBE controllers that are integrated into EHL, TGL SoC have
different clock source selection. This patch adds the required setting for
running linuxptp time-sync.

The patch has been tested on both PSE (/dev/ptp0) and PCH TSN(/dev/ptp2)
and the results for the time sync looks correct.

############################ PSE TSN ####################################
> cat gPTP.conf
[global]
gmCapable               1
priority1               248
priority2               248
logAnnounceInterval     0
logSyncInterval         -3
syncReceiptTimeout      3
neighborPropDelayThresh 800
min_neighbor_prop_delay -20000000
assume_two_step         1
path_trace_enabled      1
follow_up_info          1
transportSpecific       0x1
ptp_dst_mac             01:80:C2:00:00:0E
network_transport       L2
delay_mechanism         P2P
ingressLatency          231
egressLatency           147
tx_timestamp_timeout    50
> /usr/local/sbin/ptp4l -v
3.1

#################################
# Start ptp4l eth0 [verbose mode]
#################################

> /usr/local/sbin/ptp4l -P2Hi eth0 -f gPTP.conf --step_threshold=1 -m
ptp4l[8380.510]: selected /dev/ptp0 as PTP clock
ptp4l[8380.535]: port 1: INITIALIZING to LISTENING on INIT_COMPLETE
ptp4l[8380.535]: port 0: INITIALIZING to LISTENING on INIT_COMPLETE
ptp4l[8381.655]: port 1: link down
ptp4l[8381.655]: port 1: LISTENING to FAULTY on FAULT_DETECTED (FT_UNSPECIFIED)
ptp4l[8381.676]: selected local clock f6cd9d.fffe.e6dc36 as best master
ptp4l[8381.676]: port 1: assuming the grand master role
ptp4l[8383.705]: port 1: link up
ptp4l[8383.727]: port 1: FAULTY to LISTENING on INIT_COMPLETE
ptp4l[8387.099]: port 1: LISTENING to MASTER on ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES
ptp4l[8387.099]: selected local clock f6cd9d.fffe.e6dc36 as best master
ptp4l[8387.099]: port 1: assuming the grand master role
ptp4l[8388.357]: port 1: new foreign master d63d87.fffe.60a9eb-1
ptp4l[8390.357]: selected best master clock d63d87.fffe.60a9eb
ptp4l[8390.357]: port 1: MASTER to UNCALIBRATED on RS_SLAVE
ptp4l[8390.981]: port 1: UNCALIBRATED to SLAVE on MASTER_CLOCK_SELECTED
ptp4l[8391.607]: rms 24333463708388 max 48666927416912 freq  -1919 +/- 725 delay   101 +/-   0
ptp4l[8392.607]: rms    2 max    6 freq  -2194 +/-   3 delay   101 +/-   0
ptp4l[8393.607]: rms    5 max   10 freq  -2192 +/-   7 delay   101 +/-   0
ptp4l[8394.607]: rms    4 max    5 freq  -2195 +/-   5 delay   100 +/-   0
ptp4l[8395.607]: rms    4 max    9 freq  -2198 +/-   4 delay   100 +/-   0
ptp4l[8396.607]: rms    5 max    9 freq  -2201 +/-   6 delay   100 +/-   0
ptp4l[8397.607]: rms    6 max    8 freq  -2196 +/-   8 delay   101 +/-   0
ptp4l[8398.607]: rms    5 max    9 freq  -2195 +/-   7 delay   102 +/-   0
ptp4l[8399.607]: rms    7 max   13 freq  -2199 +/-   9 delay   102 +/-   0
ptp4l[8400.608]: rms    6 max   14 freq  -2198 +/-   8 delay   101 +/-   0
ptp4l[8401.608]: rms    8 max   10 freq  -2195 +/-  10 delay   101 +/-   0
#########################################################################


############################ PCH TSN ####################################
> cat gPTP.conf
[global]
gmCapable               1
priority1               248
priority2               248
logAnnounceInterval     0
logSyncInterval         -3
syncReceiptTimeout      3
neighborPropDelayThresh 800
min_neighbor_prop_delay -20000000
assume_two_step         1
path_trace_enabled      1
follow_up_info          1
transportSpecific       0x1
ptp_dst_mac             01:80:C2:00:00:0E
network_transport       L2
delay_mechanism         P2P
ingressLatency          503
egressLatency           275
tx_timestamp_timeout    50
> /usr/local/sbin/ptp4l -v
3.1

#################################
# Start ptp4l eth2 [verbose mode]
#################################

> /usr/local/sbin/ptp4l -P2Hi eth2 -f gPTP.conf          --step_threshold=1 -m
ptp4l[8526.902]: selected /dev/ptp2 as PTP clock
ptp4l[8526.957]: port 1: INITIALIZING to LISTENING on INIT_COMPLETE
ptp4l[8526.957]: port 0: INITIALIZING to LISTENING on INIT_COMPLETE
ptp4l[8526.957]: port 1: link down
ptp4l[8526.957]: port 1: LISTENING to FAULTY on FAULT_DETECTED (FT_UNSPECIFIED)
ptp4l[8526.978]: selected local clock 7ab054.fffe.8aaa86 as best master
ptp4l[8526.979]: port 1: assuming the grand master role
ptp4l[8528.026]: port 1: link up
ptp4l[8528.058]: port 1: FAULTY to LISTENING on INIT_COMPLETE
ptp4l[8531.070]: port 1: LISTENING to MASTER on ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES
ptp4l[8531.070]: selected local clock 7ab054.fffe.8aaa86 as best master
ptp4l[8531.070]: port 1: assuming the grand master role
ptp4l[8532.878]: port 1: new foreign master 5ee86b.fffe.dd4586-1
ptp4l[8534.878]: selected best master clock 5ee86b.fffe.dd4586
ptp4l[8534.878]: port 1: MASTER to UNCALIBRATED on RS_SLAVE
ptp4l[8535.387]: port 1: UNCALIBRATED to SLAVE on MASTER_CLOCK_SELECTED
ptp4l[8536.012]: rms 24333477164408 max 48666954328964 freq  -1980 +/- 749 delay   224 +/-   0
ptp4l[8537.012]: rms   48 max   61 freq  -2195 +/-  13 delay   221 +/-   0
ptp4l[8538.012]: rms   29 max   43 freq  -2182 +/-   6 delay   221 +/-   0
ptp4l[8539.012]: rms   13 max   27 freq  -2192 +/-  14 delay   221 +/-   0
ptp4l[8540.012]: rms    8 max   13 freq  -2205 +/-  10 delay   221 +/-   0
ptp4l[8541.013]: rms   12 max   20 freq  -2217 +/-  13 delay   224 +/-   0
ptp4l[8542.013]: rms    7 max   17 freq  -2214 +/-  10 delay   221 +/-   0
ptp4l[8543.013]: rms    7 max   11 freq  -2208 +/-  10 delay   221 +/-   0
ptp4l[8544.013]: rms    8 max   16 freq  -2214 +/-  10 delay   220 +/-   0
#########################################################################

Thanks
Boon Leong

Wong, Vee Khee (1):
  stmmac: intel: Add PSE and PCH PTP clock source selection

 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 46 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  7 +++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  3 ++
 include/linux/stmmac.h                        |  1 +
 4 files changed, 57 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
