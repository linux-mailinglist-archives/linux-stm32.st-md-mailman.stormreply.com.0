Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 868644BD6BC
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Feb 2022 08:05:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26274C60477;
	Mon, 21 Feb 2022 07:05:17 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACF6BC5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Feb 2022 16:01:23 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id j7so14276636lfu.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Feb 2022 08:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kiCO7Y3o/yfvY4Cex2AEsXYa2jd9fcUopAAuMMIl7X8=;
 b=UYW3P4C6klhBelzEbt4knsukbmG/vQrDalHcSOV/oA0N9z7KGI32MOaQM9QMiZ0y0b
 0qeYVp/Jk640kEgKGDf+ig/zbygc7XKgV9roR+KLswYEb/5tsvPinZmZfipxppUr4WC5
 LR4nrrxzta8WA2/vlM6MEgD5QSFH7uEf7/B8tlAh1IrBxvHQ2UdJ8AxGFv4utxkmJUOH
 istYxxlm1f/h+v24iKa6hGkxxBteB1jMZTr8ZRRc28MitrNyMSza35qZ/XUDNMto4FvY
 NyB7ioIyHTBNIjMZj1qjBF+br9vOdBhSxmG9wXurDHoqJ8o+biWqifbgDGHok/dKvKjv
 wLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kiCO7Y3o/yfvY4Cex2AEsXYa2jd9fcUopAAuMMIl7X8=;
 b=Mcvf37T2sMb+nBkTUGHxaHOnxGyFAD8T3ZoQBfKUXHq97OHpHe1r3GOk7NswQAvVJq
 L2xww7+pXioSUC5gM6xTjn7L/TGKhO65GNJTBsaBjkEfYMeaZpoNJkBz3jd5vPpvMnK2
 33S40Q/gQcrhhlUwBbXEiiiNemDmHuMelNHuNwyMD3WDAYcMPhvV+MrGESoA81lhF+UH
 pBZ/mFn5xNv8q2yLzkeB8tb4cZdgEaizHaZgGHeD49S2AdvakeiX6ccjQi4SuE5h/2jP
 A/nbQN0ZktuODKK/L0XRD+zUApRPKNdb8LHi0+IM5SrSMBExzf9SHl2zW0N9dW6D46EX
 lsFw==
X-Gm-Message-State: AOAM532/yMw5SDNQ1LUul/VC/VjuLJPqMhSUgg9aDCiJL+ZSJB7j+yAi
 LFuq6CzU39SqDd5QwfYjvLQ=
X-Google-Smtp-Source: ABdhPJwv9apys1DY/TwkeoLaXGUaOOzCI3U7YhVsxCvO6NPyAfRSsL06C6Isxw3fVxrX6fos67Xeyw==
X-Received: by 2002:a05:6512:390a:b0:43f:62f8:efd5 with SMTP id
 a10-20020a056512390a00b0043f62f8efd5mr11391942lfu.0.1645372882809; 
 Sun, 20 Feb 2022 08:01:22 -0800 (PST)
Received: from localhost.localdomain ([94.103.229.64])
 by smtp.gmail.com with ESMTPSA id y11sm1018835ljj.122.2022.02.20.08.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 08:01:22 -0800 (PST)
From: Pavel Skripkin <paskripkin@gmail.com>
To: jikos@kernel.org, benjamin.tissoires@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, kimi.h.kuparinen@gmail.com
Date: Sun, 20 Feb 2022 19:01:14 +0300
Message-Id: <20220220160114.26882-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Feb 2022 07:05:16 +0000
Cc: syzbot+35eebd505e97d315d01c@syzkaller.appspotmail.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pavel Skripkin <paskripkin@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] HID: hid-thrustmaster: fix OOB read in
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

Syzbot reported an slab-out-of-bounds Read in thrustmaster_probe() bug.
The root case is in missing validation check of actual number of endpoints.

Code should not blindly access usb_host_interface::endpoint array, since
it may contain less endpoints than code expects.

Fix it by adding missing validaion check and print an error if
number of endpoints do not match expected number

Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
Reported-and-tested-by: syzbot+35eebd505e97d315d01c@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index 03b935ff02d5..9da4240530dd 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -158,6 +158,12 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 		return;
 	}
 
+	if (usbif->cur_altsetting->desc.bNumEndpoints < 2) {
+		kfree(send_buf);
+		hid_err(hdev, "Wrong number of endpoints?\n");
+		return;
+	}
+
 	ep = &usbif->cur_altsetting->endpoint[1];
 	b_ep = ep->desc.bEndpointAddress;
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
