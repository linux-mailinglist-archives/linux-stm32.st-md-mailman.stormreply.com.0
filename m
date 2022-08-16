Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CB4595572
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Aug 2022 10:40:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AFB6C640F2;
	Tue, 16 Aug 2022 08:40:34 +0000 (UTC)
Received: from ma1-aaemail-dr-lapp03.apple.com
 (ma1-aaemail-dr-lapp03.apple.com [17.171.2.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D5F3C04003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Aug 2022 07:30:54 +0000 (UTC)
Received: from pps.filterd (ma1-aaemail-dr-lapp03.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp03.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 27G78EXY029011; Tue, 16 Aug 2022 00:30:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=20180706; bh=kfbzQQ7kGHkA4s318UX6eWWGRUIQVHhzwyFKp7LGS68=;
 b=XZeg04JzopgRnEAKr7LLyI+eN6PYFiHToju2YKjMu2mDdG/88pgM03OoneTXOXgAnQBk
 RChDtQFXRFE5iO64sTW1gaAgy/KnTeWDj5ZU5zcj1EbV0kaLpxgAIo6NkGVk4+p97agU
 05ZvLx4HLPMZjhZDWy6nexqkl8HUYswFeC0Bmq9B73IKrdv6XhHVkKpF8TSgyOMSO10H
 pVxHr8ADaD2zmy3U5KSY6bv5Nuq2FpvsHfFTqlahWQp/S5mT/4stUI6aBQ8HBfmwJFMA
 yGZ4PaAZIPCVZ+zZpskfPiIMcE9VoOVReKPNnouw/DBgVylBTko5QnlRc2CQd6wNnTTv 9w== 
Received: from sg-mailsvcp-mta-lapp01.asia.apple.com
 (sg-mailsvcp-mta-lapp01.asia.apple.com [17.84.67.69])
 by ma1-aaemail-dr-lapp03.apple.com with ESMTP id 3hxaxuvjxj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 16 Aug 2022 00:30:13 -0700
Received: from sg-mailsvcp-mmp-lapp02.asia.apple.com
 (sg-mailsvcp-mmp-lapp02.asia.apple.com [17.84.71.202])
 by sg-mailsvcp-mta-lapp01.asia.apple.com
 (Oracle Communications Messaging Server 8.1.0.18.20220407 64bit (built Apr 7
 2022))
 with ESMTPS id <0RGP00XWR66BOX00@sg-mailsvcp-mta-lapp01.asia.apple.com>; Tue,
 16 Aug 2022 15:30:12 +0800 (+08)
Received: from process_milters-daemon.sg-mailsvcp-mmp-lapp02.asia.apple.com by
 sg-mailsvcp-mmp-lapp02.asia.apple.com
 (Oracle Communications Messaging Server 8.1.0.18.20220407 64bit (built Apr 7
 2022)) id <0RGP00N0060RHF00@sg-mailsvcp-mmp-lapp02.asia.apple.com>; Tue,
 16 Aug 2022 15:30:11 +0800 (+08)
X-Va-A: 
X-Va-T-CD: 52f47d0d3a734aeac067923cd2934936
X-Va-E-CD: a2066982c29c3a93c49ac808e2b7df0d
X-Va-R-CD: 4618f2fbb1637c7babb5c70608677672
X-Va-CD: 0
X-Va-ID: 069cf63d-aaa0-4466-8a02-a5953dc52aa2
X-V-A: 
X-V-T-CD: 52f47d0d3a734aeac067923cd2934936
X-V-E-CD: a2066982c29c3a93c49ac808e2b7df0d
X-V-R-CD: 4618f2fbb1637c7babb5c70608677672
X-V-CD: 0
X-V-ID: d7370bab-5838-4c3e-91a5-e97aaaa09440
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-08-16_06:2022-08-16,
 2022-08-16 signatures=0
Received: from smtpclient.apple (unknown [10.106.132.175])
 by sg-mailsvcp-mmp-lapp02.asia.apple.com
 (Oracle Communications Messaging Server 8.1.0.18.20220407 64bit (built Apr 7
 2022))
 with ESMTPSA id <0RGP00S2Y6679P00@sg-mailsvcp-mmp-lapp02.asia.apple.com>; Tue,
 16 Aug 2022 15:30:11 +0800 (+08)
From: Vee Khee Wong <veekhee@apple.com>
MIME-version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Message-id: <4C6D4699-3BC3-4F31-86E2-B5CD7410CC0A@apple.com>
Date: Tue, 16 Aug 2022 15:30:07 +0800
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-08-16_06:2022-08-16,
 2022-08-16 signatures=0
X-Mailman-Approved-At: Tue, 16 Aug 2022 08:40:33 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 tee.min.tan@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next 1/1] stmmac: intel: remove unused
	'has_crossts' flag
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


The 'has_crossts' flag was not used anywhere in the stmmac driver,
removing it from both header file and dwmac-intel driver.

Signed-off-by: Wong Vee Khee <veekhee@apple.com>
---
drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 -
include/linux/stmmac.h                            | 1 -
2 files changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 52f9ed8db9c9..1d96ca96009b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -610,7 +610,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
	plat->int_snapshot_num = AUX_SNAPSHOT1;
	plat->ext_snapshot_num = AUX_SNAPSHOT0;

-	plat->has_crossts = true;
	plat->crosststamp = intel_crosststamp;
	plat->int_snapshot_en = 0;

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 8df475db88c0..fb2e88614f5d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -257,7 +257,6 @@ struct plat_stmmacenet_data {
	u8 vlan_fail_q;
	unsigned int eee_usecs_rate;
	struct pci_dev *pdev;
-	bool has_crossts;
	int int_snapshot_num;
	int ext_snapshot_num;
	bool int_snapshot_en;
-- 
2.32.1 (Apple Git-133)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
