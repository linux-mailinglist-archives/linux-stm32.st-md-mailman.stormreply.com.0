Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDD8343CB9
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Mar 2021 10:27:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0028C58D5C;
	Mon, 22 Mar 2021 09:27:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6792FC58D5C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 09:27:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12M9CxkN014304; Mon, 22 Mar 2021 10:27:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=+TEAoakqQ2P/EInqBDC7sgpRA0k9i6CV8PBrFGCQ13o=;
 b=lIhI5MtiThg42YmcUa4gIGCbDSmkRYiwg8L7DrBSv352Gtsjh/wha0UsgbKsI8TC1bSc
 lnPOT+C5K/kY2eIDKQUBzlKjMcDClyrZn1sOM8svvjup2oCd7qKMyw2fXo63DXoQeREp
 J1ZbddXRzLdjzoY5S14vP8VDm+3UVl4H4i+Da6WwymWE9l4mtFxwSojy11yfaMSGDjVb
 q16TRdEUl7FDsLuXFne26TAadfY9eenTB3C4dgggmxsSRyJqkzOT3QS8hU96TNxh5JNZ
 +vZvZKlv1uSmCFLLFJjQAQf4mvQUGBysVWrdIFbz+B8XB25HPBaUw1mJLvewsiJDfeS1 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37d7d7rq7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 10:27:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA52F100038;
 Mon, 22 Mar 2021 10:27:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6A59231DE9;
 Mon, 22 Mar 2021 10:27:07 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar 2021 10:27:07
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 22 Mar 2021 10:26:51 +0100
Message-ID: <20210322092651.7381-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210322092651.7381-1-arnaud.pouliquen@foss.st.com>
References: <20210322092651.7381-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_03:2021-03-22,
 2021-03-22 signatures=0
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] remoteproc: stm32: add capability to
	detach
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

From: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>

A mechanism similar to the shutdown mailbox signal is implemented to
detach a remote processor.

Upon detachment, a signal is sent to the remote firmware, allowing it
to perform specific actions such as stopping RPMsg communication.

The Cortex-M hold boot is also disabled to allow the remote processor
to restart in case of crash.

Notice that for this feature to be supported, the remote firmware
resource table must be stored at the beginning of a 1kB section
(default size provided to the remoteproc core).

This restriction should be lifted in the future by using a backup
register to store the actual size of the resource table.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
---
 drivers/remoteproc/stm32_rproc.c | 38 ++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 3d45f51de4d0..298ef5b19e27 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -28,7 +28,7 @@
 #define RELEASE_BOOT		1
 
 #define MBOX_NB_VQ		2
-#define MBOX_NB_MBX		3
+#define MBOX_NB_MBX		4
 
 #define STM32_SMC_RCC		0x82001000
 #define STM32_SMC_REG_WRITE	0x1
@@ -38,6 +38,7 @@
 #define STM32_MBX_VQ1		"vq1"
 #define STM32_MBX_VQ1_ID	1
 #define STM32_MBX_SHUTDOWN	"shutdown"
+#define STM32_MBX_DETACH	"detach"
 
 #define RSC_TBL_SIZE		1024
 
@@ -336,6 +337,15 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
 			.tx_done = NULL,
 			.tx_tout = 500, /* 500 ms time out */
 		},
+	},
+	{
+		.name = STM32_MBX_DETACH,
+		.vq_id = -1,
+		.client = {
+			.tx_block = true,
+			.tx_done = NULL,
+			.tx_tout = 200, /* 200 ms time out to detach should be fair enough */
+		},
 	}
 };
 
@@ -461,6 +471,25 @@ static int stm32_rproc_attach(struct rproc *rproc)
 	return stm32_rproc_set_hold_boot(rproc, true);
 }
 
+static int stm32_rproc_detach(struct rproc *rproc)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+	int err, dummy_data, idx;
+
+	/* Inform the remote processor of the detach */
+	idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_DETACH);
+	if (idx >= 0 && ddata->mb[idx].chan) {
+		/* A dummy data is sent to allow to block on transmit */
+		err = mbox_send_message(ddata->mb[idx].chan,
+					&dummy_data);
+		if (err < 0)
+			dev_warn(&rproc->dev, "warning: remote FW detach without ack\n");
+	}
+
+	/* Allow remote processor to auto-reboot */
+	return stm32_rproc_set_hold_boot(rproc, false);
+}
+
 static int stm32_rproc_stop(struct rproc *rproc)
 {
 	struct stm32_rproc *ddata = rproc->priv;
@@ -597,7 +626,11 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
 	}
 
 done:
-	/* Assuming the resource table fits in 1kB is fair */
+	/*
+	 * Assuming the resource table fits in 1kB is fair.
+	 * Notice for the detach, that this 1 kB memory area has to be reserved in the coprocessor
+	 * firmware for the resource table. A clean of this whole area is done on detach.
+	 */
 	*table_sz = RSC_TBL_SIZE;
 	return (struct resource_table *)ddata->rsc_va;
 }
@@ -607,6 +640,7 @@ static const struct rproc_ops st_rproc_ops = {
 	.start		= stm32_rproc_start,
 	.stop		= stm32_rproc_stop,
 	.attach		= stm32_rproc_attach,
+	.detach		= stm32_rproc_detach,
 	.kick		= stm32_rproc_kick,
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= stm32_rproc_parse_fw,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
