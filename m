Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DF53A0916
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:32:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BB86C58D5D;
	Wed,  9 Jun 2021 01:32:29 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77342C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:32:26 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id x10so11682926plg.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=14DXo/gQwzalmPUmXYTocs4CME9s7GOS9p5R5YtgXZk=;
 b=TujjSmROvBrFm01zCy+diwD2kEaIeC/luEfVKI6a+7CAs3QqhClnQIiOCfvlDfovfI
 kguTKJXsGYYi6vfHmsLBFjANn84GA8qvOFXnlW5iDkJFT/ZvgKfc4RblfH+cHI8amlWn
 JvGJtraGSuUIispgYtbnJb0K+zp7ZpvSIe4QU+S51QARJnhXBMxXGg/gRgjM97Y7HbVl
 lXaoDnaRigz5WtWoWni7hJjWzWAZ+p+RmlE/IXLvT2arvaxJAilPo9aEYeEGETuFfy1x
 qJMxwClxz5zXmr2LnVIUdoLutEghVw6HGNk4ZAiAq/MtSIorcOmfMyzHxih/EdRdMdZn
 7Zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=14DXo/gQwzalmPUmXYTocs4CME9s7GOS9p5R5YtgXZk=;
 b=gALthCiiG/grnIyn7V6rGv8phjaTFSTDe40fxMWkxFdajZDT4rPNjcs26CPJNWaNQ3
 OME+rrXajQSLgstHDb+A+KCrBTKZL1TXn0hV4xsIfrzZlZ6tP0d/0Fc7Qf9UHiIXQVvm
 Zw9HHdoO+0WJeb8vll88la3a9m5RE09XJhgNAdAvhxh4Awuah7VQYA3rZaTCHC7aezeU
 RT6IaHaCZSc1X0MWr/LMsQTI/vz891gRV8AAfiTAg6jL8j4ttGdylGEQTnRGl5P2oSLx
 F98v4dNwHOVulwj9zTIRghdqVsGnKWZa6wfQgzxcZ+5CjecFl4oyntSmQiZB3WmrAaWR
 1TEw==
X-Gm-Message-State: AOAM533SZJefII/F02cEC0Gq4r0kDDgxzhdoPaglD9Cb9RjaZn6lxcOT
 hwMBPU4FDCwlp5dE1qIYEI8=
X-Google-Smtp-Source: ABdhPJzdTdPJRUr3bOq9BJfkgAU6+P4ZrboFuZvPrV9jwLOHXPdzTe0Wc1iBMzp5BFUXBHO5+zC0CQ==
X-Received: by 2002:a17:902:8a98:b029:f9:36dc:37cd with SMTP id
 p24-20020a1709028a98b02900f936dc37cdmr2904637plo.68.1623202344988; 
 Tue, 08 Jun 2021 18:32:24 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:32:24 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:10 +0900
Message-Id: <6847da7553208e7f2554e6c7688e2021f7e19716.1623201081.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v11 07/33] counter: 104-quad-8: Add const
	qualifier for functions_list array
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
quad8_count_functions_list to match functions_list.

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 51fba8cf9c2a..ae89ad7a91c6 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -193,7 +193,7 @@ enum quad8_count_function {
 	QUAD8_COUNT_FUNCTION_QUADRATURE_X4
 };
 
-static enum counter_count_function quad8_count_functions_list[] = {
+static const enum counter_count_function quad8_count_functions_list[] = {
 	[QUAD8_COUNT_FUNCTION_PULSE_DIRECTION] = COUNTER_COUNT_FUNCTION_PULSE_DIRECTION,
 	[QUAD8_COUNT_FUNCTION_QUADRATURE_X1] = COUNTER_COUNT_FUNCTION_QUADRATURE_X1_A,
 	[QUAD8_COUNT_FUNCTION_QUADRATURE_X2] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_A,
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
