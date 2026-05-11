Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zhtzBO/PAmoNxgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8261151B62E
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 309E7C8F291;
	Tue, 12 May 2026 06:59:58 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57900C8F288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 17:12:20 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5a8738c178dso3143752e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778519540; x=1779124340;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JH+u+xhzUiMSlilufXXl7nt5EV8IiDoOquYIB5049q8=;
 b=AUhOljyI0Xv0R+diIHmZo6SkfK4I2TtDzkWEw+YTGusrCOSgUzorR4aXLJcT3R/ewe
 8dcz0OcOCUK7NLM9/th3eSbeC1Fu50SXKdzCHCT6Lq810wnreKit5IWlTrkXxl+CCujU
 M1fJow28T7Gs5ncflX4QybUN+ujtGhMsyiBnfdpGv+iG3E0o9FekDsoU/U98owKraqmF
 9XgxecWkJyBwVzA1Pi8BlBOwE5CisUGsZkgcLCvTl2AQrJjCKOukRvoQYbmW5q9mPAep
 KSKK4StQiRL5VSMlM+5y5u/jdJcxVZRYciZiNLEimzXxfT0wraolKAgcQa5gsgKAv+aj
 swLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778519540; x=1779124340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JH+u+xhzUiMSlilufXXl7nt5EV8IiDoOquYIB5049q8=;
 b=nWGv9p7pjWEAhjqKNMftxkmB9Hzg6hTiSyvVlXfzt3gnFBMWLqj7iLjRlINfMPCO1b
 mHe663+v+IRkTPLtxnKAwppEl9Tfstvx/qMP8wmW/Sm8+AL32qnUMarh+QbO/VSZQSOI
 r+5NSdrveYkZWxs1D51DobB15Ry829mxA+DBu/90ZKUnGD1OErltcppTnqqPdgpnXPGa
 RMWpsBSdItKeNGAjJcu0YcehwDkqLgLzqiVqGvp5PUeJ1suLK24mUmsA3F3TyAHq0xhy
 aV7eP6q/6WG6OrJvpR/RRpFCmC4ESWo+9Jo9W9stKtBJ1Inr3Y4VMiBN4ELnWUfhxC8c
 9zLA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9sTuGa/kCHg9XX/5P7h75o+Qk4MniPgu85sS5UKh/ZOmyO/zN1vQRLu69awEKxIpwQUBPxgTj1JQM1bA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzO1S69hUdwtbQi8ds1u6hAs48UloZvFVFgnAaaM12OE/twduXV
 wHr9DOXN54LK6SQ3mCeT/5HuFCnr6RhzAPrKY2E+Uzb6ZWsOjTKzi0Nn
X-Gm-Gg: Acq92OGbJ33hEecwZbbFJsKYO+AhIdxCfcKTyrRRTzAiFYLibRK3InLYdAVHadrHbgQ
 ST0OED0VOekxJ66PmOoCDLl8XhXq0jwac0yYddGKuaA9fC88thIYz0hwadROsJmMfnLiaWYuoWN
 sL6i0SOfd1F0mj0C3FxRc8i7WYgwjM27ulH3riX3XISGpmopr0iHcXsRHd9V+kC3MZJwAkpgs9P
 WnramIwGAw7od3CI6u0HzDRXtRhloBMHM1ij1Uh7DaqqSFJycZEUTj7LEKqg4B2rEfVj7USNnrs
 5OUzeoh0IHsB3rLo/lLtMpjTB68JDpIUKSeFieK1ZDU2tp3wKjDg9tiFYPZ5HlfKmNLknSl5Is/
 iqCPuBBfFOHU9yHNrIF2nlJE+Dsnv21eoZ/zCYs191W7ipDfVNGN/lg5D5xYzJrECo5mIsrlzuB
 q2SloU31ioeM0Rx2qdXmDQr7AvqcA4RPrzPxzdYgo9bq+cbFkYU9BKoDFITOyo/0iShtUdW0A=
X-Received: by 2002:a05:6512:3e16:b0:5a3:ff5a:d83 with SMTP id
 2adb3069b0e04-5a887ae3618mr10520299e87.16.1778519539315; 
 Mon, 11 May 2026 10:12:19 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 10:12:18 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Date: Mon, 11 May 2026 20:12:08 +0300
Message-ID: <d0fdfb94b56871e757812bfb7aa58e83f7215903.1778518085.git.vebohr@gmail.com>
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
Subject: [Linux-stm32] [PATCH 3/6] media: pwc: Return queued buffers on
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
X-Rspamd-Queue-Id: 8261151B62E
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
	NEURAL_HAM(-0.00)[-0.663];
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

pwc's start_streaming() had two early returns that hit this trap:
-ENODEV when the USB device was already disconnected, and -ERESTARTSYS
when mutex_lock_interruptible() was interrupted by a signal.  Call the
existing pwc_cleanup_queued_bufs() helper with VB2_BUF_STATE_QUEUED
before returning (matching the state already used by the
pwc_isoc_init() error path in the same function).

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: ceede9fa8939 ("[media] pwc: Fix locking")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/usb/pwc/pwc-if.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index c416e2fc5754..59b99ac8fcb6 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -710,11 +710,15 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct pwc_device *pdev = vb2_get_drv_priv(vq);
 	int r;
 
-	if (!pdev->udev)
+	if (!pdev->udev) {
+		pwc_cleanup_queued_bufs(pdev, VB2_BUF_STATE_QUEUED);
 		return -ENODEV;
+	}
 
-	if (mutex_lock_interruptible(&pdev->v4l2_lock))
+	if (mutex_lock_interruptible(&pdev->v4l2_lock)) {
+		pwc_cleanup_queued_bufs(pdev, VB2_BUF_STATE_QUEUED);
 		return -ERESTARTSYS;
+	}
 	/* Turn on camera and set LEDS on */
 	pwc_camera_power(pdev, 1);
 	pwc_set_leds(pdev, leds[0], leds[1]);
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
