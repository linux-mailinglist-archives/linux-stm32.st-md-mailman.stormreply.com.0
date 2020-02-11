Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7634C159658
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2020 18:42:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1C68C36B0C;
	Tue, 11 Feb 2020 17:42:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75432C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 17:42:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01BHgTGV007804; Tue, 11 Feb 2020 18:42:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=RDDGxzn9ujSpMGf3xyClXU8q9LiJT2dp9a7bhWHwHaE=;
 b=WOnWH8557Fafslre+IfU0FrL6wbdVb1sKjSWV37mfbkF9SY2IINGpl5FcdrcLcGNyzHN
 SIaQe+OlGU6/SC96BtMmz75WZVCqG58cuFcNrnCh8CSwAh4ae8UrEzeR4+4oveGp80V4
 SaMQK2g5sEi/1ShRtcwsBjPpas5AzmR9QwPe8alPjQfyztB+2rtPQJnkT76u2yIKoTk2
 /61HchnUFmPsTW9e42jsk+Oq9mKWhUFuRCgvM557mzvjkR9WK57WdHQFxpsyqjTjLhHN
 Dq8I+ZyUOcredGxtC0NkWFQbQvbvLF00qFSbohBBK646ZwRB7n8olJjDeBeEejmapCip Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufh7phr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 18:42:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1AAB10005C;
 Tue, 11 Feb 2020 18:42:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6E1E2C8E8C;
 Tue, 11 Feb 2020 18:42:22 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Feb 2020 18:42:22
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>
Date: Tue, 11 Feb 2020 18:42:02 +0100
Message-ID: <20200211174205.22247-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_05:2020-02-10,
 2020-02-11 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 Fabien DESSENNE <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 0/3] add support for co-processor loaded
	and booted before kernel
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

This series introduce the support of a preloaded firmware. In this case
the load of the firmware is skipped. It is platform driver responsibility
to implement the right firmware load ops according to HW specificities.

V4[1] to V5 update:
  - add stm32 platform implementation  

[1]. https://patchwork.kernel.org/patch/11265869/

Arnaud Pouliquen (1):
  dt-bindings: remoteproc: stm32: add syscon bindings preloaded fw
    support

Fabien Dessenne (1):
  remoteproc: stm32: add support for co-processor booted before kernel

Loic Pallardy (1):
  remoteproc: add support for co-processor loaded and booted before
    kernel

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  21 ++
 drivers/remoteproc/remoteproc_core.c          |  67 ++++--
 drivers/remoteproc/stm32_rproc.c              | 205 ++++++++++++++++--
 include/linux/remoteproc.h                    |   2 +
 4 files changed, 267 insertions(+), 28 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
