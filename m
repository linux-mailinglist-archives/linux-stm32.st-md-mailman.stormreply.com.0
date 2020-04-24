Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 432E51B7350
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 13:41:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0AD0C36B0B;
	Fri, 24 Apr 2020 11:41:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0157C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 11:41:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OBWhDp023182; Fri, 24 Apr 2020 13:41:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=48ijLv0H8aPna6VpnvuqVOGM5Dz2rM04kkZgD9MA9eE=;
 b=Es8C1862D8FqWo05sEOjdJfrZx2FT/J+PwwAg+M0K/cS4OlJmwyTpgq9bfrxqVlgXYbJ
 nbWRakh3o8x4jlwSeS4fVYqVs2VlcsBK7F3Mq1cX8TTF5AW8AQa+kosfClU56KGad1l/
 0OO1kRPI8GP5ap1G+lKH6UIhRPtSZ+BUb6L1nQU6ooLF8yVVZcLf6qetCgjmesTMtzh/
 rhyTj9i0zGv0p9dvY7D7PacBj0BDhyxRaNhrSQU5teiMSf15EkxwCrm4F3CORLnCnkiL
 fin6EzodcbFKmO5Lo4pHiV4uc0GTZmd6qU0bBVIGhvvdWD4X1gjbCPoG9Cco0G9oTbA1 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp9bchc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 13:41:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25802100034;
 Fri, 24 Apr 2020 13:41:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1156C2B3DA0;
 Fri, 24 Apr 2020 13:41:02 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Apr 2020 13:41:01
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <rjw@rjwysocki.net>, <viresh.kumar@linaro.org>, <hugues.fruchet@st.com>,
 <mchehab@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <pavel@ucw.cz>, <len.brown@intel.com>
Date: Fri, 24 Apr 2020 13:40:55 +0200
Message-ID: <20200424114058.21199-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_04:2020-04-23,
 2020-04-24 signatures=0
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [RFC 0/3] Introduce cpufreq minimum load QoS
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

When start streaming from the sensor the CPU load could remain very low 
because almost all the capture pipeline is done in hardware (i.e. without 
using the CPU) and let believe to cpufreq governor that it could use lower 
frequencies. If the governor decides to use a too low frequency that 
becomes a problem when we need to acknowledge the interrupt during the 
blanking time.
The delay to ack the interrupt and perform all the other actions before
the next frame is very short and doesn't allow to the cpufreq governor to
provide the required burst of power. That led to drop the half of the frames.

To avoid this problem, DCMI driver informs the cpufreq governors by adding
a cpufreq minimum load QoS resquest.

Benjamin Gaignard (3):
  PM: QoS: Introduce cpufreq minimum load QoS
  cpufreq: governor: Use minimum load QoS
  media: stm32-dcmi: Inform cpufreq governors about cpu load needs

 drivers/cpufreq/cpufreq_governor.c        |   5 +
 drivers/media/platform/stm32/stm32-dcmi.c |   8 ++
 include/linux/pm_qos.h                    |  12 ++
 kernel/power/qos.c                        | 213 ++++++++++++++++++++++++++++++
 4 files changed, 238 insertions(+)

-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
