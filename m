Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 252E893FA18
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1971C78F97;
	Mon, 29 Jul 2024 15:58:24 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20A3DC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 10:13:18 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-427cede1e86so28794675e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 03:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721643197; x=1722247997;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9CvKA9Oo8oUAGLDUMUBH2byBqwwnuDLfYbLv1IHZER0=;
 b=A/v+iOBtXzno0QlFy34X0MfwlhLKTJu7UJQGLmec1IY4no/N2HHilae8UPB6A1Ps3j
 VDFRTeGVYOvvzdxWdutxeC+GaDeLRRoswKsORMsY7NtFde9Geu25sHTVRS7uS5nduSDh
 oP7DGEIBdDO/2aZZHF/ohoF1N2jX12//Xqe9gnSkUoqllFMjWRe6+eK5DfhuXu58R7Lk
 zeciNUKTaRqRFqA3INiTOnGAXOeVl8Pj3lY/c2UEFDT/7a60NdxLtuPKCcS3E4dSUuHS
 SCyaWel5vAWhSZO/FKpGesoZxHUFiEgUrJYsT5Ah/CY8FwJmo0ZrO0BTNDtHsMdhPuIn
 38ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721643197; x=1722247997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CvKA9Oo8oUAGLDUMUBH2byBqwwnuDLfYbLv1IHZER0=;
 b=cdj447lbPa8nUA2i4v55BW4KjC/gRnHw5GMqmCj8k5VZ1F8Yts/4/fWkwGgvbS5IEZ
 Q4ssdINtk1jqlXNHIkca3RqsqhlbjQc+4P1GHx5OEZXqtVvzyQVViMUMQCQ0o+GG7ThO
 /7VUTiov9SZfWRIjSGib5N2cXbRbuI4RMc9k3xiKLS545JNfISSHCRGEFM3WzhWUIpcj
 lZzgAlodZsbg1tYYCn9GYFId55Ds32vPHLqWLT4VE8zzpPlRe8CeSfWzUmykhudE5h2/
 5PdxJjmSWTrmCNcA9Nd57tJAt+uqtCwpq+6ECsnwgdJ0sU4cUe0uvBsUBjTWN8SC7TJ8
 KPSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtx14MZqSoClxcsm3dQnD8FHuCSQZJHrwFcIr6mE5R2gVYKQgyFIbhvJzxV/eoQc47aE/sS+ndD5HrNDVxl9x2oxQMOpoVpn7hJc/HH8sPU/DHOusq4LQN
X-Gm-Message-State: AOJu0Yy1Dqqf1dMfhuYFcRBH6UGNTdqA9Va0w9mqvM6XAIgscPYiszxO
 Yr2+Y0+2NhFaDcfKf6RT4Qvm79e7lYW80++2spBoYiIFIsONs1HbrHhvA/LtmH4=
X-Google-Smtp-Source: AGHT+IF7qS/l5dBLpir4Vw8LPazyz0x8s3+xWgLLeI6+jb9MqA3mHfayIPDgC0IjLcyLxDckxJt5aw==
X-Received: by 2002:a05:600c:35d4:b0:426:593c:9361 with SMTP id
 5b1f17b1804b1-427dc569cb0mr43200815e9.26.1721643197578; 
 Mon, 22 Jul 2024 03:13:17 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e436sm147993865e9.33.2024.07.22.03.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:13:17 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Mon, 22 Jul 2024 11:11:52 +0100
Message-Id: <20240722101202.26915-11-james.clark@linaro.org>
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
Subject: [Linux-stm32] [PATCH v6 10/17] coresight: Clarify comments around
	the PID of the sink owner
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

"Process being monitored" and "pid of the process to monitor" imply that
this would be the same PID if there were two sessions targeting the same
process. But this is actually the PID of the process that did the Perf
event open call, rather than the target of the session. So update the
comments to make this clearer.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Tested-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 5 +++--
 drivers/hwtracing/coresight/coresight-tmc.h     | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index e75428fa1592..8962fc27d04f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -36,7 +36,8 @@ struct etr_buf_hw {
  * etr_perf_buffer - Perf buffer used for ETR
  * @drvdata		- The ETR drvdaga this buffer has been allocated for.
  * @etr_buf		- Actual buffer used by the ETR
- * @pid			- The PID this etr_perf_buffer belongs to.
+ * @pid			- The PID of the session owner that etr_perf_buffer
+ *			  belongs to.
  * @snaphost		- Perf session mode
  * @nr_pages		- Number of pages in the ring buffer.
  * @pages		- Array of Pages in the ring buffer.
@@ -1662,7 +1663,7 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 		goto unlock_out;
 	}
 
-	/* Get a handle on the pid of the process to monitor */
+	/* Get a handle on the pid of the session owner */
 	pid = etr_perf->pid;
 
 	/* Do not proceed if this device is associated with another session */
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index c77763b49de0..2671926be62a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -171,8 +171,9 @@ struct etr_buf {
  * @csdev:	component vitals needed by the framework.
  * @miscdev:	specifics to handle "/dev/xyz.tmc" entry.
  * @spinlock:	only one at a time pls.
- * @pid:	Process ID of the process being monitored by the session
- *		that is using this component.
+ * @pid:	Process ID of the process that owns the session that is using
+ *		this component. For example this would be the pid of the Perf
+ *		process.
  * @buf:	Snapshot of the trace data for ETF/ETB.
  * @etr_buf:	details of buffer used in TMC-ETR
  * @len:	size of the available trace for ETF/ETB.
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
