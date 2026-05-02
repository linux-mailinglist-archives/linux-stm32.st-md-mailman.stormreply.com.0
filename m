Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B65IAsZ9mmPSQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 02 May 2026 17:32:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECF94B29DE
	for <lists+linux-stm32@lfdr.de>; Sat, 02 May 2026 17:32:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3269EC8F277;
	Sat,  2 May 2026 15:32:26 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92A04C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 May 2026 15:32:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D205D112877; Sat,  2 May 2026 17:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1777735944; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=1Ji4o/UKh5s3iYAgum24fW1ttfWjMxe2zCp2y0o6sCg=;
 b=Hq2oZqmfzGYQ/21alyh41Hi/ZBlWkeDrmW6/VbJiHP8dLV0mska06rVLmpVN9VEtln9Jmh
 6EdvO9PtCahkjrCKRB2AOicrdvK9Lcxf0kBCoXeapjzM38empUchYBlqx4/X+gQ15aed6i
 ep8GvpYJMHENQuOGrPjh2OFUj4DE5gtghEF7nlztujBGVJJERJBQbp/d2kYk9elanswqC8
 hY38US03Y94gHVOgP4S7nfzKrKVTWRRGhDfM0MUkI+DQ0PPH54zDgEkPo5e4byXIgSgaP1
 w4jz7e7sirOQNlQmpMwqACaIggv1ELxVFr6kflPJloNbHohmF9MMl9byOw8dFQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-i2c@vger.kernel.org
Date: Sat,  2 May 2026 17:31:54 +0200
Message-ID: <20260502153218.56142-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@nabladev.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] i2c: stm32f7: Move reinit_completion() to
	stm32f7_i2c_xfer_core()
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
X-Rspamd-Queue-Id: 0ECF94B29DE
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nabladev.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-i2c@vger.kernel.org,m:marex@nabladev.com,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[nabladev.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nabladev.com,kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabladev.com:mid,nabladev.com:email,stormreply.com:url,stormreply.com:email,st.com:email]
X-Spam: Yes

Currently, the driver may repeatedly call reinit_completion() during
transfer which contains multiple messages, while another thread is
waiting for the completion.

This happens during transfer with more than 1 message, invoked via
stm32f7_i2c_xfer_core() -> stm32f7_i2c_xfer_msg(). After invoking the
stm32f7_i2c_xfer_msg() to start transfer, stm32f7_i2c_xfer_core()
calls wait_for_completion_timeout() to wait for completion of the
transfer of all messages. When the first message transfer completes,
the hard IRQ handler triggers, and detects transfer completion, which
leads to stm32f7_i2c_isr_event_thread() IRQ thread being started. The
stm32f7_i2c_isr_event_thread() calls stm32f7_i2c_xfer_msg() in case
there are more messages.

Without this change, the second and later stm32f7_i2c_xfer_msg() would
call reinit_completion() on the completion which is still being waited
for in stm32f7_i2c_xfer_core(). Fix this by moving the reinit_completion()
into stm32f7_i2c_xfer_core(), together with wait_for_completion_timeout().

Since stm32f7_i2c_xfer_core() now waits for completion of the entire
transfer, increase the default timeout. This fixes sporadic transfer
timeouts on STM32MP25xx during kernel boot.

Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/i2c/busses/i2c-stm32f7.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 70cb5822bf17b..53d9df70ebe4d 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -895,8 +895,6 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 	f7_msg->result = 0;
 	f7_msg->stop = (i2c_dev->msg_id >= i2c_dev->msg_num - 1);
 
-	reinit_completion(&i2c_dev->complete);
-
 	cr1 = readl_relaxed(base + STM32F7_I2C_CR1);
 	cr2 = readl_relaxed(base + STM32F7_I2C_CR2);
 
@@ -1728,6 +1726,8 @@ static int stm32f7_i2c_xfer_core(struct i2c_adapter *i2c_adap,
 	if (ret)
 		goto pm_free;
 
+	reinit_completion(&i2c_dev->complete);
+
 	stm32f7_i2c_xfer_msg(i2c_dev, msgs);
 
 	if (!i2c_dev->atomic)
@@ -2253,7 +2253,7 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	snprintf(adap->name, sizeof(adap->name), "STM32F7 I2C(%pa)",
 		 &res->start);
 	adap->owner = THIS_MODULE;
-	adap->timeout = 2 * HZ;
+	adap->timeout = 8 * HZ;
 	adap->retries = 3;
 	adap->algo = &stm32f7_i2c_algo;
 	adap->dev.parent = &pdev->dev;
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
