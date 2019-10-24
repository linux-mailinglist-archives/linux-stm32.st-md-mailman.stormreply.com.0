Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F2EE36DB
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2019 17:41:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59E90C36B0B;
	Thu, 24 Oct 2019 15:41:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67176C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2019 15:41:29 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9OFeiOc016236; Thu, 24 Oct 2019 17:41:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=LV706jSi2f+46Tg4TfZ6VFseIWlovRjlpB2QmvImJLM=;
 b=Lvr6UMzPZIbaUCdsuXyTfwXFrY9t3F2VK2AkIkERTLYyOwsPzXtIf4Aa3yFAUcVqaEMI
 DuQHh9FaNMTMLbvKd0MAMXA7LgyvBZexsQ75zcv7eWNF8V5ttSevNh5X+oq34RzKtxpJ
 ytA4YhXmydgdIzo+ikwYb/wuhgZF0c6JCxJIaP4QMPWQWRfOWduET4d1ciKMGhn26+As
 BxIqlqS3OFq9mdsWMSoPi7RDEBZFQdu+AZA2IB205jUdxIT/8gLeFQFWwMT3F8GqF2XP
 lgSwocuJioc0Lfn9mlmFJhw7eH+as/+0HyjqU6wQ9LKE0XLGYn//gsqggJnuosuLtwVM gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s1tp5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 17:41:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 177D0100038;
 Thu, 24 Oct 2019 17:41:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0BDFA2C6E5F;
 Thu, 24 Oct 2019 17:41:25 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Thu, 24 Oct 2019 17:41:24 +0200
From: Pascal Paillet <p.paillet@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 24 Oct 2019 17:41:20 +0200
Message-ID: <20191024154121.8503-1-p.paillet@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-24_09:2019-10-23,2019-10-24 signatures=0
Cc: p.paillet@st.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/1] Enable stm32_pwr regulator driver for
	stm32mp157
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

Enable the STM32 PWR regulator driver for stm32mp157 machine.

Pascal Paillet (1):
  regulator: stm32_pwr: Enable driver for stm32mp157

 drivers/regulator/Kconfig | 1 +
 1 file changed, 1 insertion(+)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
