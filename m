Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B3B1F873B
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jun 2020 08:19:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98318C36B0C;
	Sun, 14 Jun 2020 06:19:12 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66B05C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jun 2020 06:19:08 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id z2so12453137ilq.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jun 2020 23:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9KK+F0d4mciiuo9VaW5QFXWP2Ch9Rbbv4U0+fODdYfw=;
 b=HDUWrCkggu0J1UgH7dQO1nYEXZBkr5iknhM0hWr8Cxnps2IFyJvHAbm6BhL5HSHOiL
 WX37C60DJVxnU40AE6VWz63fnS75SQgC69ZoK7b/4wqZFHl/156yjZLfXFBhaqHKs106
 KoJLVkVbIXH+4J8MHF1Z175hMrrlHTeDtn62CqD6mnQ54WNqw5M/VJREluvKXfAxAfP/
 0U+8b0JwdnROS3sjXzFelRhMmBiRdzI5LyeP2gNsQCUhskCB/SuMwoUdzPb24surrQ99
 1kQ2hnm8DG3Wc39OJrUbpKTLvfNB5vzFrmr+MyV+IExRyF84+5aA59fAIPji1X7t4f2A
 RAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9KK+F0d4mciiuo9VaW5QFXWP2Ch9Rbbv4U0+fODdYfw=;
 b=cGPgk5/7GOFBsH8pK4oElmuxz7QchdP1ZoymG7jiZAgWIn8oy/mYKvDbW6SHMFn4A2
 TlmvJ02ofIheACEBzznbUwoJKhDTWpB7pBVAB9BCGkS1LfZur2hW2snwdlCz+cx4Mcq/
 MlbMi1E+qCNBts9TjgTbSkcj007kb8kbBkZphrwdwlKFnHcIejyl3cAP2zOQzz89dmpN
 0JSuwfjc+tkRgWktTkNRrGYvi/MzkyVP916S+lWsV09qHjD5JAFdCPSzP208Prcy9J5E
 hsoyLyPCiVRYoEKnZi3QSsdj48MYOIvBMHtD1zIDnZwSlGHm3XkVkEneMlfIRFqInwk2
 fMEw==
X-Gm-Message-State: AOAM533ljHdo2cNwmfXhwn+6ew9cUIv5C8mLSu4z8T0GLuNSkhng1Ke2
 mpTRML424VsnvCFFNK36z8U=
X-Google-Smtp-Source: ABdhPJx+RHJDlWRBydGsMDNESumPn7fohMgnWm/IsMUtg/EAwn/mNh1mHSYHhLadFHOzD269hdoBBw==
X-Received: by 2002:a92:d1d0:: with SMTP id u16mr20748595ilg.7.1592115547052; 
 Sat, 13 Jun 2020 23:19:07 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id c3sm5798908ilr.45.2020.06.13.23.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 23:19:06 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 14 Jun 2020 01:18:59 -0500
Message-Id: <20200614061900.75253-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: emamd001@umn.edu, kjlu@umn.edu, wu000273@umn.edu, smccaman@umn.edu
Subject: [Linux-stm32] [PATCH] Input: stmfts: fix ref count leak in
	stmfts_input_open
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

in stmfts_input_open, pm_runtime_get_sync is called which
increments the counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/input/touchscreen/stmfts.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index b6f95f20f924..1ef282d7cc14 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -339,11 +339,11 @@ static int stmfts_input_open(struct input_dev *dev)
 
 	err = pm_runtime_get_sync(&sdata->client->dev);
 	if (err < 0)
-		return err;
+		goto out;
 
 	err = i2c_smbus_write_byte(sdata->client, STMFTS_MS_MT_SENSE_ON);
 	if (err)
-		return err;
+		goto out;
 
 	mutex_lock(&sdata->mutex);
 	sdata->running = true;
@@ -367,6 +367,9 @@ static int stmfts_input_open(struct input_dev *dev)
 	}
 
 	return 0;
+out:
+	pm_runtime_put(&sdata->client->dev);
+	return err;
 }
 
 static void stmfts_input_close(struct input_dev *dev)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
