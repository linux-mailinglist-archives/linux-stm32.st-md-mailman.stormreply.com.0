Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7758491F22
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2019 10:41:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13C89C35E02;
	Mon, 19 Aug 2019 08:41:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 401DFC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2019 08:41:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7J8f3E8017060; Mon, 19 Aug 2019 10:41:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=M1zfSStNLc5tpPt8ZHooe06PUzWeCcjJwKms6B9R8lc=;
 b=fvM3T4xtjaNHlumQbADEiuIRvVQmGIC5kZZ4sq8f/0IJKY/CNWrUZ5hfjCJq/gfOeNzx
 78vpiuYBshtLqLIjLNK/bvqKU0OhRrGOwRcxBpHYHos5ZAVpD6M2UC41PFcAUSbSIBCS
 CzVOqZL0KqnwuvmfjQh0ABfET1epgqXy6eElMrEg8OsGxM0gPdNqDHlZi7ju3MaD2gdZ
 vkiAo6ABzchbzmvl6XI1UGo2Wj+xT/Ntia9y/lEa3ISxHWDZCDkKsg1C8wiDiv+vUJkS
 1/bxv+04gIv3/IQ8MjmV9xBjgVbOZSLphYevPIIehyXxcspoZ8k6ZeanqZcAUIrq29I7 LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2ue6q8j4m4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 19 Aug 2019 10:41:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BAEFA34;
 Mon, 19 Aug 2019 08:41:27 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE9012BF4F2;
 Mon, 19 Aug 2019 10:41:27 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 19 Aug
 2019 10:41:27 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 19 Aug 2019 10:41:26
 +0200
From: Hugues Fruchet <hugues.fruchet@st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus
 <sakari.ailus@linux.intel.com>
Date: Mon, 19 Aug 2019 10:41:19 +0200
Message-ID: <1566204081-19051-3-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566204081-19051-1-git-send-email-hugues.fruchet@st.com>
References: <1566204081-19051-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_02:, , signatures=0
Cc: Mickael GUENE <mickael.guene@st.com>, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 2/4] media: stm32-dcmi: trace the supported
	fourcc/mbus_code
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

Add a trace of the set of supported fourcc/mbus_code which
intersect between DCMI and source sub-device.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index b462f71..db01210 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1447,12 +1447,21 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
 			/* Code supported, have we got this fourcc yet? */
 			for (j = 0; j < num_fmts; j++)
 				if (sd_fmts[j]->fourcc ==
-						dcmi_formats[i].fourcc)
+						dcmi_formats[i].fourcc) {
 					/* Already available */
+					dev_dbg(dcmi->dev, "Skipping fourcc/code: %4.4s/0x%x\n",
+						(char *)&sd_fmts[j]->fourcc,
+						mbus_code.code);
 					break;
-			if (j == num_fmts)
+				}
+			if (j == num_fmts) {
 				/* New */
 				sd_fmts[num_fmts++] = dcmi_formats + i;
+				dev_dbg(dcmi->dev,
+					"Supported fourcc/code: %4.4s/0x%x\n",
+					(char *)&sd_fmts[num_fmts - 1]->fourcc,
+					sd_fmts[num_fmts - 1]->mbus_code);
+			}
 		}
 		mbus_code.index++;
 	}
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
