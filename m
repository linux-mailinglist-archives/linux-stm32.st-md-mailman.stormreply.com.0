Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D753A0919
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:32:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CD98C58D5C;
	Wed,  9 Jun 2021 01:32:34 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 611F9C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:32:31 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id ei4so404788pjb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aCZji4goj7QXlZQ7G+Tg1qQ7IvLJWZRrdogqrbs3ALM=;
 b=ACkOCpxDCDfZiguYpTYkrtSKfIleiPywiOpWXj9r+yf0p+9zcSNzh0pRtjhROytMNw
 hLPENnYIIEYrmOAA0LOWgmi/93MX0Jz7pMSbP0qsCMpbEKvblWsiCyEEm7JRmKkGe0eU
 N4t8z78PaI96dNN32hwBANoqURCS+bM4B1rhIKZvZLuFH+HIQhppFV25f56+5cWwQMxY
 i9G68ZCiNlzG28JQVCMB597wvPDvlUczxoWo53+UopMmC1XK+bxIx8SN7bkAHKaC3KaR
 6DPpstl5RIkDuMJWjIdw17/NXhDzv0F4FQmWSLmN0X+p/WHNMywPFHV3Sr9wmoyFteQf
 rTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aCZji4goj7QXlZQ7G+Tg1qQ7IvLJWZRrdogqrbs3ALM=;
 b=G3qtqP/bIq/7s04CAjx5TnYLdWzv2ZtvBCs2FGnBVAms4ISDFor/KrhK4Se8I4x2lU
 gSXjM0CHEODerg+cVsdyShxGYqgQYjjC1MTETBoqO9VER+xy+nqcF+aJXPms0Wuzxfxm
 twP33p5JHIvLMeTCoaf1yKpxnI4ZlPqtg7vHCjFAx3zdJypoxSB6fv5rRWoJMFHxYsgp
 H/Y2PP3104lKFIGlomT/SB4WGljlqcmMtRAyqG7WO8c7VAXtfFy6Y9fPt60mOcqLR2ER
 AIgp8H1UxPjp2VvCPO+xHnXBwRhPHf7GIz9Z68ROS9co4S1gShXD7sD08o6MneaTjITA
 9WUQ==
X-Gm-Message-State: AOAM533HyPm6gZWi8Ox42IduuQB+6sYZrZoA+Qo4lXcaE928Y4Td84PT
 m9DT/sJNtKlFZTY+C1L+Gak=
X-Google-Smtp-Source: ABdhPJw8Wzw+mTITiTIF/fFew3Ep8DDA++vqep06vunlCkFhn0b+E4h8pgkUdr7Z167dUExBJtOWzQ==
X-Received: by 2002:a17:90a:a512:: with SMTP id
 a18mr7852442pjq.215.1623202349999; 
 Tue, 08 Jun 2021 18:32:29 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:32:29 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:11 +0900
Message-Id: <86f7fb77f703cf2508a6b4ee9cf80aa523392976.1623201081.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v11 08/33] counter: interrupt-cnt: Add const
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
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
