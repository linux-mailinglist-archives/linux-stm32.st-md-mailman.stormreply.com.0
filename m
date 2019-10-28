Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECFBE75D6
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Oct 2019 17:12:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4789BC36B0E;
	Mon, 28 Oct 2019 16:12:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BC8AC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2019 16:12:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9SFuCiJ007143; Mon, 28 Oct 2019 17:11:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ULIF3nGXJmIbXhgf4TYuqp1B8PHksrpUdhfUfjdzh7g=;
 b=YvEIq1+R8QzfF3ZFSdqiEMZX5FrHw2X+7+YPzgc9tTFY2FuXcwz3ozfzfA0wMqYfKNrT
 yDXuz+PuKy6P1IovkdYg/RMR8KR24EQGPic+HwDMidiEuLNnmEol7uu53+eZleYtC/9y
 pcTflqj3KFuQXrLiNU2jXzWQiOJ7dEh2SxnGSl4/1gnuax95aindMURTem4nW0jvgpP0
 XTn6uJNpbgoEUQne6XbNfLMqyMOMM0si86/10jNd+QaBSZ4nvSd4dV5JyleBOrgOZfd5
 2gDrAvgKwWZAPANlNpKDnLzywIcUuq8x+NiBIkGrMhTuyROVH6mNGjQ58owoSlGOwU5r 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vvbm0b68c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2019 17:11:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 00E0D100038;
 Mon, 28 Oct 2019 17:11:54 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E0C252B1E73;
 Mon, 28 Oct 2019 17:11:53 +0100 (CET)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 28 Oct
 2019 17:11:53 +0100
Received: from localhost (10.48.0.192) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Mon, 28 Oct 2019 17:11:53 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <jic23@kernel.org>, <robh+dt@kernel.org>
Date: Mon, 28 Oct 2019 17:11:46 +0100
Message-ID: <1572279108-25916-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-28_06:2019-10-28,2019-10-28 signatures=0
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lars@metafoo.de,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] iio: adc: stm32: add max clock rate
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

Add optional dt property to tune maximum desired analog clock rate.

Fabrice Gasnier (2):
  dt-bindings: iio: stm32-adc: add max clock rate property
  iio: adc: stm32: allow to tune analog clock

 .../devicetree/bindings/iio/adc/st,stm32-adc.txt         |  2 ++
 drivers/iio/adc/stm32-adc-core.c                         | 16 +++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
