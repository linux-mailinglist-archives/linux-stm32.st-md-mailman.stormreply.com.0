Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3324A7CE26
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Apr 2025 15:36:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66D6DC78F69;
	Sun,  6 Apr 2025 13:36:07 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E71EC7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Apr 2025 13:36:06 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so39060285e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Apr 2025 06:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743946565; x=1744551365;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
 b=baLdBjUfin7moVXpqfzFNuZQeDJICELfXgoE6Osv7/+hLjeftiWLYZkeJa/+RFqJo0
 779IAQRQ+QnoNBUfQgOeXguBQFrIwfzc/JTVRvTunrpYsDJNkX9Yaw7K3jPIoYhqOdYI
 OO/IpTGzyOcSMTCsgEXUtXm4wayC6mO+VwEyaSR6qBvV6CVgRCAcb4LKKT/QnDZSm3Y5
 eyGtQawdPHtNOJTwSKT0s7Za39ubZ0soVKkhFEuE+QPBjpBom6hhq3rQzmlAlKgHRIUb
 83gifri2FEwe5Knt5B5K3U6xVBLZMB0sh7gYG+TL3igYEEVmkbPvHgIbFqzOxGZFoIDC
 igOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743946565; x=1744551365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
 b=h5iy6NcFaC7PIf7wYf1rgpU4tZj/fzmvWHzTS3a1GtNZYCFXgk5y+hqo42/kaQ3/bs
 UK7xRjP50AI83ItCA57218ZgS+MsCbeEW0cEaGJ0EuzJBBscyDqSrBPzZt6QdDi95+zv
 fe34CoA3TIJj1lfUEcq2azdAvTmg6EvvNAJLI0m2obSNF4oFojks7AjDfzf/VaVdMB/f
 gIiWe6l8EclzVRB0yaPTo2WWano7SxmJaPFFTRoQbSNfWGUvXJRosBZ0f+VclPsHRHn1
 SUBPGNCoj/2+kbQL3mPFaQq/e4FsYo3//+5ZjSWlakwYHO2JNHi0PqK06pjL+1DEI05w
 1Y/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsrJURtiwQdfd/GFwmpPPh3c9PEoTTLhZ43xG2ILuYJ3fXTE8/2outBPRu+Xz9IVk5odYyk1erOuxQTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyY48MXc0kLAR2+8x49M4ovc9a5YZ3WuaXccCSZ6nOYzL5vozNM
 apNxZ/WuwQYyXGuRR2+UnxFYWWJ74eA4CCHeb9UWsMC/4RjtRawh
X-Gm-Gg: ASbGncuSAoZlVV61nHHJVg7kpPbeToP6nB0bLVPUMD2ejF/G94scl12oMPPLoqUk8Tb
 TPXdKlur1wKnqo2ymR9l7FN5eiLebln/5t4l+JLCTbhYz2x1U2amUt3DyYZ+NRlaC2yCTHvrL2o
 SPB+h94hoXVbLT1NvB41NkaR3e2fMkL9NP0EHXY7Kxc4DZEziikCLhjZYG5mS+GnVHZh7r9XCJw
 sklTsQduBobmh9o2CpsD5vaCOkQrqqb/5nvUbzmQRVApQHlqSFZgsv6v/ssbvH0vGFgCMLOh6D2
 RYQI8dGx+aa5zahiyPb+XYsng1LPOcbpeFlD2ac+RwMyKQ==
X-Google-Smtp-Source: AGHT+IGaLSX5abguqVbP+J6yIKq+sGqu7t/mSZeOJdHosj/2KCuKMRBbvEKTP1d8iNP8JedYaFysdA==
X-Received: by 2002:a05:600c:3d94:b0:43c:fceb:91f with SMTP id
 5b1f17b1804b1-43ed0bc8d58mr87064365e9.11.1743946565281; 
 Sun, 06 Apr 2025 06:36:05 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:e805:af55:cd2d:e06f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec36699e0sm100652575e9.35.2025.04.06.06.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Apr 2025 06:36:04 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org, bentiss@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Sun,  6 Apr 2025 14:35:51 +0100
Message-Id: <20250406133551.4576-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: [Linux-stm32] [PATCH RESEND] HID: thrustmaster: fix memory leak in
	thrustmaster_interrupts()
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

In thrustmaster_interrupts(), the allocated send_buf is not 
freed if the usb_check_int_endpoints() check fails, leading 
to a memory leak. 

Fix this by ensuring send_buf is freed before returning in 
the error path.

Fixes: 50420d7c79c3 ("HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index 3b81468a1df2..0bf70664c35e 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -174,6 +174,7 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 	u8 ep_addr[2] = {b_ep, 0};
 
 	if (!usb_check_int_endpoints(usbif, ep_addr)) {
+		kfree(send_buf);
 		hid_err(hdev, "Unexpected non-int endpoint\n");
 		return;
 	}
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
