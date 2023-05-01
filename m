Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D20C16F2CD7
	for <lists+linux-stm32@lfdr.de>; Mon,  1 May 2023 05:05:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A869C6A5ED;
	Mon,  1 May 2023 03:05:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56705C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 May 2023 03:05:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A67461765;
 Mon,  1 May 2023 03:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C05CC4339E;
 Mon,  1 May 2023 03:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682910355;
 bh=L7TaH2CVnBpQ3FgRQFzJASy56Np5ekKgT/J9X7fsE+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VrknC49X/Fri5KbYQ6+XLNmQRFRUeQxFI0SwoQ/U3PKlxmObPEAlNlyA8EmYf83jV
 CrOwcedalcZ6t0gY1R/Wqr1Vt3dnikokSrsTTs40/LgPy5/thIwUF8gV6men4EBtOJ
 Nmx0ZVj5ft6r85dbwIFAc19bLWRNFGtcPc4bivDqHBv7ytSs9+DlZ7h6ZTmvqDDFCC
 Luq8jqKtvhLTJ6LlAbhQc4iPjWEw4Gt0nfohBXle8AnuRKd4ixkDiRHNUQnvkt2cb4
 AJ8eK1YIbmlM4sw/53/EEu/ptbVfXtNrjoCt2oh0PnRK4gim5dRnK7uWbdaCFTNfkA
 lFy3zeg7crosA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun, 30 Apr 2023 23:05:33 -0400
Message-Id: <20230501030540.3254928-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501030540.3254928-1-sashal@kernel.org>
References: <20230501030540.3254928-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, andersson@kernel.org,
 linux-remoteproc@vger.kernel.org, mcoquelin.stm32@gmail.com,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.10 07/12] remoteproc: stm32_rproc:
	Add mutex protection for workqueue
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

From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

[ Upstream commit 35bdafda40cc343ad2ba2cce105eba03a70241cc ]

The workqueue may execute late even after remoteproc is stopped or
stopping, some resources (rpmsg device and endpoint) have been
released in rproc_stop_subdevices(), then rproc_vq_interrupt()
accessing these resources will cause kernel dump.

Call trace:
virtqueue_add_inbuf
virtqueue_add_inbuf
rpmsg_recv_single
rpmsg_recv_done
vring_interrupt
stm32_rproc_mb_vq_work
process_one_work
worker_thread
kthread

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Link: https://lore.kernel.org/r/20230331160634.3113031-1-arnaud.pouliquen@foss.st.com
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/remoteproc/stm32_rproc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index d2414cc1d90d6..659b747e182d5 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -297,8 +297,16 @@ static void stm32_rproc_mb_vq_work(struct work_struct *work)
 	struct stm32_mbox *mb = container_of(work, struct stm32_mbox, vq_work);
 	struct rproc *rproc = dev_get_drvdata(mb->client.dev);
 
+	mutex_lock(&rproc->lock);
+
+	if (rproc->state != RPROC_RUNNING)
+		goto unlock_mutex;
+
 	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)
 		dev_dbg(&rproc->dev, "no message found in vq%d\n", mb->vq_id);
+
+unlock_mutex:
+	mutex_unlock(&rproc->lock);
 }
 
 static void stm32_rproc_mb_callback(struct mbox_client *cl, void *data)
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
