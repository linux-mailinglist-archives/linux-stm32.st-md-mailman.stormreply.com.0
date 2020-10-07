Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A19F286234
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Oct 2020 17:35:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C06E0C32EA7;
	Wed,  7 Oct 2020 15:35:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99BF9C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 15:35:35 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097FWDIn023606; Wed, 7 Oct 2020 17:35:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=LPmTNBs4XJT9cCBJcxCmDFKkYPrNIrwRIBlSBsDz2R0=;
 b=lm1iWgIpw3IRxl+qksHroByVOItjRbOuuvxvijzveW7+Y9ICpeptdf6WIc5pIZiTqKAp
 jpWvLuQrdzZx4Fd7EJm3glQXfQnoBVYovukBy4jRmLDNCMyeOprguLv8mXyUM+vKE/+J
 mco1YAzJVY4FPvUGYMhspQW42Cua6au0cmdKHeciHHmcQOSulhJaC/uhZQCMf95m8RX2
 K6p6JN7wGf4Gx9lXCmjeK5FKt59HOP/M74padGli3II1RjJELU4s0f8837tiRtY4K32I
 hNyUq67nTSegexag0oatupc6Cjf0biUnc6b7DZiQPuwGOICW+6puyb5o4vieBaP4dXac xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tjwfh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 17:35:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7628D10002A;
 Wed,  7 Oct 2020 17:35:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 690F82B8A27;
 Wed,  7 Oct 2020 17:35:15 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 17:35:15
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Wed, 7 Oct 2020 17:34:59 +0200
Message-ID: <20201007153459.22155-3-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201007153459.22155-1-olivier.moysan@st.com>
References: <20201007153459.22155-1-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_09:2020-10-06,
 2020-10-07 signatures=0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] ASoC: stm32: dfsdm: add actual resolution
	trace
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

Add a trace to report actual resolution of audio samples.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 drivers/iio/adc/stm32-dfsdm-adc.c | 4 ++++
 drivers/iio/adc/stm32-dfsdm.h     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 5e10fb4f3704..b7e9ef1a6eec 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -293,6 +293,7 @@ static int stm32_dfsdm_compute_osrs(struct stm32_dfsdm_filter *fl,
 					max >>= flo->rshift;
 				}
 				flo->max = (s32)max;
+				flo->bits = bits;
 
 				pr_debug("%s: fast %d, fosr %d, iosr %d, res 0x%llx/%d bits, rshift %d, lshift %d\n",
 					 __func__, fast, flo->fosr, flo->iosr,
@@ -476,6 +477,9 @@ static int stm32_dfsdm_channels_configure(struct iio_dev *indio_dev,
 	if (!flo->res)
 		return -EINVAL;
 
+	dev_dbg(&indio_dev->dev, "Samples actual resolution: %d bits",
+		min(flo->bits, (u32)DFSDM_DATA_RES - 1));
+
 	for_each_set_bit(bit, &adc->smask,
 			 sizeof(adc->smask) * BITS_PER_BYTE) {
 		chan = indio_dev->channels + bit;
diff --git a/drivers/iio/adc/stm32-dfsdm.h b/drivers/iio/adc/stm32-dfsdm.h
index 5dbdae4ed881..4afc1f528b78 100644
--- a/drivers/iio/adc/stm32-dfsdm.h
+++ b/drivers/iio/adc/stm32-dfsdm.h
@@ -249,6 +249,7 @@ enum stm32_dfsdm_sinc_order {
  * @rshift: output sample right shift (hardware shift)
  * @lshift: output sample left shift (software shift)
  * @res: output sample resolution
+ * @bits: output sample resolution in bits
  * @max: output sample maximum positive value
  */
 struct stm32_dfsdm_filter_osr {
@@ -257,6 +258,7 @@ struct stm32_dfsdm_filter_osr {
 	unsigned int rshift;
 	unsigned int lshift;
 	u64 res;
+	u32 bits;
 	s32 max;
 };
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
