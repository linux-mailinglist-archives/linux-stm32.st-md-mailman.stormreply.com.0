Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 779108CB10A
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 17:12:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D656C6B47A;
	Tue, 21 May 2024 15:12:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 606E6CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2024 15:12:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LDpiHh028512;
 Tue, 21 May 2024 17:11:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=/FEvlAQ
 usilGdNjTRD3PN3O7G4HvNhMpAzyobKWFMJ8=; b=RzUe5abH98tY6GRCtWl7ubG
 AVSey2r/LDF6N+YK3U9A6eXRwP250dihFM5bZPJyA8GFYLqmHfJw9PIKPzA+c6XO
 hsxsg7pZX2MobxHpYMLu0JJfYmk2A0Zfcwed1cu5CHvTXAf4mJFjTX7O7k2R86GH
 L2xVp1KMZFbDLfjGYJvc0PfKTEYBA5Co7pBRHfH5bvYvO5abtZikcO89T9h7nkHl
 Ud0Tcb3BiR6DT5kAQ2Fa+BflikB3eN9VwGpl7QVi8NjQrKT0FI9s9Y3rfR+WYKtd
 CHCaX4Ai6XP9sS9EbvoekG1iuGsLPegHdsJ7hLjtGyUE9jkm4LHzU32ByQJARdQ=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y8vqh8cag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 May 2024 17:11:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1BCFF4002D;
 Tue, 21 May 2024 17:11:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 220332194C7;
 Tue, 21 May 2024 17:11:17 +0200 (CEST)
Received: from localhost (10.252.1.80) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 17:11:16 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
Date: Tue, 21 May 2024 17:11:09 +0200
Message-ID: <20240521151109.3078775-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.1.80]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_09,2024-05-21_01,2024-05-17_01
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] usb: ucsi: stm32: fix command completion
	handling
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

Sometimes errors are seen, when doing DR swap, like:
[   24.672481] ucsi-stm32g0-i2c 0-0035: UCSI_GET_PDOS failed (-5)
[   24.720188] ucsi-stm32g0-i2c 0-0035: ucsi_handle_connector_change:
 GET_CONNECTOR_STATUS failed (-5)

There may be some race, which lead to read CCI, before the command complete
flag is set, hence returning -EIO. Similar fix has been done also in
ucsi_acpi [1].

In case of a spurious or otherwise delayed notification it is
possible that CCI still reports the previous completion. The
UCSI spec is aware of this and provides two completion bits in
CCI, one for normal commands and one for acks. As acks and commands
alternate the notification handler can determine if the completion
bit is from the current command.

To fix this add the ACK_PENDING bit for ucsi_stm32g0 and only complete
commands if the completion bit matches.

[1] https://lore.kernel.org/lkml/20240121204123.275441-3-lk@c--e.de/

Fixes: 72849d4fcee7 ("usb: typec: ucsi: stm32g0: add support for stm32g0 controller")
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/typec/ucsi/ucsi_stm32g0.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index 93d7806681cf..7d6576778dad 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -395,9 +395,13 @@ static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const
 				   size_t len)
 {
 	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
+	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
 	int ret;
 
-	set_bit(COMMAND_PENDING, &g0->flags);
+	if (ack)
+		set_bit(ACK_PENDING, &g0->flags);
+	else
+		set_bit(COMMAND_PENDING, &g0->flags);
 
 	ret = ucsi_stm32g0_async_write(ucsi, offset, val, len);
 	if (ret)
@@ -405,9 +409,14 @@ static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const
 
 	if (!wait_for_completion_timeout(&g0->complete, msecs_to_jiffies(5000)))
 		ret = -ETIMEDOUT;
+	else
+		return 0;
 
 out_clear_bit:
-	clear_bit(COMMAND_PENDING, &g0->flags);
+	if (ack)
+		clear_bit(ACK_PENDING, &g0->flags);
+	else
+		clear_bit(COMMAND_PENDING, &g0->flags);
 
 	return ret;
 }
@@ -428,8 +437,9 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
 	if (UCSI_CCI_CONNECTOR(cci))
 		ucsi_connector_change(g0->ucsi, UCSI_CCI_CONNECTOR(cci));
 
-	if (test_bit(COMMAND_PENDING, &g0->flags) &&
-	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
+	if (cci & UCSI_CCI_ACK_COMPLETE && test_and_clear_bit(ACK_PENDING, &g0->flags))
+		complete(&g0->complete);
+	if (cci & UCSI_CCI_COMMAND_COMPLETE && test_and_clear_bit(COMMAND_PENDING, &g0->flags))
 		complete(&g0->complete);
 
 	return IRQ_HANDLED;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
