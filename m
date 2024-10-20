Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC10F9A5F85
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 10:55:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55CD6C78039;
	Mon, 21 Oct 2024 08:55:03 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE90FC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Oct 2024 14:47:50 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so4803884a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Oct 2024 07:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729435670; x=1730040470;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jKc4HUiSL08fbl+1Cp0m4Wtmx7X/6lUCNDJ1T+im9NM=;
 b=LmA6OgQ2Cu4CExUByzqMLqk6FYAojQPkOVqOnA2TTFg+BATdrtGioSQE/7jUdJ00tA
 Oc/vBLOCAUGnwsPw4B7Js0EAFWmm6YaaZpFAX3NTLTK9CYMnZ2MEYnu7lRS/bdBktq/r
 pImFm6k56LRtbtGbk/w/TmxYLG2MTlWf+4ymFn3FhHEVne0XxXPayHRYXx+IG1iSnsP+
 kwYmHVAzdyCYDeOAT6lz0hgVIRJFoesngZiNI5cXTlixPIb4+5xJk2OEn0EAygibcQt5
 IdVNFvbfJS/UvXKFPUsLFehe108PXVqTTHu+8P23L2XVYCANp2uQiRXjb+WyZEb2XhHF
 mTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729435670; x=1730040470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jKc4HUiSL08fbl+1Cp0m4Wtmx7X/6lUCNDJ1T+im9NM=;
 b=qOD5BVPuGB9CeroMywXCp9arvXoxI8OpViZb6P7tjhtRaWy6d9TReLK1zfeXZBXz5Q
 x8iz5QGviJhbR1C7Z5UXCyFqATZR/V3um/Czq2aqr+U4v8569tzM/hYoVPIPDcS5Jk9y
 iGCjt7yzlcCmPSjJw7CK3bVs3XMGAx1apasl3OhGUJuMNJpIV4Vgl+iQ7v1oj3MLPfDg
 BIyfo4szU6p7lKDj8UdPnWgGf9n2AdZV78DhkcsXXBMBk2Zj8ldVEdzGN8q5Q3cCIbK8
 xBvI/EZ88SY9STZy7v3w1rglSAmjvNrG5wf+kFOr2IwnS7zsyeSsFed5IEAQxJw+orDz
 UvxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw732n8jpLVr0lU3JbwSHzDs27hvepwEhHjA1uXeK4r/EpPTiEkCbtOq6cmMLQS+V9xRjIt7j73EvRgQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzrpE3v0eez1o4tSqYM6G7qmo5xAQNGYTW4kb8GqmZun3ZdNjgA
 aThDDUC/2o0P/BzdAexxO5vGZe7NJNqihjEYwU7mWSXyJD0Kv+Mr
X-Google-Smtp-Source: AGHT+IGHD3C7WMAfwu034gemcUPBTbi4GTHeY+VlhD+dixphZLpFTmlYZV+o5j5E5ifFLaLvCDDMXw==
X-Received: by 2002:a05:6402:34d4:b0:5cb:6729:feaf with SMTP id
 4fb4d7f45d1cf-5cb672a12cbmr1857651a12.16.1729435669814; 
 Sun, 20 Oct 2024 07:47:49 -0700 (PDT)
Received: from localhost.localdomain ([83.168.79.145])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb6696b525sm945788a12.16.2024.10.20.07.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 07:47:48 -0700 (PDT)
From: Karol Przybylski <karprzy7@gmail.com>
To: jikos@kernel.org, bentiss@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Sun, 20 Oct 2024 16:47:36 +0200
Message-Id: <20241020144736.367420-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Oct 2024 08:55:02 +0000
Cc: linux-input@vger.kernel.org, Karol Przybylski <karprzy7@gmail.com>,
 linux-kernel@vger.kernel.org,
 syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] HID: hid-thrustmaster: add endpoint check in
	thrustmaster_interrupts
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

syzbot has found a type mismatch between a USB pipe and the transfer
endpoint, which is triggered by the hid-thrustmaster driver[1].
There is a number of similar, already fixed issues [2].
In this case as in others, implementing check for endpoint type fixes the issue.

[1] https://syzkaller.appspot.com/bug?extid=040e8b3db6a96908d470
[2] https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622

Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
Reported-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Tested-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index cf1679b0d4fb..f948189394ef 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -170,6 +170,13 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 	ep = &usbif->cur_altsetting->endpoint[1];
 	b_ep = ep->desc.bEndpointAddress;
 
+	/* Are the expected endpoints present? */
+	u8 ep_addr[1] = {b_ep};
+	if (!usb_check_int_endpoints(usbif, ep_addr)) {
+		hid_err(hdev, "Unexpected non-int endpoint\n");
+		return;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(setup_arr); ++i) {
 		memcpy(send_buf, setup_arr[i], setup_arr_sizes[i]);
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
