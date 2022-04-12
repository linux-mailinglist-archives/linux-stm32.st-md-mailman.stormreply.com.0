Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E7A4FCC05
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Apr 2022 03:56:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18D93C628AD;
	Tue, 12 Apr 2022 01:56:41 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F17EC5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Apr 2022 01:56:39 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id u2so515364pgq.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 18:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=sM5FjahbxiDWtBMcPGoH6sjK50a41Jzz6Kf8kK5IDIA=;
 b=Vb/IP0/ckbo8JnxvOIqofc/GCxVL5OwLwa2/kVvlfWhHBj5G7Byk5xMS+tct28pghZ
 TjiX3jRqDNqNJRMws9ao6amJT7UsZ34eigDIyTwmZMS7Ni61Mi/olKMbLZdYFvQxdj42
 57TwBOzAz7v5OFbDeALkA+a0kLtLFJJcN5kmFvgTZR5LrhWchnZNNsKENwWvJshWtCl6
 AtCcacnD6C2Oi/X8J77PhIIFq2QSY09G/tzc/a16o6RnMxR4amjp6NXs7RcKSBab8wzG
 FOcfqhL/QCvsohG7Vzqypqru1DVwekKsExWvYpZgT/dYWMf34rGB4kQSUED4UgIscY3w
 bmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=sM5FjahbxiDWtBMcPGoH6sjK50a41Jzz6Kf8kK5IDIA=;
 b=n+HF2fIhjs6RGhuRnJVwFHKu2x5JNwwkgzQTXmlkQJuiuKpznqxGVqN7XcTb5KIlss
 OhE/qpPCMds7N+jXk9hifzyV/ifEO/vAOiemDmRGK9cRQ5OYGB5woTER3Qf1ypfVBHJf
 Sz/6mlozvj/iOqoOBss1gonkQiW7e9I0FEbgF/ok5BGdVoMXcV5KJOKTsZd+fCrc1wCP
 ZZOeXA3BUbOyv6PsMHot3tGmuQVRy3zthwb0dQFu/nOejfuPkF2kYlA16XROBCHWwNdQ
 cG1W9I0SX0ix/9g1h9KUOOf2seS6T3Pf94Sk20pQDiZvplejY9Oyq+zBSPQBR4DTzDUx
 4KDQ==
X-Gm-Message-State: AOAM530kEyxLdnNNSggG4y6YTH8ubbdTqpfh6WHmAKZREoAVRznCrXAJ
 sWj4pZi74R2J6REh/FD/Szo=
X-Google-Smtp-Source: ABdhPJxaKYnF/FBKWSQfNDG/CffffK+XXw6W3BSTU7WQBeJ+uvZ16E1x2om5zLruk4LPuCuEc+5eJg==
X-Received: by 2002:a63:140f:0:b0:399:3005:baf5 with SMTP id
 u15-20020a63140f000000b003993005baf5mr29409036pgl.193.1649728598072; 
 Mon, 11 Apr 2022 18:56:38 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 gn21-20020a17090ac79500b001ca3c37af65sm746815pjb.21.2022.04.11.18.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 18:56:37 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kees Cook <keescook@chromium.org>, Miaoqian Lin <linmq006@gmail.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 12 Apr 2022 01:55:42 +0000
Message-Id: <20220412015547.4137-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <60e67c07-7e40-4187-a90a-1be9acdfe757@gmail.com>
References: <60e67c07-7e40-4187-a90a-1be9acdfe757@gmail.com>
Subject: [Linux-stm32] [PATCH v2] iio: stmpe-adc: Fix
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
