Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3FB954707
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:54:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7ED8C78020;
	Fri, 16 Aug 2024 10:54:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A665BC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:54:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4280ee5f1e3so13347165e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805696; x=1724410496;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6YRde/fYbJz8xZyUhMQmHjg4wnmznu+US4KTcpFxBxo=;
 b=AzHSuHNTicOrVbK+uvm9/FZuilZIHI9fC2BQK0TLIRToypS6xQV4SV206x0VICnIiy
 53xF17T/1ypfNC99xv0i48t6dggthB4QmDFscn/jj71ellvY0l3TqAjQM7QL0ZUyFpLW
 ZL9lFqDw0fIgiCp3lZNQwgfSK/HRs5/4vtQXwRFnokWL85z3Dq7D3BJWdFBtB6xWR7ti
 s7aZtP7qUvKc2gEcZfnACWebyA4fCfHkjMgU2yY1ewv54nuXzz9f+clVcn3nng0Xrxn+
 moZGv0KsOUEUtZf0kiJ8iD8qvmfl0fXI11vNPhzu2hrg4khRycZHaXj1pTb92y4wPx6p
 MIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805696; x=1724410496;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6YRde/fYbJz8xZyUhMQmHjg4wnmznu+US4KTcpFxBxo=;
 b=ZXRxjdNd7RBb81N/9Ug1zLDFk7VmF8eh6J4VpkxjZv4Giot3fwMSEvXOZ34J5L2/HT
 +ZyNcYYr/GJaK3yWMy63kRo9bOvXr0AqjxKCXXNJUt56fACcj/tl8aHBOlNroUTnWv50
 CSuk6X3jA2SL2SNP4CEIxZKqIOhgdVeyRg1duqXXMGoEVWjDMdpShR6YRtT3a5/9U3Ac
 RRBK0NTj9/F+NALMdBIn19x9GOdsN/JTRV8ToP3+3WDldNZXOg57NGA2BbEnwtT+Vbqd
 YIp+/n6dUZtDbNhRbrYP1j27IIrHaGLiGRUiLqptndP9qaI3McqxLkHEZmRS09fy/PcU
 nl4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSRq61V+q/nLP2SofIBMNdpDqzwTJBpmH0+wnNgK+SgXqiQNDmKxbyeXV/xS8JWa/d6He2cU8BK9Inbw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwnT76uKnLnBDzmQctJntXv44Zz1M+yZeiPRcW7cB/HPm9V+QZT
 OlsXXLqTsmYQuzRYFGSkEBLAvfVoaa7HJiuI7RxyRVTQfIA6e8ZWWoYddW29P+w=
X-Google-Smtp-Source: AGHT+IF6JR5QgFzYZqDis0yng6ewdCGRElyq9KQSPO+EpQI/aW4zcsFVDjGZ6uVazhi1rffyYnq0KQ==
X-Received: by 2002:a05:600c:4f8d:b0:427:d713:a5d3 with SMTP id
 5b1f17b1804b1-429ed79daa4mr16802255e9.11.1723805696134; 
 Fri, 16 Aug 2024 03:54:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:54:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:31 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-7-9eed0ee16b78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=SAst7T1lfs852WDMPyN7cdI8dxlvyoFUdcgyCbTBwGY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/slbj3+EXAI6pk399+GoDZQ7kgdWtQ7XQ9i
 iI781jL8UuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v7AAKCRDBN2bmhouD
 10ZTD/0Z7SRvLmaBE+Gm6YtZvr0IwKzMR9efFrxg+sCxIUabM6l8TKG73/GeZE1pWa2NzX5Y5MT
 B+MgKAT7I93N042qHHUfGjB4ZNqu3HoHMBrDTFFoixqjMeJ3em7cZuCi84Crr1chTAqvyqQdZK9
 idnbYS4yHD6T/VcXQ/6OhgyMuf1OfyghFcekCQGQQB3ifinxb9Sx6u81HbboWBwlCLU1vAOMCya
 l/8TUj7AzauBbQOT8cHxiVmydvVG+QivUVINIkENi6eWcdAPRl4qBYanLQTckl0s3HOeKO8rSjg
 VwvimtJXbPTRswVDhrO3r+Q5KlgN0Q/03mPM3GRPRCYBfZ5Q+M2NOGrc1pmHMmkC/IJjO6D6fmr
 P2s9hAJHAvHYlucn5l7uV2zqb5UB1s/MIW8Fh0ZTuSFFo/HzH7MFBXdYgQSagiLYliwLeVLbsoe
 vloGmpxWk4IvfxapJl3a5beo99W8PALAYRwiMTl9C9yU3ysvJ3l16kMkCQAsIB6fB07zi25a7AF
 5lyltwEAXdORJvYfV2qpH0ubioiMFhxVu/lTr4N9gd8r2F6HEj4aNZKhFhfk4KpWypXInpaW3BD
 rkFiaKUi14wboHIU0trpU3cNYvV66uyuLxMKTEGykTQ7eihutPKJyUtr1HdprrvuO4dl9aNcMU1
 aV0RVoW1QBvtjIw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 07/13] memory: tegra-mc: simplify with
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
 drivers/memory/tegra/mc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 224b488794e5..bd5b58f1fd42 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -450,7 +450,6 @@ static int load_one_timing(struct tegra_mc *mc,
 
 static int load_timings(struct tegra_mc *mc, struct device_node *node)
 {
-	struct device_node *child;
 	struct tegra_mc_timing *timing;
 	int child_count = of_get_child_count(node);
 	int i = 0, err;
@@ -462,14 +461,12 @@ static int load_timings(struct tegra_mc *mc, struct device_node *node)
 
 	mc->num_timings = child_count;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		timing = &mc->timings[i++];
 
 		err = load_one_timing(mc, timing, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 	}
 
 	return 0;
@@ -477,7 +474,6 @@ static int load_timings(struct tegra_mc *mc, struct device_node *node)
 
 static int tegra_mc_setup_timings(struct tegra_mc *mc)
 {
-	struct device_node *node;
 	u32 ram_code, node_ram_code;
 	int err;
 
@@ -485,14 +481,13 @@ static int tegra_mc_setup_timings(struct tegra_mc *mc)
 
 	mc->num_timings = 0;
 
-	for_each_child_of_node(mc->dev->of_node, node) {
+	for_each_child_of_node_scoped(mc->dev->of_node, node) {
 		err = of_property_read_u32(node, "nvidia,ram-code",
 					   &node_ram_code);
 		if (err || (node_ram_code != ram_code))
 			continue;
 
 		err = load_timings(mc, node);
-		of_node_put(node);
 		if (err)
 			return err;
 		break;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
