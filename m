Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682C34A4BB
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 10:42:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 494B0C57B79;
	Fri, 26 Mar 2021 09:42:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20A99C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 09:42:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12Q8vTcD014270; Fri, 26 Mar 2021 10:42:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=ShKYrA7P3E0igvr61VeFGfLX7dh39Y23GnQBwv5C1to=;
 b=36fNdSB8EzAULjFddGjJRuHEwIBdg1KAai4QjhqS8ztSblu0JWCOA3clBsPPzPvjThaA
 9/M4r8HSDaxS3HtKYkq8DVkkfTBVXP/jaBicG2HslH088Vj6WvVUmSDSZt8KXuEcFJOG
 OQUXQHs2YyE3hAHB5HmOBp76e+dpV4E3jt1hmPjHzI1796dksyp+aDlmpSMGRoDe8ntA
 s9gHs5DVLxE76cwss+ZNLDcbsIvQIfIpC/L1gvB2e8IvCo6JU9XcqCyRDikkpTv8w2Ve
 vGywoOqhOQaRzLNxY4rwL6rtgbHAuWWZOIjwW70S7ykTJl7dIFH5jEx4x4+MVLDHaoEU qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37h138b7wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 10:42:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A975100038;
 Fri, 26 Mar 2021 10:42:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AA882463D6;
 Fri, 26 Mar 2021 10:42:28 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 10:42:28
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 26 Mar 2021 10:42:07 +0100
Message-ID: <20210326094209.29750-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_02:2021-03-26,
 2021-03-26 signatures=0
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 0/2] remoteproc: stm32: add support of
	detaching a remote processor
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

Update from V2:
Fix comment and changelog in patch 2/2.

This patchset is the stm32mp1 platform implementation of the detach operation
added in series [1].

On detach, the stm32 rproc driver sends a mailbox signal to the remote 
processor to inform it that it will be detached. 

Applied and tested on Bjorn's "for_next" branch (2b81aa17008e)

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=447171

Arnaud Pouliquen (2):
  dt-bindings: remoteproc: stm32-rproc: add new mailbox channel for
    detach
  remoteproc: stm32: add capability to detach

 .../bindings/remoteproc/st,stm32-rproc.yaml   | 11 +++++-
 drivers/remoteproc/stm32_rproc.c              | 39 ++++++++++++++++++-
 2 files changed, 46 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
