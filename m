Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 692C04FD0D4
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Apr 2022 08:51:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AF28C628AA;
	Tue, 12 Apr 2022 06:51:58 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA8DAC60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Apr 2022 06:51:56 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id cj5so926175pfb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 23:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=RBbYU01e+AFbhWY3ZuGeFMRIuU/CVxN8Q/n9EQ09lHU=;
 b=a8AKCKRLwEJ+ICpyl0Ua49RR5GoUvlGs65zLny8zLr9rq8FPqaowjaciyPlu0e0Ra5
 K38C9SACTeDtneV0qgjKDJBJUEWchIR3VIhC9SpjB3IXVvUnsnuVOkKl9UFn60wHF9N4
 JMw0aiBOyEdWx9p+NYgkcgqLhB7jNVb8eS1V2+vluyREM6O2fqdKfAdlLOt1xz7uWDTN
 dws3dSdt0MyP5UQhVa68Spk7WNjnYcPTgH+KtTzNkjZwyCBJHqy2nDP9oqdP1YDoavPZ
 MA6Qx75v3pkISAyQJgVWK+UJjDfbAk4jHEqdT5BM1mpcOuzxHlGUkGZ32J3dlFvJxCxN
 SZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=RBbYU01e+AFbhWY3ZuGeFMRIuU/CVxN8Q/n9EQ09lHU=;
 b=Mpaz4cpnrwZVkjpqJT3igaDIyscieLYmODPuj37vY7RZ0QpRII6K1tSwg+Wl1CD24Z
 fouVbsLM2di0j76pTPKpY7B3QkjniT5UovPJJS21ICgWVd0mxF1XuQPtgzj09EQCPzT4
 rzFXnWfIkancxdGTmlug3zNvWX24H7aVK67de/5WXbO3Ohjy+Q9VM3A4AdXFlMYnnI4i
 h5JtVnqoZPkqwc+EScCGEgpAy9HnVT7Et61WBPHyd+4JZ9wuysVGCCJ/cnE1SXSZG3+L
 8qg7pv7Zfsm2I7764PTK58BnGnFAgOhgCA9w7jBWJ0hn/Jz4jzZdZ+nprquExBDyjPfm
 JMIQ==
X-Gm-Message-State: AOAM530DUgpeLWf85arcl8p1mhW+oW1Wo4Fy044yjlm3oDu3Ul6mftuJ
 37r8wv/KnERtjlr3kUUUIvo=
X-Google-Smtp-Source: ABdhPJxPK9vIH5rkg+Zivi5zxRj7BATlOjv/oQFrgbrSqTgZiffo9i573UyyUxob/kW5MlB279CmGA==
X-Received: by 2002:a05:6a00:1488:b0:4fa:ac61:8b11 with SMTP id
 v8-20020a056a00148800b004faac618b11mr37315301pfu.58.1649746315502; 
 Mon, 11 Apr 2022 23:51:55 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 ng17-20020a17090b1a9100b001c9f79927bfsm1654577pjb.25.2022.04.11.23.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 23:51:55 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Miaoqian Lin <linmq006@gmail.com>, Kees Cook <keescook@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 12 Apr 2022 06:51:45 +0000
Message-Id: <20220412065150.14486-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <PH0PR03MB6786157EDA63137DF0071D1F99ED9@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <PH0PR03MB6786157EDA63137DF0071D1F99ED9@PH0PR03MB6786.namprd03.prod.outlook.com>
Subject: [Linux-stm32] [PATCH v3] iio: adc: stmpe-adc: Fix
	wait_for_completion_timeout return value check
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

wait_for_completion_timeout() returns unsigned long not long.
it returns 0 if timed out, and positive if completed.
The check for <= 0 is ambiguous and should be == 0 here
indicating timeout which is the only error case

Fixes: e813dde6f833 ("iio: stmpe-adc: Use wait_for_completion_timeout")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- Fix same issue in stmpe_read_temp.
---
changes in v3:
- update the patch subject.
---
 drivers/iio/adc/stmpe-adc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
index d2d405388499..83e0ac4467ca 100644
--- a/drivers/iio/adc/stmpe-adc.c
+++ b/drivers/iio/adc/stmpe-adc.c
@@ -61,7 +61,7 @@ struct stmpe_adc {
 static int stmpe_read_voltage(struct stmpe_adc *info,
 		struct iio_chan_spec const *chan, int *val)
 {
-	long ret;
+	unsigned long ret;
 
 	mutex_lock(&info->lock);
 
@@ -79,7 +79,7 @@ static int stmpe_read_voltage(struct stmpe_adc *info,
 
 	ret = wait_for_completion_timeout(&info->completion, STMPE_ADC_TIMEOUT);
 
-	if (ret <= 0) {
+	if (ret == 0) {
 		stmpe_reg_write(info->stmpe, STMPE_REG_ADC_INT_STA,
 				STMPE_ADC_CH(info->channel));
 		mutex_unlock(&info->lock);
@@ -96,7 +96,7 @@ static int stmpe_read_voltage(struct stmpe_adc *info,
 static int stmpe_read_temp(struct stmpe_adc *info,
 		struct iio_chan_spec const *chan, int *val)
 {
-	long ret;
+	unsigned long ret;
 
 	mutex_lock(&info->lock);
 
@@ -114,7 +114,7 @@ static int stmpe_read_temp(struct stmpe_adc *info,
 
 	ret = wait_for_completion_timeout(&info->completion, STMPE_ADC_TIMEOUT);
 
-	if (ret <= 0) {
+	if (ret == 0) {
 		mutex_unlock(&info->lock);
 		return -ETIMEDOUT;
 	}
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
