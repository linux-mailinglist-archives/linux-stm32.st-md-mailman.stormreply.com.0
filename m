Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F11AA8D7905
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 01:25:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C122C71288;
	Sun,  2 Jun 2024 23:25:05 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0B3FC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jun 2024 23:25:00 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52b90038cf7so2059009e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jun 2024 16:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717370700; x=1717975500;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uMHRLla4ILsm5OyTHPffYpll4rFbwg7rZ0xiqfrtlAk=;
 b=AxZsGBug7LwbgGg1g21o5NLDjTGbXUFHrgievegT3oHQnumfdZEaaIFqW9IqOYwcf7
 ut7XTjQb0NNcUvGN/iAtayEL8eleq4mGAcSDjJFEuA3TLc2BA6+DzASNJq9wZOY3q6bI
 bEZgINmrjfTIrD5Ipx4zb8qoyqLysWky527marS1plTxOxf3pEAhKmVo7tfzajmZOysG
 gDqj5laF2EgxcfdhHbQECdjx4pxmBdBCxBxmrRXZWEYBRzTvCCdWoJS6OgkJzoPnS1x4
 w9AORCR39Saz8+iw4r5jZKZBESM228FwEEbqMoV2vnBRkwCbINs0UENwmILiXWs4Stvp
 gYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717370700; x=1717975500;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMHRLla4ILsm5OyTHPffYpll4rFbwg7rZ0xiqfrtlAk=;
 b=JgiHROUI7cdsqheUFx84OdLTSfLkbB8w9e5guN2UGeVaei5poCSheWU51uCFGboVtW
 vjMzibZts+60XHgzrWuXLeg68wYjO8jbWDSbGGCYxObPgcKoBbDelJhRo9wsZUEsgpRE
 4dxQQ/aadyozpJ70VwvPB67JXcUgMrNlDc65e7KEplfD9O+uGmFF1dbwZ8JM5Vful5wX
 XYfku2Pf6Dj7b0luFu5Losy7ZXNwL5ZxvEcI8kHstK7CEVRzFHAuWSjHSMB8ZqwzCAP9
 49BIW0SnVHSOfVKgw+B9nKJ35Cu0I+KVUzRNvHAL9fI/ovUQmxEMwM73RI7i/lFfN2Ri
 u7Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWafbsSXUcpYqy+RWQHTG30M1v/0bvVT+7RSUPVRBGU1a0CPd/R0spc/XArVKG72of97UFGL1zum8qqJ2okoQBaSHWXJhJ/xZiSk+a+bj/iNWUAZ0CrYtbx
X-Gm-Message-State: AOJu0Yxy6MpR+FjgdHIyNQ7h6Up01pQmbtC9jCyKsp0AamSsm1sttRlC
 0hT4c5p6lHFylaKx0pYAoTev0CjoCRK2JzfGv5rTuJRkhGhcTyAweJ4Uu7vhARs=
X-Google-Smtp-Source: AGHT+IEinySEY+8mUF5JebFptkGUEBHH1p6v8JTLm5BkjmrOYM/dSR6lKjEU8RJ2VRVXxIay7X04zA==
X-Received: by 2002:ac2:5927:0:b0:523:b19a:2602 with SMTP id
 2adb3069b0e04-52b896c1583mr4583720e87.54.1717370700174; 
 Sun, 02 Jun 2024 16:25:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b959008aasm392369e87.269.2024.06.02.16.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 16:24:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 02:24:58 +0300
MIME-Version: 1.0
Message-Id: <20240603-ucsi-rework-interface-v1-5-99a6d544cec8@linaro.org>
References: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
In-Reply-To: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mrPf66+/PzNa3/0SVv6o28YNwb3VM608GVeFzUihyTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXP9HAufR5oVjQ0LWVWAxSmYfDH5vS6wJiYuZ1
 dHGzcQ447iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlz/RwAKCRCLPIo+Aiko
 1WYeB/9JZcDHr+OF40i0unPYw6KFSmRQ5469nPCT2YTGknUhZXQSaNZ5MjbUZg7XLCeUYccokgJ
 y5EPZdDTaWFO+eXLDilcoFpoNzbs4Kowo86yEfvPVm2YzydiXpGCkvHSnQcEskFxHbUnI0wEQSt
 zspOCM051maHPSZLoGtbJ6mt/sZ8KJiTBfc0iQi+XER2c5/lwFA0rcfEXQXEfqECNWB8tn7HF52
 W23c3lkftFGNTtNSGwh46VWLlcJQ00eVChhByC4oPoyqS+taGwm4IM5ROUGdRbI8RhVxx7BcVF7
 mLr41IHkns9dAUC5Ut/0i3z9vQBkNOX6Jz1pOI6DlKLYaPg3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 5/7] usb: typec: ucsi: inline
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
index 54a2c505442f..ac4bd86b3fae 100644
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
