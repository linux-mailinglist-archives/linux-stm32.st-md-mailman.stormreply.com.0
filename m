Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AA3C2AB2D
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 10:18:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAC9DC62D37;
	Mon,  3 Nov 2025 09:18:09 +0000 (UTC)
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD096C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 09:18:08 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1762161488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yuMMfRji0QsBlO0qJt9H926jh5AK/yBWl814HSXET8M=;
 b=VCc7uU0o3gSh/l2zJutUq3ddK4nxUqz1cGKERW42Fox8REh1n4QZ1C3ajAxTUc/t3yj+bK
 jNH2aLWTZ4pcGF2UCURHl76dmZqEyk1qBoGf2Qd3gooYiU4+ZXOhBrnTNyJHEAQBv6ycM0
 tDqDmry7YcsZhYMSC32HMLvzrNDlXOA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon,  3 Nov 2025 10:17:41 +0100
Message-ID: <20251103091741.2728-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Cc: linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@linux.dev>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH RESEND] stm class: Remove unnecessary local
	variable in stm_write()
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

The local variable 'err' and the corresponding if check in stm_write()
are unnecessary. Remove them.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/hwtracing/stm/core.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index cdba4e875b28..f3814e4ecf23 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -602,17 +602,11 @@ static ssize_t notrace
 stm_write(struct stm_device *stm, struct stm_output *output,
 	  unsigned int chan, const char *buf, size_t count, struct stm_source_data *source)
 {
-	int err;
-
 	/* stm->pdrv is serialized against policy_mutex */
 	if (!stm->pdrv)
 		return -ENODEV;
 
-	err = stm->pdrv->write(stm->data, output, chan, buf, count, source);
-	if (err < 0)
-		return err;
-
-	return err;
+	return stm->pdrv->write(stm->data, output, chan, buf, count, source);
 }
 
 static ssize_t stm_char_write(struct file *file, const char __user *buf,
-- 
2.51.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
