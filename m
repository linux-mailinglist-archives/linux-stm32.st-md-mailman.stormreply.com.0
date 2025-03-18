Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 538B0A67918
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 17:22:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 170F7C78F60;
	Tue, 18 Mar 2025 16:22:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 632D8C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 16:22:28 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso3179483f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742314948; x=1742919748;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ALchZOot//FGgxa5QWuInvWCPSBt1WNbqrc9Q6XX+5o=;
 b=ze1VrrSm6TtEi7njGKdvs1mYwhdYsk/qieWoPo9QxTvjryYjY0qDVIYhd5R8KVlUC7
 kiMKeaBmrhi1nKYzowQcy4fkNmi0ePNxhFu8HBQge2j/uUK+H/vdiYF96HeKO81Q8ONu
 R2NxYiL0KijRpjIT8wJPz4yX7BQdYwZ5U3s0dm4DQJPuwt+GVj1asZnRzxnFORUDINw4
 JoNbf9sd31IeLXF7kR6ZIw3CImrdQ2PU/rynUeS3FNmrT1oucNMGRKjou761CDTUp6BP
 Mk95pU+xXQEOWUlItiUypZrFdxzArk4csHyaTJRwGoLPlPv/R6RbFullhCWXkLwovCmH
 UiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742314948; x=1742919748;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALchZOot//FGgxa5QWuInvWCPSBt1WNbqrc9Q6XX+5o=;
 b=jCgz8dNQSnyMS1FTyacx3kLbgtSg8qQIr4/3OWbXNhv9BDsv9hBc91wN3ilswehdnT
 tTQkOBCuvZKhrWOivKcycyNWsJZTrUdHmZK1FUxUMAkmwcNDoeGyymcanydv2M4uadM0
 T35NtIXmf5rXIsosewD5FxJXdBf3wm5hI4fRHo5zDh2tJZDxoF6vjOWKb7lfKZivQgUF
 /0X1YqRsI05BPZysMpeBoZAYcANj+bBg9oW6AkNhsusXDHeudeM/9c6JIABnzzviFzzB
 unmGNOsvzr1OUsiZhOd+G0FUS/eDsFxsmXTNjz7iC4wsiJjDqE9Z6ux4OBtfHX9BNwm6
 9nCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrT85gWm+8fnwCaQcdbI7rFIVsy1eHtMVol09tmfLWPFirJSuRto5yL3ReB/3U2VMxbySl1ZyhKKIKcA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYbBC8JXR8pkR7ZRQU88EDtHzaLp/PQgJbzc+7vvEOWFuF9y5p
 bcycqOH1eRO51CtnSr4T/64RGcEIUl9DmrX/ijWautd7cGUhPurdokRzqDGXh7Q=
X-Gm-Gg: ASbGncveXB1sa5VSBQpEjAr1OVWhLTJF1EnBKGDiBA914e2spEPFkxSFLqzRPxzknWQ
 sXvrLbgeJLxD1f4wAlQAaouaLPCw7PvB/pb5upWxZ/dlHKNxTqjbfzNkIsWa9wnJ4OKUkkxghLF
 q4DVJmfppjeOTkSQTQWBWAxTTJtXy3I9JaUrPEUna1842wYkfHC8CDetFLYM4cH0FIKZaEGTI4C
 AA0uym/Du6nd+yaTxYDPxQ7PeaAB4j5Hc24vsY8CdX8jkdp96RHmuFb9DxRMljecRG0CD5+3HVv
 LMtkXlXN3msrcGf2eMkNgCdmnY4LmO6Ow/UJ004OhLxz9UqIctxhNPOMmQ==
X-Google-Smtp-Source: AGHT+IF4rGnbGHEoa5pDKJFwrg3P3FevDrpaRcIRwif399qLvhZbFXQMfBkg079H3FFpst3W+F7xmg==
X-Received: by 2002:a05:6000:2a7:b0:391:2e6a:30fe with SMTP id
 ffacd0b85a97d-3971f9e517bmr20040164f8f.39.1742314947911; 
 Tue, 18 Mar 2025 09:22:27 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 09:22:27 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:21:57 +0000
MIME-Version: 1.0
Message-Id: <20250318-james-coresight-claim-tags-v2-3-e9c8a9cde84e@linaro.org>
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
Subject: [Linux-stm32] [PATCH v2 3/8] coresight: Only check bottom two claim
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
index 9ff601e2415a..e39043a9551f 100644
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
