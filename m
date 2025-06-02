Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 215F1ACB699
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Jun 2025 17:19:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC07EC3F952;
	Mon,  2 Jun 2025 15:19:15 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C769C3F94D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Jun 2025 15:19:15 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-32a5eb73ad4so37883691fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Jun 2025 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748877554; x=1749482354;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S7FRnrLBkBYHmFUuH4KGx1nHshhZCeSgrXIZ5dzYfvU=;
 b=fUXsSTBqjn/7EX37DFx5uja7L/SshcndGYpysFfNhH1H0IroWg0z/m9IqhYh6GrO2Q
 9il4IH0Wvre0nZs/BVNTQT3Zta+bDy0jubS8O0JbVPZEyMfuGx7nkyNMBGzS+wlU/MYB
 5kozO0Vd8SN6iIWb2aOqB7+JkPfcYAO5YlUt6Ht5Qz998oIuhPnaiaIpIw5Tg9xATWre
 G5i11FWpyf6XQygLk8QuT5bSAw03hF/0fLk+di/p6+8M1ANbzBinv77Scd0kaDL5cNnr
 Awh/zhiSSkJnOatOagmUamVzUAAJd9CG7iZprvuDudsC4U57GpqSDOeaodtCcTZIsK5+
 ZDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748877554; x=1749482354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S7FRnrLBkBYHmFUuH4KGx1nHshhZCeSgrXIZ5dzYfvU=;
 b=n5NeaXAqXzKFvF7T7u1M80w63nsnoSnpASa1coDdWu+GVhjm9AJofnsyiA9yZzMt1P
 AQ5abVVA0cNFpqYLTP30ekjCXXap3c+0Kp2/q+VlY+u5muzjR9KTLHiP4z0spnC7EPBw
 svibZFaia4FdW6WbvEHTosWfKXDGKu4QjqX8dmJE2FeiJkCT1xUA76CZiNa1vAeAXmMX
 rcY1y+dQfJkzYDYYjG8hdGrrQTMk4j4YcvBIo3JQ2deo8apYGcEhPLIA4sSrD3bvDIeR
 PYyV4Is4jS5CF79HL8Xi7h8fQC7cApZnexLSJFSVuP4i5BCsgKtLN06MegsLFPMZcb0L
 FpEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqaWgtxW/2ETwAp/RwbXmfuS50LA0e+/+kzpjCUCBD50BSLet0MlyjvIu/LkJTl9i4S1jY4u9d39T7RQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwU1MmsxF6KzvZUFe2+cT+0nMHCLXQxRKXkVtLgIAtUWyfVucNm
 oDqVsEw67VR0BT7sfRcTCGWhmAFhVQQ+9NnOSWFIYbvE7JpY/vfxZHlKeQcBqShGV0U9B057wmn
 0/esI6os=
X-Gm-Gg: ASbGnctith5Eli8LPASOge3qvZUlAVMDTHGKcAkGOc6XD2mMlL5BXGBy0n1CVqDKURL
 l6Qcef/sJoKQ4jjOJrDmQJeMqBSeMYsvqTdxGI9lVdLNZmSngJn86oI7xuFJeZgsfJMKy4qwzZo
 7RmOcWNcLNW5Uj68RG3GgVfPgU2pAw18PmF3lKx9YtsJduDYmbvX52jn76zfz3NTG8Dt4Vub76r
 ky3hR+2I0GLmtcmASANcQX+IP9l/P0xoPiwOvoQcwJ1M/gSdielROSEn0HbOt2Wx6YCKFckb2m0
 tqU5dZiRQqH9jh7bMt/gtomfVcl5iWVJyiOWYKKres7/M5509jKLTlh0sdyz69fuLOo4vmN6U5K
 eRw==
X-Google-Smtp-Source: AGHT+IE+SpRjISuBJ+0qyPRe6UZcsVpz/N5qpzBFRSza5rkSFVM1NCoj9ElY/SVHO3bb6cTtRiaJ4w==
X-Received: by 2002:a05:6000:26ca:b0:3a4:f787:9b58 with SMTP id
 ffacd0b85a97d-3a4f7ab515fmr11075338f8f.58.1748877543609; 
 Mon, 02 Jun 2025 08:19:03 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 08:19:03 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Mon,  2 Jun 2025 17:18:49 +0200
Message-ID: <20250602151853.1942521-6-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Cc: Nam Cao <namcao@linutronix.de>, Marco Elver <elver@google.com>,
 Will McVicker <willmcvicker@google.com>, Saravan Kanna <saravanak@google.com>,
 Samuel Holland <samuel@sholland.org>, Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 John Stulz <jstultz@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 5/7] clocksource/drivers/stm: Add module
	owner
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

The conversion to modules requires a correct handling of the module
refcount in order to prevent to unload it if it is in use. That is
especially true with the clockevents where there is no function to
unregister them.

The core time framework correctly handles the module refcount with the
different clocksource and clockevents if the module owner is set.

Add the module owner to make sure the core framework will prevent
stupid things happening when the driver will be converted into a
module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-nxp-stm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index d7ccf9001729..bbc40623728f 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -201,6 +201,7 @@ static int __init nxp_stm_clocksource_init(struct device *dev, struct stm_timer
 	stm_timer->cs.resume = nxp_stm_clocksource_resume;
 	stm_timer->cs.mask = CLOCKSOURCE_MASK(32);
 	stm_timer->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	stm_timer->cs.owner = THIS_MODULE;
 
 	ret = clocksource_register_hz(&stm_timer->cs, stm_timer->rate);
 	if (ret)
@@ -314,6 +315,7 @@ static int __init nxp_stm_clockevent_per_cpu_init(struct device *dev, struct stm
 	stm_timer->ced.cpumask = cpumask_of(cpu);
 	stm_timer->ced.rating = 460;
 	stm_timer->ced.irq = irq;
+	stm_timer->ced.owner = THIS_MODULE;
 
 	per_cpu(stm_timers, cpu) = stm_timer;
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
