Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4359593F9F7
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC8AFC78031;
	Mon, 29 Jul 2024 15:58:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97D11C78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 10:22:55 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4272738eb9eso13406925e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720779775; x=1721384575;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cmWH7agSbHonx/R3+MefD7iRtWhdpwSVOkyLggPVZz8=;
 b=QKUQgLWPktWsw7elm3L8gtEskQB5weD8TgdUxNcOdIJ4GrGDCyNA6xr9yIromD2YIr
 6gwB1ngzag+IiLrnZfTSWKjqp0je8J00S9NVIAFhZc+lcYDzVTrIvPb19tceSHvk/o44
 FKHl9FzsWRW5V73TI3osoUgB28Ny8Iw8yyM8RmiwN1y2rOookYyn5PGocI0+VQfMY6l6
 ZwP83YV0Auu+kFtxtSDlUutA/4OxFTWz44ZcTuiHzh5QEZkRgi1GCe63msQDee00u4No
 mST9+RG/pVMEEHrCOdO9zv6gONsG9r28QsrLOrwlYnZwv3MWancgQtdSAL39l5LWfrR2
 iDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720779775; x=1721384575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cmWH7agSbHonx/R3+MefD7iRtWhdpwSVOkyLggPVZz8=;
 b=bNCcQvazLFPnvpdW7NpdnbxvsM3RMr+Jh5rBDUTD3NAY5XWhGvEI/k1diozdWi+Hti
 4ygQuAArJTrfAmXBEYf9bakaDlGaDIENTwlzouGaLWIgSS3KUh4V+2Dc/W6Pk2UvxP6Y
 bGlXcMC9MvOaYSbaFt60IpGWbjX4JviR2WbiE633JAHv8caIfIZGITstdASmNeIdET+t
 cIa40D4308Abs6q2KmishBcmJB+I9yFDb4FcqTIlo7MJCS5RoM1/bzMtNPLkEAKJaaQ/
 PJROGN4HxLjIkiGWxsDJDIciFneYaV9Vj6ecC2iN9vx31QW3r8/RHPqPnyXxq+X7RxvS
 7p5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe+HzM3NI7yZ3hQSmm14jk+By0EKme+mDMKjWodYkTMAzFI3aANFx0q66qfp0To5cskiFuRyLLasNTETuZw0xVWykIF587+EQNKRYSMGGjOqQoB+ryvE7H
X-Gm-Message-State: AOJu0YyMuwU7VprAwyeIbvTpXCKI8UQIikhjMfu7R+Owc/FD+4GG+NLo
 UBOKMQoLbe06zDEQMe/0ZM/HRUYKBYl5279epL4dPlGxmUrrAYGRAiXfA5im/Qs=
X-Google-Smtp-Source: AGHT+IEcDju9t6NYw7w2pn4HE1UlUqGJVIFxet+KybGAhZdj2K7aQZy/5dyu5Tg/5qQTcXTwx+bEdQ==
X-Received: by 2002:adf:b30b:0:b0:366:df65:8763 with SMTP id
 ffacd0b85a97d-367cea8f94emr7440282f8f.34.1720779775028; 
 Fri, 12 Jul 2024 03:22:55 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89164sm9911058f8f.63.2024.07.12.03.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:22:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Fri, 12 Jul 2024 11:20:19 +0100
Message-Id: <20240712102029.3697965-11-james.clark@linaro.org>
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
Subject: [Linux-stm32] [PATCH v5 10/17] coresight: Clarify comments around
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
