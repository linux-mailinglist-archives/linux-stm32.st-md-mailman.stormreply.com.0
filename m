Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1CEA6A8A5
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 15:35:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAE55C78F67;
	Thu, 20 Mar 2025 14:35:11 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 864CAC78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 14:35:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3997205e43eso692247f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742481309; x=1743086109;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZfzFRHbfXxXFspuQSyUelov0bU9Y998lI+AV7Y8adF0=;
 b=nIlS8OXix4J3Gpr5AN3kEi7A3TRwToP8s8+szxk98qJCUQ7NaukwDPYBHlY4OuCNFM
 Zf5OtA64DxwLn0TWSGDTtG49W9+m+xRiKLANP7uROzWIGHqaFoF29m2uekcJsFN/07zT
 E1udwt99Xu/1zipbzeGU3554hjd76GCPkJgpzE4jxhE6aALEoVvD1VulCtNFWQmymDcL
 u+NHR6dmb8LAscucZwstwRrM6CWWXlbQf/wssYl6sk4yU+ESJNdpvuRZJmmgIZZAUTkU
 vEDmuxMzsKcqoqGcc9effT2Cat3Wgyb/n7vvv6cCrZQRE/2ANGrUotdDYtdGGRbyUjo2
 /jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742481309; x=1743086109;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZfzFRHbfXxXFspuQSyUelov0bU9Y998lI+AV7Y8adF0=;
 b=P1GvM7EZ+8zYjzeZQ2aADBOxyUV9N8GHzqGVDq1O2hVAspfmmSFH1cCHUgMu2du0i9
 pGuJIWB9QdWYS1J3NrFWDu/xfJp63wPy+EJLQP05V8FVr+Th+LgnrhZZ/LbkdRpcdwGy
 PKnQuqDGOwFX3p6qjCNq+SV7bEVsqzdztpkw1j7YAfmVtoWf0C1YJTkIi0OqcnSWJWeS
 GAyQfFJ4Xe4D6lMEX5Yb9KS3teOQ6ZRinn/H4fGqVA6/oCiu+PeLzMH4dFkRAdA2vwJq
 tYikhLyJsIv9gog6Npm22jg+Okx/XRqM0Yxm7uJT2IU9gtGJ71knOJOhunv8WJ2Pytx1
 xR+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPoaQenugOHif9vgc15zGJPdsk12BKg9nNzyNj4O3X+aHrU5EyObySH/JRKA/p/S1IJ1fLtC8hKSPzRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyjEvXAMONRPMYJddfgZBXkOVjLeR9jxzxbr9wJJgb3aMeU3zhN
 XrJj6Q1TgLOeG2Nrm9Vb/PAMD6j1csNYV/wzjCU4juLkqFFcHd2uN3BUlrYYj7Z5cjKnP4Gf9KW
 A
X-Gm-Gg: ASbGncs7rs+k+LasdtEKbgfZ5Z7/3PDuG1E0mjMkMU86LvljduaN5SbYLRdhsZP4ULG
 zJvUPE0asqxZdmEs2AXHN7FtEXIwQmo3QP29E9pBicgaUO2kHtCaEvk8PPl06vQNoleQRucYPp5
 KbznlYt/Ut5iALtWGh2r4OAkUhQOxzjF3PVJA0wSgEXXItgP+5c+LjOvxZy+ydW8clI6t6QIqo6
 Oq1ETlY79NT/zOG/mdsQwqUtOU8rHonKGcfQMausU4+CObowd49KNA1oHFPGweU886kfnaiuzYy
 h2oZ4Kch4YeXkkE7pyFgBVL36qizR/HJp4Ff20vXraZ4lKw=
X-Google-Smtp-Source: AGHT+IF73C+sldZfp1EoaiTa2aCKKOCtDRpElINoDtMTnJAzYhWVerLTt8PUOTnbGm7i+dgQZml1yw==
X-Received: by 2002:a05:6000:2ad:b0:391:2c67:7999 with SMTP id
 ffacd0b85a97d-39973b0befbmr7716072f8f.48.1742481308907; 
 Thu, 20 Mar 2025 07:35:08 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm24238187f8f.31.2025.03.20.07.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 07:35:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 20 Mar 2025 14:34:10 +0000
MIME-Version: 1.0
Message-Id: <20250320-james-coresight-claim-tags-v3-1-d3145c153820@linaro.org>
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
In-Reply-To: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
X-Mailer: b4 0.14.0
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 1/7] coresight: Convert tag clear function
 to take a struct cs_access
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

The self hosted claim tag will be reset on device probe in a later
commit. We'll want to do this before coresight_register() is called so
won't have a coresight_device and have to use cs_access instead.

Also make them public and create locked and unlocked versions for
later use.

These look functions look like they set the whole tags register as one
value, but they only set and clear the self hosted bit using a SET/CLR
bits mechanism so also rename the functions to reflect this better.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 27 +++++++++++++++++++--------
 include/linux/coresight.h                    |  3 ++-
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..8471aefeac76 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -144,19 +144,30 @@ static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
 	return coresight_read_claim_tags(csdev) != 0;
 }
 
-static inline void coresight_set_claim_tags(struct coresight_device *csdev)
+static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMSET);
 	isb();
 }
 
-static inline void coresight_clear_claim_tags(struct coresight_device *csdev)
+void coresight_clear_self_claim_tag(struct csdev_access *csa)
 {
-	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
+	if (csa->io_mem)
+		CS_UNLOCK(csa->base);
+	coresight_clear_self_claim_tag_unlocked(csa);
+	if (csa->io_mem)
+		CS_LOCK(csa->base);
+}
+EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
+
+void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
+{
+	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
 	isb();
 }
+EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
 
 /*
  * coresight_claim_device_unlocked : Claim the device for self-hosted usage
@@ -176,11 +187,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 	if (coresight_is_claimed_any(csdev))
 		return -EBUSY;
 
-	coresight_set_claim_tags(csdev);
+	coresight_set_self_claim_tag(csdev);
 	if (coresight_is_claimed_self_hosted(csdev))
 		return 0;
-	/* There was a race setting the tags, clean up and fail */
-	coresight_clear_claim_tags(csdev);
+	/* There was a race setting the tag, clean up and fail */
+	coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
@@ -201,7 +212,7 @@ int coresight_claim_device(struct coresight_device *csdev)
 EXPORT_SYMBOL_GPL(coresight_claim_device);
 
 /*
- * coresight_disclaim_device_unlocked : Clear the claim tags for the device.
+ * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
  * Called with CS_UNLOCKed for the component.
  */
 void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
@@ -211,7 +222,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 		return;
 
 	if (coresight_is_claimed_self_hosted(csdev))
-		coresight_clear_claim_tags(csdev);
+		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	else
 		/*
 		 * The external agent may have not honoured our claim
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d79a242b271d..00134a80d358 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -685,7 +685,8 @@ extern int coresight_timeout_action(struct csdev_access *csa, u32 offset,
 
 extern int coresight_claim_device(struct coresight_device *csdev);
 extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
-
+void coresight_clear_self_claim_tag(struct csdev_access *csa);
+void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa);
 extern void coresight_disclaim_device(struct coresight_device *csdev);
 extern void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
 extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
