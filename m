Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EDE36414F
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Apr 2021 14:16:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CD3DC57196;
	Mon, 19 Apr 2021 12:16:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F59CC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 12:15:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13JCFEHJ009811; Mon, 19 Apr 2021 14:15:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=zKHnDC/t1gVZr01XZJKPAzPKhFgNwrDSSFbSp/Msn3c=;
 b=gODYIx5bRMwti3ZpTHRBbyWwr1OpnzJgr6iCiwwpX+L9r/NPOqOceNA3CObWoZQUiY/e
 eaz/j6Isvt2xBkwU7ycLBKHde7tK/0XeTuQNwMOsSBT8kMtBnqPU8URwRstpwT6Dec4b
 /QkUzLK9wPCfgptkQbqpSgD9Kldayba4GMUcJfTezI/5yZh8EMACtcpwGfba4znji707
 +oUqyZy2+EGur7jcL47p6acbebKSO8Ugcq2H+tjUymW7etrelRyS9BkZi2fmEXiELXXt
 Urus13k+Klt4DpT7kkblaW77MsnD9IK2yIbRdOuLL84MteBpSul+vdfi2znCqAZZAD3m Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 380rdgc933-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 14:15:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1900E10002A;
 Mon, 19 Apr 2021 14:15:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 054F82139BC;
 Mon, 19 Apr 2021 14:15:43 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr 2021 14:15:42
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Mon, 19 Apr 2021 14:15:38 +0200
Message-ID: <20210419121541.11617-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_10:2021-04-16,
 2021-04-19 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3]  spi: stm32-qspi: Fix and update
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Christophe Kerello (1):
  spi: stm32-qspi: fix pm_runtime usage_count counter

Patrice Chotard (2):
  spi: stm32-qspi: Trigger DMA only if more than 4 bytes to transfer
  spi: stm32-qspi: Add dirmap support

 drivers/spi/spi-stm32-qspi.c | 106 +++++++++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 22 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
