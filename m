Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B19DF3A0929
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:33:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53801C58D5C;
	Wed,  9 Jun 2021 01:33:14 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBCF5C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:33:12 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so427340pjz.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bitxx/XbIAxQ+3ku/Ck0eGbzGv7Jfqx1XIDiwjeLpr0=;
 b=Cm4lgvn1K3wLjgrx+rRm23T6dRACnIdASni2uM4/i5kkJxieL1zML733wmI+3AC6H0
 mlZT2pBdnl/2B5kx5GQN6PjeYGJQ4hdKKmentCRpVjfcTjNk5RgGw38ockGOHYC+alfC
 Fgrgiq26fO4Ix542suEce5f6XuA2y7AhqnCfhuN81tGcI78byXX9b57XxDwHkKDaRl4H
 xQaNcibGY69gloVh1jT1LnJSwucrxoRlX2FamQxeCrEozECXycTQhQmqsZ77ETyBLWU8
 6XYsPXMeXm20pgQCcbGk6lrBIsxkQNK9Fn3EzfSKKNiyTA7ZWzSFyL3G6fNGpDdxokGr
 lFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bitxx/XbIAxQ+3ku/Ck0eGbzGv7Jfqx1XIDiwjeLpr0=;
 b=mVeK+FSjTm7wtYhROWtm6dOmy4m3fa4BIVFsaPOHrLf3AMjv+BVmDQK5s1dYuYLs0K
 uqPWWe9qKrjXVHnWL9jZAMRqa+7RRdzaeKn1P+8QdpHRwY0vl1NRx9HfK6tHhV8OozPZ
 A8ANPZGdKiHsKoXWjf4kgrIIKkDhGVfNmb3B+wnFAwyrvlEItcRVewU4wPbvcgxHTUaP
 U2G7miX+MFWTiOsFEw6GgkkrYVR7CEM19zDYBBAlXa+xYzRUhoMOAC41HJiWsfTliS58
 2PLduZL4YOcRWlzLqRH0DhaUvxTpb7nlaEIybPdVpyiT5pe1qmchFxXtUmte+tqQ/ZRq
 2n4g==
X-Gm-Message-State: AOAM533zKzFwUKfGIdqAfQdisrnedEzx9WJarejOyZ/6uHNNlzdPLSQH
 pWg0X7o1sHeZYNCdSDb2wWY=
X-Google-Smtp-Source: ABdhPJyMKmmHQ+mR1LtGofnKzVZSBQVARi0dlfhoCQT7X39eFTFYBwJ52Ckga5KRPHl9sp8NnBTsCw==
X-Received: by 2002:a17:90a:e541:: with SMTP id
 ei1mr28853250pjb.189.1623202391406; 
 Tue, 08 Jun 2021 18:33:11 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:33:11 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:19 +0900
Message-Id: <785e0daa3633923ede42394f423fcf94c4469154.1623201081.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623201081.git.vilhelm.gray@gmail.com>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v11 16/33] counter: stm32-lptimer-cnt: Add
	const qualifier for actions_list array
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

The struct counter_synapse actions_list member expects a const enum
counter_synapse_action array. This patch adds the const qualifier to the
stm32_lptim_cnt_synapse_actions to match actions_list.

Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-lptimer-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index 0f7d3f1ec1b6..c19d998df5ba 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -146,7 +146,7 @@ enum stm32_lptim_synapse_action {
 	STM32_LPTIM_SYNAPSE_ACTION_NONE,
 };
 
-static enum counter_synapse_action stm32_lptim_cnt_synapse_actions[] = {
+static const enum counter_synapse_action stm32_lptim_cnt_synapse_actions[] = {
 	/* Index must match with stm32_lptim_cnt_polarity[] (priv->polarity) */
 	[STM32_LPTIM_SYNAPSE_ACTION_RISING_EDGE] = COUNTER_SYNAPSE_ACTION_RISING_EDGE,
 	[STM32_LPTIM_SYNAPSE_ACTION_FALLING_EDGE] = COUNTER_SYNAPSE_ACTION_FALLING_EDGE,
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
