Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37807A67915
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 17:22:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF986C78F60;
	Tue, 18 Mar 2025 16:22:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE634C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 16:22:25 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-39130ee05b0so5747571f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742314945; x=1742919745;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3gOSFN/1KIzpDFDMtVSThY4tdpbBGk9qFEr0fShnj6c=;
 b=sFOxlB3cE7EeIC9V9uT7yLV59rxHArrJhI5X+ud+9gHSyUPjrjn+15foNOd2V5ODse
 jkyRJn/dlFWqW44XDhnWofOcSAxkLn9zw7RD8GjE56C6pswABTs23a1soiNFqSxOZJWJ
 HmL+lQWnNW0sErPzsd/FyCngGcDX+kCJupLTTV/tYQjCh08gLkbbQ6p7La+MVjqofsSp
 p4Y6veC9ca/UEnk0GGv4Br7qZLQVXdFpKdjpyuF0PQKzvkJUP9NvgZpa8DbdnGW4+8FJ
 NTJW/ayp0Q87AtGJHuBlTfOp7dpwMvMWlIKO/OgYsMc9c6SKXFrKwcJJI0ITqffCdJDR
 EBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742314945; x=1742919745;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3gOSFN/1KIzpDFDMtVSThY4tdpbBGk9qFEr0fShnj6c=;
 b=wCRyB6stl7jxo9egvU0lCCMCDbmAJoOH1JxHF4xVdEOYZoPZQB+UNdtLT4fjATnWYo
 TB9Hbi7L0XN/NsdKFvszP23r5QXsLmsXNQK2e8oGxQfLPBhHNEiL2IwL3S0j5HnAUsdt
 kL3rtD/Xtzz3OO3LZolLrplJNYMdhePEN+mtokAMhP7ZMgVz6c+OOMCNT6j+mD2GTXDA
 NhrjS8zAgVZswS4D9TFkqhgnF4kmLPpuTth90XWskkp04UazuA6+jIL/H1WcwBGW/DJK
 SmM93rzr3LBelV7AZHskO4+8n1f4jKeFuW9JXjEGnGSsm3TLZfz+i0Kq9PILHzAd/voD
 ZHrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+0zxs6WOxQfX+BJhlfxzxQPxmBo0ho6dycBCAfVPvsnPQeemro1w90apzTq5u7fqMrhl1fhh5lYmHrg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yze283thzjKe3HVD2rZ27EB1m0K9hDn9aDtUGGQnH2M4Vz2Z19x
 ayKjwebGzj9dSewp6xlPFgJGNyxWlG/QYGUt6vRuG3xx4fwxwLTpOMaiaSJKEAg=
X-Gm-Gg: ASbGncvWHNKx5+zCfpbrmoSF9mAkGDdE7m9SEEx41cnhGJwepcJVA6GYJtbAwycnirc
 GRMV/lFVnCfEEKjDfvo3PXIjKP/2rg/gCn3w3H/IFjYwUFrAl1PtCgqpRtxM/ab+lsgHkrBKPQ/
 ejWEC+MR1aiXoRDGWV8wvQ0vcrqS0ZCqXIbU7zAQhpTa58vl92X9lc/FD0vEuXZTP/+HMjaMX8/
 Mg6M9iMySvJnnEDw6wZ6pb2GHWZHizuSTHjYNtaKOU6ZQJgSM/b55otI4vuvJXf2SuBoMytscMZ
 eiVMdidVoAdVzcDClWP3PtfJYqwQPvfaVmElWdOr/V8gOdM=
X-Google-Smtp-Source: AGHT+IHHZ/8jKdHrmeWg2W9ew9ZgBKl+G80VmK6gRjbRZx2tpx7r9TxqGynoIPH3wrYx9//VdC/l2w==
X-Received: by 2002:a5d:47ac:0:b0:391:13d6:c9f0 with SMTP id
 ffacd0b85a97d-3971f9e7813mr16838834f8f.47.1742314945185; 
 Tue, 18 Mar 2025 09:22:25 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 09:22:24 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:21:55 +0000
MIME-Version: 1.0
Message-Id: <20250318-james-coresight-claim-tags-v2-1-e9c8a9cde84e@linaro.org>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
In-Reply-To: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
X-Mailer: b4 0.14.0
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/8] coresight: Rename coresight_{set,
 clear}_claim_tags()
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

These look like they set the whole tags register as one value, but they
only set and clear the self hosted bit using a SET/CLR bits mechanism.
Rename the functions to reflect this better.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..3f1c996d668a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -144,14 +144,14 @@ static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
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
+static inline void coresight_clear_self_claim_tag(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
@@ -176,11 +176,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 	if (coresight_is_claimed_any(csdev))
 		return -EBUSY;
 
-	coresight_set_claim_tags(csdev);
+	coresight_set_self_claim_tag(csdev);
 	if (coresight_is_claimed_self_hosted(csdev))
 		return 0;
-	/* There was a race setting the tags, clean up and fail */
-	coresight_clear_claim_tags(csdev);
+	/* There was a race setting the tag, clean up and fail */
+	coresight_clear_self_claim_tag(csdev);
 	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
@@ -201,7 +201,7 @@ int coresight_claim_device(struct coresight_device *csdev)
 EXPORT_SYMBOL_GPL(coresight_claim_device);
 
 /*
- * coresight_disclaim_device_unlocked : Clear the claim tags for the device.
+ * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
  * Called with CS_UNLOCKed for the component.
  */
 void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
@@ -211,7 +211,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 		return;
 
 	if (coresight_is_claimed_self_hosted(csdev))
-		coresight_clear_claim_tags(csdev);
+		coresight_clear_self_claim_tag(csdev);
 	else
 		/*
 		 * The external agent may have not honoured our claim

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
