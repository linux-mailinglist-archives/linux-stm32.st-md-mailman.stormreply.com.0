Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2F938B680
	for <lists+linux-stm32@lfdr.de>; Thu, 20 May 2021 21:01:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 003DAC57B60;
	Thu, 20 May 2021 19:01:27 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7947C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 19:01:25 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so5854316wmg.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 12:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fjcCUXPequaERL0iWKMvvnJNHWoIV+jPVNxaSD9GFTU=;
 b=j+O1Mtk9M4NGgVt+3NsfiQd7A1ZWIT1Kke3k9FKKFxQ+RvhWemwcuBOP5fYr9xUV6d
 zVKuYUb6BJI/c93srLW6aahf54kj1sLFTE9oG7KgsxWQnQ+rolnTuGUQ6eMwmdLYrfX1
 2HPgW3G3oRZUBe6AaKUsDwWch8gN3LBplctpv2Y9sGorHbhT3xxAXngG8jjkGwyt+6oz
 NTic7vEgZmDoMCC8dk0xJL17T/AcTA5vcHBBV/RZ8Jg191WCm5XGS/Zftm3ZiA8UOJIs
 iMHynJolI0QrcQGJBnNx4wEXycSwRzPvMC8+fMUG03wUoQaz8CsiguONaYCUZfmDUdos
 qBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fjcCUXPequaERL0iWKMvvnJNHWoIV+jPVNxaSD9GFTU=;
 b=cu6cHAtNuRgx4llPk0E4uiyVdcKoTvZY2ChXI6ENH1PEiyciBh4CUa+CYWnnuo4sMo
 veeFVbEnkgmpTYetNvwsNERQOr9Z/2yyk366hx+0qauvYuArgGAndwNHlWpJjMWWRpcd
 8MS/r8dV+xamSQFiCJe2+iLVda7TOk0wlmOCfDUo8ANeL07q7xfqax8zob//vd9NHsqq
 8pQm4vhjcVbRHMOplYPKKgfM9y/XytDU+rmNJkPbkjgrFWWTbc+ew/LZNz0k4xQupO9R
 x18oTABgJ0/a7U3IwHpxLe2B6OVPyoOnGf8DtIg1tA1HAImAP1428kYlAyMvSuobjVEK
 UxRA==
X-Gm-Message-State: AOAM531Ar4+Z7eT1WFD3p+yqUFQM9ihQEQvGREIzy+OAcgrghQSp+FYd
 doMO/j9ZZ4AbPQ+3sp1YUoLHVw==
X-Google-Smtp-Source: ABdhPJw3QdxXdYb3YGeZ5nDe9KaL5FXMJWT8YGtBx3+uAxOifUAnuBCO5ExKWVHYpmm8HLWWMKfmvA==
X-Received: by 2002:a1c:4482:: with SMTP id r124mr5513989wma.42.1621537285341; 
 Thu, 20 May 2021 12:01:25 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 12:01:24 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu, 20 May 2021 20:01:03 +0100
Message-Id: <20210520190105.3772683-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-i2c@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cedric Madianga <cedric.madianga@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 14/16] i2c: busses: i2c-stm32f4: Remove
	incorrectly placed ' ' from function name
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

Fixes the following W=1 kernel build warning(s):

 drivers/i2c/busses/i2c-stm32f4.c:321: warning: expecting prototype for stm32f4_i2c_write_ byte()(). Prototype was for stm32f4_i2c_write_byte() instead

Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cedric Madianga <cedric.madianga@gmail.com>
Cc: linux-i2c@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-stm32f4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 4933fc8ce3fd1..eebce7ecef25b 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -313,7 +313,7 @@ static int stm32f4_i2c_wait_free_bus(struct stm32f4_i2c_dev *i2c_dev)
 }
 
 /**
- * stm32f4_i2c_write_ byte() - Write a byte in the data register
+ * stm32f4_i2c_write_byte() - Write a byte in the data register
  * @i2c_dev: Controller's private data
  * @byte: Data to write in the register
  */
-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
