Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C22DE4B94B
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 15:04:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DB36C593FE
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 13:04:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D5ACC593F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 13:04:25 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JCu4JD023632; Wed, 19 Jun 2019 15:03:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Snd2JSaEu7Z6XLdmFflA+YpQRWPbEmDirJH8rOIN+Hg=;
 b=gC2g+F4FLTf8VKpowhrkPjLvh3D1Z8GAwMlQcrwkCJqInZztHxLKi7EiFOGIcoW/A0cL
 8qsClG8aWxwyaxd89UcdM43p0QwEZiFKeuAqzkvXm/7AX7654e6Oi3VztmklY/ptDJ+Z
 ON680YGi/YAgsylciwmqJxfMhGQl+Zcujqu5qegb6YZNYEaJW9zSpAI00nCPkTc4WgVs
 JjSH9/rKKd4mn3knLbjuJfJPNAHl9H6OYJYKQstqcgim0+rMWdMXFBrGcDnYmfDH60dh
 yXu4eSrkGkzxLufxNpNl4FCKC1B1kzHH4X+XNHxz7QZivq5DI7HLCL+SwW583U7btRVG /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813c0a8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 15:03:57 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 639B631;
 Wed, 19 Jun 2019 13:03:57 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42B362831;
 Wed, 19 Jun 2019 13:03:57 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 19 Jun
 2019 15:03:57 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 19 Jun 2019 15:03:56
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <jic23@kernel.org>, <knaack.h@gmx.de>, <lars@metafoo.de>,
 <pmeerw@pmeerw.net>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <fabrice.gasnier@st.com>,
 <linux-iio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@st.com>, <olivier.moysan@st.com>
Date: Wed, 19 Jun 2019 15:03:48 +0200
Message-ID: <1560949431-22948-3-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560949431-22948-1-git-send-email-olivier.moysan@st.com>
References: <1560949431-22948-1-git-send-email-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_07:, , signatures=0
Subject: [Linux-stm32] [PATCH 2/5] iio: adc: stm32-dfsdm: fix data type
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

Fix the data type as DFSDM raw output is complements 2,
24bits left aligned in a 32-bit register.
This change does not affect AUDIO path
- Set data as signed for IIO (as for AUDIO)
- Set 8 bit right shift for IIO.
The 8 LSBs bits of data contains channel info and are masked.

Fixes: e2e6771c6462 ("IIO: ADC: add STM32 DFSDM sigma delta ADC support")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 drivers/iio/adc/stm32-dfsdm-adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index cb596f104919..6b90a40882f2 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -1365,11 +1365,11 @@ static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev,
 					BIT(IIO_CHAN_INFO_SAMP_FREQ);
 
 	if (adc->dev_data->type == DFSDM_AUDIO) {
-		ch->scan_type.sign = 's';
 		ch->ext_info = dfsdm_adc_audio_ext_info;
 	} else {
-		ch->scan_type.sign = 'u';
+		ch->scan_type.shift = 8;
 	}
+	ch->scan_type.sign = 's';
 	ch->scan_type.realbits = 24;
 	ch->scan_type.storagebits = 32;
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
