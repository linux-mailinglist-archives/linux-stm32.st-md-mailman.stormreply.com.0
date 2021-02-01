Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 174F730A4C6
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Feb 2021 11:00:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC8AAC57198;
	Mon,  1 Feb 2021 10:00:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C36CDC57184
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Feb 2021 10:00:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1119aefV027350; Mon, 1 Feb 2021 11:00:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=N4vMR5Z35V9XSwzyek947QkwbVqglusfZ07NaE7/aOo=;
 b=rEI/k/LcwY/SMN4r1UtpDtUXL51LdfsVUVc9FMnf5V2W8wvXhQLOmCA7IHrK1nvhcb25
 Lwk1dTQ859Z4Exl4dD/jje6ItKtfNXjDCXA3whYjgD4eDE4ueNhu8cV3W8HHl9Y6QTi+
 FIFtP3NLA3Lwbm88derdWi9JvEugPnX6I/nMlMHrT2/2hzUiUMY6VhlEdvzaEekC/PnI
 4HSAtVVzj0UIg1XqOGVJJ1CwKsjTD0Hs/PN6uWUTDhEwGY6Q9PcqmV4OMymPynvF2mru
 gwb5URfx1j/VHgbg543Wrq2Szpk+qQTYZWHQtoEX8jt4QHE0GZTyvz0P/GW2kMj/YeLX TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36e7x0j9y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Feb 2021 11:00:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D18010002A;
 Mon,  1 Feb 2021 11:00:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1024422D602;
 Mon,  1 Feb 2021 11:00:27 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 1 Feb 2021 11:00:26
 +0100
From: <patrice.chotard@foss.st.com>
To: <linux-kernel@vger.kernel.org>
Date: Mon, 1 Feb 2021 11:00:20 +0100
Message-ID: <20210201100023.10985-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-01_04:2021-01-29,
 2021-02-01 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/3] MAINTAINERS: update STMicroelectronics
	email
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

This series:
  _ Update st.com to foss.st.com email for some maintainers.
  _ Remove Vincent Abriou as STI/STM DRM driver
  _ Add Alain Volmat as I2C/SMBUS driver maintainer

Patrice Chotard (3):
  MAINTAINERS: Update some st.com email addresses to foss.st.com
  MAINTAINERS: Remove Vincent Abriou for STM/STI DRM drivers.
  MAINTAINERS: Add Alain Volmat as STM32 I2C/SMBUS maintainer

 MAINTAINERS | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
