Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8340F93FA0E
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42F4AC78F83;
	Mon, 29 Jul 2024 15:58:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D448C6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 10:12:29 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42795086628so29122455e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 03:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721643149; x=1722247949;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tvIqnYuZYV2/+xYtsXtoYvUIcyIYgJiQLbfJZw43cls=;
 b=Ja2D8Qd72OmxBvA3Wifgv+dJhDFJDtV4KdGyw7dMfsnKhOMh5LYA3NTkm9cdJLtqEN
 3mdCGa7PmCr2t1YmaRpyojIcKtn92DHq8RulTkNJ+Kbo3997oFXTotq53XsgORbjj9kS
 iid2yjd/+Z5ZeHKXvTxeJ8IJWHuZH+UvH2c0jzQVYxuEBqUa6volqvbZ6khr/JvG6SfN
 hjncgaelcxHlOoDUn2qoPjda31B5s432xYVe8eKSm9QhMoitM3i9BKc42NfFlQYlJY73
 EbgdM7fQSRDfK5hdcaKaBV/cMvUf7jf1eu94TtnZnBQ/9E1wvpSaS96FncuFQftpMjAe
 mnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721643149; x=1722247949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tvIqnYuZYV2/+xYtsXtoYvUIcyIYgJiQLbfJZw43cls=;
 b=JORG2qVgYlmhWXZZPmY3LEn+3Sefmw8o5HrIm24XijdlfTkR1FExLswqam5kd53aOh
 z1WztovXOr6P4ZjcVfBDc6uvQFcGKhDehCf6/cuLFEhlkrHNVk1kdV9jwtwacLB+TOwT
 8L6EvkA1xeF3RDX6A9ayr81BYFZ3NQrnJZjsvUTwx3Zv6lhTAOYBQBGt39jGVrWnf7YL
 DN7LyU+03bhsNliJvcDiFYFlVrObdTlRM9NgZw7oKvJec505iWvIYFi2WSA8HRF8DQva
 aSDgvyFaPe+X7hkHklAknlt8wNC0IW2BFPSvjE8RiRAcF1mzu9ishlKdZa5pH+ARxilc
 9Yfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlLzXxAUuQVNO0a+sKD9iMeQ1ZxGwRdLCYOFybFh3mCl2SwKxYbcKq+wdazioV/kjHfYcCiBWTYbs4QJ3VQ2gUMUW0dRGIoyzx9tSRt21gHUR83SyhSMPl
X-Gm-Message-State: AOJu0YztsJIp56zgGQfhtzFyA79mPcYeY4r2jpuIpA1NwwreZJKze94S
 yl4QLkKkWINAvW/cqajKNinyqBcMh5+ZypmM3W9SE3pPETuf/G1I2UFAV1DvB3o=
X-Google-Smtp-Source: AGHT+IEuuQIrmzIO0zM11jr+yM94YwQ2ufkKLq0ZEfsaM9EANBUdXgXQ01+M4sPvdg9zpdfL46GD+g==
X-Received: by 2002:a05:600c:5103:b0:426:63b8:2cce with SMTP id
 5b1f17b1804b1-427dc52063amr39592745e9.7.1721643148703; 
 Mon, 22 Jul 2024 03:12:28 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e436sm147993865e9.33.2024.07.22.03.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:12:28 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Mon, 22 Jul 2024 11:11:42 +0100
Message-Id: <20240722101202.26915-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Subject: [Linux-stm32] [PATCH v6 00/17] coresight: Use per-sink trace ID
	maps for Perf sessions
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

This will allow sessions with more than CORESIGHT_TRACE_IDS_MAX ETMs
as long as there are fewer than that many ETMs connected to each sink.

Each sink owns its own trace ID map, and any Perf session connecting to
that sink will allocate from it, even if the sink is currently in use by
other users. This is similar to the existing behavior where the dynamic
trace IDs are constant as long as there is any concurrent Perf session
active. It's not completely optimal because slightly more IDs will be
used than necessary, but the optimal solution involves tracking the PIDs
of each session and allocating ID maps based on the session owner. This
is difficult to do with the combination of per-thread and per-cpu modes
and some scheduling issues. The complexity of this isn't likely to worth
it because even with multiple users they'd just see a difference in the
ordering of ID allocations rather than hitting any limits (unless the
hardware does have too many ETMs connected to one sink).

Per-thread mode works but only until there are any overlapping IDs, at
which point Perf will error out. Both per-thread mode and sysfs mode are
left to future changes, but both can be added on top of this initial
implementation and only sysfs mode requires further driver changes.

The HW_ID version field hasn't been bumped in order to not break Perf
which already has an error condition for other values of that field.
Instead a new minor version has been added which signifies that there
are new fields but the old fields are backwards compatible.

Changes since v5:
  
  * Hide queue number printout behind -v option
  * Style change in cs_etm__process_aux_output_hw_id()
  * Move new format enum to an earlier commit to reduce churn

Changes since v4:

  * Fix compilation failure when TRACE_ID_DEBUG is set
  * Expand comment about not freeing individual trace IDs in
    free_event_data()

Changes since v3:

  * Fix issue where trace IDs were overwritten by possibly invalid ones
    by Perf in unformatted mode. Now the HW_IDs are also used for
    unformatted mode unless the kernel didn't emit any.
  * Add a commit to check the OpenCSD version.
  * Add a commit to not save invalid IDs in the Perf header.
  * Replace cs_etm_queue's formatted and formatted_set members with a
    single enum which is easier to use.
  * Drop CORESIGHT_TRACE_ID_UNUSED_FLAG as it's no longer needed.
  * Add a commit to print the queue number in the raw dump.
  * Don't assert on the number of unformatted decoders if decoders == 0.


Changes since v2:

  * Rebase on coresight-next 6.10-rc2 (b9b25c8496).
  * Fix double free of csdev if device registration fails.
  * Fix leak of coresight_trace_id_perf_start() if trace ID allocation
    fails.
  * Don't resend HW_ID for sink changes in per-thread mode. The existing
    CPU field on AUX records can be used to track this instead.
  * Tidy function doc for coresight_trace_id_release_all()
  * Drop first two commits now that they are in coresight-next
  * Add a commit to make the trace ID spinlock local to the map

Changes since V1:

 * Rename coresight_device.perf_id_map to perf_sink_id_map.
 * Instead of outputting a HW_ID for each reachable ETM, output
   the sink ID and continue to output only the HW_ID once for
   each mapping.
 * Keep the first two Perf patches so that it applies cleanly
   on coresight-next, although they have been applied on perf-tools-next
 * Add new *_map() functions to the trace ID public API instead of
   modifying existing ones.
 * Collapse "coresight: Pass trace ID map into source enable" into
   "coresight: Use per-sink trace ID maps for Perf sessions" because the
   first commit relied on the default map being accessible which is no
   longer necessary due to the previous bullet point.


James Clark (17):
  perf: cs-etm: Create decoders after both AUX and HW_ID search passes
  perf: cs-etm: Allocate queues for all CPUs
  perf: cs-etm: Move traceid_list to each queue
  perf: cs-etm: Create decoders based on the trace ID mappings
  perf: cs-etm: Only save valid trace IDs into files
  perf: cs-etm: Support version 0.1 of HW_ID packets
  perf: cs-etm: Print queue number in raw trace dump
  perf: cs-etm: Add runtime version check for OpenCSD
  coresight: Remove unused ETM Perf stubs
  coresight: Clarify comments around the PID of the sink owner
  coresight: Move struct coresight_trace_id_map to common header
  coresight: Expose map arguments in trace ID API
  coresight: Make CPU id map a property of a trace ID map
  coresight: Use per-sink trace ID maps for Perf sessions
  coresight: Remove pending trace ID release mechanism
  coresight: Emit sink ID in the HW_ID packets
  coresight: Make trace ID map spinlock local to the map

 drivers/hwtracing/coresight/coresight-core.c  |  37 +-
 drivers/hwtracing/coresight/coresight-dummy.c |   3 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |  43 +-
 .../hwtracing/coresight/coresight-etm-perf.h  |  18 -
 .../coresight/coresight-etm3x-core.c          |   9 +-
 .../coresight/coresight-etm4x-core.c          |   9 +-
 drivers/hwtracing/coresight/coresight-priv.h  |   1 +
 drivers/hwtracing/coresight/coresight-stm.c   |   3 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |   3 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |   5 +-
 drivers/hwtracing/coresight/coresight-tmc.h   |   5 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
 .../hwtracing/coresight/coresight-trace-id.c  | 138 ++--
 .../hwtracing/coresight/coresight-trace-id.h  |  70 +-
 include/linux/coresight-pmu.h                 |  17 +-
 include/linux/coresight.h                     |  21 +-
 tools/build/feature/test-libopencsd.c         |   4 +-
 tools/include/linux/coresight-pmu.h           |  17 +-
 tools/perf/Makefile.config                    |   2 +-
 tools/perf/arch/arm/util/cs-etm.c             |  11 +-
 .../perf/util/cs-etm-decoder/cs-etm-decoder.c |  49 +-
 .../perf/util/cs-etm-decoder/cs-etm-decoder.h |   3 +-
 .../util/cs-etm-decoder/cs-etm-min-version.h  |  13 +
 tools/perf/util/cs-etm.c                      | 629 +++++++++++-------
 tools/perf/util/cs-etm.h                      |  12 +-
 25 files changed, 650 insertions(+), 475 deletions(-)
 create mode 100644 tools/perf/util/cs-etm-decoder/cs-etm-min-version.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
