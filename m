Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 352BDB047FB
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jul 2025 21:39:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8736C3F92E;
	Mon, 14 Jul 2025 19:39:45 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4345FC3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 19:39:44 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-2eaf96c7579so2824572fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752521983; x=1753126783;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=urOya2QD0PAv3aRyUi92qVBccHFN0GyUQM4mpsavCC0=;
 b=u66x5XaygFJ9OtST8cMKA/3AEVMajriQ1KC2rNX9chk6DYnVJMiTS1bVThE26I3xnI
 DKm8DyLy2NiVJyED2qRKmM/7oY7HbkHdcPoKtvGj9qcAAHA/lVwQdQJ2GhJqkROE8mzU
 n2UjC0+SdlZdK5r4+RNMDgvOViWWeOfBfGMg8do9Iz9u72Zu1BQpbFA3LskqvK6R6pai
 CsYpbv7EfZ1tNnVGDNv/bWg/B8Z3eMdzLrrlBwJRisX3yppC/xRrHtXoOQIXFEMERoWq
 tyM9T8pfRTce3Z682AJDP7xkYosgJnIVl5szF2jZBbRHp6yI3pR9+L+2KdYTSUgAKGQs
 D0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752521983; x=1753126783;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=urOya2QD0PAv3aRyUi92qVBccHFN0GyUQM4mpsavCC0=;
 b=tOnqj8L2jJcT+loHZWVwNwwwxF7HGfUcByBdcbbdS7CV+3tRgH0yBl8kA0h9VRa5gT
 s1OQJmwot/20XjTed1JovK8+hMqZnok1lXaEgTJiB/Xvfo8U+czkATYrMlBQ5v5kGmQ6
 eI/e/qTaoVYykF1VsjFbG9fwgB9paL0mN1s1to+KZmXg5xVnooYoFKeMs5iLE/+0FOaM
 X5oh0CQEOgjDIpPsstge36W4pAqAplBfbA4zEtm7niigOhbQLyHJQFl9T5/1IdxLr5Ko
 s7WI5Zm6Gj1nNHWDqMVBQ6pT/XV8h6KG7KrT9pwjuI/wseL5PNEKlSUVG4A4Z05n5PiS
 x69A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVml8TtoD2ZAzu+3kTsP75NjH+Tb8TyLUdsTvzGWA1dascKdDfh1BGSAqaD8zhpJP0KdZHJ5Bob04I90w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzc3XQqbadQPsaTMsFXfeqE3y5XmlByHUw+jTTbevD6P57Tqvbl
 2h5mKSn2PZ1WOINgBQ/c+Ey3Qi+uu0d1/+DFaalSxCZReMdYjjALsyMx28eqzBZ5UHs=
X-Gm-Gg: ASbGncv/wIFEy5/mGJ62VBzl/7xp5/pcXzP7eQKVf2A586E1dfzF4OWKRgVYlmOh6h0
 dyC17rf/zsqaqf8TbUeFrAbEt6ULjA785Hyr/VI9va+0PqekzCri9cI9ub5go90hm0b42AVySbR
 iD5PeoN5KFiHjnqTk3gKw3273A4LvY27m3KNFCsI25jBWwl22YXTSU17DTZoaAyn58yuj+aKtBo
 5FSOK+w4kwUM8qGbyJGi7M4YvNGQV04OvhZwXDAISha0+o9wlkZ10VPmpc9UvMv6IU954yb54rh
 LT0SBtPaW+McBleT+NLcMPhvUUsrdFDyOmr4lLEYqECdFEu2jZi+WmuFpTyeiUm3HeoARBpHqK+
 7RJLMvl8Gj23UfiZFxwOVXekfyJdlvw==
X-Google-Smtp-Source: AGHT+IG9YCfy/a8BjNGBo1GzQjJuR8GmP8UR9cv+uwP5yDJexmfxPdWGAOu8EtDFH9IyIV9EN6mZeg==
X-Received: by 2002:a05:6870:c03:b0:296:bbc8:4a82 with SMTP id
 586e51a60fabf-2ff2706c894mr10579426fac.27.1752521982792; 
 Mon, 14 Jul 2025 12:39:42 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73cf12b62e8sm1674368a34.60.2025.07.14.12.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 12:39:42 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:39:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
 =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Le Goffic <legoffic.clement@gmail.com>
Message-ID: <1fd92742-0958-4f64-8e50-4d0595fe74eb@suswa.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711-ddrperfm-upstream-v2-9-cdece720348f@foss.st.com>
Cc: devicetree@vger.kernel.org, lkp@intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 09/16] perf: stm32: introduce DDRPERFM
	driver
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Cl=E9ment,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bu=
s-firewall-move-stm32_firewall-header-file-in-include-folder/20250712-030518
base:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
patch link:    https://lore.kernel.org/r/20250711-ddrperfm-upstream-v2-9-cd=
ece720348f%40foss.st.com
patch subject: [PATCH v2 09/16] perf: stm32: introduce DDRPERFM driver
config: sh-randconfig-r071-20250712 (https://download.01.org/0day-ci/archiv=
e/20250712/202507122125.eve8lg60-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507122125.eve8lg60-lkp@intel.com/

smatch warnings:
drivers/perf/stm32_ddr_pmu.c:380 stm32_ddr_pmu_get_counter() warn: variable=
 dereferenced before check 'pmu' (see line 376)
drivers/perf/stm32_ddr_pmu.c:380 stm32_ddr_pmu_get_counter() warn: variable=
 dereferenced before check 'event' (see line 377)

vim +/pmu +380 drivers/perf/stm32_ddr_pmu.c

73af3c4ba702d7 Cl=E9ment Le Goffic 2025-07-11  374  static int stm32_ddr_pm=
u_get_counter(struct stm32_ddr_pmu *pmu, struct perf_event *event)
73af3c4ba702d7 Cl=E9ment Le Goffic 2025-07-11  375  {
73af3c4ba702d7 Cl=E9ment Le Goffic 2025-07-11 @376  	u32 time_cnt_idx =3D p=
mu->cfg->time_cnt_idx;
                                                                           =
^^^^^^^^

73af3c4ba702d7 Cl=E9ment Le Goffic 2025-07-11 @377  	u32 config =3D event->=
attr.config;
                                                                     ^^^^^^^

73af3c4ba702d7 Cl=E9ment Le Goffic 2025-07-11  378  	struct stm32_ddr_cnt *=
cnt;
73af3c4ba702d7 Cl=E9ment Le Goffic 2025-07-11  379  =

73af3c4ba702d7 Cl=E9ment Le Goffic 2025-07-11 @380  	if (!pmu || !event)
                                                            ^^^^^^^^^^^^^^
Checks are too late.  The variables have already been dereferenced.

73af3c4ba702d7 Cl=E9ment Le Goffic 2025-07-11  381  		return -EINVAL;
73af3c4ba702d7 Cl=E9ment Le Goffic 2025-07-11  382  =

73af3c4ba702d7 Cl=E9ment Le Goffic 2025-07-11  383  	pmu->selected_set =3D =
GROUP_VALUE(config);
73af3c4ba702d7 Cl=E9ment Le Goffic 2025-07-11  384  =

73af3c4ba702d7 Cl=E9ment Le Goffic 2025-07-11  385  	if (config =3D=3D TIME=
_CNT) {

-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
