Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0ED77752C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:59:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3443BC6B472;
	Thu, 10 Aug 2023 09:59:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03767C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:59:41 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso685338f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 02:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661580; x=1692266380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LA6g1+NA1MHwgD0J5/0iacU9T/Zj+WYPU0o6GQh2M60=;
 b=O1zGd4xmWe411WBeHnJ8AnZONvqE7Z9u3MFhkDtUZCO307na8i8N5vr+98ztCj50oI
 0nb9hFMmwsuYc3rCJdKobyxauVd6dyWfkigXmeHz29uTSAtFkGxphfnCEl11yEHgKRu0
 AbiDxcqsma9jYw1oIHWwQ76uNZN/cdYNxI3JYj4u0YDMwhVnzHEFrdP7Cmdqoc6R9AYx
 9Z9cGlrTILoqs7IE/361Y3mpszZ7qgJnMisepKC1a98bGVT97jNwSwGqEJpFtHGVuut+
 DGwGz9UbXZZfJqeZjUmWWRTwaVt89t0o4NnN//b8QCToFu3aEeHskABnmhFGCuUpNcX9
 4TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661580; x=1692266380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LA6g1+NA1MHwgD0J5/0iacU9T/Zj+WYPU0o6GQh2M60=;
 b=ATWt6CgUinLzWe5SQ3P0qm5BMsNshCeaNvTxXI6a/7CNJYlqONxFk3n+bOYyxQ9FSV
 o5BM4nsCj2vooQ68iDVvyMP8YeAgYs7kKpBpjkJ8IsVAbBbbh2jVFsEOhREN9xBvcjQL
 StuNrbuO8evZXlhv/C8w8m0xnDDg+YEZEIWcb/roytFJvxYPMZiMJABJbuJ6EkGhycAx
 3SdNh11nso8Mne2JD5oTDw4DQtNnQMyaL1TJY/83Uz82Ank+oHqxZr2GPi5jiThoAfLb
 6AC1T2AYKxrnEfiTrmU9WzXp9DXj6k435BmOgyIl0OIMELbqHgRRGseWbRnCEKISCtjL
 m8ww==
X-Gm-Message-State: AOJu0Yw4u5W6+e3u1oDMw5ZPy2UZaD2Nb9RLsw3ytEax+nn+mH2Uz0uR
 k/GOQL0p9at7xGT0L6i3Pwg5cQ==
X-Google-Smtp-Source: AGHT+IEOo9PSJhciOwaN1TWXgpDhd54pTrrYRzGVnPGGiXjSds0yhXAKmUVfpiMdr2xl8lBRf7vCwA==
X-Received: by 2002:a05:6000:1090:b0:317:58eb:1e33 with SMTP id
 y16-20020a056000109000b0031758eb1e33mr1507037wrw.8.1691661580528; 
 Thu, 10 Aug 2023 02:59:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 a2-20020a5d4d42000000b00317ca89f6c5sm1623182wru.107.2023.08.10.02.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:59:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 10 Aug 2023 11:59:36 +0200
Message-Id: <20230810095936.123432-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810095936.123432-1-krzysztof.kozlowski@linaro.org>
References: <20230810095936.123432-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: [Linux-stm32] [PATCH 2/2] Input: stmpe-ts - mark OF related data as
	maybe unused
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

When compile tested with W=1 on x86_64 with driver as built-in:

  stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/input/touchscreen/stmpe-ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index 25c45c3a3561..a2032189fc25 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -368,7 +368,7 @@ static struct platform_driver stmpe_ts_driver = {
 };
 module_platform_driver(stmpe_ts_driver);
 
-static const struct of_device_id stmpe_ts_ids[] = {
+static const struct of_device_id stmpe_ts_ids[] __maybe_unused = {
 	{ .compatible = "st,stmpe-ts", },
 	{ },
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
