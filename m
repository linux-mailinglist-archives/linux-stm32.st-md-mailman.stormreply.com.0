Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2639A9FDCAB
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Dec 2024 00:33:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 900DBC7803B;
	Sat, 28 Dec 2024 23:33:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D57C6C78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 23:32:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so93264545e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 15:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735428775; x=1736033575;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wOndzP+gvkrgZs0qc02qdGu1OBtOTqc7KPMQjqAeOC0=;
 b=ekvwJS833ewSwxQohVmsSYI+E2SidjQchdcMmcQZq8fKNw/lQNSkyPmM6wSUStEZCo
 RdB0OC1huBHHbeVugd3I3h3qwHvQzj53eszZQHZnmmX/Bl2UYUtSFHfgkNF9b6WKAiTk
 AJNiSqt75BdSSdtfAy3/P242DN5UWln+6SlQpY7dbCNrTmRbcSFPLmfXUSX9NmAqcguG
 x3bO7UkhyfUG+7VaQ2D2Q62E3lL2sNvG0cuzaxGka1rPaMtZ0DKt1gowhgI31hHLNxpc
 v6fYj758PvVv9Qfo41pg1db5dF+aRndKyj82qbKIgIoVw8g5xcMOqcfuL1NBEtZXcbCf
 w26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735428775; x=1736033575;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wOndzP+gvkrgZs0qc02qdGu1OBtOTqc7KPMQjqAeOC0=;
 b=gQ5DRpmoDYyf8OIJ9gxALh1jcX3Q5GTtEkPRAsrWNAAWvEi656g4qoT1voE0pDLnN1
 8S9jiLBlVApBaZdlArlCBnPhZpGFCY9uYYffatFCyMpwFpJc6d7kDpOC3FATVSJ4Zsrd
 vF+pFYgT8Rq5Rnchly8Ek1944djiC6nAC6qXsgcpVwaN8MICXvIUKDvNoj5ufAgncI09
 4T02hm86isDZeSzbtJhItZFQaPXDMmbsJSa5UHWoexTzwJjP0krAyPNIjq2Q0pDuowPb
 XBqXMzBNL3TP9MDMbYBE+AfBIGlLx49/M11fymR/8gbFD1wgMMJdOi9gm23Ju/+p5Iu9
 abLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZjI9uaLycGLl3h10Pnl/VaJEpCxDP1pvQC7N+OtHofRGXXk3ZAhRGgOU9SEt+VcsGPV6vlFXqr4c7ew==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzgObf4+MO0xuR92Y12z5nDE+uiPCwMX/BEeH7azm86so3HWvRH
 GMIx9M8xwhzQqI1r7maa4g3Cj1TkUucW7Kt9FfbFWngOrza/1LQn
X-Gm-Gg: ASbGnctfNZs+ynF62ENghoBvMgS1+Y4JnEeFBuEYYpsmjqmfDl40RiDeLqvUj0qz24m
 abT21bsr3sNpl0E+/5YaFPdeFxX2nBwFDJkCwi6XoGY6dtiR/G8M9m7BtWSK8uihTjQPTv7dXRX
 3+foKBYa0W5ORYV9DAeBfccjMcDY7rCxgasS99Cwt+J6tlh7L8M9ZzvDISj87earrrkUJbjsZ59
 r4juNsnOh5AgX2/PXoeyd8NEilWDCCmrZcHtQT+kZtj648VUPpqleAmGg==
X-Google-Smtp-Source: AGHT+IGe8Rwcmuo9VN1Lkb94sZXMSVEBxRAkdBXNxIt/1C+WWqsmcYg0Za15vXGe3lPDFNIsmfP2GQ==
X-Received: by 2002:a5d:64c8:0:b0:385:ec8d:8ca9 with SMTP id
 ffacd0b85a97d-38a223f5c0dmr23948509f8f.42.1735428775256; 
 Sat, 28 Dec 2024 15:32:55 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8475cesm25785410f8f.57.2024.12.28.15.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 15:32:55 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:40 +0100
MIME-Version: 1.0
Message-Id: <20241229-update_pm_macro-v1-1-c7d4c4856336@gmail.com>
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
In-Reply-To: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=pITQ3SISHmNURCP92MPtMIDVu2hGeerDTBhUOZa4ipk=; 
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqk5Qr8I8UCU+eXHkVfaa5GP81eSw5Fhp3mZ
 d3XzeEUBu2JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKpAAKCRDnIYpo1BLC
 tSpaD/92t81iuqxEUHcsYt5/Wd4eQOM5eEy6ZSir1T7uL3om6KgK6F9iIjSVBlFj6kEbB25IJ/h
 Bt1oVYolifnCrjPORvWAOSIw3MWCn1Osds32OjHMKm3W8nWcwB8bDoCMZBFhtpioriPGVKTjdZW
 PlEXPCH2XKcSdDdqB0Tw55BruLDg+f56q2fHv88gAjRqPgt7HS/IpOc/cdp04Z2k8rv0DL7Jg2M
 kUB00pqUBL0ghgILZkXQ/ylZJZSSQhyN7CeVrK7R6YBmUDf14wnLHEFOqj8Wj6hKR2cILhfftu2
 8x1MvvwQrupvZZoPTGCvPnt/E9Pe4N6LTXHY9fq+1a3Y5jJeFgnaYmgk6vAHEVT54lTshPXJ6iK
 oFdHkO6bjUb/71rNJrug6/BCIr+7VAkCnaMeK8NB8EmKeUNmo6pgBgzpLexiQrardLh+J7kq/pL
 kpaJR6FSoq/KZWSzWtpyHQ9r838IHznXZ/gd3O3j4h56wIsNKj1xC6N3fRBGoqGr1GAiwTAb1qb
 dOzLYzkIRXA4IlPIDj1CbJ0Lvf1y1Fis6k1vwl1Cz77RCpC4wa7/1uoB9S198DgNdoXvy+a/5QI
 oMezUW+nv2ob40fcPfwzr9abnCP5iFLv/OINnqBukVW8iUUCjreXiHUuLpBflRfZD2ia/9uLqpa
 bHzvuymCdM0rkJg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/6] usb: dwc3: st: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Link: https://lore.kernel.org/all/20240716180010.126987-1-rgallaispou@gmail.com
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/usb/dwc3/dwc3-st.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index e16c3237180e970c184dfdb147c8abd46ff429a3..ef7c43008946e15b72d88aba4941dc52bf0788d7 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -309,7 +309,6 @@ static void st_dwc3_remove(struct platform_device *pdev)
 	reset_control_assert(dwc3_data->rstc_rst);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int st_dwc3_suspend(struct device *dev)
 {
 	struct st_dwc3 *dwc3_data = dev_get_drvdata(dev);
@@ -343,9 +342,8 @@ static int st_dwc3_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static SIMPLE_DEV_PM_OPS(st_dwc3_dev_pm_ops, st_dwc3_suspend, st_dwc3_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(st_dwc3_dev_pm_ops, st_dwc3_suspend, st_dwc3_resume);
 
 static const struct of_device_id st_dwc3_match[] = {
 	{ .compatible = "st,stih407-dwc3" },
@@ -360,7 +358,7 @@ static struct platform_driver st_dwc3_driver = {
 	.driver = {
 		.name = "usb-st-dwc3",
 		.of_match_table = st_dwc3_match,
-		.pm = &st_dwc3_dev_pm_ops,
+		.pm = pm_sleep_ptr(&st_dwc3_dev_pm_ops),
 	},
 };
 

-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
