Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65318A6791B
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 17:22:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 274E1C78F60;
	Tue, 18 Mar 2025 16:22:33 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA4FEC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 16:22:29 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-390cf7458f5so5012185f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 09:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742314949; x=1742919749;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pGJ5zCEXGy4gA/KaDFLiaN40rMPxYRX5syJtqsz1eiI=;
 b=eaY22BdllquXJQo++67Caeuue44GvFUEFkLiHf3FnTyIRUmQn6MKIRglFmhC5GP2qu
 hMjeoi+gfCS0V0x24sSKAUBqSGAYkhXaul+kV7zWVvwgRCp/ENyuBIywhFyxVcyAi9Nc
 /AQNz9d/BKZqHcin/fpHxTdSWbAhlV2kpqQzQAw3N0WJchLcCbRCWhq6BVrgCVYvDiFp
 ze7auqyvjR+KQMoD2D9h320HEU29/RbzK2nvhxWhSXh2XVq6J6y4vWomzvq03jlh6mZJ
 73o7g5fSQmy1MZqtTWiUNrYgyMiwkXpdF5C6Z7vyrZBIdqrL6qVNtsLGzX4YyIoUHJey
 yu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742314949; x=1742919749;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGJ5zCEXGy4gA/KaDFLiaN40rMPxYRX5syJtqsz1eiI=;
 b=mjKiRsdQ3gQgCQk5oUEcIBKHzYy5f/XKqtOFTvbbA1NMhbVU68F4qtpUb4Rc299j0B
 RfZr5XMzusNbzlPKo3l5DsKNwQTKmWH+DHyKS5ZM2ToXp1ioQ82/a0YGGzZ8BZjYDofF
 d52AUAQz0ZAqlHux1j9zDZIzFqceHigjhbgppfHfsP0p2TzVZHUJJmAy1T3KmANiMQ10
 Z9jHZ1mq3n5Zxkugs0elFdyfYjSGMcKOcTWkvrcm5Oz+wq59YlnkSdSK2sejYR9VkFlO
 UYfAiTLEymvlbymZg5xy+GXbdCbVQ+lQBjhK2GsvfTNVAaVr6ypJ9xYZD8xMBp6MOGpp
 kb7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVxHsc1Ng60uZn0fNx7xrRK9PfYV3yEQszPZqett3etvVwprmz7IzPYqGD/CslT0j8wLgZWRjpr4jzkw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxSLVQlJuXbZvzbm6+XKb15zbE9WZWItYpdCS9IIXMz2Q2RiFW6
 Gqq1WEBOeCHSMaeVHGekS3PKRDFJ5nODG9KbxoFa2gB8doYCXvdmfcidamQNAio=
X-Gm-Gg: ASbGncv3y3J8roWNMm5GNWSCYGzilpTWpJBA+ahjqvxp7dBor389or/rpZA8FeAPxaU
 fk6cfoZIdp7quRlu9TnZxkaREPQcWQol1bsEOfD2E9neu/ZtqD0F4NgW4GKy6l5dYGbWf0zgaqK
 O2HR9UVCX/1HIpJxoFoo20zN3uTjWYbTpWKQBfeqMQmOt+vwpfCA2gJyBHO3HPv/nJ7sFi5GeA0
 QcoQurWfgJkhOeEWEvUZHOTQqhPp5EbskWMzcW5JHNnAOURqGuI2WV7VkrSntQvEfxRbdSH4hyI
 8CeSzIiugrgSj7RFLQs8KVDCrVRpNhL169YxECYA5H2bSB8=
X-Google-Smtp-Source: AGHT+IGD5l1woUahupr3/UQIVjMPG5ye4Qvywoq72MhWarq/PntTcl1VjdMMAP0XoDz6JV4vEUnAmw==
X-Received: by 2002:a05:6000:400f:b0:390:d82d:6d4f with SMTP id
 ffacd0b85a97d-39720d47024mr12201789f8f.52.1742314949252; 
 Tue, 18 Mar 2025 09:22:29 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 09:22:28 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:21:58 +0000
MIME-Version: 1.0
Message-Id: <20250318-james-coresight-claim-tags-v2-4-e9c8a9cde84e@linaro.org>
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
Subject: [Linux-stm32] [PATCH v2 4/8] coresight: Add claim tag warnings and
 debug messages
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

Add a dev_dbg() message so that external debugger conflicts are more
visible. There are multiple reasons for -EBUSY so a message for this
particular one could be helpful. Add errors for and enumerate all the
other cases that are impossible.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 51 +++++++++++++++++-----------
 drivers/hwtracing/coresight/coresight-priv.h |  5 ++-
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index e39043a9551f..5f08845faf0d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -135,16 +135,6 @@ static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
 			 csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR));
 }
 
-static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
-{
-	return coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED;
-}
-
-static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
-{
-	return coresight_read_claim_tags(csdev) != 0;
-}
-
 static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
@@ -180,18 +170,41 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
  */
 int coresight_claim_device_unlocked(struct coresight_device *csdev)
 {
+	int tag;
+	struct csdev_access *csa;
+
 	if (WARN_ON(!csdev))
 		return -EINVAL;
 
-	if (coresight_is_claimed_any(csdev))
+	csa = &csdev->access;
+	tag = coresight_read_claim_tags(csdev);
+
+	switch (tag) {
+	case CORESIGHT_CLAIM_FREE:
+		coresight_set_self_claim_tag(csdev);
+		if (coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
+			return 0;
+
+		/* There was a race setting the tag, clean up and fail */
+		coresight_clear_self_claim_tag_unlocked(csa);
+		dev_dbg(&csdev->dev, "Busy: Couldn't set self claim tag");
 		return -EBUSY;
 
-	coresight_set_self_claim_tag(csdev);
-	if (coresight_is_claimed_self_hosted(csdev))
-		return 0;
-	/* There was a race setting the tag, clean up and fail */
-	coresight_clear_self_claim_tag_unlocked(&csdev->access);
-	return -EBUSY;
+	case CORESIGHT_CLAIM_EXTERNAL:
+		/* External debug is an expected state, so log and report BUSY */
+		dev_dbg(&csdev->dev, "Busy: Claimed by external debugger");
+		return -EBUSY;
+
+	default:
+	case CORESIGHT_CLAIM_SELF_HOSTED:
+	case CORESIGHT_CLAIM_INVALID:
+		/*
+		 * Warn here because we clear a lingering self hosted tag
+		 * on probe, so other tag combinations are impossible.
+		 */
+		dev_err_once(&csdev->dev, "Invalid claim tag state: %x", tag);
+		return -EBUSY;
+	}
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
 
@@ -220,7 +233,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 	if (WARN_ON(!csdev))
 		return;
 
-	if (coresight_is_claimed_self_hosted(csdev))
+	if (coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
 		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	else
 		/*
@@ -228,7 +241,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 		 * and has manipulated it. Or something else has seriously
 		 * gone wrong in our driver.
 		 */
-		WARN_ON_ONCE(1);
+		dev_WARN_ONCE(&csdev->dev, 1, "External agent took claim tag");
 }
 EXPORT_SYMBOL_GPL(coresight_disclaim_device_unlocked);
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 38bb4e8b50ef..6e8cf55aee0a 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -36,7 +36,10 @@ extern const struct device_type coresight_dev_type[];
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
  */
 #define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
-#define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)
+#define CORESIGHT_CLAIM_FREE		0
+#define CORESIGHT_CLAIM_EXTERNAL	1
+#define CORESIGHT_CLAIM_SELF_HOSTED	2
+#define CORESIGHT_CLAIM_INVALID		3
 
 #define TIMEOUT_US		100
 #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
