Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F34DCA7D058
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Apr 2025 22:35:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE31CC78F85;
	Sun,  6 Apr 2025 20:35:39 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61B6AC78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Apr 2025 20:35:38 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3912ebb8e88so337253f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Apr 2025 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743971738; x=1744576538;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Oni6Z/lHvJDm4dC2qfnAqvwTkcCLV7N0fQ4hIhJQyc=;
 b=gpVPL78JY0tdZly3puRIitbXK8KvW9P2yOHuHiEV2QUsgZQ7dI1kwinWPksBKpZXTm
 S1SbG/4/cqxEyqpQ1k/AJruGFaPsfdQJbKfmQ4bObDGZQ0NfjlWEUCre34r93sVRsW+j
 ohDc2pSEkYdTzaOnn/kyecbP3yn2nYnfkwpMPgkyC0XdSbxRd0yvYQJjQy8NzDIlGL2Y
 s9tMEt3lIq0I5jUCihJryrz9KN2CJ0QDTi3pFCjCj0KL015vo7zI6+dhs5b2TGBZ5KCr
 Nwum1tpXEUuuPfeu4h5tLfHe6RD6RizK6cAhngTzLzJSaj4Je5baZ1R6116XyiP+j09c
 0jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743971738; x=1744576538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Oni6Z/lHvJDm4dC2qfnAqvwTkcCLV7N0fQ4hIhJQyc=;
 b=gMAOVmq71nBMtGF3+jomlnGU99xeNKV2eLypjzHlUAHhH7ZCAqpJGxzrEnlTjcf6k4
 BdNqPhBUtyQLhbQgBUwJs1iRhJCgd5Kwis+7a17wqoENo+5qLvueLbUHP1mAcXHC8lBE
 tWU/BdGX9TelSMBof68W6JnS6/n+WCl3JDjCnw/AY7LYTYEJtcKAnstebjiMmjBwnFfh
 uvfK4kqF55bHkwIeOwLVDgw8fZdvVbSWsm0sc6Rk5Zp/FaYKfZdb+Wv6T8bgxgqonU5/
 REuchsTCjlqKGigq9rn/YoNfxMann6y1q2u48P/GlSJjAcxsGALC6nMlaP5k6J7n0R2F
 wAEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhMBE4tqi/VD77nuP+4kBnUCtKn93/dMsMRL0R7QgLOcCCyRDHwHikpW/Qm/0pcnOAXbxnUF0pc4Xrtw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzpKAF9l6FXFbfcwMrLPBKE2OjXb86XbQ4y4eoUTTVtLZxGktO3
 KHw/XsZc7cIJe0C8Kad+J552DkfOAPO4RNrEdAlY2YxE/O5D1DJpARnFFfjqsvc=
X-Gm-Gg: ASbGnctfocmGgEa+/nYSxSuQLjvPLaG1aCcQDIlUf9jkvILAlOJ9tj8XXxBOS/n9PP4
 Dtbc+Ydf1lbdEv9GTJfgKKJ6W7sXJtTVVucGZOrt7UGZm2R/vSZihE9RUlEcmT/Z8d6WpP2mpyw
 ChyZz9bWIPYzJwvqIjoyS/E/eBVzFvYVgr2RkJdHFPHjY+/JMIi5tLnJZAhAsEZlpKRCV8U3Pq1
 v8DtE33rwcxzMC/MYu31DVnKzf+c+Vjcd1QrWE8fpIDnogX1enZZM/2B9hFWLeJpxToPijoILM3
 ug/NsbTwWvq933oQ4vqSGSI4Orf85oJM0TLagG66f7Br2mB2VIJeKw==
X-Google-Smtp-Source: AGHT+IFdkV0qo7M6MnBRCoiFVbhYiS1XD9xft1NUY735rauYmXbOkSn8HVSEp3wFfmum1Z3fJ/qIqQ==
X-Received: by 2002:a5d:59ac:0:b0:391:2a9a:47a6 with SMTP id
 ffacd0b85a97d-39cb3595265mr3095383f8f.4.1743971737746; 
 Sun, 06 Apr 2025 13:35:37 -0700 (PDT)
Received: from shite.. ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d7c6d838bsm38022f8f.69.2025.04.06.13.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Apr 2025 13:35:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Sun,  6 Apr 2025 22:35:31 +0200
Message-ID: <20250406203531.61322-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
References: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/2] watchdog: Correct kerneldoc warnings
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

Correct kerneldoc syntax or drop kerneldoc entirely for function
comments not being kerneldoc to fix warnings like:

  pretimeout_noop.c:19: warning: Function parameter or struct member 'wdd' not described in 'pretimeout_noop'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/watchdog/pcwd_usb.c         | 6 +++---
 drivers/watchdog/pretimeout_noop.c  | 2 +-
 drivers/watchdog/pretimeout_panic.c | 2 +-
 drivers/watchdog/wdt_pci.c          | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
index 132699e2f247..b636650b714b 100644
--- a/drivers/watchdog/pcwd_usb.c
+++ b/drivers/watchdog/pcwd_usb.c
@@ -579,7 +579,7 @@ static struct notifier_block usb_pcwd_notifier = {
 	.notifier_call =	usb_pcwd_notify_sys,
 };
 
-/**
+/*
  *	usb_pcwd_delete
  */
 static inline void usb_pcwd_delete(struct usb_pcwd_private *usb_pcwd)
@@ -590,7 +590,7 @@ static inline void usb_pcwd_delete(struct usb_pcwd_private *usb_pcwd)
 	kfree(usb_pcwd);
 }
 
-/**
+/*
  *	usb_pcwd_probe
  *
  *	Called by the usb core when a new device is connected that it thinks
@@ -758,7 +758,7 @@ static int usb_pcwd_probe(struct usb_interface *interface,
 }
 
 
-/**
+/*
  *	usb_pcwd_disconnect
  *
  *	Called by the usb core when the device is removed from the system.
diff --git a/drivers/watchdog/pretimeout_noop.c b/drivers/watchdog/pretimeout_noop.c
index 4799551dd784..74ec02b9ffca 100644
--- a/drivers/watchdog/pretimeout_noop.c
+++ b/drivers/watchdog/pretimeout_noop.c
@@ -11,7 +11,7 @@
 
 /**
  * pretimeout_noop - No operation on watchdog pretimeout event
- * @wdd - watchdog_device
+ * @wdd: watchdog_device
  *
  * This function prints a message about pretimeout to kernel log.
  */
diff --git a/drivers/watchdog/pretimeout_panic.c b/drivers/watchdog/pretimeout_panic.c
index 2cc3c41d2be5..8c3ac674dc45 100644
--- a/drivers/watchdog/pretimeout_panic.c
+++ b/drivers/watchdog/pretimeout_panic.c
@@ -11,7 +11,7 @@
 
 /**
  * pretimeout_panic - Panic on watchdog pretimeout event
- * @wdd - watchdog_device
+ * @wdd: watchdog_device
  *
  * Panic, watchdog has not been fed till pretimeout event.
  */
diff --git a/drivers/watchdog/wdt_pci.c b/drivers/watchdog/wdt_pci.c
index dc5f29560e9b..3918a600f2a0 100644
--- a/drivers/watchdog/wdt_pci.c
+++ b/drivers/watchdog/wdt_pci.c
@@ -264,7 +264,7 @@ static int wdtpci_get_status(int *status)
 	return 0;
 }
 
-/**
+/*
  *	wdtpci_get_temperature:
  *
  *	Reports the temperature in degrees Fahrenheit. The API is in
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
