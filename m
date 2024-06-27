Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C042291A97A
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 16:44:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72412C78017;
	Thu, 27 Jun 2024 14:44:53 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C92C5C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 14:44:48 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so89986191fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719499487; x=1720104287;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=efQFGr6jGBKjwmMdwj9cOaioErJGFDxQ/6GTKiEu6I8=;
 b=azJM/l03A4dlRS1I9WoOCveS+0wZF5abb8O7N40dxXnvVTudC4MuXnlhp/FxeTaEQB
 ki5a8hJVkgTIFxkBu3gJzLxt3VsoOzSiQRyBvLu0o0Tpdvh4ZAPDwgDSTX8dwNB/Jn9/
 wOP1F0fq2sqylx4Zs6JClVQ9wTb8S7mF6u0iGiahnbQCG5EGi0oDiabn6xETwc8rBVCm
 XACAMnZA5R4MsyZsRcUqVw5ORn5+mu3Dv6upuKcvimSl4dcFm+/zGuuFiyvCMCXaVZab
 ZZFuBqii4y7WTMJxqwV2IKJEF356ZpXT3t5whlucphIsEsiOOx0GATN0Ys4eFNbfzQYf
 u87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719499487; x=1720104287;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=efQFGr6jGBKjwmMdwj9cOaioErJGFDxQ/6GTKiEu6I8=;
 b=VAwl2e8TiYKS7ksWSR1/VH8YozU/cnc9KNSd45dInt7zyofJxyCvM+vyTFRCX3x3xv
 l2Lg9WDsASuCE92xouTi571aZDFOejfChCSsW7Lrb4y+R6cQxa0OAiJjs4mZxAdLoMAq
 FZfcAMLM3BWAQt+wLX84YqtaM377KyWckjZKtxFpnX7NkUt2oUQeAPJQNwLWkzhgrWTi
 DOMfiwYnDR8iGT/ng23zEAvXd653zQvupNsMgOc27lLEyZlK13B7/auf09ru3WECjetG
 XV1euAFF5flX54nhgoDsdMNWJler/BjPEeK2Kmp9g0njwNxHg06cTN10S9uAbzIdxWqk
 6w0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV37wV7IiCAdHhtapx1dHZCin5cUVmojwfTQmvBIurq8CU36x+QZiuxBSaC+5riL8gQzX/cuuxyq3b+BqG03BoBRwQT/0DQuOuQexd4IIanN8vaUJcaxDoB
X-Gm-Message-State: AOJu0Yy4zmTdFzGQBRDzsgmOchVsjLkUbvr9W4vyXNBABb8Q3Gsypxf1
 D3LIzUrL1cSuDmfRCVliwIbo0HS516MmRtTpcOanVxomel5uBEhqlQVSzIPsH2c=
X-Google-Smtp-Source: AGHT+IEEpm4AxqCI4MvWw10l4nicg9YGmxodxCLh1opitXtQr+B6jBW4EVR2xxnMzOMkHx2ZA4GduA==
X-Received: by 2002:a2e:9e96:0:b0:2ec:588d:7eb8 with SMTP id
 38308e7fff4ca-2ec5b37a303mr79821721fa.21.1719499487664; 
 Thu, 27 Jun 2024 07:44:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a34447fsm2775911fa.11.2024.06.27.07.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 07:44:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 17:44:44 +0300
MIME-Version: 1.0
Message-Id: <20240627-ucsi-rework-interface-v4-5-289ddc6874c7@linaro.org>
References: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
In-Reply-To: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1732;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SvL4pINrFSRfen69Stj/4WrpwjGf+jKWJ5TFSri6EH8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfXrZIK3sNxYmewLsvSN+DxSJY8UC0w0Xoamap
 /iSt4ILkayJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZn162QAKCRCLPIo+Aiko
 1TewB/0eEGE2cnF0wQ2wiEEsma6QExZ1Yav41XkW8NpVgs9JLW96sutdqzAxS5BpJsP1PoyaRCD
 lVRCv4c2T2eHdMrZRGrTExG691TNA1w2rDx/gDgFf7lEdxtOwgxSmsxk+CZrGAP00z9k5kHoWNY
 Vl0IFKa8sP3qSpbB0wkrpjQtK2vRBUgU4B8WqycBSdLOhQ+exl7xVKHjc0No1McFtSOU7arST9a
 zqlmROo8rQ3p1nZ3ASP///xGQKpo21+K1ATF8ekM5/kHEdhrW88lVnMrvqP88SBLbPnauJG13pH
 e5DyIzX3Lb9EIQqQgnWEHAhv8mFDrOhGm+yKzc1znzn2VMcp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 5/7] usb: typec: ucsi: inline
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

Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 10a8fe893333..2d87fe277c62 100644
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
