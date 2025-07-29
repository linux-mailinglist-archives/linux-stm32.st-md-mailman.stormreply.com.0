Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF44CB14F9E
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 16:55:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68307C35E3F;
	Tue, 29 Jul 2025 14:55:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BDACC35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 14:55:00 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TDqD6E023729;
 Tue, 29 Jul 2025 16:54:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 OiiqNbHmrqIpvUT8qdB7LVMaCcZtZqe0vh9TWwXn7ik=; b=Q3cY94cNSh8CMOm7
 QuRnG/P+O/K3AavxTYfDaZsdAXscdk2oKOGAbvFFBtiHtcCSdeQlpBzur0/I572t
 8/LUCp1WvGOYpA2Vb108E0bEpSMYLVUeMPBnB1e18vXLcKDD49k9SkhAHhQxDx/o
 BeDPiE0UM77YkqjocSP74JbYwTSUqBqwkZVqWXetoznMI7Mt9nCfJPZRCsKTJV10
 KWBSnLuo0RnO/74pN95pSIM7TfGNZ4hMn//XZBhJJaWy1ZzB9FpOWut9C8wwUJds
 b4uS6Mal2Q58P7i/cpq0kKC1DkoZZwCwHyyjnV9gY2HaQtjWymtWo2SmqzLjd2ir
 9U+haA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484memnux5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jul 2025 16:54:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6E4BE4004B;
 Tue, 29 Jul 2025 16:53:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 402B576373F;
 Tue, 29 Jul 2025 16:52:18 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 16:52:17 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Tue, 29 Jul 2025 16:52:00 +0200
MIME-Version: 1.0
Message-ID: <20250729-relative_flex_pps-v2-1-3e5f03525c45@foss.st.com>
References: <20250729-relative_flex_pps-v2-0-3e5f03525c45@foss.st.com>
In-Reply-To: <20250729-relative_flex_pps-v2-0-3e5f03525c45@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/2] drivers: net: stmmac: handle
 start time set in the past for flexible PPS
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

In case the time arguments used for flexible PPS signal generation are in
the past, consider the arguments to be a time offset relative to the MAC
system time.

This way, past time use case is handled and it avoids the tedious work
of passing an absolute time value for the flexible PPS signal generation
while not breaking existing scripts that may rely on this behavior.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 3767ba495e78d210b0529ee1754e5331f2dd0a47..5c712b33851081b5ae1dbf2a0988919ae647a9e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -10,6 +10,8 @@
 #include "stmmac.h"
 #include "stmmac_ptp.h"
 
+#define PTP_SAFE_TIME_OFFSET_NS	500000
+
 /**
  * stmmac_adjust_freq
  *
@@ -172,6 +174,10 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 
 	switch (rq->type) {
 	case PTP_CLK_REQ_PEROUT:
+		struct timespec64 curr_time;
+		u64 target_ns = 0;
+		u64 ns = 0;
+
 		/* Reject requests with unsupported flags */
 		if (rq->perout.flags)
 			return -EOPNOTSUPP;
@@ -180,6 +186,31 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 
 		cfg->start.tv_sec = rq->perout.start.sec;
 		cfg->start.tv_nsec = rq->perout.start.nsec;
+
+		/* A time set in the past won't trigger the start of the flexible PPS generation for
+		 * the GMAC5. For some reason it does for the GMAC4 but setting a time in the past
+		 * should be addressed anyway. Therefore, any value set it the past is considered as
+		 * an offset compared to the current MAC system time.
+		 * Be aware that an offset too low may not trigger flexible PPS generation
+		 * if time spent in this configuration makes the targeted time already outdated.
+		 * To address this, add a safe time offset.
+		 */
+		if (!cfg->start.tv_sec && cfg->start.tv_nsec < PTP_SAFE_TIME_OFFSET_NS)
+			cfg->start.tv_nsec += PTP_SAFE_TIME_OFFSET_NS;
+
+		target_ns = cfg->start.tv_nsec + ((u64)cfg->start.tv_sec * NSEC_PER_SEC);
+
+		stmmac_get_systime(priv, priv->ptpaddr, &ns);
+		if (ns > TIME64_MAX - PTP_SAFE_TIME_OFFSET_NS)
+			return -EINVAL;
+
+		curr_time = ns_to_timespec64(ns);
+		if (target_ns < ns + PTP_SAFE_TIME_OFFSET_NS) {
+			cfg->start = timespec64_add_safe(cfg->start, curr_time);
+			if (cfg->start.tv_sec == TIME64_MAX)
+				return -EINVAL;
+		}
+
 		cfg->period.tv_sec = rq->perout.period.sec;
 		cfg->period.tv_nsec = rq->perout.period.nsec;
 

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
