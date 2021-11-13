Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4629D4504D7
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Nov 2021 14:00:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB289C5F1DA;
	Mon, 15 Nov 2021 13:00:08 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D0E8C5E2CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Nov 2021 20:04:52 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id y8so5695298plg.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Nov 2021 12:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=Tb74LrSzA8PWHlBbQ2QqZoirlUR2jOkJqwuP2JlwP2g=;
 b=fr2NExjejAaBCjGfUF1PZQ/UEzdEpY12IHDphNFvVXzELU5LQT1rXxsc8B/Wez8kQN
 JVBQGc+eK8ziRSxV0q8O2uai0W85hXj9z6rHl/XQ0bslcahVWRu5jqGBUhR9SJZSPMmN
 86XY4kIhxoWcEQ6BEdwrlJ5i0MMpORjzjR8Is7mmInx1KRsqus4Ccr7b64/Cc/xO8pu7
 8wtTXypOWY1epP+DVM8wsqJRgCVAT2P3nCJoH89TfZ758E3ALc/XawdLvAKkcdJp3HWO
 4G818aaD2Zx0AdhP6zp/OfHEAjDA2bkBagfAFsCvwzxfSFtnCbqKqupq/Ceeu2V7TjYa
 Rgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Tb74LrSzA8PWHlBbQ2QqZoirlUR2jOkJqwuP2JlwP2g=;
 b=vNqAa0LabX7cUDEDmB4Sb7qmGMBL+AZCuQlPEEIFA8X02T9U4ujjb2LEnDlLU/noYf
 T1SN2GiCG+ITCeBpSP7BBaDsFakURls7tIHYNCxy93tdIMjCY2fBDJGINBh6yFpU9h1C
 ayrUCEMG9Qc/jmHQ53/4Oz7xfbRCNcTB6zUZOIluu/Eb/iX6FK00kAGCVMI6U5/1+ifq
 gh+YBxSAsjVD8fNRtDldpcivvzE8zbdVaPJbXFhCwrcUs58+oYnFsMeOYZPaE6mIAdKF
 OlP15A1wR0lONmaT9rS0LurnaLEc4R4TDw0KK/Rw/iRUaODuI4zxjsNG8iEaNlkgRw8G
 /yEQ==
X-Gm-Message-State: AOAM5339g2rgkSZyTniaO9qeBFEnRqoYX0fvmNirt0Nt9NXhws68XvQC
 IZSFPFiNRn+sF0d0NfCJvGw=
X-Google-Smtp-Source: ABdhPJxSzOFn3lMaparm0oRAqDqKpnDPf90DElYcRINmAqDZtXL6YFmz0+o+lMheasGAXbtcHJHfeQ==
X-Received: by 2002:a17:902:e8d4:b0:143:88c2:e2c9 with SMTP id
 v20-20020a170902e8d400b0014388c2e2c9mr20246258plg.12.1636833890966; 
 Sat, 13 Nov 2021 12:04:50 -0800 (PST)
Received: from makvihas ([103.85.9.85])
 by smtp.gmail.com with ESMTPSA id h23sm9988328pfn.109.2021.11.13.12.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 12:04:50 -0800 (PST)
Date: Sun, 14 Nov 2021 01:34:48 +0530
From: Vihas Mak <makvihas@gmail.com>
To: jikos@kernel.org
Message-ID: <20211113200448.GA1111164@makvihas>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 15 Nov 2021 13:00:05 +0000
Cc: alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 benjamin.tissoires@redhat.com, mcoquelin.stm32@gmail.com,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] HID: thrustmaster: fix sparse warnings
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

Changed 0 to NULL to fix following sparse warnings:

    drivers/hid/hid-thrustmaster.c:208:43: warning: Using plain integer as NULL pointer
    drivers/hid/hid-thrustmaster.c:241:17: warning: Using plain integer as NULL pointer
    drivers/hid/hid-thrustmaster.c:275:37: warning: Using plain integer as NULL pointer

Signed-off-by: Vihas Mak <makvihas@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index d44550aa8..3a5333424 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -205,7 +205,7 @@ static void thrustmaster_model_handler(struct urb *urb)
 	struct tm_wheel *tm_wheel = hid_get_drvdata(hdev);
 	uint16_t model = 0;
 	int i, ret;
-	const struct tm_wheel_info *twi = 0;
+	const struct tm_wheel_info *twi = NULL;
 
 	if (urb->status) {
 		hid_err(hdev, "URB to get model id failed with error %d\n", urb->status);
@@ -238,7 +238,7 @@ static void thrustmaster_model_handler(struct urb *urb)
 		tm_wheel->usb_dev,
 		usb_sndctrlpipe(tm_wheel->usb_dev, 0),
 		(char *)tm_wheel->change_request,
-		0, 0, // We do not expect any response from the wheel
+		NULL, 0, // We do not expect any response from the wheel
 		thrustmaster_change_handler,
 		hdev
 	);
@@ -272,7 +272,7 @@ static void thrustmaster_remove(struct hid_device *hdev)
 static int thrustmaster_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int ret = 0;
-	struct tm_wheel *tm_wheel = 0;
+	struct tm_wheel *tm_wheel = NULL;
 
 	ret = hid_parse(hdev);
 	if (ret) {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
