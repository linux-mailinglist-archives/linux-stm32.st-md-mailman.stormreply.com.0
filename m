Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA9B46B53E
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 09:09:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55AA2C60466;
	Tue,  7 Dec 2021 08:09:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D206C60461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 08:09:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B749etT019774;
 Tue, 7 Dec 2021 09:08:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=1iFAiZpj3lcqsYiUsA/qSLmnf8mKGkPBOz81mbNrNmI=;
 b=hessX9aaSNEpvixfK1yGxrYrXtzHeOAf2A5Fz/5NlyjodnwoA0fbNCAyJOcYju45b//q
 TQswnHvn7Kbi+Z20p1vTmnsggydaG+o5eSQRB7bgAmt0hut9PqkhjVeYI1iY9ebwhWEs
 mR219JcKgN9TZ4We4OeZj42/Y9ggNnbUNR0SWao32vFkM6XCgUJn/zhoadWn01J9Y7sg
 x7Lp7FIYKQ+coN8awDNcVKN9sdfZtrT5NAuN30U2SETIB0uadVb6PR95JdDaYVocvmIa
 MXC0EoeUb/t0leiSXwS3xtqA/3e/7M/CW7PFKF7KttkUVGLAxelYT50CS3gyBQwoEQkM BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3csp32bc9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:08:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 033D8100038;
 Tue,  7 Dec 2021 09:08:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F13862220B0;
 Tue,  7 Dec 2021 09:08:56 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 7 Dec 2021 09:08:56
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Tue, 7 Dec 2021 09:08:35 +0100
Message-ID: <20211207080843.21222-6-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
References: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
Cc: julien.massot@iot.bzh, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 arnaud.pouliquen@foss.st.com, linux-riscv@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 05/13] RISC-V: configs: Configs that had
	RPMSG_CHAR now get RPMSG_CTRL
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

In the patch "rpmsg: Move the rpmsg control device from rpmsg_char
to rpmsg_ctrl", we split the rpmsg_char driver in two.
By default give everyone who had the old driver enabled the rpmsg_ctrl
driver too.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
cc: linux-riscv@lists.infradead.org
---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index c252fd5706d2..c0439d3ffb8c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -97,6 +97,7 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 434ef5b64599..99eabad7ca0f 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -89,6 +89,7 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
