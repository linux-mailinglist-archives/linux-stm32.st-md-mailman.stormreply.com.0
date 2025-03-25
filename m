Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FBCA6FA7F
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 12:59:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46145C78F6D;
	Tue, 25 Mar 2025 11:59:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 845DAC78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 11:59:06 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3913fdd0120so2989284f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742903946; x=1743508746;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+T3WQyKZjc+sTss9oWTNDsgD0VLz9miuiujDFgPAAiM=;
 b=iMCoHWfwZPQ9xu/T/UYSJ51xUhb/N2B2lehou63LLtanzDzR74Hz4NSEBea9dxHGH/
 OVBREiQBGzO70WC7+EJj6+HhX2xe0rNKMfr+58n02WfAsBcmTEFPKxWSVtbJ0HLu5igR
 FIkSCNF5XegwOoESm/Q6a+Adw96jGKj+9K8s86ZZwE9XMRYOUT6+JGy8mu29HmYQY/ke
 jExRhvwPCXDC+qgU0mP6fWU/MWibsLlQV8bRZc5JkI3VAJlphjWQ3VSzEruh17Uqd8AE
 LZCu6oYlQ1BuY8B/nvIBOOEnkC8c108FnD38JAEhdjUdmAPbcrtjL/WrlSCA20yfCWjW
 0xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742903946; x=1743508746;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+T3WQyKZjc+sTss9oWTNDsgD0VLz9miuiujDFgPAAiM=;
 b=c7MudJi++VihJIoS5QPoq4AwuU1TJBnfm0nNEdId8mE2fTPuHGLSdBf923CDMttsBH
 QzDjd84rFBpRmclTKZfltBaFNP3aFS6y4aD5B7C6kqPi+5EoKud93W9g3HCATaO50TGc
 Ywu4HC0x5Dzhl0W6veuUwhSgQEwtZWca6xqbEroGzTWzx0Pe0nd8nMJD2NdipVeRMhx5
 kzXnFTYufVJxyASfSrCw8aIVKGdM7LE74nicMOY7mCo4BMRzM9l1rPXkVSvn4ofKH7QY
 SLi/YB3nuMpxRtOAP8yeUThkudgNdYZ6k1giC6e/uaU0qPrAnpYdeO9rbsx5KTxwxJDU
 srzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2UWIPOILGpUzMy5D5z64jXunWWYTpgsafyhRmgvDedJILGxIMD+tCsRuqOnIgMjsZ4KVE5AuT3B69EQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzPdYj5Sih8xzOMChgxvef7a3+/1iBUtD0fOjNUuibQcZBNbF/1
 vCgZVP1YD1cE8v/VmcBsQMpKiR43H8GfxNsmnnu2tEuanxlydENKrA2GgBFDKaU=
X-Gm-Gg: ASbGnctgnkf8HeQ0KGKtvIBE6VKaWsWJqBq3i+Hr5Yu1BxwV3PGBRwDPh+zEx5j5khA
 xk/mJ7Ky4GxnOqHBJWme1d6GhVvtFAk78SIpDkYdUdC9Ch6ArPgyN5zDOXoctnPyI2PgVejN7BS
 nzUpyLlvdJCvBS3vlE8dPa3Fe6znXVi+6BrXcQUBeFt4tyLjJrMFt+FGgxImwMm/v+ZsSuLavxg
 d5LSAjXyUkn1O8fC8yAikCACrNIGHlbpYCKfaceFRdtJzIfbAgCYoKrWAA0gKeoUiUWql9Xu47R
 lde1uwbpzp6gyxx0RA5pONlnyJmZUU8P5fs3M8hhwR0YEhRx
X-Google-Smtp-Source: AGHT+IFPGy9vum6o+O8NH5bMurCGa+Js6mdtnSW1DTWQ2JGk0tgT1DLh6k91VuQbSdSQx9wfiBlcYg==
X-Received: by 2002:a5d:5885:0:b0:391:29f:4f87 with SMTP id
 ffacd0b85a97d-3997f93c495mr13090045f8f.49.1742903945954; 
 Tue, 25 Mar 2025 04:59:05 -0700 (PDT)
Received: from [10.42.0.1] ([145.224.90.136]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6676sm13687169f8f.62.2025.03.25.04.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 04:59:05 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 25 Mar 2025 11:58:46 +0000
MIME-Version: 1.0
Message-Id: <20250325-james-coresight-claim-tags-v4-1-dfbd3822b2e5@linaro.org>
References: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
In-Reply-To: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
X-Mailer: b4 0.14.0
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 1/7] coresight: Convert tag clear function
 to take a struct csdev_access
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
won't have a coresight_device and have to use csdev_access instead.

Also make them public and create locked and unlocked versions for
later use.

These look functions look like they set the whole tags register as one
value, but they only set and clear the self hosted bit using a SET/CLR
bits mechanism so also rename the functions to reflect this better.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 33 ++++++++++++++++++----------
 include/linux/coresight.h                    |  3 ++-
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..d895815dee1d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -129,34 +129,45 @@ coresight_find_out_connection(struct coresight_device *csdev,
 	return ERR_PTR(-ENODEV);
 }
 
-static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
+static inline u32 coresight_read_claim_tags_unlocked(struct coresight_device *csdev)
 {
 	return csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR);
 }
 
 static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
 {
-	return coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED;
+	return coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED;
 }
 
 static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
 {
-	return coresight_read_claim_tags(csdev) != 0;
+	return coresight_read_claim_tags_unlocked(csdev) != 0;
 }
 
-static inline void coresight_set_claim_tags(struct coresight_device *csdev)
+static inline void coresight_set_self_claim_tag_unlocked(struct coresight_device *csdev)
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
+	coresight_set_self_claim_tag_unlocked(csdev);
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
