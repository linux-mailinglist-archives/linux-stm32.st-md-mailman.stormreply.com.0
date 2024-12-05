Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7F9E606B
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 23:22:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83690C78033;
	Thu,  5 Dec 2024 22:22:48 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADD45C7802D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 22:22:40 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aa54adcb894so248528866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2024 14:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733437360; x=1734042160;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m3lyXrqzIu+Kk45XA+AociMWK/OJuQLe7K4aBvShe1s=;
 b=Ynw1zZRGZ8ZSwtD6GGEsFvAGbSd+IkpOzOs5Rn+DZyVjM6dhPqNebdUs6tpNLGtGov
 64PQ46wRhSRPaXeoGF7O14I/dWyqW1OdGPSI4HIjlC8ujmdldHTj8SPyVDG5e68/L0bd
 1z/aHfZ4CuaIkYTJ1ThE1grb5se4OT64yB+xktNvR3lpQAA5dWVzO9PIZO3Ot5OQ+UWs
 yxURE9YkZ9l3ZaQ2cxCQFt/M/g5R9yJe0pPfmRl84IMVjgpo39mDGqZLEpw2JXW7Caw1
 x1osr1OyDPcEfazqmXlsc8dmJ5FHOzaZIGwQw/Oi54j3JghDHUOCbP9GqsYWvQq1zzjz
 /b6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733437360; x=1734042160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m3lyXrqzIu+Kk45XA+AociMWK/OJuQLe7K4aBvShe1s=;
 b=gssQx9FFFSAaw4A5QfIbhAi4LRw+rb3cWP+RzkxvFIuOyLSCzC7f+H1Y+GNEDfiyjr
 3kGyTMzTx/L8EoyJogQ2Lm8heHQhb4OTEPaJqSifgB7pu9kmmGiBkn0G2BsklmgTmlTB
 6HQ8FFmDUJWjhK/6KOiHaTLV+WHnm6vxVJxqkgpzCHdeBJQ5PUtW37zNZEAiCGIVMHqH
 orxCJx+9/jpW8AYweDBJoS9XqPb1y94IxO+SpcPAbGxByBCCIOn/mptgmbdl3dOC0QYX
 BRcbrXh0M68rOVSQEJM7IM0lGZOzSK/OoqYPJLTG96ltK16TxU8yBRVIfvM4iyDLf6Js
 YpgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpqWLMbEHFPcrRA737WZXHcN+j420RbmLD6Al30v5LgBkbq30Fpz6+LlI9/tVkWH0O/zkM8y2sSLewUA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx+LIbhGXAba/o/Wr9WPFmfP0w3eajsXKM2WYqcv27yYDFJYPqm
 KH69Qiqm3DAJ2QcuEGWHHDPpogWpLoAYrmNA+G2zj27iN3i0JXmt
X-Gm-Gg: ASbGncsyGTyHZMIBquyijjeUsBr5kOhCSEgnlJUgSu0Peyc62XWF6P9JNsZzoYO93sf
 XO2mXyWbiMgyOv8TuqDksrr0iQzLg0ytDGy0PlwCP4ACSg8N0FAwWKpJaAamLabD/YlOCAswmP8
 BJ3NRQ9KMBdWSbFlFpJKMH+NWke7UfnRAXVUBZKFFkLDyNSkursEOcvEm0KWWXjVnc07+VqAdtw
 VvpdeSsGPjaHfWdjWGC/7uIDfIx7y4XL83tYDfbSX80TcP+wkB6Iw03QsJj
X-Google-Smtp-Source: AGHT+IGcrLT4gONP5gatqkYWWG2Utr7wcaZ76fP3t5w0AD0MTmF9LBS0SpqfRAOkQ11uPNvWm5iasQ==
X-Received: by 2002:a17:907:7703:b0:aa5:449e:1a1d with SMTP id
 a640c23a62f3a-aa639fa434cmr49156166b.2.1733437359965; 
 Thu, 05 Dec 2024 14:22:39 -0800 (PST)
Received: from localhost.localdomain ([83.168.79.145])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6260e33f7sm148805566b.183.2024.12.05.14.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 14:22:39 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: karprzy7@gmail.com, jikos@kernel.org, bentiss@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Thu,  5 Dec 2024 23:22:21 +0100
Message-Id: <20241205222221.3094702-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com,
 skhan@linuxfoundation.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCHv2] HID: hid-thrustmaster: Fix warning in
	thrustmaster_probe by adding endpoint check
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
 drivers/hid/hid-thrustmaster.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index cf1679b0d..6c3e758bb 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -170,6 +170,14 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 	ep = &usbif->cur_altsetting->endpoint[1];
 	b_ep = ep->desc.bEndpointAddress;
 
+	/* Are the expected endpoints present? */
+	u8 ep_addr[1] = {b_ep};
+
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
