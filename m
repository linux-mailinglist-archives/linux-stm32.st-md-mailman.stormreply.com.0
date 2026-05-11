Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QpgqOe7PAmoJxgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C5C51B62D
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 176BBC8F28E;
	Tue, 12 May 2026 06:59:58 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F25FDC87EC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 17:12:17 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5a8d1f43432so1585571e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 10:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778519537; x=1779124337;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XSIxIJUh3eL2dSuA1xrUNZiqoyBIDeeVRxEk9r/yyRo=;
 b=WnmqBazvO8obf9hF5SPCFlUqEpy2MNQiLZlOkQQO6xfCZJbSHwPWjfsC1SW9jXeSsK
 R6cjUq8zbKzMqGKPXY2TiO09/mtQiY7DFErCmjgrkGeLaoJ0QIOrw0aUfHmfyGgr+xZE
 28Y4dZwk7ig+OfF2Pvc9bqPM6qglgkKRe8iDytsIA/1JaFPpD7kqXfguLmHMzVawbVUR
 HL587C4XFOu6eED+TevJKuQpulK8O7B9DPNxVlT2CvbvFjAmPRkY/GvaG7SM/0mHJ9rQ
 LMVMwH1d+MR93WMuLZp7pt0alvv663qGGY2eBVSLu99ruPCM1XDwyLC6QcRs7c+j3RnQ
 ZlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778519537; x=1779124337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XSIxIJUh3eL2dSuA1xrUNZiqoyBIDeeVRxEk9r/yyRo=;
 b=a8Dows+KfTelzw41eC3vEji33W1MpHljvGyQGekM06pcNzkYit/IXexMFKcDixFrYb
 fm+ZPC1bL1b0rt6wwbp0i4twHb0pkaIKn2GIbOAYXZeh2ZyIMcEjBSxwuU3ZaIiGcUK7
 xM6K938r2cR81ehBWuIg3KwVWZQkWRxRU5p8yiYNaEvV36DUK/XBSCqkaf4HTkq7tNGT
 WChVxTfywJt7qkzN+R3zvmlKdciX9TE196L9q23AhzM4fq3i9jX3PeLpkjALdnksW64t
 jGbYlGSFldyA4VYtUCaYf8XwraJcfETLKT8YsgHBlTSVsRzM7dAy9Htyb491mD8Ew3x6
 RpQw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/VYO8NvTnOT/komdLTMxMfnNlP7O+tDmziUnvMf0HHeZd8HSrgAlruNfcY7ytmEALzlPFkrr5L6tHxRA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwAhe2fE1hVop9ZH1gRr3GyNfv+asAfpblZ6M99CTx3UZfe07OQ
 FAp3DJhMp7i48UcZU8eUGMv0PLhW4TpmlC8KZFnVBt3pCYiOhL90UkGy
X-Gm-Gg: Acq92OEh3OCf3/Dm0zwX08qSPHFjxaYU8bx+tbfCIuJIYEAa+iSfsAuRVpQydshWP2c
 UZ6aCMTZwCoNX6h36tZHkeMz4L3TjxbQOjV6cIidJOp9CDolfobklJFPwTV4HeJv5Ob4o80bG7Q
 qMdO3hxqo5gmeCR22/dmMEp84tlBjUjnG+00W4UKnCXyBZyFCrekgg9l8HTF4XhEDwTNVG0M+b/
 iWD7j0VDd9vS+sOp9yHAB6KqkX1xfBaQwbGhzdg9xdpHDoo6ktdULrJ4+w3I9aG/icJ/z412YBa
 QIgiCt+F5uEWzinxEDfHyxQbaK6ydrV36H+YLB3QZONYyFp1Q9abQs7KA5t7i6HZYXl/BZNjcGT
 CPkLDWR9laRFp8haJRRDvgR76v0My1nhau44kk27OOEcGBgEO64ZU96qT4uYMfHaO+49KhXWN+i
 cvPL51JkN8vV/OPM81JFyeQi4t6RfZkcUChimqw3a9hswYXgHHxlAsOVHHGyy+
X-Received: by 2002:a05:6512:3ca1:b0:5a8:7be1:24c8 with SMTP id
 2adb3069b0e04-5a887ceaa65mr9581194e87.37.1778519537055; 
 Mon, 11 May 2026 10:12:17 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 10:12:16 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Date: Mon, 11 May 2026 20:12:07 +0300
Message-ID: <e3052e648c898900582b7bebb6890ff4042100c0.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1778518085.git.vebohr@gmail.com>
References: <cover.1778518085.git.vebohr@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 May 2026 06:59:56 +0000
Cc: linux-arm-kernel@lists.infradead.org, wens@kernel.org,
 linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com,
 samuel@sholland.org, hugues.fruchet@foss.st.com, mripard@kernel.org,
 linux-sunxi@lists.linux.dev, hverkuil@kernel.org, jernej.skrabec@gmail.com,
 mcoquelin.stm32@gmail.com, stable@vger.kernel.org, mchehab@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, hansg@kernel.org,
 Valery Borovsky <vebohr@gmail.com>
Subject: [Linux-stm32] [PATCH 2/6] media: msi2500: Return queued buffers on
	start_streaming() failure
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
X-Rspamd-Queue-Id: 70C5C51B62D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,vger.kernel.org,linux.intel.com,sholland.org,foss.st.com,lists.linux.dev,gmail.com,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:wens@kernel.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:samuel@sholland.org,m:hugues.fruchet@foss.st.com,m:mripard@kernel.org,m:linux-sunxi@lists.linux.dev,m:hverkuil@kernel.org,m:jernej.skrabec@gmail.com,m:mcoquelin.stm32@gmail.com,m:stable@vger.kernel.org,m:mchehab@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:hansg@kernel.org,m:vebohr@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[vebohr@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.644];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

The vb2 framework hands buffers to the driver via buf_queue() before
calling start_streaming().  If start_streaming() returns an error
without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count) and the queued
buffers leak.

msi2500_start_streaming() had five error paths that all hit this trap
and were further tangled by ret-overwriting between calls:

  - -ENODEV when the USB device was already disconnected
  - -ERESTARTSYS when mutex_lock_interruptible() was interrupted
  - msi2500_set_usb_adc() failure: ret was silently overwritten by
    the next call (msi2500_isoc_init), so the error was lost entirely
  - msi2500_isoc_init() failure: cleanup_queued_bufs was called, but
    the function then fell through to msi2500_ctrl_msg() and again
    masked the original error by overwriting ret
  - msi2500_ctrl_msg(CMD_START_STREAMING) failure: no cleanup at all,
    leaving isoc URBs submitted with no way for the driver to consume
    them

Consolidate the error paths into a small goto chain.  Every failure
now stops the function, drains the queued-buffer list, and returns
the real error code.  The ctrl_msg failure path also rolls back the
preceding msi2500_isoc_init() via msi2500_isoc_cleanup() before
unlocking and draining.

The cleanup helper takes a vb2_buffer_state argument so that the
start_streaming error paths can pass VB2_BUF_STATE_QUEUED (as
expected by userspace on start_streaming failure) while stop_streaming
keeps its existing VB2_BUF_STATE_ERROR semantics.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: 977e444f59ad ("[media] Mirics MSi3101 SDR Dongle driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/usb/msi2500/msi2500.c | 32 +++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 1ff98956b680..0614087c3c3c 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -541,7 +541,8 @@ static int msi2500_isoc_init(struct msi2500_dev *dev)
 }
 
 /* Must be called with vb_queue_lock hold */
-static void msi2500_cleanup_queued_bufs(struct msi2500_dev *dev)
+static void msi2500_cleanup_queued_bufs(struct msi2500_dev *dev,
+					enum vb2_buffer_state state)
 {
 	unsigned long flags;
 
@@ -554,7 +555,7 @@ static void msi2500_cleanup_queued_bufs(struct msi2500_dev *dev)
 		buf = list_entry(dev->queued_bufs.next,
 				 struct msi2500_frame_buf, list);
 		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
 	spin_unlock_irqrestore(&dev->queued_bufs_lock, flags);
 }
@@ -830,25 +831,40 @@ static int msi2500_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	dev_dbg(dev->dev, "\n");
 
-	if (!dev->udev)
-		return -ENODEV;
+	if (!dev->udev) {
+		ret = -ENODEV;
+		goto err_cleanup;
+	}
 
-	if (mutex_lock_interruptible(&dev->v4l2_lock))
-		return -ERESTARTSYS;
+	if (mutex_lock_interruptible(&dev->v4l2_lock)) {
+		ret = -ERESTARTSYS;
+		goto err_cleanup;
+	}
 
 	/* wake-up tuner */
 	v4l2_subdev_call(dev->v4l2_subdev, core, s_power, 1);
 
 	ret = msi2500_set_usb_adc(dev);
+	if (ret)
+		goto err_unlock_cleanup;
 
 	ret = msi2500_isoc_init(dev);
 	if (ret)
-		msi2500_cleanup_queued_bufs(dev);
+		goto err_unlock_cleanup;
 
 	ret = msi2500_ctrl_msg(dev, CMD_START_STREAMING, 0);
+	if (ret)
+		goto err_isoc_cleanup;
 
 	mutex_unlock(&dev->v4l2_lock);
+	return 0;
 
+err_isoc_cleanup:
+	msi2500_isoc_cleanup(dev);
+err_unlock_cleanup:
+	mutex_unlock(&dev->v4l2_lock);
+err_cleanup:
+	msi2500_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 	return ret;
 }
 
@@ -863,7 +879,7 @@ static void msi2500_stop_streaming(struct vb2_queue *vq)
 	if (dev->udev)
 		msi2500_isoc_cleanup(dev);
 
-	msi2500_cleanup_queued_bufs(dev);
+	msi2500_cleanup_queued_bufs(dev, VB2_BUF_STATE_ERROR);
 
 	/* according to tests, at least 700us delay is required  */
 	msleep(20);
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
