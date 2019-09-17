Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6082AB4DEE
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Sep 2019 14:39:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6132DC35E04;
	Tue, 17 Sep 2019 12:39:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2D2CC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 12:39:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8HCVred000451; Tue, 17 Sep 2019 14:38:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=cOyzcoGBpVBGscxdizJshAfCpisInpaxvUv0kh4n7UA=;
 b=hs8Q69x5uVUWDQzS2+p3YDWMe3MHcsv37AZeQ3/0xoguP34cw7Za/Do82lGa69wlPong
 X8Spmagds8nN6KBS31/XpP1tvHJK6x+gGpB3fOtQw20MFfwiJloVOZrxG5ykp4NoOfS8
 /le8tsuXyZhJXCptBSWxeYMui10Wgpufzu9EtEdqlXDLFrxGt9Gyi0GrgqVisvDIxsOS
 jtm71AHG6V1jp3snHSjYWxyg19leJI/8yKsbnPNBIifPWYmNdwYMOfQGdbMQA9gQmAs4
 RoD5bv5Rqg0HESvBG5rafAEhSb35U+wgxG6Y4Y0VkB5xcIUNb+hAiEmVpbrGITiJ+smP lA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v0nb9hpgw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 17 Sep 2019 14:38:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5491C23;
 Tue, 17 Sep 2019 12:38:34 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1C7C2BDA7E;
 Tue, 17 Sep 2019 14:38:33 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 17 Sep
 2019 14:38:33 +0200
Received: from localhost (10.48.1.232) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 17 Sep 2019 14:38:33 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <jic23@kernel.org>
Date: Tue, 17 Sep 2019 14:38:14 +0200
Message-ID: <1568723896-19063-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.1.232]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-17_06:2019-09-17,2019-09-17 signatures=0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, pmeerw@pmeerw.net,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] iio: stm32-adc: fix a race with dma
	and irq
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

This series fixes a race condition observed when using several ADCs with DMA
and irq.
There's a precusor patch to the fix. It keeps registers definitions as a whole
block, to ease readability and allow simple (readl) access path to EOC bits in
stm32-adc-core driver.

---
Changes in v2:
- Add a precursor patch to follow Jonathan's comment on readability

Fabrice Gasnier (2):
  iio: adc: stm32-adc: move registers definitions
  iio: adc: stm32-adc: fix a race when using several adcs with dma and
    irq

 drivers/iio/adc/stm32-adc-core.c |  70 +++++++++++---------
 drivers/iio/adc/stm32-adc-core.h | 137 +++++++++++++++++++++++++++++++++++++++
 drivers/iio/adc/stm32-adc.c      | 109 -------------------------------
 3 files changed, 177 insertions(+), 139 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
