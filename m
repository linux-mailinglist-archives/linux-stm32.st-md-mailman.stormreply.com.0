Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69056A308D3
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 11:40:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35A9AC7A828;
	Tue, 11 Feb 2025 10:40:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBAC8C78F7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 10:40:36 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4395578be70so2820355e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 02:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739270436; x=1739875236;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SuiN1rfKfscB8sMfW2+d+Ei1aGExcejRdUcNsTvpxwA=;
 b=gvrEOgip0xG5Y2jvrmAf2tojcYTtFBkTGZV6VuBRWGlbfUjpaKlCSpJJ634e4C+gjH
 WorJuwMPMSDrIa9pNvBPacGbQbC4UJIzfDyInSK3he/knyYHa1IZycBFIIpqnmVzQnVu
 amep0fmCIzA0P4zErOI7u1Edp4PU3Dw5wwS9L90s+29H3dIDi5D4hFVPReOwVwUTSKim
 ocmNGqdx7egL9Fw7IFPY6RBtbLzK35jG1XSEi6RMnxTSoyS38S+9YgS9b0bOTPWxkb/H
 JwGJgX1YM4iSKT334P3pLXclVPTPriL0f/qUoO655ulV1qb+xwuf+C4/aTUKxZauJpzM
 eAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739270436; x=1739875236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SuiN1rfKfscB8sMfW2+d+Ei1aGExcejRdUcNsTvpxwA=;
 b=hXgcZavaHMXszA6GK3qm92Vv3j1Sl8Xmt/ZY3GaxMc2jikbdrIzpPZhrUx3lBAm6A8
 wcM/w+Omtxn6hgFRZVqkec3SQ29EKfNCa5zD/KQiPoWKEhhhQjRY4jmPaZvYiZPAehaq
 F9RtbOFrEyN1iIsZQc4DuqZR6nVe7NJ9ZugBwg8xFqt5pqht9ICUmqFKGfkXkZn1NiKp
 lg8GUYF7ySHIIYoIMUhO5c7w9MiJ75yU0VCijJVqEcPfm7mhZqbXt8OJ4IslNlo241+c
 UA2UxIqun0iMoHaWOvu51k+flXszHDYoxaOHrRUIV0AO0Irl9/GBW8VXe5GlN6LxJCOP
 cM1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1pmyPOt1hpQGEnmHt9GMISFMlbK1cijuZ2F0vUkFKMtlxVfFv5vnblTTOwd7vSYoBr0g9lNNd6dMmBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwH+DeAi7gwRqk6g0g+GqmYn55su01KLfXECYI79p3bHsRZQfgk
 Z1O0eDSj5Rjz/mFP585ZDYum2qjdNyCbEz6ao8RjfdM52y1+U7yXjUHgljoLJRQ=
X-Gm-Gg: ASbGncvW+y4HJnkVXn7QFIDgUrUtYH1eJSmyBdLArXKBUq8DsW1atxSD+s1Myyis6ic
 yJ7WMoRwgKD02CIT+YN6N/J45/uNEO4QnjNOZmCKlqLsdAqMnkrUsr6Rdh9f4972dLu635XBtoo
 u2eZJGiZc9bLKIMEPCeS1Y4IUdaQF3As4W1RF+T4nSjJEEjSJCuIFQXxkaXqRPH8m8TIfGv0wBj
 pZ53IfqlIcEarZVzacdv/aiQEUY99id7Hwfo4v4zW5iH3lnMmcPYKt2s4SJx2vInzDHvUxp/HPV
 7MVDlZvDH1wq
X-Google-Smtp-Source: AGHT+IE1hxIA+zty0IDfgAoUxOjIOrc1e6B7eBLp0wuK/35clgp+dxoPGKaDdwuWgNf5QUZVkobIVA==
X-Received: by 2002:a05:600c:4e43:b0:439:33c5:386c with SMTP id
 5b1f17b1804b1-43933c538ffmr110046565e9.5.1739270436244; 
 Tue, 11 Feb 2025 02:40:36 -0800 (PST)
Received: from pop-os.. ([145.224.65.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 02:40:35 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Date: Tue, 11 Feb 2025 10:39:39 +0000
Message-Id: <20250211103945.967495-4-james.clark@linaro.org>
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
Subject: [Linux-stm32] [PATCH 3/7] coresight: Only check bottom two claim
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 3 ++-
 drivers/hwtracing/coresight/coresight-priv.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index a669872b4118..7b53165c93af 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -129,7 +129,8 @@ coresight_find_out_connection(struct coresight_device *csdev,
 
 static inline u32 coresight_read_claim_tags(struct csdev_access *csa)
 {
-	return csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR);
+	return FIELD_GET(CORESIGHT_CLAIM_MASK,
+			 csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR));
 }
 
 static inline bool coresight_is_claimed_self_hosted(struct csdev_access *csa)
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 05f891ca6b5c..cc7ff1e36ef4 100644
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
