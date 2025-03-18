Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DB0A67917
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 17:22:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0908FC7803B;
	Tue, 18 Mar 2025 16:22:29 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 226E5C78F61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 16:22:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso33965575e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 09:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742314946; x=1742919746;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=30vcmK8Kb7EgO69NndpoCL59432NFZcGkb09xNX7nz0=;
 b=ct0vN4nZpUW2vsjCQn8pSeaoCUD/jEcX7NHQZiaTxspm1QNPAWTMC+XgcrHkYsQihG
 sAhTd9FoLcvyvD1UjIGg6LI7/H3apOL4HVGzGjIHwsIf56Cv/VdeEpYaJ6UosImmBlUc
 PFLbYVamc0ABkidq1PdEIy23AgwOt19NyTOZtGHTOTBQjAOyAWYF3Kz6t0YO7+ArulJ2
 Z2OsrEY9Au9KLEOS9TGECBND80hHORkbGrK/84I0VMbl+fQXoS4r86YYZbNM0rSWAZjA
 UWgqrINX/VWLDk3euHadgIizLatZJB2nr+UvSYinvHRxSMx+GmBMxK7i+IH+Cz9IgFCK
 K6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742314946; x=1742919746;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=30vcmK8Kb7EgO69NndpoCL59432NFZcGkb09xNX7nz0=;
 b=aje7VHnz7gvKelQpPwKj6vUZKRmf90Kb1nlbIPhtVYa9/4otn90nhWLf/QJK5SgZI1
 5/CHnc2njVlU6HhaKMpwjHOTX06Lf18ckRA+LNghq8C0PKoTfDsplJh5NIg5a3gyIjpk
 o4nFnC58mqnOq+5BIDpKieRVGP1HuSnVkdQxG2e5Txrn+XFBG4iPLD5vjxfqBX266JGO
 i9bjbUc18LTbPgLbZ2mE4NbkjAro7ZJiLd7PczQETQhlufYa841txejM6YqLGgWEvq6a
 UF2jwx8W3sz+7aO0OoVR22/wW4UktRpNPl315KBJv4MUxjbvzEY4UE1/nwVmZFe9SP9M
 hTCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTtrBukmU/P34cuyZ8pDhrz5HlWE8A9MFMdbTF8Z4+tAEd9EWkJTFxo6IWe1KNOgQmdD9H5KK0ehB8kA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwaKMwH2drmHZ26sV5LVniDazY/k6xYJ/zL5hUMg3s7ilVHTDsn
 c8d2rgcf592Kbq/SuQxLJCzGgjNRcifvrDZqREnLaFA+yh3eqP9XP4c0AFfRqVI=
X-Gm-Gg: ASbGncvagbYelZ6nTwO9wRwjw44Gp1pyq8xJGNGwDrZWcAOBh9IUK55zTPoKkJX8Aov
 7r9/xiIxOuBROmvvxU7xmaO3iazqa8pv4EgkPI+3bexQiNYXOpvpb2O+brUPaePhAd7M8r+02AM
 n9p35oHgCYfmCaCtPZM40CxsRv4CViIPGnc9YR9Z0tzUbt4xgPUWj5AR+XWuomBaUfH9hYA2bkW
 rmf6WKg2YJ2zxRYkFHBJA6TV44nqPoNM/Sxd+rt+ACdEEXsB+JmDnNtqZOKsfdHvdxWzZKRCASg
 3tVL0UolpQuwvAhhMpVXspAjlXPlTXhm0honFKYaPsuByO4=
X-Google-Smtp-Source: AGHT+IETiy237nAdexxdqvMHP+odcdjCXjFhjN9Ayys4lYn4AXHoxQDsgrwFoHMV7AdF0nuLdpHD2g==
X-Received: by 2002:a5d:47ac:0:b0:391:13d6:c9f0 with SMTP id
 ffacd0b85a97d-3971f9e7813mr16838898f8f.47.1742314946529; 
 Tue, 18 Mar 2025 09:22:26 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 09:22:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:21:56 +0000
MIME-Version: 1.0
Message-Id: <20250318-james-coresight-claim-tags-v2-2-e9c8a9cde84e@linaro.org>
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
Subject: [Linux-stm32] [PATCH v2 2/8] coresight: Convert tag clear function
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 17 +++++++++++++----
 include/linux/coresight.h                    |  3 ++-
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3f1c996d668a..9ff601e2415a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -151,12 +151,21 @@ static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
 	isb();
 }
 
-static inline void coresight_clear_self_claim_tag(struct coresight_device *csdev)
+void coresight_clear_self_claim_tag(struct csdev_access *csa)
 {
-	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
+	CS_UNLOCK(csa->base);
+	coresight_clear_self_claim_tag_unlocked(csa);
+	CS_LOCK(csa->base);
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
@@ -180,7 +189,7 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 	if (coresight_is_claimed_self_hosted(csdev))
 		return 0;
 	/* There was a race setting the tag, clean up and fail */
-	coresight_clear_self_claim_tag(csdev);
+	coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
@@ -211,7 +220,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 		return;
 
 	if (coresight_is_claimed_self_hosted(csdev))
-		coresight_clear_self_claim_tag(csdev);
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
