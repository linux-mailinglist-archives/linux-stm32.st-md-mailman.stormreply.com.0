Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2356295470A
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:55:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0DAEC78012;
	Fri, 16 Aug 2024 10:54:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4847CC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:54:58 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-428119da952so13406455e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805698; x=1724410498;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JOgxzZUvrtpq2BMDuicgWPsp2jimj6KEDspxwy4BQUg=;
 b=p9NYqk2QiEmR/o9mtmkLBNwSMMSe5DrfeRUf7sjLDBQ9cfrKZttjEzkF+oVyrmOT4V
 nFB/peYRSTmiCqiZICrG6wjjqp3Vt/13VKS4pjVMzntRlgZfg0QH2NSZdt3urqjKxUnS
 m0KjkctzSpfwi4SlbYPo1DtmhXNdnSRkHfsrzyQAFuNNajyxCKzL/2LFmtz4f8ZVxlIC
 74XCnREJsN5OakyMXMsag5kwaanHlblmxlhcIRQjFzVydAHzTWsMOI87c0C9xfjPIRnn
 qpgNJnI/GEx55HXuRqxVnznRtf4h/rNFTvk3rGuKmE85PUYOi9mQfPD8fUVtfjGeE0RH
 XIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805698; x=1724410498;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JOgxzZUvrtpq2BMDuicgWPsp2jimj6KEDspxwy4BQUg=;
 b=ikRF9Sh9nQCnRvhN5BE11c2OGU0xmwi0QG2l9NLsbBQMN3PFJvDD8hbusZHOwcLdFP
 HvGdVqfJ2Q0NZwmw6IP9lJi/DiiKhF1IB/yTvb7xsWpIHWDn5vMj5lBqxSiU3cwrNjmp
 GvOOvGZCa+jg7lzYm9YjexmzNZuMWaUHlWh+wdtrNzFVJleb7B/Dye3ir+iVKiKdyO3/
 Dng+NGF8us7V4UWtdBsnLKi8s2doMv9cHnnCozB3I/3lU0NyMAOI2uRaZEHaeGAhP1fe
 TH/8hwxdMcugZodQr3T587v946lFY8L/t48eeXE1+ItA8VtG9C+z3sLtw3WatTwhE1O7
 PwGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0gYPfm8W/zuc65SkE5qYasOVRVg48SGxExJtlOyaseVYFBVsrS9DRc33SeadsS5ec6p9c8/GLnDy82nl0OC5gi3VVAMW+EIajBKEct1Sewb89D3ulxoDQ
X-Gm-Message-State: AOJu0YwxWWNPB/4cGwg1rlQGLiMnOMHwU1I41TVwMQjmM2HHMFPdh/si
 03CEWUG8iWAmSKRJB6qDSKzCDLHqNyCQrUiT0WIRrrX2BHiYcLRALfKvbvRWypY=
X-Google-Smtp-Source: AGHT+IHMPxUtjfGRn7ZG1qPQZ/Tx/a2kVQMSOXnBcUVsMZ+mh2g/UkrF5oZy92ASETKVrsM2pu1Eew==
X-Received: by 2002:a05:600c:a45:b0:426:6edb:7e14 with SMTP id
 5b1f17b1804b1-429ed7d34fdmr15301545e9.35.1723805697665; 
 Fri, 16 Aug 2024 03:54:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:54:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:32 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-8-9eed0ee16b78@linaro.org>
References: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rDsZLo3wwoaidFkJYFptVSgVV4IV53Wsuj2KZiIUK6I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/tahceV7TKEor8UTYOHOw8XO+MpwcWse5dr
 Yc5OT5M1QeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v7QAKCRDBN2bmhouD
 15qVD/4temSVQ0ngkzMHbEIkNQhXO194h+2fYYACqxi8kpkiZBvmRpBRXJviVipghRhO9K5i3Pi
 bCLujgzzk3lAnUlRAUWLFE1ZwJwbNorN3L2wMvDiAH4xWtexjXHdpJU6Frbq9hf41oMf8To3yn4
 mpYNezq1J3BvH5AvfuNV2cG707DvNk/mGOfYyG6818en+8wWeI8gQFsjusd7PtdWmnq7fSRVcE2
 qQnN3nCq4uBAvghWHM9zN7GmmkLtIP2jAC02NIDPVBw9QNZHaSjGb+Z9DeasEOErDeYzxS7cu2e
 /4AZKgZkHgu3Wa9veJOuUOYhwlovzdflxQo1yd725cwJs0PVSUmX5wmplqc46JaxKNQPgZ5k5EX
 G/23vekqpdTc22RLBtafVW47vW+Jequ/eSCV9ObE/b2j5HXdd93G2wESc2roklzvr5qnEL6cX4b
 S6SQZ5j3yrxo21XrBloI7KTj+XaiRG27QrJ5CqxN/dnQ77vGOJPY/vhmZHpf0YjELoI2vylKP+l
 KKinczj+fDN9OL162qEJnOn58KSFvQviNx0Is1TPt2LoYk30l2I/5Ga72W+SflJCAWYMPBEBwkT
 rwjTv2CqWkebZjiE16onqrwHk9gkdH9/Wyon/lJMXW9lb/Xm29+jK3AcBi+OPK3OljwHqayB2X0
 j8CvAwe+7cD/yXg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 08/13] memory: tegra124-emc: simplify with
 scoped for each OF child loop
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

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra124-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 47c0c19e13fd..03f1daa2d132 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -992,7 +992,6 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 					  struct device_node *node)
 {
 	int child_count = of_get_child_count(node);
-	struct device_node *child;
 	struct emc_timing *timing;
 	unsigned int i = 0;
 	int err;
@@ -1004,14 +1003,12 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 
 	emc->num_timings = child_count;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		timing = &emc->timings[i++];
 
 		err = load_one_timing_from_dt(emc, timing, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 	}
 
 	sort(emc->timings, emc->num_timings, sizeof(*timing), cmp_timings,

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
