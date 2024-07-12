Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E99A93F9F6
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF51FC7802F;
	Mon, 29 Jul 2024 15:58:22 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43054C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 10:22:51 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2eea7e2b0e6so22638811fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 03:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720779770; x=1721384570;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BwI9jTEsVvDswQgvITJiqUvAl80XwA5xHpIDYVZZf9Y=;
 b=nBbvSwQD4C4vSu8GrFFjuLEDBqtUBoXUKtRuVSoRkNTxps8xePmTyzxYfWaLp2TMrr
 aAJr+AcyfLiDTIyPRRsfdtFBtyTQXCrxQVQxPypHLfSo9PJB1PmdU6VgPu/n0uH6Nmk2
 pfMiGXx1HEONXDxY+xSf0RYsJmyJmbgaLY0wQIwc1wP+btQ6ofTOGGouqPjaqL98uw7B
 ekiIy7wc43uh3+CFubW6N5WpEfnDZtcFhbf87niZgeK06lsk1+P/4H5YBw0JzH6CXPiR
 Ef2xbn1EdbLTJEsB1h6d/foPXts7uG/9EtdqWC1cPn7hWNqxUcoB0MtgwhMGQ8r9UGX1
 z/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720779770; x=1721384570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwI9jTEsVvDswQgvITJiqUvAl80XwA5xHpIDYVZZf9Y=;
 b=hzk1yfzImlDA4DvcC8SvXqHPlhwxv+aI8qkd290yYEVhSC5ZxWLCUF9JgfcVF4yrQF
 rPfkwBzT1UwbMzFA9BUx/yqOPxT9WgpSSianjS/9nockLXSBIC8Xl9tl2stBQ5XAdrGE
 /4UeB9uD4G6itZZer39mZ8yzWSjtw2IYEpeZsa9IHhBfTKHIu018TdQHwVGgTjoBI55e
 6sjUEME49Gheol/+7ABw02hrPbxsidHfAGfm3WeRNfeYq8W9ufJpVBYP3BqcEbxvYLd4
 TlyBUIft4zZA/fo2gM03TVFU8sRZQFUCWLvNJak046bsJCUSvn90Im9Hol/8/Lx2CYVG
 POFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKs0LVaj0E2UImsgFgHXFVEM7Z5iDMspQoQgTvAAZP9tvmxRgZMK0Fudj2Qsz2DxFbOdussBa7xqkxLE/fXsGmwW+5LlpFZtzSEnDBVOuW6+lw+jPozjzX
X-Gm-Message-State: AOJu0YwfT1lrNm4+scVEmgSDTfrb8/bGMasbyzVTxtpz+R/HFMFdGI9h
 5zRrYR/b/Onfntyar7Ry3REu0cI/pTZ+EBeZCJow12SbwiEYHhtVqoA6bsgQUeo=
X-Google-Smtp-Source: AGHT+IHb1uo/ezehFmvJBG3pixDiP0iKwZcCOyic9lYbULsOd868Wy8XD42z86zOXyTa11uw8ecUbw==
X-Received: by 2002:a2e:3315:0:b0:2ec:565f:ef56 with SMTP id
 38308e7fff4ca-2eeb30b4d38mr72972731fa.7.1720779770420; 
 Fri, 12 Jul 2024 03:22:50 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89164sm9911058f8f.63.2024.07.12.03.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:22:50 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Fri, 12 Jul 2024 11:20:18 +0100
Message-Id: <20240712102029.3697965-10-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712102029.3697965-1-james.clark@linaro.org>
References: <20240712102029.3697965-1-james.clark@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 James Clark <james.clark@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 "Liang, Kan" <kan.liang@linux.intel.com>
Subject: [Linux-stm32] [PATCH v5 09/17] coresight: Remove unused ETM Perf
	stubs
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

From: James Clark <james.clark@arm.com>

This file is never included anywhere if CONFIG_CORESIGHT is not set so
they are unused and aren't currently compile tested with any config so
remove them.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../hwtracing/coresight/coresight-etm-perf.h   | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index bebbadee2ceb..744531158d6b 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -62,7 +62,6 @@ struct etm_event_data {
 	struct list_head * __percpu *path;
 };
 
-#if IS_ENABLED(CONFIG_CORESIGHT)
 int etm_perf_symlink(struct coresight_device *csdev, bool link);
 int etm_perf_add_symlink_sink(struct coresight_device *csdev);
 void etm_perf_del_symlink_sink(struct coresight_device *csdev);
@@ -77,23 +76,6 @@ static inline void *etm_perf_sink_config(struct perf_output_handle *handle)
 int etm_perf_add_symlink_cscfg(struct device *dev,
 			       struct cscfg_config_desc *config_desc);
 void etm_perf_del_symlink_cscfg(struct cscfg_config_desc *config_desc);
-#else
-static inline int etm_perf_symlink(struct coresight_device *csdev, bool link)
-{ return -EINVAL; }
-int etm_perf_add_symlink_sink(struct coresight_device *csdev)
-{ return -EINVAL; }
-void etm_perf_del_symlink_sink(struct coresight_device *csdev) {}
-static inline void *etm_perf_sink_config(struct perf_output_handle *handle)
-{
-	return NULL;
-}
-int etm_perf_add_symlink_cscfg(struct device *dev,
-			       struct cscfg_config_desc *config_desc)
-{ return -EINVAL; }
-void etm_perf_del_symlink_cscfg(struct cscfg_config_desc *config_desc) {}
-
-#endif /* CONFIG_CORESIGHT */
-
 int __init etm_perf_init(void);
 void etm_perf_exit(void);
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
