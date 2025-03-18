Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC77A6791C
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 17:22:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33A07C78F74;
	Tue, 18 Mar 2025 16:22:33 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38257C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 16:22:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3f4so3582000f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742314951; x=1742919751;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WRSIoJtQEht7L+lhpKZdRykVgJI6cMPKCHCjNInEcQk=;
 b=BhkoQ/2pAUhEHubT/JHzA2oH7ddi1Dx5d0MHm+mZN6btVCnKa9lbhHVTIO6PEZUFBf
 53yWbggxLx+cfUkVUBDXmpTCs7y5zhBfYZ3WpAXj/dDcUwhdYbqW/hjmlCAVSlhpIhZF
 r+s2URmwNXGQgDslZztKadQW5ClLARdl4/PfZTscRFTuKyylBxqE8LFrIDliLMYuVsHU
 4gJnnI+Ed1K8AGKz19YfsvNcFiI1zUYPhk8wWLUuo+9USh+l80ffQtG5po7o/KwBg2g5
 EaQbGlV344nm32RCdU9Pmk4KSjfGx1ootYYY30t4srNWshkAX0VKLNQcRVUga322wW3u
 yTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742314951; x=1742919751;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRSIoJtQEht7L+lhpKZdRykVgJI6cMPKCHCjNInEcQk=;
 b=kcdEKRCA36tdioXqkvEO4OPBWO9+8br8Xht1r4Ppwt6OWpZtfM2a7CaGuiSVyHkuXz
 ZBcYY+zzljVpiYW7f3Ii8l03Hl709gHwCN2XDt0k7NCIlitF2t4CMerCZKYNtU6TCXFW
 pBHDiKzW5ktggTGINkBsW6mNZw4uucagxRV8z6A3TS6U2VipAYox6JyOKJFpxGDS53RU
 X78onlCFeAzUvjqHo6kDqg12bOvZvhrMCov39kNUeoag8qsKQoWnjN+duybF29jZG++p
 YQN8Pw4yJpWo4dOj2TejFZSgerfwSjVmRTAtHfqp5E5l2aASJUtV4JiiVA5OZQ63BoWe
 xRnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV11061IFaE1EbO6Mlq39z9SZ0YOHHWgF1/FeHBfgZp9rTM3NG550Uuf4XcxHX0XF17OvPta/Px/BO40A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzdY48IHXbdmXhZwuc5v5OMFxlPjPEgPJCWfyxP8dTI6/S41veV
 JXoNza10x4yd+6cqtKy/CJr7UTzb62WZt9gno9p6lpAC9YHKMyBgoPbkdnf6o00=
X-Gm-Gg: ASbGncul3LKNMFVQk5lWGwFCHCdzGK8qkoV+n9JZMHBd7XpKlfX3rEwJ4tTuTtjf8LK
 nmNiTiUia1LY4N6uBipVQPvADC3YFA+wTMtm/SX0shqZqoqUZQ6nBhgvB85aMxY76lmiFAf/5io
 mIkTuhVjYxxAmZBHrXDLaNn2qjqruHl3ItOB6duxZ+hZzzqXN2QPjattLJtmpSi9dxpNYDcY8Ml
 2AMj30oQRFVelAsveZUFF787qVMVn4BmE/UWyNsrbb3bODjFLf4CDw/3BR+bXZn7Vwdcuxp5/GN
 p5F0l5O9oKlvhBbIHOBMqMMM174jkTXmU75917MUwuBm8RqKXq7tHPbJQg==
X-Google-Smtp-Source: AGHT+IE9oZFsPwz083sEIt1xLxpkaeWDmU244cuNkbu74PheoYY6+y+/eO82rufHd0nZQ7vu7yeTIQ==
X-Received: by 2002:a5d:5f95:0:b0:38d:dffc:c133 with SMTP id
 ffacd0b85a97d-3996b49984dmr3916452f8f.44.1742314950657; 
 Tue, 18 Mar 2025 09:22:30 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 09:22:30 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:21:59 +0000
MIME-Version: 1.0
Message-Id: <20250318-james-coresight-claim-tags-v2-5-e9c8a9cde84e@linaro.org>
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
Subject: [Linux-stm32] [PATCH v2 5/8] coresight: etm3x: Convert raw base
 pointer to struct coresight access
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

This is so that etm3x can use the new claim tag functions which take a
csa pointer in a later commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm.h        |  6 ++---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 27 +++++++++++-----------
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    |  8 +++----
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index 171f1384f7c0..1d753cca2943 100644
--- a/drivers/hwtracing/coresight/coresight-etm.h
+++ b/drivers/hwtracing/coresight/coresight-etm.h
@@ -229,7 +229,7 @@ struct etm_config {
  * @config:	structure holding configuration parameters.
  */
 struct etm_drvdata {
-	void __iomem			*base;
+	struct csdev_access		csa;
 	struct clk			*atclk;
 	struct coresight_device		*csdev;
 	spinlock_t			spinlock;
@@ -260,7 +260,7 @@ static inline void etm_writel(struct etm_drvdata *drvdata,
 				"invalid CP14 access to ETM reg: %#x", off);
 		}
 	} else {
-		writel_relaxed(val, drvdata->base + off);
+		writel_relaxed(val, drvdata->csa.base + off);
 	}
 }
 
@@ -274,7 +274,7 @@ static inline unsigned int etm_readl(struct etm_drvdata *drvdata, u32 off)
 				"invalid CP14 access to ETM reg: %#x", off);
 		}
 	} else {
-		val = readl_relaxed(drvdata->base + off);
+		val = readl_relaxed(drvdata->csa.base + off);
 	}
 
 	return val;
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 8927bfaf3af2..cfd463ac715c 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -86,9 +86,9 @@ static void etm_set_pwrup(struct etm_drvdata *drvdata)
 {
 	u32 etmpdcr;
 
-	etmpdcr = readl_relaxed(drvdata->base + ETMPDCR);
+	etmpdcr = readl_relaxed(drvdata->csa.base + ETMPDCR);
 	etmpdcr |= ETMPDCR_PWD_UP;
-	writel_relaxed(etmpdcr, drvdata->base + ETMPDCR);
+	writel_relaxed(etmpdcr, drvdata->csa.base + ETMPDCR);
 	/* Ensure pwrup completes before subsequent cp14 accesses */
 	mb();
 	isb();
@@ -101,9 +101,9 @@ static void etm_clr_pwrup(struct etm_drvdata *drvdata)
 	/* Ensure pending cp14 accesses complete before clearing pwrup */
 	mb();
 	isb();
-	etmpdcr = readl_relaxed(drvdata->base + ETMPDCR);
+	etmpdcr = readl_relaxed(drvdata->csa.base + ETMPDCR);
 	etmpdcr &= ~ETMPDCR_PWD_UP;
-	writel_relaxed(etmpdcr, drvdata->base + ETMPDCR);
+	writel_relaxed(etmpdcr, drvdata->csa.base + ETMPDCR);
 }
 
 /**
@@ -365,7 +365,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 	struct etm_config *config = &drvdata->config;
 	struct coresight_device *csdev = drvdata->csdev;
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 
 	rc = coresight_claim_device_unlocked(csdev);
 	if (rc)
@@ -427,7 +427,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 	etm_clr_prog(drvdata);
 
 done:
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 
 	dev_dbg(&drvdata->csdev->dev, "cpu: %d enable smp call done: %d\n",
 		drvdata->cpu, rc);
@@ -549,7 +549,7 @@ static void etm_disable_hw(void *info)
 	struct etm_config *config = &drvdata->config;
 	struct coresight_device *csdev = drvdata->csdev;
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 	etm_set_prog(drvdata);
 
 	/* Read back sequencer and counters for post trace analysis */
@@ -561,7 +561,7 @@ static void etm_disable_hw(void *info)
 	etm_set_pwrdwn(drvdata);
 	coresight_disclaim_device_unlocked(csdev);
 
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 
 	dev_dbg(&drvdata->csdev->dev,
 		"cpu: %d disable smp call done\n", drvdata->cpu);
@@ -574,7 +574,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
 		return;
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 
 	/* Setting the prog bit disables tracing immediately */
 	etm_set_prog(drvdata);
@@ -586,7 +586,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
 	etm_set_pwrdwn(drvdata);
 	coresight_disclaim_device_unlocked(csdev);
 
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 
 	/*
 	 * perf will release trace ids when _free_aux()
@@ -733,7 +733,7 @@ static void etm_init_arch_data(void *info)
 	/* Make sure all registers are accessible */
 	etm_os_unlock(drvdata);
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 
 	/* First dummy read */
 	(void)etm_readl(drvdata, ETMPDSR);
@@ -766,7 +766,7 @@ static void etm_init_arch_data(void *info)
 
 	etm_set_pwrdwn(drvdata);
 	etm_clr_pwrup(drvdata);
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 }
 
 static int __init etm_hp_setup(void)
@@ -827,8 +827,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	drvdata->base = base;
-	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.access = drvdata->csa = CSDEV_ACCESS_IOMEM(base);
 
 	spin_lock_init(&drvdata->spinlock);
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index b9006451f515..762109307b86 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -50,11 +50,11 @@ static ssize_t etmsr_show(struct device *dev,
 
 	pm_runtime_get_sync(dev->parent);
 	spin_lock_irqsave(&drvdata->spinlock, flags);
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 
 	val = etm_readl(drvdata, ETMSR);
 
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	pm_runtime_put(dev->parent);
 
@@ -949,9 +949,9 @@ static ssize_t seq_curr_state_show(struct device *dev,
 	pm_runtime_get_sync(dev->parent);
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 	val = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 
 	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	pm_runtime_put(dev->parent);

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
