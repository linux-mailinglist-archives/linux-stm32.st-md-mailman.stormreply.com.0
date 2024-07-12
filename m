Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCF093F9F1
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F3ECC78025;
	Mon, 29 Jul 2024 15:58:22 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36CA1C7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 10:22:33 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-367a9ab4d81so1073089f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 03:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720779753; x=1721384553;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qAEjb2rsZzI9cp0F4WnNKSmv65r49XxBwIOcuWflPXM=;
 b=Cm2EYIEaGmRQJycAbbkLTWEsLmnfZ0J9Q8/y0nOY17T+4hCKNu+6KKaMY1/+vAlCNs
 /O3qnOUp3caaEmuRsLddjDMErQ1fboMgKx78Tw32UejGeGppZB3XCrkOIeGb59FkzDrI
 8r++5nopNyajpx7BDXx9/WaoOMGz39S60t3BvQjkqMbSvCTwtJftiYXQKw3jVWtaBtjm
 dH2Ch1VXO1M1D6Ywnt9d+cAhhQrk7TCavSEKfIxD5QNMYkCkzqss6grRODvlnzARvYfb
 o7F2Z28Qo5bTgU41E0YDnR5HWzP+uzWF8kT4s86PLFMRyhl9n5KORIQDqwPBbLR3lBaF
 DrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720779753; x=1721384553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qAEjb2rsZzI9cp0F4WnNKSmv65r49XxBwIOcuWflPXM=;
 b=KQOzx6jO4QTy7hZTJoCBfKyDxwXi9qSbggl48z86MbPGPxEL+dh3SQ275gjdUbPbzV
 QGaLtc7RuwQg9cmxgpw+IkuoHcuzZOFAunOCP/CXBJ26okBRRVDW3dJNw7LHGs7syUCZ
 a1nOZH/sJV3JHS0d3Gie8s932UmJJcNc5026Qbi4p9JgvgdWrOfh7clodb6iTIKa4sx6
 HpY4nO1M0yChAiRbVA+O9WLas17URAFCLdtVVIwev0nZhuLORsrvUjZSxAwmyXLxXamz
 8GdKeO0YapGXg9LJm94U9bXQkRGaOvV7iTcLXTq+dmGMxPs+u8ihRKpmQXRXEShOuHww
 HPJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/W0c/V/vbY08CURkHwJC6ri9+pn5SNqYtIHvI3lG79gTTauNYQXNF4rxDUELtyZX47//oGu24Q9217A6o39GbqcjvqLjfhTgR4HkYNM1aiLp/GEJ7mHdq
X-Gm-Message-State: AOJu0YwmKlOHUiJdDFJiUn0jzYzxZlg5u8KlY6zFIYJz6auEgt7u9Op2
 JzVFN6xYEuts8ug/KcgWswEGr6Y4Eong5f+UAtHIHwcDlAvNPAtjvH2H3lb7B00=
X-Google-Smtp-Source: AGHT+IGPjnTLfBpPGirazj3MagWZ4dzGzTQ2NX7i1Hi2QXi7FbivacQqalO2G5Sx2vx8cy0+g+npzA==
X-Received: by 2002:adf:fcce:0:b0:367:909b:8281 with SMTP id
 ffacd0b85a97d-367cead9313mr6585747f8f.59.1720779752806; 
 Fri, 12 Jul 2024 03:22:32 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89164sm9911058f8f.63.2024.07.12.03.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:22:32 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Fri, 12 Jul 2024 11:20:14 +0100
Message-Id: <20240712102029.3697965-6-james.clark@linaro.org>
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
Subject: [Linux-stm32] [PATCH v5 05/17] perf: cs-etm: Only save valid trace
	IDs into files
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

This isn't a bug because Perf always masks with
CORESIGHT_TRACE_ID_VAL_MASK before using these values, but to avoid it
looking like it could be, make an effort to not save bad values.

Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index b0118546cd4d..14b8afabce3a 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -643,7 +643,8 @@ static bool cs_etm_is_ete(struct perf_pmu *cs_etm_pmu, struct perf_cpu cpu)
 
 static __u64 cs_etm_get_legacy_trace_id(struct perf_cpu cpu)
 {
-	return CORESIGHT_LEGACY_CPU_TRACE_ID(cpu.cpu);
+	/* Wrap at 48 so that invalid trace IDs aren't saved into files. */
+	return CORESIGHT_LEGACY_CPU_TRACE_ID(cpu.cpu % 48);
 }
 
 static void cs_etm_save_etmv4_header(__u64 data[], struct auxtrace_record *itr, struct perf_cpu cpu)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
