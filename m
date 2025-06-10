Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78366AD3741
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 14:51:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DBC5C32EA8;
	Tue, 10 Jun 2025 12:51:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF50FC35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 12:50:58 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLEvP010672;
 Tue, 10 Jun 2025 14:50:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 38uKaBZ1vK3ex/cxNpuaM1uYPLDT4KoCoxyuRnJRdDA=; b=nXXf3lSNgwNMuH0w
 nLld5c69c3mbSsvSbMYpSr42Q0WOosrYVX2cBFPK+9fNUY7bqH2s5nbKaLGfnpsq
 yQJvaD1XSRQyCcInzk6t1/gGxCA5L+xbmRUgUehSn0PoyZfSQEgQPfsZdc9BYR1w
 sZHny1f9rEOGGo3t4OALBMdib07MJw0j6ocvjuu3pqFigmU+Wrdc/B149jnaDuSC
 36d6MvJvLn+yEwmggN7jvHWOgGW7oZLo/T7+MmFYs+r7yEAUyXj/RRN5h64hNJc/
 ozp1IrariQlH2mUCiOtW+SM/fm3RN3s2bL3bfrk0buJirWnrPd00DOCC5Y2lbVlm
 qQzlMw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y052j0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 14:50:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0712A40045;
 Tue, 10 Jun 2025 14:49:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F90DB4BF99;
 Tue, 10 Jun 2025 14:49:01 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:49:00 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy Shevchenko
 <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Gatien Chevallier
 <gatien.chevallier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, Lee
 Jones <lee@kernel.org>, <linux-iio@vger.kernel.org>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>
Date: Tue, 10 Jun 2025 14:48:53 +0200
Message-ID: <20250610124855.269158-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610124855.269158-1-antonio.borneo@foss.st.com>
References: <20250610124855.269158-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/5] iio: trigger: stm32-timer: Fix build
	warnings about export.h
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

After commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") and commit 7d95680d64ac ("scripts/misc-check:
check unnecessary #include <linux/export.h> when W=1") we get the build
warning with W=1:

drivers/iio/trigger/stm32-timer-trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Fix it.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/iio/trigger/stm32-timer-trigger.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 925b864facca1..3b9a3a6cbb25c 100644
--- a/drivers/iio/trigger/stm32-timer-trigger.c
+++ b/drivers/iio/trigger/stm32-timer-trigger.c
@@ -6,6 +6,7 @@
  *
  */
 
+#include <linux/export.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 #include <linux/iio/timer/stm32-timer-trigger.h>
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
