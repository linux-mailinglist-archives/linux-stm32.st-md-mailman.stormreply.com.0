Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 418CD9115FC
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 00:55:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D12D6C7128E;
	Thu, 20 Jun 2024 22:55:31 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DA20C7128D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 22:55:27 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2e95a75a90eso14033201fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 15:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718924126; x=1719528926;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EQohNPpaTb5KYVE0BZu3/ef4lat3R4WjEfszMMJQNKU=;
 b=UUp8V2QzFbBD0YrLS6RnqxwzlRYL8YqdKPLR0bYTrly4xNlrK6vfEjV0nJ/xJuUWt7
 dAihFKTBQoduGtMni4H2N5TzvCE5tb+XMNsvD3x1wgfEUedVjXj0GBd10WU8q/nMXQgV
 dwstSNMQS33dPDKVqzhI0U9dT+59iPcR0tAKLad7WPw+aTYUHlr0rVz33VL+mxqI+R7i
 ERSEXXtKso9ssB4hrn/JgSf5ZASfi8rKq85wjBgIeALVlx8d1Vl2hF/DVgmfthZeUiyr
 ROPSwTdZLgtjok2IMOlqtAdY/UkFJyzeTA4oyoDitqUz3OABi9uxX7d1eXNGmGHA5ItL
 +XXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718924126; x=1719528926;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EQohNPpaTb5KYVE0BZu3/ef4lat3R4WjEfszMMJQNKU=;
 b=PVZc2BKvirVAxIEFQHGyFjuDSjjxKb60tOkEY7mRvitg4YZdwCeSR6QLd88qspOFqV
 teMsHa78BftW8sgPeTlpZ5pkl7MWk9uMEKXh3Bf+Ip0maCxZuuiRde6j//xNcfVJFRlu
 hjlsmtIFSSAa70VIeZp34gGOJC4zsykrt/Ls4AOzZa7J0+d0ZEs7FMOS6LSM8e8taLa0
 hGtCvjPTdMsRDGQZ1M1SdO29RvGlHOEY5AgV1o2+jJV0AwJtSysdTM/VSCcsqMfvXifg
 NXV8QWHjDNBPhhrvWwxssqlDLDRh1WdmZD0u8XKCA7hp67xKk3oHMS6hLlevgePhucw+
 ACag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL5NC2pAtksQY6G/zqsWUj5o6bl5AYpOiZuLHcjUgsFyEJ/DPdMxFtC5c1SkN0dVrRKDh3HTT+FOHTVVzTGZgdg39fWxPIoas0I+HINv+ScTWU3oKbduvb
X-Gm-Message-State: AOJu0Yw6ZEHSvyJ4VwlvydEeUKGF9Z/0Jgs6K4KrxhoBupAbBG9Slcb4
 6R+CwA4WKThiGryJNBed/7l7aN36K4IEC6iY+iq3MvLzerSQcySaUkyxFAbKTYU=
X-Google-Smtp-Source: AGHT+IHiX4zKNBalbolTrJjjqJsWAjc1/tOmVInlXcwDg2oe43Um4+0q1bXe0brVi/wRnLVylxIuGA==
X-Received: by 2002:a2e:9e16:0:b0:2ea:e98e:4399 with SMTP id
 38308e7fff4ca-2ec3cfd74b1mr42903741fa.36.1718924126551; 
 Thu, 20 Jun 2024 15:55:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d60126fsm510461fa.20.2024.06.20.15.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 15:55:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 01:55:24 +0300
MIME-Version: 1.0
Message-Id: <20240621-ucsi-rework-interface-v2-5-a399ff96bf88@linaro.org>
References: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
In-Reply-To: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5JJ0FuTmJ51m3GFnw66fokeLW92y7ep22LnE63sLqV4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmdLNaDofb3amsRcu0qvjDc9UZGAvmIhod3B7mD
 g3oylyO/0iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnSzWgAKCRCLPIo+Aiko
 1QtNCACdBMXW0rp0duCVy1o696WTIt9Z8/8Fok4J2crdv8mHpLp/GVcEY0Ukoxe3RlnwPD/5UVu
 kxoogwkMVQAh4Dr1qvYAFY/Kte2dVgLzhY1tvMt+mBGza88/7dXk0fuXBKuqQooTBylLFIV/j3l
 LOozQbRYT9JrdTJ7epm7qs1OjKBfmG9qrKZ5hIf2Y6mhXA43e40xiBqBY+fwfjpWaJn+uUQTcpe
 jMIL3J/BU7/NkWKmtt9ADgm+4sxLJaPHfAwIAJQA5sMmD0kssmK79YxPf6lZNt3mI8OYZUkNC67
 Luoqk+ml0bImb8JxFgJ+JbQXLrTnXwVtQgWJD25MA+/Nbgkv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/7] usb: typec: ucsi: inline
	ucsi_read_message_in
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

There is no need to have a separate wrapper for reading MESSAGE_IN data,
inline it to ucsi_run_command().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 58d9602bd752..4ba22323dbf9 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -36,19 +36,6 @@
  */
 #define UCSI_SWAP_TIMEOUT_MS	5000
 
-static int ucsi_read_message_in(struct ucsi *ucsi, void *buf,
-					  size_t buf_size)
-{
-	/*
-	 * Below UCSI 2.0, MESSAGE_IN was limited to 16 bytes. Truncate the
-	 * reads here.
-	 */
-	if (ucsi->version <= UCSI_VERSION_1_2)
-		buf_size = clamp(buf_size, 0, 16);
-
-	return ucsi->ops->read_message_in(ucsi, buf, buf_size);
-}
-
 static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 {
 	u64 ctrl;
@@ -70,6 +57,13 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 
 	*cci = 0;
 
+	/*
+	 * Below UCSI 2.0, MESSAGE_IN was limited to 16 bytes. Truncate the
+	 * reads here.
+	 */
+	if (ucsi->version <= UCSI_VERSION_1_2)
+		size = clamp(size, 0, 16);
+
 	ret = ucsi->ops->sync_control(ucsi, command);
 	if (ret)
 		return ret;
@@ -98,7 +92,7 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	}
 
 	if (data) {
-		ret = ucsi_read_message_in(ucsi, data, size);
+		ret = ucsi->ops->read_message_in(ucsi, data, size);
 		if (ret)
 			return ret;
 	}

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
