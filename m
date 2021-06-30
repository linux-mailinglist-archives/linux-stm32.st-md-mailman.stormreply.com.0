Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F1A3B84C9
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 16:13:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2E7AC56630;
	Wed, 30 Jun 2021 14:13:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2194FC424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 14:13:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UECm2J019682; Wed, 30 Jun 2021 16:12:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=IFFSjjhuK7hpbYhX8q4QMoe7AicReb+FwH97hXJauXY=;
 b=5q9nIbf7K4NP9X0nPNTUy8gm9GojwkOIMUSoH4buiTX3zc9a/8zbS8z/NjQca4TnRme+
 Ox8H5LW+L4z9+p/gCuKotG7vcQJpc47kspPvDjQ1KjrLCVlouFQzgIp/zPQBd2QEB3V4
 +vBMiVVHaN+dD6B2on/LSEDuEQISD1w0cpILzBU2vLiP9kryF6LT5Uhzm0FZblfkNS+J
 Yf8WqZE/jdXgXXhWvArbnesp8rwmTY4FiPrzgY4xHOA6rOfyJNezwR1d4JNMFwIMbx5W
 0U3A5KjNNWkun1Ye7fUMILYw+rBe+sFzz+5mdUqPx8w6/FDUINvosySikfHGfkP78gBU pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39gnbpjpf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 16:12:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B637010003A;
 Wed, 30 Jun 2021 16:12:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A30DB23151C;
 Wed, 30 Jun 2021 16:12:56 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Jun 2021 16:12:56
 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
Date: Wed, 30 Jun 2021 16:11:40 +0200
Message-ID: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_06:2021-06-29,
 2021-06-30 signatures=0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] i2c: stm32f7: several fixes in error cases
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

This serie provides several fixes needed for cases when communication
when a device is not behaving properly.

Alain Volmat (3):
  i2c: stm32f7: recover the bus on access timeout
  i2c: stm32f7: flush TX FIFO upon transfer errors
  i2c: stm32f7: prevent calling slave handling if no slave running

 drivers/i2c/busses/i2c-stm32f7.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
