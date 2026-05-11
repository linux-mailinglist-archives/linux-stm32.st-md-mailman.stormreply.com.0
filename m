Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL8PF+/PAmoJxgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 325A451B64B
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67BE1C8F295;
	Tue, 12 May 2026 06:59:58 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E0FCC8F288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 17:12:25 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5a8c6fc5fd3so1465017e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 10:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778519544; x=1779124344;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fxqdxYVfNyLoxNKHswDJZT0z/g1AEcUqUWKcspgGBc8=;
 b=IWDrdeBhFp11iQhBz2MAfTZK+BeyueVdz9lKS0EnL95jJarRkCD7QFUYRJM0hVF6vQ
 YNa9J70yaNQDONzxiuvwpv3P8TI7e3qqLoFRj9OJGxx799/P6xB9v2NIj64dQw6LKjHh
 u1SAa7F4pJ5Rz2GYw0JeXfuJRZi6L2i1Q3i4mIlJMOtr0UkM/f7IS+IuFnUoEauSxLUL
 kXDRWzJ0zhcslD/C9sNa/J6IhwUD6Bv295Cl6b5YYnzwDD9219bWYeJ+IriACPOhBx+C
 zj2Ra0M2g1vt7ljQPUD2INpRoYREA2EHIC3Wt4SEP9+bmljitah9ga/rBLXrwZUVWPqD
 zKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778519544; x=1779124344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fxqdxYVfNyLoxNKHswDJZT0z/g1AEcUqUWKcspgGBc8=;
 b=OuHgOFtx+r9obZpEvs8hwAo9Q9M3GPjsYwqLuW2qp9qKMwWG3SgKka2r6OgkvB0x/o
 Lrpc+fBjP7AyQNKwDR9JsS8evkJMBV/bqoR2SwGZ3IRYIeiQVbSfkQgzCqSkM2n6Np9q
 GnQMo4IbXANnPjnPM+SoT8hrZ4s4f8TJP2gCzL4e5YSAzv87a/ME8g+UUA/JlkgTteTh
 p6mzBSBfIfP9UV0DqSUIGpBn9FM2gE3Qr55pDGVrWFRrSy4IWm/jfOWPPF+uP/Jxob+X
 MckUISeuD7waowSnQY+SKA3ig8NHzaTgXOYMXJ2s93xqjwHiMv9uHGLxAyNLVVVzoc5P
 fdzA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9z5QnInP1ZWaAboKMXS9B/FJFcrkGLrDR1+9U3c1bCxIMPNs8DTG8ddL7RaTvLmEfJbh587Ff2bcoixQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxYB12Er5NFJjeVSnAThwaEYndca7MXxfyZciNve2fpGPOtvMk6
 RvNx+iE+SIwsJbcDKV+hBELRluAI5xPbbjxROAaUQpy/qRqRdXqFK8ab
X-Gm-Gg: Acq92OFlBsAYwncdQgQzklIos9KI6jfhE8NmwvVd6LXcufvI1mAmrmB62gJ7Un6fOBr
 tLmX1Qn87RvqtfmN5AtTX+SRotAZBQvXeGg7wvtYCMO3n7DS5oHqCW/NVVBa1zMJpqZbHF2ZUk3
 5AHwt+cnn34zfqNR3QF+E6uWPSUqQGZXBiSJKoCUd6wwPNigN0AtcXfokOYj4p3aTEe86/mRsyk
 ryNXX+B9HjeHvLkKV5EW3pjpfNwCO+9QbsWPXXI9els8oSW3zmi5WNScpp7xpyKJMvC61RMCouQ
 1AAgZsUpURlv5QbL1abFmmb3PpmpBwvOkwCRNHmXo93PAENqKFaqRbedd73Ru7Lj8rvWx+hX/7T
 cRWnik0H6EmtHFKDL2y2+ReAFenYxJ2NyZjeRzA9vGPHTDrP7Ug4pPOGr988h3F0SHaqu8W684V
 CuMwsFRzGpT3H7PxfWrkFbmSpz6Ye/mMMzJGxWcVWCGsFxzGL5lkS5B1YgppdL
X-Received: by 2002:a05:6512:2309:b0:5a2:b86b:56c2 with SMTP id
 2adb3069b0e04-5a8e0f35137mr91615e87.21.1778519544242; 
 Mon, 11 May 2026 10:12:24 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 10:12:23 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Date: Mon, 11 May 2026 20:12:10 +0300
Message-ID: <3b7c3d1be61bcf092484016e25e7b8add98bbe0d.1778518085.git.vebohr@gmail.com>
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
Subject: [Linux-stm32] [PATCH 5/6] media: stm32-dcmipp: Return queued
	buffers on start_streaming() failure
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
X-Rspamd-Queue-Id: 325A451B64B
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
	FORGED_SENDER(0.00)[vebohr@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.669];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

The vb2 framework hands buffers to the driver via buf_queue() before
calling start_streaming().  If start_streaming() returns an error
without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count) and the queued
buffers leak.

dcmipp_bytecap_start_streaming() returned -EINVAL when the source
subdevice could not be resolved from the media graph, before
pm_runtime_resume_and_get() and media_pipeline_start() had been called.
The remaining error paths already converge on the err_buffer_done
label, which calls dcmipp_bytecap_all_buffers_done(...,
VB2_BUF_STATE_QUEUED).  Jump to that label directly: the intermediate
err_pm_put / err_media_pipeline_stop labels are skipped, which is
correct because nothing they would undo has happened yet.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index a42f43d19f9e..f0e809458489 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -401,8 +401,10 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	 */
 	if (!vcap->s_subdev) {
 		pad = media_pad_remote_pad_first(&vcap->vdev.entity.pads[0]);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			return -EINVAL;
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity)) {
+			ret = -EINVAL;
+			goto err_buffer_done;
+		}
 		vcap->s_subdev = media_entity_to_v4l2_subdev(pad->entity);
 		vcap->s_subdev_pad_nb = pad->index;
 	}
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
