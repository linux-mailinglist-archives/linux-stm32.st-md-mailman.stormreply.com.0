Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD1086DF2B
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Mar 2024 11:26:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08A46C6B46B;
	Fri,  1 Mar 2024 10:26:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79D2BC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Mar 2024 10:26:21 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4219345a021497; Fri, 1 Mar 2024 11:26:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=vp6qVxJ
 487N75yXFKor9ARqDlZLKEE+aQ/uMZChldUI=; b=zZNq4TqUD3suEztwQFse5rO
 dyMvyXT4S5CPRCUwHnw3aAybLz3LdveJbu0AKfZWtLnXGWmga6A5CVXjExA7zFZ7
 IIa9bLZahnWkwoFABBsEwmAH3Nm88Z1+b4tq4OABLc+M+fjSjwEmF4xYX6s/gCqj
 hm9BP/vOs7/xAADaRPBdfOqa6IzguLHLgptQbqg6Vqr8PmgJg/hd3Ho/P1g4suMm
 lMJQvy1n3troKACRd2vGqEuFspPnICLiSskCJpzmYuz8PbXEt+vmSwjheFST9CXU
 LmRsOutuRpxsa6Xlbe0W0LQ9/z4do0NQW35d9R1gHnkN55MiPmeqMPQIWg61/rw=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3whf4bqdtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Mar 2024 11:26:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 80BE640046;
 Fri,  1 Mar 2024 11:26:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A80AA244B60;
 Fri,  1 Mar 2024 11:25:31 +0100 (CET)
Received: from localhost (10.201.22.191) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Mar
 2024 11:25:30 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <william.gray@linaro.org>
Date: Fri, 1 Mar 2024 11:25:05 +0100
Message-ID: <20240301102505.591918-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.191]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_08,2024-03-01_01,2023-05-22_02
Cc: vigneshr@ti.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jpanis@baylibre.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5] counter: Introduce the
	COUNTER_COMP_FREQUENCY() macro
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

Now that there are two users for the "frequency" extension, introduce a
new COUNTER_COMP_FREQUENCY() macro.
This extension is intended to be a read-only signal attribute.

Suggested-by: William Breathitt Gray <william.gray@linaro.org>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v5
- "frequency" extension is read-only, so there's no need to provide
  a write parameter.
- patch sent separately from "counter: Add stm32 timer events support" [1]
[1] https://lore.kernel.org/lkml/20240227173803.53906-2-fabrice.gasnier@foss.st.com/
---
 include/linux/counter.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/counter.h b/include/linux/counter.h
index 702e9108bbb4..0ac36f815b7d 100644
--- a/include/linux/counter.h
+++ b/include/linux/counter.h
@@ -602,6 +602,13 @@ struct counter_array {
 #define COUNTER_COMP_FLOOR(_read, _write) \
 	COUNTER_COMP_COUNT_U64("floor", _read, _write)
 
+#define COUNTER_COMP_FREQUENCY(_read) \
+{ \
+	.type = COUNTER_COMP_U64, \
+	.name = "frequency", \
+	.signal_u64_read = (_read), \
+}
+
 #define COUNTER_COMP_POLARITY(_read, _write, _available) \
 { \
 	.type = COUNTER_COMP_SIGNAL_POLARITY, \
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
