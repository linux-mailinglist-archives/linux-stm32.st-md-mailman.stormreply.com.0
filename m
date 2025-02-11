Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEA3A308D0
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 11:40:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 194C2C7A824;
	Tue, 11 Feb 2025 10:40:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0428FC78F9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 10:40:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4395560cc13so3123785e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 02:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739270430; x=1739875230;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5A8RVRjBK7H8bCZinYcme/5PJTGf7uIF6oMOSyxCJUQ=;
 b=nsKbhxvTXvDnInWYed8E4Bd8r+N6ihjdja1tefdMWyFcQSzF8sjo8tkihuqbxMfxkd
 CpiCI9CciLJ7kelOH7QDLHujKUxlzbK80h3a03ZWpeURLoiygwABWqE7P5Mepeh6Vv/s
 aUKwi621KDAXMP3yOvKsOQwvFyMHeetN1VQJETTVdm6TBdwbi0bqVauxltl/0JDlxfPA
 tHt6k4RN9hgjfqbDs+hYQR7Uykd85+bzRLe88S+sfyrFC6cIE4OoFOeKnEMuYfNhf/Li
 vG/rs5YKOq0/1hSFpceHmxPQ89YLLm+bg61dfSCYqWSiOI4riP5Ek0XuIVlCAON4rX/L
 Zg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739270430; x=1739875230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5A8RVRjBK7H8bCZinYcme/5PJTGf7uIF6oMOSyxCJUQ=;
 b=R1L8gPARTROdVD8Gyi6Uj3oSQ0THxIQZRRWmOxLZ74lVqYLX3JSmqXzf7Dh6z5Xulq
 V5U7nUTGeP5ppOOqTveATtWyWe18vZfheCmJZGEa6szxu5j9FeyKdNoixfCbdmvMxflJ
 /ui9zr/RAlHgNgzUd6HCDS6NfJinMfloVzPYsjQyFOuUcIDMyhIl/hVkqouHR8wPbMZX
 UaaKjaWLkPJAyu1UE8r0SoHcVEYVbq7WGIgsd9YY1+2Z0IbK4ecbT3d4W/gJa+tXOrXB
 fZStnSPpk+/VC1RSs8oVINaWwQnLa4s89/FMFQyF0qRxLe2zm4jowkFsATtep1UpvuX1
 53Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc0O7/xD97NAkStcPC1F7HdbDez5L7m+WUNCbDT8bebjEK/VX0CV2VQDAXta+Sge21NfR6XqVO4cynwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzLuH0iK1PDG89Yvm3b93BwtRKHGyjpI60H51Siokd11s6bpCAu
 sbCwU05qTk6RiFX5pcCZ/hyM4aBZGK59GXQci5jb1BnO/25EWDtxe3vgbiITZmc=
X-Gm-Gg: ASbGncvEOwLoPdfDKt5kOv0zk70dNxRqP8xTgyO2TWH6CX3vdnqn/fLfuUyni/uT3G4
 X8KLOdpPK6i7NZTt18sfZvWVtyH53ZfBwYBrD1K9rwzHwW33/0IxDIRQVkFa6KLezD6ACPca6H+
 Mg1srT96FXbyH3qf2GKnm9ktakv4bEvd2I21B/087KRbvecnshJ1QIdug2pC9jHMGYbwlwm6a/D
 lSNrZl5BHCfVXyvDQLKV61QcbgGUUpy43N45J70eSZr53tiPlA+akgRvG5BM/bgbJgwHxwIs5kR
 avYCZJc3Rv0H
X-Google-Smtp-Source: AGHT+IHsAnh1dHvEt+uOlGshWjb+DFPLFBYIUXSAhkCj/7Y+istcriVGonzZp0irFU33oYSY1ss5Eg==
X-Received: by 2002:a05:600c:5128:b0:439:473d:a3dc with SMTP id
 5b1f17b1804b1-439473da569mr60088295e9.31.1739270430353; 
 Tue, 11 Feb 2025 02:40:30 -0800 (PST)
Received: from pop-os.. ([145.224.65.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 02:40:30 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Date: Tue, 11 Feb 2025 10:39:37 +0000
Message-Id: <20250211103945.967495-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211103945.967495-1-james.clark@linaro.org>
References: <20250211103945.967495-1-james.clark@linaro.org>
MIME-Version: 1.0
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH 1/7] coresight: Rename coresight_{set,
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0a9380350fb5..523dbb381f90 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -142,14 +142,14 @@ static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
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
@@ -174,11 +174,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
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
@@ -199,7 +199,7 @@ int coresight_claim_device(struct coresight_device *csdev)
 EXPORT_SYMBOL_GPL(coresight_claim_device);
 
 /*
- * coresight_disclaim_device_unlocked : Clear the claim tags for the device.
+ * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
  * Called with CS_UNLOCKed for the component.
  */
 void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
@@ -209,7 +209,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
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
