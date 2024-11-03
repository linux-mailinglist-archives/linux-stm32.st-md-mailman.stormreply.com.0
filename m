Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ECD9BBB8B
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA741C7A850;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 681C3C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Nov 2024 18:25:06 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-46090640f0cso34920431cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Nov 2024 10:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730658305; x=1731263105;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yzgzMpcRdmKNSKal7H2bOhmkB/Lh3IDIXdJcfZ+Ojsc=;
 b=lLk9gDCo6Ix9m7zIm0zqzOnP0gtMXCExB7KH4yiPRCWqMsqL7JkInsZRPNhcKULzpq
 aZdPTlpABE/Ww5ReTghSUxoVBn6KgSVblU9Ap6/TERCcXHdjqBpKfJt81LFQQ174sBDb
 TSPJmApocbQAQ/44U/Mjd1sHW1oYmbJFG0k30/fTbcAv6H1IVIuLlm7JF+1yNkHwfaRI
 1v/UAhhSi9WS1lPD+/W0kQPgc78EhdGVxAbSt0r8ZT2TL/C2lVqg84GBl0ixpy4npWyo
 QBRmkn98jR7cvjTmsWCDTjAPbrFFwHZfJuSv5wXLF/IxfmVEJq4ZPpU01h2vo1jV4AGR
 OLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730658305; x=1731263105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yzgzMpcRdmKNSKal7H2bOhmkB/Lh3IDIXdJcfZ+Ojsc=;
 b=kRdAmVIyCfGsxcfA6vjtkcM6zON2F8ZkeFpPiV41w9wu+VuYtgtWp5ZwSfPDUkywSU
 MAoWhUXrwm+CFC/M47SseQA5eWbatlp/jm4810j1TuuU4GKrV0A0r4dRzRTYP2Ndu8IL
 9NA0e4HXCscKFXyAgLn68BiyhomvmbxgnpeUFyB1L1u8WDGSqPzz8yAcKpv2RlUe41al
 BEB8bB76IogkkCyDcZGhCrA32PeOySBdBjcGvQhPfxRoIRQIteOOIsTlzBdtGIxUogaQ
 It+wldAUDPAranasMb8yNyqOeEAOxyVIr1ulGbpwNA1djikgPSwE5hTA5e+HbjfMEcf/
 vZpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf0B62SC/9/rtCdfZl7F3zgjGk0ULMLJCQ+yQG7lc737zkYnexx6G2reXohIQPCgLG+IiolCBDCpcyKw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3bvDPDUOO73OOkyP8DuiXD5JrWAtyLqXFfeqW7i5xSCyQMOP7
 nO2V+w6V6eOeTRYgMhjMPqRIBy1fiKFvtHmIjXb+NfLWQftuY4P0
X-Google-Smtp-Source: AGHT+IEaw3nGMJ8bhhqo73g756ybtLD42XoRl05nXL1wjuN+i1W03TlspIeQ3fHjcuKr936uMQ2V8g==
X-Received: by 2002:ac8:5a87:0:b0:460:8bb8:fd79 with SMTP id
 d75a77b69052e-462b8646bc9mr145956651cf.12.1730658305244; 
 Sun, 03 Nov 2024 10:25:05 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-462ad19b328sm39287511cf.85.2024.11.03.10.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 10:25:04 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: fabrice.gasnier@foss.st.com, wbg@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, Jonathan.Cameron@huawei.com,
 benjamin.gaignard@st.com, gregkh@linuxfoundation.org
Date: Sun,  3 Nov 2024 18:25:02 +0000
Message-Id: <20241103182502.8384-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: linux-iio@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@outlook.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: Add check for
	clk_enable()
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

From: Jiasheng Jiang <jiashengjiangcool@outlook.com>

Add check for the return value of clk_enable() in order to catch the
potential exception.

Fixes: c5b8425514da ("counter: stm32-timer-cnt: add power management support")
Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@outlook.com>
---
 drivers/counter/stm32-timer-cnt.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 186e73d6ccb4..0593c9b73992 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -214,11 +214,15 @@ static int stm32_count_enable_write(struct counter_device *counter,
 {
 	struct stm32_timer_cnt *const priv = counter_priv(counter);
 	u32 cr1;
+	int ret;
 
 	if (enable) {
 		regmap_read(priv->regmap, TIM_CR1, &cr1);
-		if (!(cr1 & TIM_CR1_CEN))
-			clk_enable(priv->clk);
+		if (!(cr1 & TIM_CR1_CEN)) {
+			ret = clk_enable(priv->clk);
+			if (ret)
+				return ret;
+		}
 
 		regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
 				   TIM_CR1_CEN);
@@ -816,7 +820,9 @@ static int __maybe_unused stm32_timer_cnt_resume(struct device *dev)
 		return ret;
 
 	if (priv->enabled) {
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret)
+			return ret;
 
 		/* Restore registers that may have been lost */
 		regmap_write(priv->regmap, TIM_SMCR, priv->bak.smcr);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
