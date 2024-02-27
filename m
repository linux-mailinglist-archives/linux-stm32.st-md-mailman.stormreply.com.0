Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 582F1869DE9
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 18:39:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20BF3C6C855;
	Tue, 27 Feb 2024 17:39:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10BBBC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 17:39:21 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41RBi2OZ029666; Tue, 27 Feb 2024 18:38:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=vJldcTa3fZJ+W5cK/vrvMKnfUz/AWmcz3zq1p3k7gUo=; b=mz
 R1Ciu59N9MZiKesA/ud4/Se2eEr5pMXEDx0BlligdUEfBmzk/4iCTGDoizS7DH9p
 mCBIf/JE5Lgehp0dk9RZipzw1sz7OeEcNaQ0nASrWGq6CkKjketjfgcB1B9mNBIR
 H7e5e3DqXJrdd3nl2yvcHV8onYnvd0jj2b8AM74C/tTUWlHF3DumoBXW7NZ47+Ij
 lGvEkMnt8XYPzfnDLZGJDD69OkRAWaRjTAtgbnxcQrJM2Yarvdqz2/mDUwPP5WPr
 BodgS9CSum/YTOoozS4eKiAXfg26I5tj5JJNxC9oHxwMrSpumIb1JNbLc3Zg5j2q
 RPUkioxPVvDOR+JDca9Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3whf4b9d71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 18:38:48 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6C0E040046;
 Tue, 27 Feb 2024 18:38:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00D762AD12A;
 Tue, 27 Feb 2024 18:38:17 +0100 (CET)
Received: from localhost (10.252.26.109) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 27 Feb
 2024 18:38:16 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <william.gray@linaro.org>
Date: Tue, 27 Feb 2024 18:37:53 +0100
Message-ID: <20240227173803.53906-2-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227173803.53906-1-fabrice.gasnier@foss.st.com>
References: <20240227173803.53906-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.26.109]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_03,2024-02-27_01,2023-05-22_02
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 01/11] counter: Introduce the
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

Suggested-by: William Breathitt Gray <william.gray@linaro.org>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 include/linux/counter.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/counter.h b/include/linux/counter.h
index 702e9108bbb4..03472d7407de 100644
--- a/include/linux/counter.h
+++ b/include/linux/counter.h
@@ -602,6 +602,9 @@ struct counter_array {
 #define COUNTER_COMP_FLOOR(_read, _write) \
 	COUNTER_COMP_COUNT_U64("floor", _read, _write)
 
+#define COUNTER_COMP_FREQUENCY(_read, _write) \
+	COUNTER_COMP_SIGNAL_U64("frequency", _read, _write)
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
