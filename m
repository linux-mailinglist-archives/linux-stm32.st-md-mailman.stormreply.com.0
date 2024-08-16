Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3688895470B
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:55:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB67BC78018;
	Fri, 16 Aug 2024 10:55:00 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9723C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:54:59 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-428119da952so13406785e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805699; x=1724410499;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ofyujhdwo9HhuT+uKq2h0ijjUNuG8zhSZ3XGJMLvxUE=;
 b=aB3x7oivjXkNUuqLEF5Oeh8Cxkurexm5T6EJAJCmvDqtyJ/HWfs42WrwjaxMOApGmO
 SvXFrVsxGgMVOkZVYoShr/Z3EYcHcRrraWAbwbbjMIm4kgahIAW80wCe6j7hWJWHcncW
 JSfqQQcQHOFJcrSIryV2JTasMCCV1LQsfCygIGl+IT7Rm/mfBpoQ7J4Td404Pmqoo5Na
 Zp117KB8fFgY5pFUO0gYbJD0cKY3WFDWcFLVnADxIPCQV5Y9eMQATCkHiQ9llZA32o+B
 Vhq/rYJ/yLuB26c4Kiko0rgH343a8XdgGBlr6u/Tk8rQXY7I2mp8rIJRuJu6ct8lfaeK
 rTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805699; x=1724410499;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ofyujhdwo9HhuT+uKq2h0ijjUNuG8zhSZ3XGJMLvxUE=;
 b=aUd++7WNxmDI0inG1ez/FspVpK/HEjG0unDkNfrkaiOWl31tgtAZPr0GYbJVe/0l0W
 EsDy5FiqfNSHxnb1tBBZUCf/G66Gi5215gyLyZeTvdEcXtQfU9mq5Bo1JPYGPpdP/55k
 G2DBty8MPNafhogc+k6qPJL/yYeuAN1gaFFzVM7K2DCMa05ExXTOAmnCFij68dufpZ8t
 7Sthg2rL2ivA+fa+8E4cZMyWJdacBsziifRKSsN9vE8wy6HG3lfO3yTHPROGIl3KT1wd
 B/I/bUsglQnEAH0YjLo2ukwjaO4k6pgoKXqlksWd9tGnE7N2kRJhPiItHXF6+MVosryT
 kKGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOM4eX7qZ96/K0LNZdp39o6auItkmeOFx1EDMBM+k2k4HQUDk4/IKVh/P3YBDIaU8yhCDZ/rc8tIBb6j4s+g2AhVUsAVPVBjV5YwERAjhUh8lzmJxy9KUN
X-Gm-Message-State: AOJu0YydxRf0foIifVXl7Q47fwT46g1xcwA1+4NokS5zd04D9UcZTLC0
 CP7mWAhTFEiD7bHJETmjdnxX6nhpaWlIVPUUpPSixl/Jj0Ac64pxS8515sfTvo8=
X-Google-Smtp-Source: AGHT+IF1Ki7kkJVeoFcsxkp8A7OnvN2/y+Y07xGgbyNW/uCef1ZfE+zmmjjSZ7/A05BtryN3zai2Tw==
X-Received: by 2002:a05:600c:4f4f:b0:426:64a2:5375 with SMTP id
 5b1f17b1804b1-429ed77da5fmr16657705e9.1.1723805699218; 
 Fri, 16 Aug 2024 03:54:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:54:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:33 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-9-9eed0ee16b78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=H9pgFKFZj0vfgCksat3pZIHsHYX7b2XRIDWJ9Ds+vFo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/ue0ZjWg9eHgEHo9vzwpfBVB0sZcVnAPvqh
 ztGhVs5Qm+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v7gAKCRDBN2bmhouD
 10PCD/9BhzHHyMZ1ybl9Uqzx4g21Dxc1765kJu8rXa42a0jWJfLt6GovUNJY2+gsqS7uFhqlwYm
 sYqfjAEwQuwL81Qj0fovqGeHxM9A5m/XxYSRm5LDhA0CURo+9gC4XukSN1NGwW+WGaJ/ocVQumY
 cL8XFrAXoTmNk16mAmgIkfQz8rSugfhTJcLO289UGnghyKjjzWiYKseuVRfo5tglKkluXJiy8a0
 9ctneDbYsGEm1FtFUlKGX4he7OZ+5MHRK4NJmHVib1BK1rJke4axNolcwehhHsygI/DrNhBCCqx
 PRJkXyoUexFGGT9tGBQ+/BvjB0JsHagEm0S8p3PXvn5XvQwVmYU0xRNHayJgS7hUnLIGkzhgKxa
 lMNwPR+tO2Scr4P1Zat9I1s+5DBqnOcqA3TN6XzF4Pc+UlEEJKcygMrmseG1FFzBbLETGURcMyY
 CiA+MI2bKJF5a7RQWESVKSIqSgnUF7cZbuKY8P9aabxn4/Xl3vF3BucyIwjZhGprxPDCNp4M9zA
 bwVblrv0vWmbHK9RqtmIO67gBgGhoevTs+XfcQWZ5dJE5IjE2UdcDaDCGQsrUIfebaUcuR8sIHZ
 kG5UZSt30jVw8ULHXWOtX1HO5TOYjXYWQbPMRzgCrpqKy8yMjLLSrspykBPUcqomNMYKiFC9x78
 9IbhnSsdWiJ96Lw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 09/13] memory: tegra20-emc: simplify with
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
 drivers/memory/tegra/tegra20-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 97cf59523b0b..7193f848d17e 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -410,7 +410,6 @@ static int cmp_timings(const void *_a, const void *_b)
 static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 					  struct device_node *node)
 {
-	struct device_node *child;
 	struct emc_timing *timing;
 	int child_count;
 	int err;
@@ -428,15 +427,13 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 
 	timing = emc->timings;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		if (of_node_name_eq(child, "lpddr2"))
 			continue;
 
 		err = load_one_timing_from_dt(emc, timing++, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 
 		emc->num_timings++;
 	}

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
