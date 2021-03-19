Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD66341A99
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:01:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 474B8C58D5B;
	Fri, 19 Mar 2021 11:01:47 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10173C58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:01:45 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 11so5627288pfn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mCIsrz/xNvA8l6ynJhWaN/C4nkgE8ErMLRxbZcB8jd0=;
 b=am/M0nVLA6ftbdIkBJC85jGx6ceAzyM00ClgAXBg541rE5bK6A+wFcQfakS/ZWqkg1
 gamQ9xCPIsmi4YpN0aQqREqPnl4PS6Q35iX09W+AJD+ypBMZ+Z0mpi6waAoh+8/MARTT
 cc33HDM0mNeAMW4lN2dVsCVp1ZqWvKxU32LqbchgFLVV10rVNmfquOneDsNtgilXi813
 d8r4ROtk5bKf/LpcDkE8NOpzLDgvcDuGEsGRH4os16N2y7bPQN0ZmETIYRF5xB4LO2f4
 JsixGDErfCTV+au9XB15Uusyu3pFn9SjhTT7a40KRd1ZsxoyiNIANFKs/3Ecrsy9ejwH
 9trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mCIsrz/xNvA8l6ynJhWaN/C4nkgE8ErMLRxbZcB8jd0=;
 b=nzoQhjqlu8z8AwSlz33jIQnYWt+pE7b2RRCwDYKKr+4fcLh9M/j/WofALyStTUmNpO
 8Iv+xaCO/AZ7T8xu+eGe7quJdGO522YkJJN6S7iHdUvaHq3D3P52CEUuKgIn7AjecXxn
 x80/u1DxF2hVpd/3RNIf88WO3x8uZXXeAB6wqyWPy6OSC3Hxi2Hpuw9ncsdn6LwpQzQa
 TsLYDzILpmvAp+Ek9nsC+1MHiMEjGYJGw3eGAwv336+9RDYYRAiNuaMNnt7+x5aq2qPe
 H+zyO76CVO3rdKl/Q7gHfNRiYNttJvXV0dRZa6L61GEEPPZywy1qzFoKMiYo7nrV0ROV
 jjqA==
X-Gm-Message-State: AOAM531R2o0SYJkSPC+DIb6YyBXRhJhaqkuTQ27P0tGf545RNbYmyKTs
 KPqPBLJZ8pC83BLMzoccWr4=
X-Google-Smtp-Source: ABdhPJyKv5HtcVkjQgECZi+ZwlOiOa96Ec+AS01yofO/WrXx2aXH4fKPJt8mdlUA9B36kq6B2dkFgg==
X-Received: by 2002:aa7:95b5:0:b029:1ef:272f:920c with SMTP id
 a21-20020aa795b50000b02901ef272f920cmr8767965pfk.21.1616151703668; 
 Fri, 19 Mar 2021 04:01:43 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:01:43 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:27 +0900
Message-Id: <ae7132b943c51fb5b7a9c9bb247c26bc74c9a8b6.1616150619.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v10 08/33] counter: interrupt-cnt: Add const
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
interrupt__cnt_functions to match functions_list.

Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/interrupt-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/interrupt-cnt.c b/drivers/counter/interrupt-cnt.c
index a99ee7996977..827d785e19b4 100644
--- a/drivers/counter/interrupt-cnt.c
+++ b/drivers/counter/interrupt-cnt.c
@@ -112,7 +112,7 @@ static int interrupt_cnt_write(struct counter_device *counter,
 	return 0;
 }
 
-static enum counter_count_function interrupt_cnt_functions[] = {
+static const enum counter_count_function interrupt_cnt_functions[] = {
 	COUNTER_COUNT_FUNCTION_INCREASE,
 };
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
