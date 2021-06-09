Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A8A3A0915
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:32:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3A1AC58D5C;
	Wed,  9 Jun 2021 01:32:21 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C1D5C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:32:21 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id h1so4035551plt.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rzSSFM9eA7D/nASKgieKIKXoM9U+od0SIxRVo0RKwbs=;
 b=T37gis28MP075rqTyRhAlrTWtsa3kDZQh1r47qcKH0NNEVSompkKpN5d7z8GDHGHqz
 VlzszmEKm7FtBv5XEJH6XDp+8+BIkZl9JCTA/fGHu1WoypHkO74bmkZTclWCEZBtW9yZ
 RTN3tIBQXoILSRugZw5mxdymx8R0xy0U4naAciR4tfkPoTv3MC07yhkHoM9ISpDKs1Zj
 b79JYllFGL0YAt8EiQHH8IrZSiVflGpAvEUehWNlEgSu8pP0tkSDXz5LGr5kHL9L3cqf
 j9195/L44+nURGJQoYjms3Rp9Uiqd1IVCETmsf/WEUSFnzOYR5HQOXmnHvoexyiSpXPF
 QHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rzSSFM9eA7D/nASKgieKIKXoM9U+od0SIxRVo0RKwbs=;
 b=gboQHOqHt4agqatEfZfocxPJqY5biY2fDxxzLzFAqHm//vM+RyMA3h9cY20DikufQa
 BMJK+7Z+9y/oxjAkrC2R+p/eiaUzZBQ7HxpGfmoqyNg1m1FMeG6pOGhKzw/wGEp0Qac0
 JeQBjf4RJzJgoW4w2kLvzDDyUJQEm8aS0s4ChqnQLushkr4o2s/s+79TA6qtqDoP20Mn
 bPHGZB5MQ5Sj1ySu0uPzBi9eQ4gqpPPQ9QbJqC8UnGGFKgeNFSHBhGFvtckClZwJMHdS
 nwnhZnIrKitVncVkVEfoKL00p+c62Ipzb7Kunj9Lf9h+6SaASAl23cSucdXfFhSOZx8d
 UyQw==
X-Gm-Message-State: AOAM533UpdLwLhsUGzHVuX2RAHWTgIpoevgGAKYldYB6faVaGRzLkjqU
 NvxWKCzy+sBnmJRMGpQadfQ=
X-Google-Smtp-Source: ABdhPJzHx8m37RAm6th5rtYK4N+44f3lBAKH9sGXux1cR9nBP9hDBHSt90KBliON8+mHPJtsukB/tw==
X-Received: by 2002:a17:90a:e541:: with SMTP id
 ei1mr28850129pjb.189.1623202339993; 
 Tue, 08 Jun 2021 18:32:19 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:32:19 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:09 +0900
Message-Id: <050f1b518eeae8e3683f7d6d11f3219a137adf48.1623201081.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v11 06/33] counter: 104-quad-8: Add const
	qualifiers for quad8_preset_register_set
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

Add some safety by qualifying the quad8_preset_register_set() function
parameters as const.

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 0fd61cc82d30..51fba8cf9c2a 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -632,8 +632,8 @@ static ssize_t quad8_count_preset_read(struct counter_device *counter,
 	return sprintf(buf, "%u\n", priv->preset[count->id]);
 }
 
-static void quad8_preset_register_set(struct quad8 *priv, int id,
-				      unsigned int preset)
+static void quad8_preset_register_set(struct quad8 *const priv, const int id,
+				      const unsigned int preset)
 {
 	const unsigned int base_offset = priv->base + 2 * id;
 	int i;
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
