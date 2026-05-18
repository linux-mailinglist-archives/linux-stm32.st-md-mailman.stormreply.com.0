Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEKSMnETC2o5/wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 15:26:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CAE56D94E
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 15:26:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D077FC597BF;
	Mon, 18 May 2026 13:26:08 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9515EC58D7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 13:26:06 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2ba17c8cfacso22525445ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779110765; x=1779715565;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OgGqZu/lBvzHJtzf9xCysSkNq9jit1BxS4Kzrlj9Hvc=;
 b=ef6s+zyih0RpAHqSk0azDwsX3fVtI3XMAEokebGRSsJ9ZFvg7M4xNU9mseakG3O5X8
 v8/R4Zjx2sHBiiFIp5V2/7CxTYDY18ecyUAiPprcTlpqEBWcKzxzu470EUOcqj4o5Pw5
 f7H9Er6uz/vItiFwr0rXzsEpXupfVOjc6BBZ+SM8vcx29G/QM7hSAVdcB8vQye7j6tnL
 pLO3KlMTKDN8qHiI6B9hW4W4EkuYdD1dOXT/kzVpZfqSKTmpnnFTs61z/EzW7qqhb4s/
 LIJcyr29NFn839z+9vgLtKF2iw/VgpcGwoaIlungIi+2GgBSNTyE65JtrddseTZUIgu7
 7UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779110765; x=1779715565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OgGqZu/lBvzHJtzf9xCysSkNq9jit1BxS4Kzrlj9Hvc=;
 b=V5IQCwts4W3AByYqdDqr4cfxRqzjrxGP+9FijorZW/Lm0cw0+LpcBFpJwq15xRHFrd
 3lV+3b/iandd7Mm8vzG71KMoGjC2TpURWHDBHQiSVCZ98XD8URwcqEVGpl3L/hTG6c+x
 7tp6Q2Z4sAeu3dLMhwmKvAWnJxYtW6fSFbL7bH8dcC3cToBwSVdMKp5twLA1DY+o4KXC
 0aABfs+swahJMR7aPFF0qGiAwi1prYcR5Eo19Xngw1NqyP4X3V2EhB27bxg/Rpbjheai
 3mFSZzNlmfIY4TeU6XI3DOJhf6IQgFQwyomL6H6OUXL4Rc0uukRTqhSp9mXv22ndjzdw
 d7CA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Q900fRznpFZUY5e7EDqxA+mhSJrHITMlLgbUOx5qq1idOzxEwgdlJrnFw6eJFJGOxOlhAWOTXZIRGQQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YztbwBHA0azSw/9WULddPJa8p/v2BoRarS5VGlEX0OmS9QxZZQP
 LLARtJC1gJFqDmibjEMziMbLa6fJa+uGxPDa2EgsTydtNwKXiIEiRGHn
X-Gm-Gg: Acq92OFWHHvB+2CiqR8MlD3o8khv2SOQbT1w7nnf6QKRIIisREi339KxUpgqji+J8Bt
 RziRZA0Lo0jtItfvK4sj7l7X064HbKBto/7X0IV5ZzV7G2PWsQYMKcy8nWTeAp0SJ91LweRxCGi
 dCpbnG97XvlJPWvz7TALknFqkk7Ym5F04P9V/Ir4r1bDnVT7130X5kBAH20hqxnUvf9pvFjRT1Q
 MyR+HOlhENS0irkHRcaOxL76GkNsIjOnFhRVas/pVcrlNv1td4w/aNE+GNhCSWx0l5t7MVPb4Ly
 I6ZKAXtMg8IEiXJHHXTqmqPIlLgw112BoQ6baNtz+3gDvH891HCqFjqFfc4r9g46i6VO1uH7Wtp
 dUPzKvH5S97GaWDjLDfMOwEbRrDfeXv8SBzZaFYkHOqMYqk9f1jkS3GKf+ZdrymzMh2/bc/DCYh
 8tbwvfnw==
X-Received: by 2002:a17:903:3ba4:b0:2b2:4029:d781 with SMTP id
 d9443c01a7336-2bd7e8c6819mr166862835ad.20.1779110764953; 
 Mon, 18 May 2026 06:26:04 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5bd5f2cesm153402635ad.14.2026.05.18.06.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 06:26:04 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 21:23:44 +0800
Message-ID: <20260518132344.1008402-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [Linux-stm32] [PATCH] media: stm32: dcmi: avoid double free on
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
X-Rspamd-Queue-Id: 41CAE56D94E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:yannick.fertre@st.com,m:hans.verkuil@cisco.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:lgs201920130244@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com,st.com,cisco.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FREEMAIL_CC(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
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
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.990];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

dcmi_probe() allocates a video_device with video_device_alloc() and
releases it from the err_device_release error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  dcmi_probe()
    -> err_device_release
       -> video_device_release(dcmi->vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free dcmi->vdev through vdev->release().
dcmi_probe() then releases dcmi->vdev exactly once from
err_device_release. Restore video_device_release() after successful
registration so the registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 37404f91ef8b ("[media] stm32-dcmi: STM32 DCMI camera interface driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 13762861b769..a6918fc618fb 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1990,7 +1990,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	dcmi->vdev->v4l2_dev = &dcmi->v4l2_dev;
 	dcmi->vdev->queue = &dcmi->queue;
 	strscpy(dcmi->vdev->name, KBUILD_MODNAME, sizeof(dcmi->vdev->name));
-	dcmi->vdev->release = video_device_release;
+	dcmi->vdev->release = video_device_release_empty;
 	dcmi->vdev->ioctl_ops = &dcmi_ioctl_ops;
 	dcmi->vdev->lock = &dcmi->lock;
 	dcmi->vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
@@ -2012,6 +2012,7 @@ static int dcmi_probe(struct platform_device *pdev)
 		dev_err(dcmi->dev, "Failed to register video device\n");
 		goto err_media_entity_cleanup;
 	}
+	dcmi->vdev->release = video_device_release;
 
 	dev_dbg(dcmi->dev, "Device registered as %s\n",
 		video_device_node_name(dcmi->vdev));
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
