Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id D1YfKFSJw2nJrQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 326F2320686
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8699DC8F27F;
	Wed, 25 Mar 2026 07:05:55 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95979C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 18:27:51 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-c70c112cb61so990047a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 11:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774376870; x=1774981670;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YOUVvE5FNmjkaySdFPrc+7+hSpPNsoY2HaGuj8AkFfI=;
 b=nFM+8Pb4TN0tPA8dSOQUQrPIbHU3mhcOncnP3gYtLttRmynnyF0f56GiFZKn9DXAeB
 J/IzM4Zh5kAmVhhk0u+t7p9iU0Nrj9vTpkGlPf7y8PyccqtV2/mSSZfpgGfWoo08XHOB
 8qOXjRLHWya2HWWjqPLx67sLPUNx/EEgETW2zmSEKXW7fVkeTVgSP8Wa7bNjBtQwCbTj
 pCW902lgYB528RKRhEMA9IWxXzSwnjewad2f1BJFvr5pZjnlBm1/l8FcPD8TL8v3/FXA
 rPn70xZIQ76KiOBpvTeRCD33OJzJkTY1xSP8PINiJv1I7rk+UtFKbjF09rzJH/e45OlJ
 N/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774376870; x=1774981670;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YOUVvE5FNmjkaySdFPrc+7+hSpPNsoY2HaGuj8AkFfI=;
 b=qdQwz0nOP32vIn4jt7O4ZvVyp2r4e6OAbUIfL0boEj92aYLSQo71Wzpf0j7ilKs1jE
 bFqRHZ6bc5VDd3v3b/wdVYJ8HUcwv7NjcYmIfwlpQ8QroAz5yvDV56k/24OY+SzLZFAe
 CpqNcXeSkF29nUQkd77g6hcYHK5B/IShf0EzqBiwa2W30Gocz6YvagxhA+1JPE7JcBFP
 NQw0Jhq2VYM1BVcE7F5xlTuP0DpYO7cg6ICT9504rYXn97wEG3W0q6qsUbV8c+0VJ9G7
 5pTODR+3s78/rMlm8zcrJJnIAeuTVv7Mtw1jxIqUNRyQcuE7J1+aRdRXmNlbvp74NwIj
 XXiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvxkFGofwcLt0YMIARqyRQbFQ21YZ9273ls58h8u4DjcpogYvB6aeayrELYbmTUfjnp1WIl6GIPSjrFA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxIthUAtHNWGvJqcaKCfpm5C7hT61IEzhlSrXVdFvnr2Dr1qgIc
 4ZVuLM6C1B3pRVlSS94L16G9H/y0hNMU+IxuOfO4G2KTNnUAYXkvdKeV
X-Gm-Gg: ATEYQzzz/kEUJQ7w+DtZXW3+SwiJAMmM8S4B5OAJ5xXuBziwmisf/A6wYvBdesdXB8y
 5UMHkqXK6eBTzRW5lP4khwnBJDuy3cIpeEy61hu4yf29KE3spXnaQHTovtJFcXOcmMFx/HQJ0H7
 r4jqzXyQZDdXQmmNH0qoks/mZLvsY1iCZ+NcaRVyeFfqq3RBdNaxyVbTPRzzvL2+VYYrZ1Qk+4Q
 2OAC8p752cctE/QziIWfEcopxUGZvBbWTSbEH30E0LC7GS29EFkhIO3SU6KvA4d0E75kbYnokHC
 zaGgOiy73HIR9rmZvYb+kK0G2nfmhmg8gxnrZvRZymopB7Bb7024cUB+EW/hX1umVjcVtoFZbSa
 NLFdgOplsRh1LnRHVj2KbOhURKWQsGfIp0cSnLSWEn1ZsGZKLXFH2KqV37UWGI3Yo5ynZJ4rAMS
 uy19gZ1O3msXsa2WgVZ+kHfBIKIBNX62+U4Rrk
X-Received: by 2002:a17:90b:1dcd:b0:35b:a656:a60a with SMTP id
 98e67ed59e1d1-35c0dcf48dbmr341601a91.8.1774376869963; 
 Tue, 24 Mar 2026 11:27:49 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 11:27:49 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:52 +0530
MIME-Version: 1.0
Message-Id: <20260324-deverr-v1-4-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=6197;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=s9JDU7GcgsnDDFXsrCxagGOfCSdKXg3wGsXTsgZz2H0=;
 b=ah0pTzAjwcV8FwCOGin97Y4dMl89Nw1GTUGKElGrgDchfwSWIGhdZL4fJM5yOH/LB2Vze2ERu
 5pFUk9n36AADxerpZp4V7L4H+yM/I6gEVGRW6UOTZNuNCinHlE0yV/c
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-Mailman-Approved-At: Wed, 25 Mar 2026 07:05:52 +0000
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 Atharv Dubey <atharvd440@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Enrico Zanda <e.zanda1@gmail.com>
Subject: [Linux-stm32] [PATCH 04/10] i2c: stm32f7: Replace dev_err() with
 dev_err_probe() in probe function
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:till@harbaum.org,m:andi.shyti@kernel.org,m:ldewangan@nvidia.com,m:digetx@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:pierre-yves.mordret@foss.st.com,m:alain.volmat@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrice.chotard@foss.st.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:jdelvare@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-i2c@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:atharvd440@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:e.zanda1@gmail.com,m:thierryreding@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,m:zhanglyra@gmail.com,m:ezanda1@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[atharvd440@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[harbaum.org,kernel.org,nvidia.com,gmail.com,sholland.org,foss.st.com,linux.alibaba.com,suse.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvd440@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.950];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 326F2320686
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 78 ++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 48 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 70cb5822bf17..e7cc7f0fb56c 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -481,28 +481,22 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	int ret = 0;
 
 	specs = stm32f7_get_specs(setup->speed_freq);
-	if (specs == ERR_PTR(-EINVAL)) {
-		dev_err(i2c_dev->dev, "speed out of bound {%d}\n",
-			setup->speed_freq);
-		return -EINVAL;
-	}
+	if (specs == ERR_PTR(-EINVAL))
+		return dev_err_probe(i2c_dev->dev, -EINVAL, "speed out of bound {%d}\n",
+				     setup->speed_freq);
 
 	if ((setup->rise_time > specs->rise_max) ||
-	    (setup->fall_time > specs->fall_max)) {
-		dev_err(i2c_dev->dev,
-			"timings out of bound Rise{%d>%d}/Fall{%d>%d}\n",
-			setup->rise_time, specs->rise_max,
-			setup->fall_time, specs->fall_max);
-		return -EINVAL;
-	}
+	    (setup->fall_time > specs->fall_max))
+		return dev_err_probe(i2c_dev->dev, -EINVAL,
+				     "timings out of bound Rise{%d>%d}/Fall{%d>%d}\n",
+				     setup->rise_time, specs->rise_max,
+				     setup->fall_time, specs->fall_max);
 
 	i2c_dev->dnf = DIV_ROUND_CLOSEST(i2c_dev->dnf_dt, i2cclk);
-	if (i2c_dev->dnf > STM32F7_I2C_DNF_MAX) {
-		dev_err(i2c_dev->dev,
-			"DNF out of bound %d/%d\n",
-			i2c_dev->dnf * i2cclk, STM32F7_I2C_DNF_MAX * i2cclk);
-		return -EINVAL;
-	}
+	if (i2c_dev->dnf > STM32F7_I2C_DNF_MAX)
+		return dev_err_probe(i2c_dev->dev, -EINVAL,
+				     "DNF out of bound %d/%d\n", i2c_dev->dnf * i2cclk,
+				     STM32F7_I2C_DNF_MAX * i2cclk);
 
 	/*  Analog and Digital Filters */
 	af_delay_min =
@@ -567,8 +561,7 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	if (list_empty(&solutions)) {
-		dev_err(i2c_dev->dev, "no Prescaler solution\n");
-		ret = -EPERM;
+		ret = dev_err_probe(i2c_dev->dev, -EPERM, "no Prescaler solution\n");
 		goto exit;
 	}
 
@@ -624,8 +617,7 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	if (!s) {
-		dev_err(i2c_dev->dev, "no solution at all\n");
-		ret = -EPERM;
+		ret = dev_err_probe(i2c_dev->dev, -EPERM, "no solution at all\n");
 		goto exit;
 	}
 
@@ -674,11 +666,9 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 
 	i2c_parse_fw_timings(i2c_dev->dev, t, false);
 
-	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
-		dev_err(i2c_dev->dev, "Invalid bus speed (%i>%i)\n",
-			t->bus_freq_hz, I2C_MAX_FAST_MODE_PLUS_FREQ);
-		return -EINVAL;
-	}
+	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		return dev_err_probe(i2c_dev->dev, -EINVAL, "Invalid bus speed (%i>%i)\n",
+				     t->bus_freq_hz, I2C_MAX_FAST_MODE_PLUS_FREQ);
 
 	setup->speed_freq = t->bus_freq_hz;
 	i2c_dev->setup.rise_time = t->scl_rise_ns;
@@ -686,10 +676,8 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 	i2c_dev->dnf_dt = t->digital_filter_width_ns;
 	setup->clock_src = clk_get_rate(i2c_dev->clk);
 
-	if (!setup->clock_src) {
-		dev_err(i2c_dev->dev, "clock rate is 0\n");
-		return -EINVAL;
-	}
+	if (!setup->clock_src)
+		return dev_err_probe(i2c_dev->dev, -EINVAL, "clock rate is 0\n");
 
 	if (!of_property_read_bool(i2c_dev->dev->of_node, "i2c-digital-filter"))
 		i2c_dev->dnf_dt = STM32F7_I2C_DNF_DEFAULT;
@@ -698,8 +686,8 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 		ret = stm32f7_i2c_compute_timing(i2c_dev, setup,
 						 &i2c_dev->timing);
 		if (ret) {
-			dev_err(i2c_dev->dev,
-				"failed to compute I2C timings.\n");
+			dev_err_probe(i2c_dev->dev, ret,
+				      "failed to compute I2C timings.\n");
 			if (setup->speed_freq <= I2C_MAX_STANDARD_MODE_FREQ)
 				break;
 			setup->speed_freq =
@@ -710,10 +698,8 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 		}
 	} while (ret);
 
-	if (ret) {
-		dev_err(i2c_dev->dev, "Impossible to compute I2C timings.\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(i2c_dev->dev, ret, "Impossible to compute I2C timings.\n");
 
 	i2c_dev->analog_filter = of_property_read_bool(i2c_dev->dev->of_node,
 						       "i2c-analog-filter");
@@ -2175,10 +2161,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	setup = of_device_get_match_data(&pdev->dev);
-	if (!setup) {
-		dev_err(&pdev->dev, "Can't get device data\n");
-		return -ENODEV;
-	}
+	if (!setup)
+		return dev_err_probe(&pdev->dev, -ENODEV, "Can't get device data\n");
 	i2c_dev->setup = *setup;
 
 	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
@@ -2279,7 +2263,7 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 		ret = dev_pm_set_wake_irq(i2c_dev->dev, irq_event);
 		if (ret) {
-			dev_err(i2c_dev->dev, "Failed to set wake up irq\n");
+			dev_err_probe(i2c_dev->dev, ret, "Failed to set wake up irq\n");
 			goto clr_wakeup_capable;
 		}
 	}
@@ -2305,9 +2289,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (i2c_dev->smbus_mode) {
 		ret = stm32f7_i2c_enable_smbus_host(i2c_dev);
 		if (ret) {
-			dev_err(i2c_dev->dev,
-				"failed to enable SMBus Host-Notify protocol (%d)\n",
-				ret);
+			dev_err_probe(i2c_dev->dev, ret,
+				      "failed to enable SMBus Host-Notify protocol\n");
 			goto i2c_adapter_remove;
 		}
 	}
@@ -2315,9 +2298,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "smbus-alert")) {
 		ret = stm32f7_i2c_enable_smbus_alert(i2c_dev);
 		if (ret) {
-			dev_err(i2c_dev->dev,
-				"failed to enable SMBus alert protocol (%d)\n",
-				ret);
+			dev_err_probe(i2c_dev->dev, ret,
+				      "failed to enable SMBus alert protocol\n");
 			goto i2c_disable_smbus_host;
 		}
 	}

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
