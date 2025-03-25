Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B81D3A6FA81
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 12:59:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BD66C78F80;
	Tue, 25 Mar 2025 11:59:10 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7596EC78F7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 11:59:09 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so3065841f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742903949; x=1743508749;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jpLFATDWKZO90jD7k6C19hhyGuSC5NA6ygL5CbsK9zY=;
 b=SuYlXyJ4f1WsjstH5Ld+jGksKh9yfxJh7jfBuEZGKBzH7mM62nDQ+UWzHFE4dm3Slb
 pyz8kHp2dEfe/2LF4Mjze+JhtpuHK4O/7PdX+RYgoMKbdN8wdwjY8H6itvp5t8S3GcUq
 2VQ1qM/ECXpfQE76KnEbptGnT1okhCVAIz6tmcUKKD369zLwcaE9iLD1ToiuZiE2uwG3
 ehl2IKPN5xHqU33A1KWXTYGi3qVAFeog78Qq9xGAcQX1d0kqwXyLZxEcLr7KNQPhvgLC
 xe4RRM/Zj23M/dvZI5kU6vA4sspVtSKz+DHwR4LAzkc/rTeMh/9VyEWiKnMFr1pF0i8z
 oRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742903949; x=1743508749;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jpLFATDWKZO90jD7k6C19hhyGuSC5NA6ygL5CbsK9zY=;
 b=W4+6O4hWKpTacOggzWZNhfppVIQiHluVv3krQkUCyB0Jh/7af7EWSMiyUh1xV1ZgKz
 71ivdekkxxGYfSgSHLljjQ8qpHlqtalAaEcFm5owp9Y7djaCuoD9OkFLyF5xo15Q5RNI
 vaXSNI6OCSxfXM80+o4kM0bWu3xLSUyH7LUBrb4MRZvx1hRvuHd2jQbIM5MUlateTO22
 aEKAAc92XhD4FmbD14RjhJF/nKVeu5vO7noh4vzPhAuoHXVoFFhFaepyK/zD+I8D/8Rm
 9a428OnG9MA9acqxNnfpI83+OxBIWYXE5UGqwEYA3QCaetWmUJRtUa6A4R1Oup7SpflZ
 znPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6WZxhAAL8xRWqIaOGzrADrg05/a2SQ+8RnlsV+w8bkjg+tiwBUeHhgt/Wi+JuNp9n/lQfhYRLYdwpLQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxmspVCqrIOpDqfzoAL5toLgQAm6TG0fp5Jox5eTodvFKxdBe86
 SwZqdyshVejy6qXue/xQ24ikR3+3xpp4+GPp8o/BiR5s2r5v02Dmp4O4XUW0234=
X-Gm-Gg: ASbGncshuv4IO+D15Ju4wMsXAejHWJ+wsHh7sEt9LpQCmLm5/Hnl6FmVcjjVCRix6m0
 rV4rtYWVG3IftKW6e8nHIPyWAmvcQauDepBOAiMmhFFh4GyDBdgEyUgQNNuZQctO4rcQMimSOLQ
 u2/4ZF4Yp683InHPN6P7ekhMetD3b7du101svRgZZHGrNGsqGMUTB3tOAI+ehET32yyMzc90k2P
 O4JBXZGNxAkf9hUbdswlWd6GAy7ocjh3R7k9DwyK4cbmc7usnBSCcncY3xSdhVhUe9Zj1hijCaN
 KJz7/bI4GMlNe7sbq5DD1XtR57Ev0+2C1zveKMOqY4Ef4B4n
X-Google-Smtp-Source: AGHT+IGQRLjfoklE/nAi3keHa2krGni8a8quLIKCujHbsRuNFsPx1OQ7JeezjpcD78ucuIM5tbYduA==
X-Received: by 2002:a5d:5f92:0:b0:391:4389:f363 with SMTP id
 ffacd0b85a97d-3997f91bc76mr13237990f8f.21.1742903948838; 
 Tue, 25 Mar 2025 04:59:08 -0700 (PDT)
Received: from [10.42.0.1] ([145.224.90.136]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6676sm13687169f8f.62.2025.03.25.04.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 04:59:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 25 Mar 2025 11:58:48 +0000
MIME-Version: 1.0
Message-Id: <20250325-james-coresight-claim-tags-v4-3-dfbd3822b2e5@linaro.org>
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
Subject: [Linux-stm32] [PATCH v4 3/7] coresight: Add claim tag warnings and
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
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 51 +++++++++++++++++-----------
 drivers/hwtracing/coresight/coresight-priv.h |  5 ++-
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index e0638e5de0e0..33824f4a631d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -135,16 +135,6 @@ static inline u32 coresight_read_claim_tags_unlocked(struct coresight_device *cs
 			 csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR));
 }
 
-static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
-{
-	return coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED;
-}
-
-static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
-{
-	return coresight_read_claim_tags_unlocked(csdev) != 0;
-}
-
 static inline void coresight_set_self_claim_tag_unlocked(struct coresight_device *csdev)
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
+	tag = coresight_read_claim_tags_unlocked(csdev);
+
+	switch (tag) {
+	case CORESIGHT_CLAIM_FREE:
+		coresight_set_self_claim_tag_unlocked(csdev);
+		if (coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
+			return 0;
+
+		/* There was a race setting the tag, clean up and fail */
+		coresight_clear_self_claim_tag_unlocked(csa);
+		dev_dbg(&csdev->dev, "Busy: Couldn't set self claim tag");
 		return -EBUSY;
 
-	coresight_set_self_claim_tag_unlocked(csdev);
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
+	if (coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
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
