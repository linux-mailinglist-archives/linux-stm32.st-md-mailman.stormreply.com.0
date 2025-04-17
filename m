Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C523EA92777
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 20:25:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65923C6B47E;
	Thu, 17 Apr 2025 18:25:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5786BCFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 18:25:53 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so10712515e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 11:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744914353; x=1745519153;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
 b=kUaSX8+Sd2+QU/ymOe/c8hxWQAeq3a9ClgOnOqrRjWfFLtGoFuChijbNtBXE8T45NZ
 wC5criWvYS2qKzAoiJiXsNfo6e7dlPh4ZKa4OU6r5UiMl7cAne+jaFIuRjjkIYGk9lvg
 EVnGKIdRccmuW8Xb2UW8fJBMidZGZZx+aJ6rJeR7OGoJfUCSV7o9WgMIw7N6oINKEK9V
 0VO61jKGX4ra5xRQiPQUBwM7kBmQyUr1DswsSFKUhQ3s6ryP6Yl6Ln9XR5Y/jcRVseGq
 HqMbNOTzDRbIyefs5KopEeuUe5E7nb2Z+i0V/FPvxTQHsw96TBy+TsELA2ddu3uuZhEB
 MEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744914353; x=1745519153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
 b=jO9SLi5EOfePbQk+DC940k9yTrp0dPl+RMF5o71HPp40NC72tOL7ikytb/3N7NhOH3
 ovkUvj4tvM1fIXfZ4Y1QUa92ko8XNqnmATxOdCY7ZhhqQS6L9Zj/PQFEEyzaO1dTaNNJ
 rZYE1b99KPLTw5nTV02NLq1LlE5eY2RsBbNH4c66HvGK8DrRTkf4DPyQbANrQst7ZFrP
 mXtXWiftPlq3Fi6cUvIZxHPaFA6tXehRQeO40vpPSCOoGc72qeiVBCPcSTVRuNPMVcnY
 TT776ty2yZ66ykbZ9frsHLHop/r67dxEjIXSxDKHc4COScL9o09vXbHEwaASRpp/PKsR
 Q9tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy/e5WXeR/rHJJpnLt5QV6t5wF16ILoNc0+9IstmOMHlasoc/muFCN9/JKLz7QjDgGmI+njs9xksJvpQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxWbyNc/JS0qwoH6WfMdWQucyz1sENLDn8QfcwJ2t4Ml5Ck+MH7
 5dqW0TdtwQgEfOnBGu5S+iBVVeMV1fihRXdqfVAkTJzBzEmTQPcv
X-Gm-Gg: ASbGnctFNStPcVQbeSlKzD98miB9pjyJ/NpvYzHpZYUF7u23r2PDYsnNrWP/Qc1hsyJ
 y84Z1hRprCeNpLRP2bq6lQtRGKkLihaTR+N+0L5bI1sRiqhADorRYk+xibj8YG4R7DMxYnQ8wh3
 ZXs7rZEhvXEgcAQCxsYl2er83L35mC4WNsbd8GqSQKkfA7LW8Ghpc9XFZmhd5C7g/P0jlGXP/fY
 iOhjOKPaHiXAMl7tigw36mECnChMYCrlorxTIdDSTDnyclSBgmKqozMX3t1u85bkCSOW2I1G+Mu
 461072O6QratcJvvPPhJmiM/L9LcwRT1pQjBy0J+
X-Google-Smtp-Source: AGHT+IHWFOtrF+N20ECOnSfV+42jDn6aqmV44/diJP2+K061uVC6Elbk2/PzNB0QPE9GirlcymnYfA==
X-Received: by 2002:a05:6000:2203:b0:39c:30f9:1e57 with SMTP id
 ffacd0b85a97d-39efba3ce78mr4300f8f.18.1744914352430; 
 Thu, 17 Apr 2025 11:25:52 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:1efa:2230:869a:758])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b58cc0csm64908185e9.32.2025.04.17.11.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 11:25:52 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org, bentiss@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Thu, 17 Apr 2025 19:25:49 +0100
Message-Id: <20250417182549.36268-1-qasdev00@gmail.com>
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
