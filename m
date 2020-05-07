Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEB91C941F
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 17:12:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 993B4C3F94F;
	Thu,  7 May 2020 15:12:01 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E86BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 15:11:58 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id e6so2741832pjt.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zt3dWszzUGPIr1is87/3ZzRSaPFAJm76db1aD6xZhws=;
 b=TI0Y1zgsKvAwRGvVFzQgzAJe5FKsPk4nM6Qs1kkkV3SrYAqnMd/EWdCrqUe5JjReO8
 9monr1ObfM/RMMg+6Qy0g5hfQezijmL7qGV645Q7hl3DZAX/vzVDtSdz8uwfQs7ynM0H
 O8VtsG475Cnp3USWAolj5xZcr7y60g51TfZqlE4pnoR0Ug4BxPZuc8QY+ihNBy/x1DM4
 YUmDWXIxdGI2sMrOb9y+a/9LtG7L9/poXMtaZwDmREq1Ro82qAtLi9e+eMs8amEd4323
 o2CTewy/Ya2M7CJNdNsoBx1+CCVa/j6zocbtX5R4rIJHxeBHt8TVu5xEGBtzuedcqixU
 TNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zt3dWszzUGPIr1is87/3ZzRSaPFAJm76db1aD6xZhws=;
 b=JJ9Wp6jizLqSZnSQV986+QwvIMkV6IozY9yDzjVLq4ZfUePWoVGZFUxcIUNW2IwfJU
 BhdrG7sr1wV/aUETXpw8RnKq0+8XXbMho+JfmInSkJ1u1xcTAg+mKN+QYTMA8SwkHXwk
 3d4NqhaXbMY9Fpmx7TuqAlwMnRaYrEA9CwKlnZQDesMs3TGMDcsl7E468HnRRmz6xC0c
 3aQQdrvjrpkhNdTCi0IBPf62j88ewqcCrYyar+vnDKI8NN9jrvSVx7niEJynExE/eY2X
 nyBToaw8XECyWEYzQTmjxa3W53byQ2f5gdVTx4IgGaD1r9gtbGzJgMhErri7+jbfwVjz
 8acg==
X-Gm-Message-State: AGi0PuaQPqrMKLccHF+cNBXCKHXxCqkQ3+9z9iFTsjPAE97WAS6Z99KB
 ZUXSuI8Ch+Qq0oc7rwxBHYM=
X-Google-Smtp-Source: APiQypJ4IITkjemHUaedvi2tTs9YZUePEepBqshIpV75NrwzsADS0UX6wsRQ65tM/+jrQuiEF+T0Jg==
X-Received: by 2002:a17:90b:46d1:: with SMTP id
 jx17mr550749pjb.212.1588864316603; 
 Thu, 07 May 2020 08:11:56 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id j7sm5080620pfi.160.2020.05.07.08.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:55 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Thu,  7 May 2020 23:11:47 +0800
Message-Id: <20200507151147.792578-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] Input: stmfts - add missed
	input_unregister_device
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

This driver calls input_register_device() in probe, but misses
input_unregister_device() in probe failure and remove.
Add the missed function calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/input/touchscreen/stmfts.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index b6f95f20f924..4345aa98a320 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -728,8 +728,10 @@ static int stmfts_probe(struct i2c_client *client,
 	}
 
 	err = devm_device_add_group(&client->dev, &stmfts_attribute_group);
-	if (err)
+	if (err) {
+		input_unregister_device(sdata->input);
 		return err;
+	}
 
 	pm_runtime_enable(&client->dev);
 	device_enable_async_suspend(&client->dev);
@@ -739,7 +741,10 @@ static int stmfts_probe(struct i2c_client *client,
 
 static int stmfts_remove(struct i2c_client *client)
 {
+	struct stmfts_data *sdata = i2c_get_clientdata(client);
+
 	pm_runtime_disable(&client->dev);
+	input_unregister_device(sdata->input);
 
 	return 0;
 }
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
