Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D53460FF5
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 09:23:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61C53C57B6F;
	Mon, 29 Nov 2021 08:23:51 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 063BFC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Nov 2021 22:12:40 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id a9so21431804wrr.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Nov 2021 14:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zYiadRhNNssRL10U2exdYiy/ZtbsaPvzaUpEf1LyXzQ=;
 b=QlIRHwAHcq4D8jHGbjoR4a/M513JCgzzk+uQcp+D0ltqpbZueJswOxZvhyNmOCN1ay
 5lNOzPRDpEgWgJOSEW7bMhcIU+5LppYAnn8pIPR1orU9bl/2C0sxtFXFv0cXRJmKiy83
 rqK/LWcLGllh95tThLzK39fXcXWInZ2UVc9J1O/RhdMaD3+kAyfq2D3k39aa9k/bYVvc
 mC2HvsashzzkW0cSgiqLYS7Srzzoo9cBM/kkn38Dj71davkk2aJHIB/HyQZyokBjV9UA
 aZg8fBy1cH9ytEaOguJmcekzw1hTLFqu+9pqOGZy5VtXZt5JYQrVP9heznR84Fu89Nwd
 kNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zYiadRhNNssRL10U2exdYiy/ZtbsaPvzaUpEf1LyXzQ=;
 b=xDFvh7kxJxZXEQoSmEbMHv/ZMpXwPJgbLY9tByUaG20NLBzbhqRPSpYuol6OjkuVId
 B2fYeJJK9PLVCx79IsUSgveFa54IUbAxsdutmyQlaYykfhUC87ekpOrRwV8wc2P6/0Z2
 mCsRzKFkf/F5ZVfRsaqT/7BXeyx+bY6p2KyUxL0DlTLxMF79hatoam6w+C/rYyfUb/IF
 n/CFSZuX0EAIdWAmxWeDqw7jWrUdQ7mPrtyGOqF2+BjOUgTa7IYU/vHPcapL7k0Z+Tr6
 DtYf47dUQP0WzmBnNL8ObcaB9ubw1588UQk0BNIfSBxv56SEtLMetr0GRq6Asy2yY93c
 GH8A==
X-Gm-Message-State: AOAM532mybayGWsHRGVAreN86tFwzRMw6k7q0YIcMW/1MmK3iy7qjanc
 QLKydhnPpMnnNQ==
X-Google-Smtp-Source: ABdhPJyjwm80wgN80iNVkpbxs8y7KzhCYWHeboUV6F2q0r9e59FfKMxVK3MdSV+B8Ah5wWRcio37UA==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr16766262wrn.82.1637964760617; 
 Fri, 26 Nov 2021 14:12:40 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id r15sm11884970wmh.13.2021.11.26.14.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 14:12:40 -0800 (PST)
From: Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 26 Nov 2021 22:12:39 +0000
Message-Id: <20211126221239.1100960-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Nov 2021 08:23:50 +0000
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] clk: stm32mp1: remove redundant assignment to
	pointer data
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

The pointer data is being initialized with a value and a few lines
later on being re-assigned the same value, so this re-assignment is
redundant. Clean up the code and remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/clk/clk-stm32mp1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 4bd1fe7d8af4..863274aa50e3 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -2253,8 +2253,6 @@ static int stm32_rcc_reset_init(struct device *dev, void __iomem *base,
 	const struct stm32_rcc_match_data *data = match->data;
 	struct stm32_reset_data *reset_data = NULL;
 
-	data = match->data;
-
 	reset_data = kzalloc(sizeof(*reset_data), GFP_KERNEL);
 	if (!reset_data)
 		return -ENOMEM;
-- 
2.33.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
