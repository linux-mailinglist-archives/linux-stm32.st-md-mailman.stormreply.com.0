Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E33713E45B1
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 14:38:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC61EC57B51;
	Mon,  9 Aug 2021 12:38:01 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88EF5C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 12:37:59 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id a5so477422plh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Aug 2021 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YrGQgqGpCuLsyKe+6eE+fTLPLd7PVMeC09xlnHEioFk=;
 b=Xmey9OnLsaawQFO6oRlKijU6vHYzB7c8gUdFesgvdaWIYUX9uj5yJ67tDqyPyFRNgF
 T3MVHTCTv61gfgpm1BNqPzsJukMpgnsmEfLoj/H5TRf70XkixrZ+ARIbsSLDQ8oNXX1N
 gpFoJxNfAeyAZc8MMos0ctvVIxlb82cXXFyHNNE5ZbAnBT8CSUatPpgADrMT+Uf2HVh0
 Rd1YqF+HRaANnZj3G69EecTyGjldJuAiZAodjVo5dzNo6l1XTAMoHGRhmhkdCp4ipwP+
 gxNtbv5f41OC8GHUuyZAxXg+iHk5dpqp1+N0YUw06ASaIY9Vy2bbEkwCY7MD7ap3qYTX
 Sv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YrGQgqGpCuLsyKe+6eE+fTLPLd7PVMeC09xlnHEioFk=;
 b=JPDrZgORkzY5bcJQO7WWvjS7wW6ghu4Izssd5x10YRWcxbqXkoMhd2imtU9s6KCjJf
 hV6cHomRtrS4007JFkFAKQkylt3su78IaRXvCMctPSK9Il/9PtRVQ0qFKe4bkipZsVgu
 VVye0Or3D1dAKasUaEanVc7m50SPaEzPOwRnEX2u0VZAi/KInCX+ZaRXEqecTiFy5BOy
 BWWFc5zY4Gq6DKLIfLw1wM6uoK8EJTE0i7Z/5CdkKBxNR/I5SEIkQqidSNIUwhpj9LFg
 108MKBEzieeFnbBX6JKdr3GAFzthg87O0xwpDHSLMvlvQY2EP6ejU1F363+OtZkS8O53
 1B7Q==
X-Gm-Message-State: AOAM533QV5Vfj9BStKcwtrwKnTT0atMslFHlYSAxbzKDYVBqIhYaCFfz
 dJTztaI+G3JDXPzTXs/GOx0=
X-Google-Smtp-Source: ABdhPJzWMdAAZP8xzP65xPj/pNIi/2biRgjteeQJJxGxRH7GHQ24mLzrW3SYde869EcAs3pBecHuNQ==
X-Received: by 2002:a17:903:31d5:b029:129:18a9:6267 with SMTP id
 v21-20020a17090331d5b029012918a96267mr7661761ple.43.1628512678282; 
 Mon, 09 Aug 2021 05:37:58 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id e35sm22382177pjk.28.2021.08.09.05.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 05:37:57 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Mon,  9 Aug 2021 21:37:26 +0900
Message-Id: <43b4acab9e238638c7067dd4a363a42f94c94ccb.1628511445.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628511445.git.vilhelm.gray@gmail.com>
References: <cover.1628511445.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v15 01/13] counter: 104-quad-8: Describe
	member 'lock' in 'quad8'
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

This adds a kernel-doc comment line describing the 'lock' member of the
'quad8' structure.

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 5283ff128c17..0caa60537b14 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -28,6 +28,7 @@ MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
 
 /**
  * struct quad8 - device private data structure
+ * @lock:		lock to prevent clobbering device states during R/W ops
  * @counter:		instance of the counter_device
  * @fck_prescaler:	array of filter clock prescaler configurations
  * @preset:		array of preset values
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
