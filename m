Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B89B04FB9AE
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Apr 2022 12:30:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F799C628A2;
	Mon, 11 Apr 2022 10:30:42 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AB13C60495
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 10:30:41 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id h19so14252075pfv.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 03:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=VrMR8gvOFjWxaufbBwSvKiS63Y8OuXOfxSp4uF7zIAw=;
 b=bynoAbM8exJk1RavUb1cy3mTryf26m1U2TStm4n/kw7GwzM6YE+84/uNbKwfjsoWtY
 T9Ad79+XdDBOj4YhVgsoRhWpiJg+hu3Mg1N3O6m65iMZUmsNW6+bk4GCrLDfpX52O059
 mpkL4bf22MXomVHepqv93Mf1CMjAN0nTQdftgaoqSS8zn2fnJBs/qj/HFaRbG2aULQU2
 zgSpG7JTQQNtlhvCgQ6pZvzHicROL1kSegg+HciTD2M+FPuXJkp0rnCOWX1d/k2au351
 0YdDWf4ZSUkT5ETpf7L8mn3kJ2maZoC+4RdBKfrtYuvhflgySZcDVaTzp0XhzL+Yx4rG
 lyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=VrMR8gvOFjWxaufbBwSvKiS63Y8OuXOfxSp4uF7zIAw=;
 b=xrR1/bFHXUKDq8sLXaFvIL2ryR5M7Fih9JKOveinxL+ygB5I3lermBwo7JNdAC/eGH
 A0YHEvCmmWG4Xl+CG/r3gS+BuEa9ZPK09oxwIr9M1/citE7fFbFBfqetiKwDUy4d3YPJ
 BQajU1tHhDi1ygME0VZK0Om5snj/o21DsMr7sJyiufQLpMFLeVcKKdJv7jvhJeqRobYo
 5uchwGS8cFE/ptjSffadBM9WFaTW30npL76XKITnliXtRN3J8hWiys35Rp0wNv15mr3T
 ipshp83rdSCrWQ1+HowoIA6du2qMUI7eCyTQghGexBLv/6HKJDtwFL91lQPVvpp67Rjg
 4eOg==
X-Gm-Message-State: AOAM5338DZS8ZMQXL7zPupxS6vib25gENhIqkD87FaF22wSee9f+aR0I
 2HbUj2tL+4J8jKUdKWSt2ME=
X-Google-Smtp-Source: ABdhPJx0YrCFIkJmWNOPe3U/JuGUNRw8r6HGtDaYdKEXEkFfWj4uwqx3GF4DBIzJEzmlWnwoDkFvmg==
X-Received: by 2002:a05:6a00:891:b0:4fe:1262:9b4e with SMTP id
 q17-20020a056a00089100b004fe12629b4emr31867142pfj.21.1649673039947; 
 Mon, 11 Apr 2022 03:30:39 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 s24-20020a17090a441800b001ca9b5724a6sm19450645pjg.36.2022.04.11.03.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 03:30:39 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kees Cook <keescook@chromium.org>, Miaoqian Lin <linmq006@gmail.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 11 Apr 2022 10:30:27 +0000
Message-Id: <20220411103032.14038-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Linux-stm32] [PATCH] iio: stmpe-adc: Fix
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
 drivers/iio/adc/stmpe-adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
index d2d405388499..d475d1c17bfc 100644
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
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
