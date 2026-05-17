Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHq+KYDaCmog8wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C68569A03
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 111D9C7A830;
	Mon, 18 May 2026 09:23:12 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C133DC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 11:42:31 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-c8027e876fcso455760a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 04:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779018150; x=1779622950;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=aybAOu/Wnku8jJKJm8nyG/Glu+5oR3YJ4061r8jTr0g=;
 b=gyu7bshkCCGcOfeaVA7yHfXZwFzR6HBr5lJTmHTfY0cD7ebJFhy/DsTfj1vRxqzFWP
 CEIdH4C7M06+2SdXGZY3WTrw4pH+SO5JWVqXJwb/O8SXYaTgWFOxuuo6sxhvv3f3bJKl
 7nW9JvPJO1VdveihxOwsqxIYUbnsmEgeCV9JiN/aRixbwYRkdtNadtipL3zFwkUK+JHK
 YWj2vhfh545CxgR7UbH3NSkiMBogEu99X7J8+2Avh6zGj3VpDy3EYhdJRwPd8oHtkb+j
 EjlgKJWDdy3YKYq8F0AJNK+ftnMyUj9wCOVOv97TxchH/UHr01RpWsBrYO9jgMOhV3To
 ElMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779018150; x=1779622950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aybAOu/Wnku8jJKJm8nyG/Glu+5oR3YJ4061r8jTr0g=;
 b=B7PH+g1X9JaMhAOVnKJz0u59KHUy/IgqRPz1+otq2Zkd/3w0FNGbgdGqqJ/ZU+XWt0
 AKfF4pmPcd2hSbk2icZGvEoDeRmfBzaruvgAJxb5UE8O8fbhQoc+ynPjth14lIw4/wJ0
 CZA0OPfto77oD7DijSRC5kIg5WzGzTfSYIoAawCEl3mClZQdBWF0vfTgfnznOEEFzGIT
 z0Qh7JsyRd8y/+lG/K62KuTGj/oCVvN7nATFC3zLsjDugmHdevDNpFe6tcXcULNkWR6/
 whi7Zlm8alxal5oWXTwWp09Tl4VQEKK6N2jIQ/wB6vOYV9shVpfA24pskaUKs/bKl8RK
 7rbg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8yenRJGx3YrXVd//F+j1kl3P5dh2wSNIaR1ILXgW3sJ0MuOtZ3rOWpqcoA3onF/R3CTRtYqRC3eYLclQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDrhU5XDqmqJvdWISrskg9BQ5TLonOPthHHe/q7kMmjfRyG2K3
 ajZW96n+Q5YwfM5sFw9lJwfwXhcw/LTjyEYEWBX53mxAaMWu1xqcMMMa
X-Gm-Gg: Acq92OGJmtUct6CvTOrLoSEUjU5wY5uIfFZPv0firJOn7VIL1Ai3ebwg8tMEmE27S0a
 38OhoypkiRThkM8HXx0sH5A1HVX7EnulcWHGNtK1pgKP1DRCHkB2WAFDCesiscvFF181q52UHlZ
 6JtjmB0A/RsRvxxm8yGniYwFrCdCcgSiHiV2Nz71Y3AhiRTg3BUqRitVFGt//aBwWYBUp3LJ4aQ
 CXPeZg3KKTsezycoMSCwaOOBXQ/bB9fpp6DmqPUZ23HEUOyiRJsbz/PoziUGeZxGd6bkRww0fBw
 hwccVy0gQ9qX41Kh1tluTWetmJWxsMf6y1r0Levm6ejiB714F8D6PHMRkq6s+K20vg2d3BfEfOd
 BMF3mPRhWTICc1pDHAXOkEySlowBuS2OxsF3nfveWXBuKqQOwsMD0vmVNiMQwMXxtDHv2qTzs0v
 eW1AQOs9KiRJH+
X-Received: by 2002:a17:903:1b45:b0:2bc:ffe1:c380 with SMTP id
 d9443c01a7336-2bd7e86c179mr114076265ad.8.1779018150104; 
 Sun, 17 May 2026 04:42:30 -0700 (PDT)
Received: from lgs.. ([101.36.106.88]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5bd5f30bsm135198645ad.16.2026.05.17.04.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 04:42:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Kees Cook <kees@kernel.org>, Guangshuo Li <lgs201920130244@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dillon Min <dillon.minfei@gmail.com>, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 17 May 2026 19:42:16 +0800
Message-ID: <20260517114216.950713-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 May 2026 09:22:57 +0000
Subject: [Linux-stm32] [PATCH] media: stm32: dma2d: avoid double free on
	video register failure
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
X-Rspamd-Queue-Id: 51C68569A03
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
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:kees@kernel.org,m:lgs201920130244@gmail.com,m:jacopo.mondi@ideasonboard.com,m:dillon.minfei@gmail.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,m:hverkuil@kernel.org,m:dillonminfei@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,ideasonboard.com,collabora.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,cisco];
	NEURAL_SPAM(0.00)[0.994];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

dma2d_probe() allocates a video_device with video_device_alloc() and
releases it from the rel_vdev error path if video_register_device()
fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  dma2d_probe()
    -> rel_vdev
       -> video_device_release(vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vfd through vdev->release().
dma2d_probe() then releases vfd exactly once from rel_vdev. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 002e8f0d5927 ("media: stm32-dma2d: STM32 DMA2D driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index a3ad19256859..0e36ddfa8c7b 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -651,6 +651,7 @@ static int dma2d_probe(struct platform_device *pdev)
 	}
 
 	*vfd = dma2d_videodev;
+	vfd->release = video_device_release_empty;
 	vfd->lock = &dev->mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
 	vfd->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
@@ -669,6 +670,8 @@ static int dma2d_probe(struct platform_device *pdev)
 		goto free_m2m;
 	}
 
+	vfd->release = video_device_release;
+
 	video_set_drvdata(vfd, dev);
 	dev->vfd = vfd;
 	v4l2_info(&dev->v4l2_dev, "device registered as /dev/video%d\n",
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
