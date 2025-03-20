Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F598A6A8A7
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 15:35:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17739C78F77;
	Thu, 20 Mar 2025 14:35:13 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAF63C78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 14:35:11 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so5464655e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 07:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742481311; x=1743086111;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BwLrnZ7veEKh9dgDPH9OcYYObOhDGXo4oYTlew/IRG4=;
 b=NuXsgnlLjpGAWfYKRt/BcoTYzC+lEsEPXSRnFkH/EQVxj+q+CXIFXmyY7yrNik6YwW
 6NVWFLocsp9m4dNQYn5pd6kX7SBZYtAqSqsu/HF8B2oY6Z5xIULJubdEAATRve7zuEgc
 jYQYHZkvSnSr2hsuPGRoa/HBk1kq1ZGRl9uRjvRw/+aJ/lfVUpPcMhROeg5CRxo5lfQa
 9sd3xArHznElp+owkhhV+lLH/Q23SseIZKGPvxY5rpPZN809uh3tiTb2X/B4hvCsTng1
 OGkiYtIPZcXx5YTYdL493+ZjC2c3VdtRI05Rku+DH1K+iksrrvJ70dF7a1FgiXsDziJO
 bPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742481311; x=1743086111;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwLrnZ7veEKh9dgDPH9OcYYObOhDGXo4oYTlew/IRG4=;
 b=ILRMr+T3PH1GIB1DeaZr3t5QXxMp+dlSEN0mHsPAZ2E7NYC9lXSirt5ahAb2g3VK+T
 peexPkg5WaMz82r2zuBoCvlBZeocZ+H6ZhuJiTeRM8hLDxCmOhJCQz9u3h9rFWnbRQ25
 2oru17lENs+A7wrJ0cEA38oKhCfIXW648mxOW3VMS/WE4vdxPjrOlGxT+EaxSS9f3exY
 Gdaw33w4MC6BZL8Jo7POUznPspOfkU2eR3jZvVEr5ck7AGipV27dR45fMWS4WvKXj2+k
 62CkYXve1/BEDwRzKPOPIS0IEqyf4vQduwHMmMzfUhNtOpiFYEDSQxay3ghe3AunRbD0
 pD1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsj8/7s98WboZMUWpGdIqG8q8gdTDVpL31TT73pz4kBmF4o6grUvCEm7qJhXvBhiQZfz6G6VhdT1eqPQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxi6rkCkDsXvbLmknCET2LuQVrPTPtS2qUrHuDbTowfS5h7vmsv
 Io69jvWOmXCzLIFEZmDRuDGD8vgomgc5Z+40nAZGQ6LEW/h5VdFMVAXVmIKDeD0=
X-Gm-Gg: ASbGncuw32luoU4hqHIoA0Z0dN9oqu83hDKoajTeduQN3iebC623SExRpzwZ2f0s62+
 NPrBy07rJGMBd9I9gF2R9IO7qjwklUW8XjBy0o0VgEjQEsFImzcNjLPyGnH1tTCb59+MBzXfiuI
 8cdoAAi2T/VTBGcXlJkb3iNeYlakQrFcXlUiDuFnHmzK8qXQd2ScaN+QmYBXZpdBvvFGA5DWCyg
 9Lly2p2f+jTXcR/WsRIYF+ndyPdP0QIhJ3M1F+SHvieFoqTbI633zlPkGVkALHfveNLUhNSEc3d
 jQBtdCQVAWzVkuoFvTH4pmp22GaOyfLr16mHZJ2Q4GUBLo0=
X-Google-Smtp-Source: AGHT+IHwP3zwF5MimE9Q6RcdnULD6yCEU4RZj5mW35Mho0ZLiaj7qqK35hnHeoXoBUJLCg626reWtw==
X-Received: by 2002:a05:600c:3c8b:b0:439:4c1e:d810 with SMTP id
 5b1f17b1804b1-43d4917b597mr32574525e9.9.1742481311313; 
 Thu, 20 Mar 2025 07:35:11 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm24238187f8f.31.2025.03.20.07.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 07:35:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 20 Mar 2025 14:34:12 +0000
MIME-Version: 1.0
Message-Id: <20250320-james-coresight-claim-tags-v3-3-d3145c153820@linaro.org>
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
Subject: [Linux-stm32] [PATCH v3 3/7] coresight: Add claim tag warnings and
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

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 51 +++++++++++++++++-----------
 drivers/hwtracing/coresight/coresight-priv.h |  5 ++-
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 26d149a4c579..2b5a7cceb719 100644
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
@@ -182,18 +172,41 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
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
 
@@ -222,7 +235,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 	if (WARN_ON(!csdev))
 		return;
 
-	if (coresight_is_claimed_self_hosted(csdev))
+	if (coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
 		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	else
 		/*
@@ -230,7 +243,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
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
