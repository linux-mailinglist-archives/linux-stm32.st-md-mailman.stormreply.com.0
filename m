Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG0dAu/PAmq7xAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7AE51B62F
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D3E7C8F293;
	Tue, 12 May 2026 06:59:58 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60272C8F288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 17:12:22 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5a40cfab24dso5041976e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 10:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778519542; x=1779124342;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TypizH+0naDcsiSshXyXpAX6OorxUGA4/sCVC58lq0U=;
 b=dNVItlSTtso4eZV+QV1Gziyq3sbkfUE6ra+59hLZvYc5CihKAR3yL2lhOWPsGA/tBu
 ACJBtS8g6VwY4PptpaXACCOTsLio6Oyg3Nh0XzK2sEa+Ln/TW0cuH9f/yIPAlrRru7gv
 CwrSpu17daXw/R3zSGs6U5Mysa1BDfp2T8nqL/6p/Adv7Mq8HHs72H5cZ+8Dm6gDId59
 bvWjDT1YARlnrObNb4WFKaX4YWzNTgLD9Mf/s171UoXs8IIdlJGXBGRci2s/s9rsn2ym
 Fe0qdtmv0pBkftOxLxnLfjwLNYRenk2WPIEy9NXb0VDCGuPXCucGTCt2VGhL5WGwXUa1
 4UPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778519542; x=1779124342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TypizH+0naDcsiSshXyXpAX6OorxUGA4/sCVC58lq0U=;
 b=l5z9Oazj2+Xi27qrm8nK5cf5mNGIydRaslGVh7z+0kqPA9uDVAPkg45pVzIe8xgo3c
 QSqN9P/0XUeZgtQd8KTOcKoYSNFiHDFvy6493cZvQo/IqD3JXFT8FEtRCAjRKmyg86Ka
 VqWHWVGVk4c7OC3dJj6ztm1TyeOcHuiJpKGZ9RBXeJYXi65cRII47GAGCrhqr8Z2cEWV
 FEKyHl/CJcnZvObKxNQhoQ03HPE6W50SqprZlt7YD1RQVjXppeCzA0vqh73NIpI2juut
 7ypvK8IIsNgu9CwJ6A1OhkW8VdtFrn19gQ8qhNBwNePZsPQCvkEkYgRAxYSjS2ZwUiYa
 MZXw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9AsUkhNLFDw7euMVbph/h7jU6hjii/7idwglkJyIhPegu/frFmFjIV8UyOP7kzfD/YiJyPfHAWE4N2jQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx1DVRMUnlK1mV1+oNWMP50M1pb+X/MmUbhIuJ7DAs4kbreGCpb
 drz8kKikABZ3MXnvvWHWCAFSJFtB3bkd1ZqhishgzcGEmXwpIArgG2/A
X-Gm-Gg: Acq92OEl17azs2Xf77qYeaRiLdCurTwpbQwDrcelQFFcQyF2jKyFvJpGlKB3jZokvpW
 vdFlrUclBygmH1rns7x4PoJYWccMnKmZ0J+0KgURa63smMnSiBlOPTQ8DbryCOFLEV04eyLt32E
 ni1ZUw3sC6hXxYlphiCqMejN3MfnwsADiSUrXQ0l66X5/BoUq1YZRzgpAL78I2pvsBcxU/qwj1c
 IUaGW0XX4X7Mzgiumr+Ro7xFnOZqVDvlKN2IkLi0ZMFB/cQmNyqfyxUikxn+r0q8go9HNSBc1Ob
 k1j/RY1SNGhjgxIlU/kgu1HwqFF91sT9VJGMBcj0+LkDf4n1VatKjs4hH0vhaSt+gMjITNavknK
 W6uqLFhu3vEJ1JtED4ta/0GdKFgCM41iTqccFGBAguSFicYIf1H+GlW9TA3qx9rbYzeC6PxhKRE
 DNYRhoHv5uYZ36qD4VfVzkJpJkHP9iJMcxAjDYblmK/ZabUzRwcoMsCDa/8xJQIFLRd9zHGos=
X-Received: by 2002:a05:6512:b20:b0:5a3:fe60:471c with SMTP id
 2adb3069b0e04-5a8a94a8fcfmr4465968e87.16.1778519541397; 
 Mon, 11 May 2026 10:12:21 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 10:12:20 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Date: Mon, 11 May 2026 20:12:09 +0300
Message-ID: <d10ab7f1bb6b4ee1760967f1957191a341b08354.1778518085.git.vebohr@gmail.com>
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
Subject: [Linux-stm32] [PATCH 4/6] media: rtl2832_sdr: Return queued buffers
	on start_streaming() failure
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
X-Rspamd-Queue-Id: AC7AE51B62F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	NEURAL_HAM(-0.00)[-0.655];
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

rtl2832_sdr_start_streaming() had multiple error paths that hit this
trap: two direct early returns (-ENODEV, -ERESTARTSYS), plus six
`goto err` paths covering subdev s_power, tuner setup, ADC setup,
stream-buffer allocation, urb allocation, and urb submission failures.
None of them returned the queued buffers.

The original function had no distinct success exit and fell straight
through into the err label, which previously only did mutex_unlock and
"return ret".  Adding queued-buffer cleanup at err must therefore be
paired with an explicit success return; otherwise every successful
start would also drain the buffer queue and kill streaming.  Add that
success return, then add rtl2832_sdr_cleanup_queued_bufs() at the err
label and before each early return.

The cleanup helper takes a vb2_buffer_state argument so that the
start_streaming error paths can pass VB2_BUF_STATE_QUEUED (as
expected by userspace on start_streaming failure) while stop_streaming
keeps its existing VB2_BUF_STATE_ERROR semantics.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

The err label still does not roll back power_ctrl(), frontend_ctrl(),
the POWER_ON flag, or stream/URB allocations that may have happened
before the failing step.  Those are pre-existing leaks of a different
class and are not addressed here.

Fixes: 771138920eaf ("[media] rtl2832_sdr: Realtek RTL2832 SDR driver module")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 422d1a7b5456..c564485e3bbb 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -399,7 +399,8 @@ static int rtl2832_sdr_alloc_urbs(struct rtl2832_sdr_dev *dev)
 }
 
 /* Must be called with vb_queue_lock hold */
-static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev)
+static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev,
+					    enum vb2_buffer_state state)
 {
 	struct platform_device *pdev = dev->pdev;
 	unsigned long flags;
@@ -413,7 +414,7 @@ static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev)
 		buf = list_entry(dev->queued_bufs.next,
 				struct rtl2832_sdr_frame_buf, list);
 		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
 	spin_unlock_irqrestore(&dev->queued_bufs_lock, flags);
 }
@@ -855,11 +856,15 @@ static int rtl2832_sdr_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	dev_dbg(&pdev->dev, "\n");
 
-	if (!dev->udev)
+	if (!dev->udev) {
+		rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 		return -ENODEV;
+	}
 
-	if (mutex_lock_interruptible(&dev->v4l2_lock))
+	if (mutex_lock_interruptible(&dev->v4l2_lock)) {
+		rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 		return -ERESTARTSYS;
+	}
 
 	if (d->props->power_ctrl)
 		d->props->power_ctrl(d, 1);
@@ -900,7 +905,11 @@ static int rtl2832_sdr_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
+	mutex_unlock(&dev->v4l2_lock);
+	return 0;
+
 err:
+	rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 	mutex_unlock(&dev->v4l2_lock);
 
 	return ret;
@@ -920,7 +929,7 @@ static void rtl2832_sdr_stop_streaming(struct vb2_queue *vq)
 	rtl2832_sdr_kill_urbs(dev);
 	rtl2832_sdr_free_urbs(dev);
 	rtl2832_sdr_free_stream_bufs(dev);
-	rtl2832_sdr_cleanup_queued_bufs(dev);
+	rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_ERROR);
 	rtl2832_sdr_unset_adc(dev);
 
 	/* sleep tuner */
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
