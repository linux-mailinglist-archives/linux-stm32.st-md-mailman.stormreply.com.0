Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B75A94EE45
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 15:34:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13997C78028;
	Mon, 12 Aug 2024 13:34:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE074C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 13:34:27 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-428085a3ad1so34225305e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 06:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723469667; x=1724074467;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iYu90t8uzYSzwZwxstiM099mVmkqpDjtdWc2Qi9XDBQ=;
 b=J7jYtk/UZhRldqfY1aV+J+1Ag/P2QOKb+hyTdtDP6y8YA8ZFsYA6xED4SZ5Ga34MLU
 LmobyVJOiBs9wKloFIkPF7LiY01pF+Y52DQye8yIF4bz5cO/oZzeQd1FSTLKo6DILaRp
 f88MMuMe9XnouBSAJWhszs4IWGwP87dnqGxpwS1I9+7dvbobznPFVei+CqlZYMQ/5Dfv
 69fU7ufPbwkROGmz04OdOuCYR4Zci6GIvxPGRE3vwvNdsCVHwLc0CzFWThGEIcVp9OtL
 dfCgXA11ZbJBX/p38u2ZzzVzJPXpHWB9CTtxIvaWTA5F+pF80OGWTSiS/U0nGchpQoTb
 D+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723469667; x=1724074467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYu90t8uzYSzwZwxstiM099mVmkqpDjtdWc2Qi9XDBQ=;
 b=cybShOabyPDAJBXpkDjMhO139WpK8d3dHG+jpAckrYKWeLBKf4WxvR5tqJwAaRAfcs
 nn5X6pmXnrkjfM/nmQsIzplG9udpYDikViS+a7qyx3BkokFRLlmFQMqL5n34eDF3vzZZ
 4LXohkvYzSkVsy1bKZfebG2fD9BmnPOg6mlLdtjfvuSspdiBy/mJbTZy0gL3kSZPrAP3
 BSL66Au8j6TDuPe7FWG5G/+FLLIEkt3ZmYFACqDCN4bkF9ElGaw7vH+JFTDaTL7RAcrq
 ShGQM/SZtpwJd4u3O74q0zLowUGJ+KpTQU02uedIbIID6JFfvz/+LHiFNWMNYL2EsX4X
 QW0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAZ6EseTDc9HyKIV46jZr2pPQHF+e4+/nXc8CPJACEZ7833FALdYLL4EZ2XMRjMzG9BelBUeDg3nVaNeTZIyOCYPCe8qZBpxPlkr6L7p3ZhuoGQmpj55dl
X-Gm-Message-State: AOJu0YyLEtnxgnHQDRwmvdBjpQ+95xvCVd1CynjVBzEMvVsmkm3Ym6LS
 6BMx8bAHKE5z5LOvqPWt1B8k61dccQiQToSrbBfzBLRpmLAtYXmdLS+Je07kZqw=
X-Google-Smtp-Source: AGHT+IGo+bwIOsZ7HKzwRQ/L9wxhGpzJ+9d90EvUl3/LSZZSk74iCon02t3qgWPnZGmK+APviAH8lQ==
X-Received: by 2002:a05:600c:35cb:b0:429:cc03:6450 with SMTP id
 5b1f17b1804b1-429d47f3d65mr3847725e9.7.1723469667400; 
 Mon, 12 Aug 2024 06:34:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:34:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:33:59 +0200
MIME-Version: 1.0
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-5-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VUl2omx8TySNDGhRBBGJcq4Ai4teD6LWmoYd+wA7nBQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9VH3wPyjxN/t/zzCvyjeYSsYVX7Jz1ga252
 UjCTUHqiJ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPVQAKCRDBN2bmhouD
 18dmD/0ewHA0UK0In5nae64KOCy+CAeX+7EsnZCjszXwHpXtbtbje2b7d8Br0Rj7OsxqkLkswiK
 0TtfIJ7JhGZMAjZ++tIyxg3wlqEt35RQt4H+PQvHeDLM2XZ+z9CKTc05uuZqynh/PpvkoXHheOr
 lO8TR4iguvJTFmKmbSieHEgcEQvDqZL+SnWoADGWfaRqTpuCvzgMMuf+2qPqqnDNfcregG9QgKO
 +w60nKgkB4CLB6FMMlzAscW23AprITn6TCuZEBd9s9Ml4+hp/NX2QJa/E79ozdZpjz/6nT+JZi2
 7QUvHO4EcccyTIqhqcC1Ggezg1vmaglKJdKUI980UDR6GarxWnvJwrNaTIjoOvUnidQNMAbw1E8
 Brc88ThoerIMUAaRW36EdH2jze/ynNoiK+qJUZnNdlK9k2d+ApRPCR0llnQTKj7OKVxe92jKUT3
 GEYOBQ1Vf6C2aD2syu/gERy554GaWVbVPHBmvlGYFw8VyyirnITcYyw2ElKoHJGTTySSedZp2Uh
 TUCYUuos2eEzx/EOV9E7LDPfrFWARV8lZefX+nMIUZnYSj1WdfPfKnxWM7S48WuUkXVDaHSNIyz
 hYY0EVe5bcenb3qyxNONkHg0IKjxWPKwtIzWFh31VxXLQoZ9VXrteRJhyEqthWTt9f6GZALFo9O
 hWEevbAzA1E3pYQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/9] memory: tegra-mc: simplify with scoped
 for each OF child loop
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
