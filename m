Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD6D39D4F5
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jun 2021 08:32:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB22AC58D7B;
	Mon,  7 Jun 2021 06:32:50 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52289C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jun 2021 06:32:46 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fz3MZ0y6mz1BJhT;
 Mon,  7 Jun 2021 14:27:54 +0800 (CST)
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 14:32:43 +0800
Received: from huawei.com (10.90.53.225) by dggema755-chm.china.huawei.com
 (10.1.198.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 7 Jun
 2021 14:32:42 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <vkoul@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <pierre-yves.mordret@st.com>
Date: Mon, 7 Jun 2021 14:46:37 +0800
Message-ID: <20210607064640.121394-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema755-chm.china.huawei.com (10.1.198.197)
X-CFilter-Loop: Reflected
Cc: dmaengine@vger.kernel.org, amelie.delaunay@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH -next 0/3] Fix PM usage counter imblance and
	clear code
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

The first two patches fix PM disable depth imbalance and
the last clear pm_runtime_get_sync calls.

Zhang Qilong (3):
  dmaengine: stm32-dma: Fix PM usage counter imbalance in stm32 dma ops
  dmaengine: stm32-dmamux: Fix PM usage counter unbalance in stm32
    dmamux ops
  dmaengine: tegra210-adma: Using pm_runtime_resume_and_get to replace
    open coding

 drivers/dma/stm32-dma.c     | 4 ++--
 drivers/dma/stm32-dmamux.c  | 6 +++---
 drivers/dma/tegra210-adma.c | 7 ++-----
 3 files changed, 7 insertions(+), 10 deletions(-)

-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
