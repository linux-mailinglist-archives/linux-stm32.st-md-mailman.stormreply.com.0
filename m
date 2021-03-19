Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EA3341A9C
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:01:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C318C58D5B;
	Fri, 19 Mar 2021 11:01:57 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE629C58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:01:54 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id g1so2783781plg.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CjJQUNTwsBa+RZPOzEy/Sih/eBggOo9hBH9OJm4YwV8=;
 b=MkepcUzFZogp8zB2PNJuWmigI/5LesD3IUw/sJfRQzB0wwWDPN2B68iLLpurdR1PlC
 23YaLOV5bj7v1kw1cMApbc0X/pyIXCcElFFarf+j4sPzHc+tx8zuBtOQ4c3qCWNC/5Lt
 05cFWeoLzkV2rUjlBaW2nYTAf8d+fM6eo8FoP+xYxMVnyAK2Q6jGAp830LeYJ2AYZkcc
 6I3dnDKWWuSMhU6UCtFZXrP/kCQkPZ6eXD5zOPjCO965p6fagAdyZ/YA3//Bd0A2TFml
 /j+OEFAA/OFVAl0JiwokRoDye5rzYz/Htk0+SZSycagbQXl0qapDLqtUgJSh7MIEyEu+
 PjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CjJQUNTwsBa+RZPOzEy/Sih/eBggOo9hBH9OJm4YwV8=;
 b=GwzpKXGfrPam/+/jurOng1MzKyAIsXrY+oBXmBDn41/86YPn7jkzK9xc1H282FI79+
 X1c18Xz413+4rdZbDKrYufZ7IWqML6MBgRdazu/FTariWda3WKLJWEmYQKNEeJYA+CtO
 r/OwSbcEbqoxkGycdric3nQ0x4SnXyNuWmWXHsCBewSowuxN0LBbiYyMch9eYilR8vbg
 TtroStE4HyVYJEu10SnXkBWqxzjdsvCk5vTC3Mp85EJYIVl1VNu6IkzwYOlngRAqWG4D
 9/PgtiobojK7kYDsSfSdlX7REETxVVGGKsr8a3laNWbLmWPdGjq4UZJe8xGLBI45Sauh
 WGQw==
X-Gm-Message-State: AOAM530URKwRGdRiAHJHoFH9TCn8bJiDQQH1oZ28WhRGrPmr4/vcTTWZ
 pLYptDW+c6PV8YzNXKGunQM=
X-Google-Smtp-Source: ABdhPJzh7KmTVF5c/eWnSvJBwidUGWNTKqwczSwnvsTNxu/q0mMuF7gvIYCDa+BqKEltXK4+qmPpMA==
X-Received: by 2002:a17:902:d4cd:b029:e5:dd6d:f9b3 with SMTP id
 o13-20020a170902d4cdb02900e5dd6df9b3mr13540874plg.43.1616151713477; 
 Fri, 19 Mar 2021 04:01:53 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:01:53 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:29 +0900
Message-Id: <e5dc16652697919af7baed6a630c436359455131.1616150619.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616150619.git.vilhelm.gray@gmail.com>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v10 10/33] counter: stm32-lptimer-cnt: Add
	const qualifier for functions_list array
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

The struct counter_count functions_list member expects a const enum
counter_count_function array. This patch adds the const qualifier to the
stm32_lptim_cnt_functions to match functions_list.

Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-lptimer-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index 937439635d53..0f7d3f1ec1b6 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -134,7 +134,7 @@ enum stm32_lptim_cnt_function {
 	STM32_LPTIM_ENCODER_BOTH_EDGE,
 };
 
-static enum counter_count_function stm32_lptim_cnt_functions[] = {
+static const enum counter_count_function stm32_lptim_cnt_functions[] = {
 	[STM32_LPTIM_COUNTER_INCREASE] = COUNTER_COUNT_FUNCTION_INCREASE,
 	[STM32_LPTIM_ENCODER_BOTH_EDGE] = COUNTER_COUNT_FUNCTION_QUADRATURE_X4,
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
