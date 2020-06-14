Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 136591F8F47
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2020 09:18:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2E07C36B0D;
	Mon, 15 Jun 2020 07:18:40 +0000 (UTC)
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 878EDC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jun 2020 02:37:08 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 49kzBW0WQdz9vZ24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jun 2020 02:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dl9kR2fgiXsD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jun 2020 21:37:06 -0500 (CDT)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 49kzBV5xswz9vZ28
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jun 2020 21:37:06 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 49kzBV5xswz9vZ28
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 49kzBV5xswz9vZ28
Received: by mail-io1-f71.google.com with SMTP id m11so8939285ioj.14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jun 2020 19:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=RQEF7X2he2CIvCAF0xeze50vGbmiUj8obcSj3YpGnsc=;
 b=Hj+qKjLqwxKZdFHcqhGL4RCVKHV6fP3Oer7rzrgPPWYbv35lGkAst5QgPc8y3nLRCp
 vKVaxl7tk1u8PZMNFAetQYQ6NwzqplGIsXILrLiVUysqIKuvbFEb3y0fL7NeZDA6eBqI
 pO96/Au+eO/frA1E4LLC+lPvS8hR2UvICjeKU9R3le1ae4tglEaeUVDybiZKisk2cU69
 JZ8sbETmJsW/DFxNKzIkJXdJ9tsV1lNSfpS/+4EkCHBrpLSK44iXq7e4QFYuFza1Hz8M
 Zi+3fmlSvQPyovl/+DtnyRguBKLN0yPRjqYUnqP4JoEqzyj84WdoVHPHGf9oZzOLGrVX
 3bdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RQEF7X2he2CIvCAF0xeze50vGbmiUj8obcSj3YpGnsc=;
 b=EOtyScNnW7fuNrUNsgQNq4xS5pLi49otSTQhiqvuQ4wijZFElqtoaa5l+MY98qEQaP
 D0r5kbj9ecr+KbTtEpM3lU9kQ2F9PNO4uv7IyyJZx6QrNRWwqzKIIiGrlF/do8ONtTOT
 /OiiExX1BsY+oR4MsuJBjPO2osyyCoWza+Mso1QS8IMgCNMXRtYbAZuWAQ9HBJrpldba
 6SiAtw9jIV0LxLkMo5kzK7bDOIqmjQ6cU4KWHWYDGQEDVF5iuZ3mBDBhHT0nXioRbA9H
 aRjb2P7cJg7sae8ZrBPTcIuF+tuqCbVkBR4BZhz4qC7zMZ5p62z6I6V7NDae0w6PwNLk
 RbPw==
X-Gm-Message-State: AOAM532xSgPSJVxgEutbPKaatTu95jZKz6E5rwpX9ui8+XNA6aHMuWSX
 OrFGpzm/bsL8tlLVJs5VIqbfjTeYPKiRKkKeRZOah+FCPE3VKTAJDl0BV6oZe/IMfjGfh1Hv1fE
 W9da90N2i2bMfhTs2KHzq6SRlc8KUiVysqVi+TZ8tfcne
X-Received: by 2002:a92:cf09:: with SMTP id c9mr19732360ilo.143.1592102226326; 
 Sat, 13 Jun 2020 19:37:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ86ckYqx5vk+JKvHiE51xf49YXvXEFvQYRO/7UldKAKo+GnZzsRu2IiSnX8jxysU/4zFyPw==
X-Received: by 2002:a92:cf09:: with SMTP id c9mr19732342ilo.143.1592102226008; 
 Sat, 13 Jun 2020 19:37:06 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
 by smtp.gmail.com with ESMTPSA id 18sm5499967ion.17.2020.06.13.19.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 19:37:05 -0700 (PDT)
From: wu000273@umn.edu
To: kjlu@umn.edu
Date: Sat, 13 Jun 2020 21:36:59 -0500
Message-Id: <20200614023659.25979-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:18:38 +0000
Cc: wu000273@umn.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] media: stm32-dcmi: Fix a reference count leak
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Qiushi Wu <wu000273@umn.edu>

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count if pm_runtime_put is not
called in error handling paths. Thus replace the jump target
"err_release_buffers" by "err_pm_putw".

Fixes: 152e0bf60219 ("media: stm32-dcmi: add power saving support")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index b8931490b83b..fd1c41cba52f 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -733,7 +733,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret < 0) {
 		dev_err(dcmi->dev, "%s: Failed to start streaming, cannot get sync (%d)\n",
 			__func__, ret);
-		goto err_release_buffers;
+		goto err_pm_put;
 	}
 
 	ret = media_pipeline_start(&dcmi->vdev->entity, &dcmi->pipeline);
@@ -837,8 +837,6 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_pm_put:
 	pm_runtime_put(dcmi->dev);
-
-err_release_buffers:
 	spin_lock_irq(&dcmi->irqlock);
 	/*
 	 * Return all buffers to vb2 in QUEUED state.
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
