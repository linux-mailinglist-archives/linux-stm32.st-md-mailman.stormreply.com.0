Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEE7A6FA80
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 12:59:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EDA3C78F77;
	Tue, 25 Mar 2025 11:59:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5A13C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 11:59:07 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso34474525e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742903947; x=1743508747;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Xzlt1Rzvb520tIYWakwAX5OIfk/gS8FgIjZQBtZ1BQw=;
 b=iFKylZQHzZps/BZOPnvS/MHqH182gxFxa6WHHodwfxCGD+EcNKMMYanxXh6z+zUMxf
 9QNGrGv9YwwyY6sRPAUf2oj5OU5nyexQ+zTE0d4HoH54/f9Y/4S1qOFfLTBAShHictAU
 gXuULGk6++C5DEVf+NjkAIbueArRwqXAdF2W3LBHo9VUM3mXdKJdm7lPycJX1BPmqSFi
 PsJgKS0MJjHb4Pc+oYv46bbhsUzQ30OyrooiUvpxwmnvj6PMzieI0qMUdqxPAYXYWkwA
 xsgfuimApxSG3U0ph3Qe8sWsmxO17deEi1Vz9Sdi5PlOj71Bae1XAQi4OFLM/vAtd43o
 cDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742903947; x=1743508747;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xzlt1Rzvb520tIYWakwAX5OIfk/gS8FgIjZQBtZ1BQw=;
 b=OFz/z6WtNr5B0CCBNfUeN/0tKDGnjPAbVQYdsjdguuLA2qJfuQhkDOZCQMw9mq4Bdz
 sUseB1EX0bypbrobgf4t1JBLDzzCCAHwGPAI+/DOSwD4MNSgh4gjvzrDDIaZOAxRC7tG
 jR7I1ERvL7YHcxM03a2neGxdTMOKfypdzmw+GjFpuOj/E494Ak5g9cAKxIgbwcATyQjt
 S0m9rdPpltrDYhIKnJNvE5ZhM0rXhf43i0NMrmES/VCjxz4PGzCahI/+bIQJqehh60tm
 M99Bj81OeDv9Zj1bMaZ2bdasiYlgoS/QEiOi09BgBvsVfcpGIeSaPeqHSvqABDtnWi0c
 Aweg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyGSDbQdo6KevwvJSl1Qah6PB+EyH+YM8d2K201Nr8hkMoWY39WQ20AjUxcRroJerBxRFORbVXKvCOJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyK6giptbXPtwuRG6TMnlys9eTq4iBg1r59trRU8pA2sl9TnRLK
 nd8Et5tDJ7PKQYZZBsk/ZugKod8p55wDayjGkT4klt372zDU69b6Sln//Pi5gLo=
X-Gm-Gg: ASbGncsROLYN0mm384nZo3P5QFwDENwX5fccK4luOwyjTTismN8B1/G2W0BRz2IcJoy
 +N0gS8zSYYqXYDMjDRPeCBIYSN+Z8qLAMxF9jHU49R2mtQD/77jD/LFPEnS6vbiZj172t12jh/L
 OJQOmhkrQAm5vLeGPJtWiASLSk3FiB9zDBERgXuOt87jPcuc4+eKqDJw0Op6pW3AIoVvXvIFahq
 urOLdERG9stZU8K1z2FYwWk0F0vynkj2bmVBntSA9fwwK4lpA2CH0iiCgCZpf4I+pgTKKJq37oM
 e6JqCzTE95lO8X9WDGpDMRGCkAOatnbNhccyolDnduUAPef8
X-Google-Smtp-Source: AGHT+IHmwU3sf2ERC5YZs23ogMiMNFDMx/Jl+ToaspZF/hgfKgGiiw1uVFM9CO8NyhGifaNlqugPWQ==
X-Received: by 2002:a5d:47a4:0:b0:39a:ca40:7bfb with SMTP id
 ffacd0b85a97d-39aca407e6dmr1134175f8f.54.1742903947366; 
 Tue, 25 Mar 2025 04:59:07 -0700 (PDT)
Received: from [10.42.0.1] ([145.224.90.136]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6676sm13687169f8f.62.2025.03.25.04.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 04:59:06 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 25 Mar 2025 11:58:47 +0000
MIME-Version: 1.0
Message-Id: <20250325-james-coresight-claim-tags-v4-2-dfbd3822b2e5@linaro.org>
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
Subject: [Linux-stm32] [PATCH v4 2/7] coresight: Only check bottom two claim
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
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 3 ++-
 drivers/hwtracing/coresight/coresight-priv.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d895815dee1d..e0638e5de0e0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -131,7 +131,8 @@ coresight_find_out_connection(struct coresight_device *csdev,
 
 static inline u32 coresight_read_claim_tags_unlocked(struct coresight_device *csdev)
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
