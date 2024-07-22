Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1355693FA17
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C17DBC78F95;
	Mon, 29 Jul 2024 15:58:24 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 398C5C6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 10:13:13 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42797bcfc77so30820245e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721643193; x=1722247993;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CtaJjK7rrgJVkNfrm1RPI3wUUBorSunZ8bK+jPbC78c=;
 b=SThxmdl83Lx9KFNss66goIe0RXUMgyPFui9uOZvqgqAPUvEVd2mR6dDvVAOfXC13mK
 XzTL5/HVIZakNwmNJ+OQGexc2gQphrWPPhHm+bj+4Y32tl0q9mcTi25JuKqegxkWO755
 H6UBVZvjN8bM0KX4/fxS8oKP5buajp0AtR303rRKp7jXD481gb/lob1rNHDmPew9lGrT
 DkZ4s6h076msbyYu1Hg2iP0nCNkMNhxEIZdAJnXPnPy4+N20MsyO1yI6hxCq5mXMGpOA
 16qXfUSgwW7YWqU2w+KqlajHf2TnKvXaRN0SoqGbz4E32Zkrmua3ceUOlKTDRAl6aPii
 XQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721643193; x=1722247993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CtaJjK7rrgJVkNfrm1RPI3wUUBorSunZ8bK+jPbC78c=;
 b=F6Aq/GT9nycn++MoUjciAndUJZJMi4yzXtjpqjZNZfuoup8f47KxwX13mA64WjYDhg
 shubYl+aERtmDIp1gEyExlAwQjFh43UylJPrXcuLaowOhIEFXSZCjzwWUO87Rzco1tLh
 WgYyQICo8LixB5ouOOgiBV1dJd9U7TSU+gQSSColi5rHHqY8oqLIBgMdxiqDW9qqlapR
 KeAPQXAGqpNoyR5LN2OOISBuc0sbnaPl7NmQZcPuYO7yLcVKkU7fygBtjcgyIoKdzvrO
 PSHODwXmwx9HMqS7DsrWZl9AjbcIZ/Mnh32ym0BpWUxr05mOcNNskW8LzkzMDc6iNFnd
 SNJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9+ObuPOgeJSQtevA4pds6OE0YKGPBoyCX02Sy1g1FdwOW2FL5FOjvrzkAqZCHro3noWIWEG8aH17fwKiPWkzv6eMkGDGYyXHrWv16k0RVdjBeGb+hiFr/
X-Gm-Message-State: AOJu0YzzMcGmnkcovB7sw2EHRRGSTC5b8NzyaQ7bLzeFOZosnbDM+N4c
 Id9PVZ6JEFUu+NN6xEEDEyZPJ40GI24eN5MhADFrGJy16LQvKYuQgH9eG6JwMHY=
X-Google-Smtp-Source: AGHT+IGdhd7RpxJePLbZIYhR6xs+qj7oZ8Lfr0TNgtXBBhZbnw2zVwMKW7uEaoI3NiSjTwpc8kM/Ag==
X-Received: by 2002:a05:600c:5493:b0:426:6ea2:31af with SMTP id
 5b1f17b1804b1-427dc5753a9mr33453755e9.37.1721643192769; 
 Mon, 22 Jul 2024 03:13:12 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e436sm147993865e9.33.2024.07.22.03.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:13:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Mon, 22 Jul 2024 11:11:51 +0100
Message-Id: <20240722101202.26915-10-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722101202.26915-1-james.clark@linaro.org>
References: <20240722101202.26915-1-james.clark@linaro.org>
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
 Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@arm.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, "Liang, Kan" <kan.liang@linux.intel.com>
Subject: [Linux-stm32] [PATCH v6 09/17] coresight: Remove unused ETM Perf
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
Tested-by: Leo Yan <leo.yan@arm.com>
Tested-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
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
