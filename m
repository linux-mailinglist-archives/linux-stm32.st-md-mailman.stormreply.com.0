Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B62A744F8
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Mar 2025 09:05:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C4E1C78F9B;
	Fri, 28 Mar 2025 08:05:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29E90C78F73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 23:13:39 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso11205715e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 16:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743117218; x=1743722018;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
 b=QutyDBYNUZJIw8g5awhCL0vFsM2zU2JL5mbXAydWl2FSQZIldkptD+2hx3iIKE9D8d
 VzOC5zfsHhgMUutXvzfmJygNa3yVaYB8g+7TwDMK7muY/zJtqFF6ecnjHRypQ9NaDCM8
 HPKCYDW0gx6VYhs1y3Hk26eySGFzzsFmcfYzOKtC7TreOalxQ9c7U9MXYgkVhrEd4K+t
 nPHDJTfPLGo8Mz6kIlyTCQ5cyfhyNAIg2TYCNh5s4Qe2Fq2K+Ay93VGejaAEW8Qek2an
 bU+8kU+RUg8g/DH6HA4wH1d2FfpF8QjWbLJpP6Q3THDR75KVXgLkWS4lvdGlLPaPT3wi
 s/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743117218; x=1743722018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
 b=tMc5sEvWZICwsedgf07NWhYka8mj6FGf7ol2Iownl2MLRZbKXMskRgYIj+5WGLIVSy
 vqFsT3wLJqNXF6nlbXQL2T1TW8JZoIXW5+YAMc4caNAfVp8w66oNjpGZabi6Axcsk3wM
 e3oGvy8P6gCS/s6pHgYlDGQlsp0V5oRxBgnteAQBR+iEZcm+rzGs6ZNKbn7yoZmOPV0G
 XqtiYO8HYUhhj33yDJEMPzhQ1zVQzCjc4m7sxh8uL5TsS05QRoqq4s2PWj2Gb3GzntOx
 O8s5vo2yrVUNnk/g43XOHdPNwz/NC21Ux9E00w3/5EziVy3gFRhlM5OhZjBc2FlCxGF1
 biPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4eo1/2KQYM7wUcnwP1+iUxotMJc0/rZwg5N1XUlgBv2AUzDHrMchHS4KjsfbdQ9liMyg70UG3ToOZzQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw9tiRQAaQFhY5s2+yTyvEyoQj5VeSTjTu/QwaY2Phr6NIuZPdP
 5jxEqeQaffj/vnfKyDHlOsgERaS97gpWRpJavKKUzqiXyP7Dyzqo
X-Gm-Gg: ASbGncvpHfwvzpmv5JuD+KHte+SBn+6xELhMqOMkkiBUmJXwnTghMdW3F4Rh+vyZdwy
 8k3AKiOy5oq7HbIZKh/MsrBv0C+xOhChOcw7Wib82sHV5xK9r8ju6zbzDvtLLK00zmDDTs2/Jvs
 dWUt/UkbKoYA0HT/DZHsbOurXTVkfB8c6LlrnD0rd8eT3ZiJkUP8/TJtgxD9Ut5FQ/GS5N4I3Mu
 jdLZ35IsclHeT8O78HD3FVowcznHoibx8Wl5F/bwlMHfA+FbC+nXfiwX1tEn2yQew38W79mJjEg
 FXYOpW8VvM8WPo8cPpajX1UnRgc9bq5F3A0x+vOosno7oA==
X-Google-Smtp-Source: AGHT+IETOZ4c3GApnoFs7MN0qkl/1HBcaEp2e0Y5v9Jar1Q6i8U47juByr5xqoThiy0+bdfqPLYyIg==
X-Received: by 2002:a05:6000:184c:b0:391:4095:49b7 with SMTP id
 ffacd0b85a97d-39ad174acd7mr5478950f8f.25.1743117218225; 
 Thu, 27 Mar 2025 16:13:38 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:80e7:c933:bc4d:7e80])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fcd78bdsm9151775e9.24.2025.03.27.16.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 16:13:37 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org, bentiss@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Thu, 27 Mar 2025 23:11:46 +0000
Message-Id: <20250327231146.6388-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Mar 2025 08:05:20 +0000
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: [Linux-stm32] [PATCH] HID: thrustmaster: fix memory leak in
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
