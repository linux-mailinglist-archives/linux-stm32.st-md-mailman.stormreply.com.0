Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4B7A6A8A6
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 15:35:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0B7CC78F6B;
	Thu, 20 Mar 2025 14:35:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C14C6C78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 14:35:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso4309835e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742481310; x=1743086110;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RYUfMkztXKy34QMNU5C7rZSoh6cruK9lZLqrSczib9I=;
 b=VcF4EIcZPjltfL9qFL0knk3Cg2lwFRdhF8XAliWCDctzZpKO+oOywj7GnaqoWAVO1x
 edrngRbJ3FcWznM+1WvJ0emFF7b38ccQmcE9EyWMHSudrt9MWt9A4ZSN31fBnsVO+bi1
 d94sTP09vq77sv6oT6Q9beHJcLmqsaK9I7LOZCh1b91dfRy+gD5+Ry2BYmx6WwZM7Jou
 W4TTvU/eyiajdc22fF7yIFy0bCsMKxWf5SfRFfYuPCAK7/OvPslYZR0AtjXQVDxQhjLk
 015XwWqhbrn6OFLJ3pvrd8JzNDmfPXjgS9hIzj2bRNL96Qeu1bo9xwmN4Iflrq5Ih6R4
 XMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742481310; x=1743086110;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RYUfMkztXKy34QMNU5C7rZSoh6cruK9lZLqrSczib9I=;
 b=mmOjowAzSq4iiL4NOPqm9+moxTgYfjPqqv0DKRNmipKD2E3ZcEdb6SfOi378T3XTaF
 hp6Yyjc+tP3SCNuLB9TnpqjrxBcG7voLD6U5rZimrmx6jzXhqvM7Sdlsxbizorqf6gpa
 xNjUbM9poCqjC8HVQNZvksp1Iv4vluagwmkvrInN8j492pqaW/AvrMmwvIhFNnj2buqL
 FKfXJEYrX/OsN77vsPWdYgu/K3/1F7zVP8zRTSHU42rGBN8wrbzw+llegxpEu8+cuzjN
 vLHMCJCk2sLmvuTOwRVRGOx3UWdDCeYMqoXs69hZ/EpppgnmMld1DMAzqwA2mvgzm/Sk
 ZN4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIyNQpZ4v6p0A4O9yBxeci883UetBmccdQFlWWjJl4Ruvc/VLFDcab4LuxrgWlk+U3vaO4jgvE1Hc2LQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyS68GGgPIMG4a2hY8Fd/Bms5neFspePeoD72YFjic8IxTIlFnV
 z4YRqYHlfPUNLjoQuqso9lQ/t7He7d0H1h581tPvlO3WPywav2SQM92D7ZsbVGE=
X-Gm-Gg: ASbGncvtVJWyLXTtZbOQjlwq85tmDTzgDHCG2qU14KYNL2S+CP13FgTwQiMcPCvdrFb
 OpaRXoirAf9WZ7hdO/p+5VGAUdJDRIqxgA9zTwBFJwGMhA+lgyHnJrk+zb2ift4iE55hGkns4hP
 CFuO8wEcXtmcBMBuR3dZGfok+VVC4uc1bshQ8VJp73G/v5BoUSTUJq8zmfjragyyFTOI+xx+mx8
 oqRDduxd34IDBDRNiISzFE8DU++kvoyOqRhd2DJPbDA0KHBjoLBK8PlUJFCyRf1k4wtMqmFHiTq
 Gev4dWYPov6P0F4OTyJLgE5Ulgm1SEwnAlKc3Mf/fonUAro=
X-Google-Smtp-Source: AGHT+IFvAZmo6NQ5OijrhciMN1Nhf7aIP4JbKjIelwmleIylRhiLnS3xjpZn3CfOBVpMLOLSS5GLhA==
X-Received: by 2002:a05:6000:1889:b0:391:a74:d7dc with SMTP id
 ffacd0b85a97d-39973b048fcmr4580230f8f.50.1742481310086; 
 Thu, 20 Mar 2025 07:35:10 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm24238187f8f.31.2025.03.20.07.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 07:35:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 20 Mar 2025 14:34:11 +0000
MIME-Version: 1.0
Message-Id: <20250320-james-coresight-claim-tags-v3-2-d3145c153820@linaro.org>
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
Subject: [Linux-stm32] [PATCH v3 2/7] coresight: Only check bottom two claim
	bits
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

The use of the whole register and == could break the claim mechanism if
any of the other bits are used in the future. The referenced doc "PSCI -
ARM DEN 0022D" also says to only read and clear the bottom two bits.

Use FIELD_GET() to extract only the relevant part.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 3 ++-
 drivers/hwtracing/coresight/coresight-priv.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 8471aefeac76..26d149a4c579 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -131,7 +131,8 @@ coresight_find_out_connection(struct coresight_device *csdev,
 
 static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
 {
-	return csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR);
+	return FIELD_GET(CORESIGHT_CLAIM_MASK,
+			 csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR));
 }
 
 static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 82644aff8d2b..38bb4e8b50ef 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -35,6 +35,7 @@ extern const struct device_type coresight_dev_type[];
  * Coresight device CLAIM protocol.
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
  */
+#define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
 #define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)
 
 #define TIMEOUT_US		100

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
