Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB6426896A
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Sep 2020 12:41:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AA36C424B0;
	Mon, 14 Sep 2020 10:41:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52C4CC3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Sep 2020 10:41:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08EAbPc3022532; Mon, 14 Sep 2020 12:40:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=RNnrii00xxDfy5WSC9QOrCt+UuQkxyoFKEqKcUhEXMo=;
 b=r7kBF8twwK8B4KodrM+9KMrXviMEyE9WvUl1bXEuXdMBe0Raslk5oZf7Swm0BNWm/xIN
 okknJS6Fm7BUfTSnCKo81w/DxB0F1E1Z6n+7yBGKRODuS8l7Fk47oYRN+OIQ58BDurtJ
 97wc6iMQ3kW3klJl+fjaa3TGZcMmzd8PZXUBAvgU6Fi5WFisqUCvWBpc6ht2NHbK6u9X
 05b/dB0KKDJbIlLgLSm2EfsPozpI7sAt5jpURWFpPIMY/fI7F2OERx67bFRQF/eKk9Eh
 z5Is652Ud1cs8LaJEa3frs5aRqexI8sazuLckE3Zlfzc44K7NFwF4bcin6EeE1Os70iL 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33gkt09ppe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Sep 2020 12:40:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A925B10002A;
 Mon, 14 Sep 2020 12:40:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 928E82ADA02;
 Mon, 14 Sep 2020 12:40:54 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 14 Sep 2020 12:40:54
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@st.com>
Date: Mon, 14 Sep 2020 12:40:32 +0200
Message-ID: <1600080034-2050-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-14_02:2020-09-10,
 2020-09-14 signatures=0
Cc: linux-kernel@vger.kernel.org, krzk@kernel.org, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] Avoid meaningless DMA error print & use
	dev_err_probe
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

This serie replaces the patch from Holger Assmann [i2c: stm32: remove
unnecessary DMA kernel error log] (1) and the first version of [i2c: stm32:
do not display error when DMA is not requested] from myself (2).

A first patch is fixing useless error print when not being able to get
DMA channel (DMA is only optional) and also avoid printing twice an error
when a real DMA error is happening.

On top of that, dev_err_probe from Krzysztof has been rebased.

[1] https://marc.info/?l=linux-i2c&m=159741480608578&w=2
[2] https://marc.info/?l=linux-i2c&m=159973040314193&w=2

Alain Volmat (1):
  i2c: stm32: fix error message on upon dma_request_chan & defer
    handling

Krzysztof Kozlowski (1):
  i2c: stm32: Simplify with dev_err_probe()

 drivers/i2c/busses/i2c-stm32.c   | 12 ++++++------
 drivers/i2c/busses/i2c-stm32f4.c |  6 ++----
 drivers/i2c/busses/i2c-stm32f7.c | 27 +++++++++++----------------
 3 files changed, 19 insertions(+), 26 deletions(-)

-- 
2.7.4
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
