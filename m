Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850632B5DC
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 09:05:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2769C57B72;
	Wed,  3 Mar 2021 08:05:48 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58738C57B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 08:05:48 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id jx13so3668494pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 00:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sDbztN44X/B/8dJkz0MmLiQc+JMIMWoneNFLgfTEAQg=;
 b=V18aHYAjb+sB7qRw721z+elzxN9FQUiIKjmzgUevEjnfPIOycyzsaOTwMoWZvI2f8O
 /87tyRjLuwT+MVqNxtVPjMzgE4TDQEwWwK/3rsAWY5t/b2oO0WlFW65jUAG/CuJvPDt4
 oaDcWbNI0Cee29rSQx3roq11xg4U8LBZK27I7ysA3vLChWzT5aMd/CrNy9+Spg8rRkqV
 HXE9GP21dXlMGeO0CHvyn2EpkINRIloS5fZV1YyXnu1D9/MVkW91YrdnXdR/6swF5fBT
 SUvGtVO46Uz16aGaxKXF1mKwBZ/H/e/gTxwS+cnSTIwM9+ofA0c44oMLgerZ8L9Wa/2y
 1eJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sDbztN44X/B/8dJkz0MmLiQc+JMIMWoneNFLgfTEAQg=;
 b=RwfshKh6pw/fYJ4rs5tDg+b91PaP04o0xUFsyAY9Y6oOzCczBrSqFzcSZoiCfXM9Fd
 AanaR9iuUZn4gJ9bU7QflWPL587o/+0abf/h5DhBhJtzinyKiNzXAZGETFxKJe7+ZH7+
 UWYjCvBUUSS8dcYjaq6fsOwMjTMyzUy+l53pdAPcxEvvB6PuUybiHkx7A1Hxs9DnDhzA
 MKiLnH9xnguLvz82mZdvlW4wSbRL+XGeR9MHgOlTqU8bovbhK9mQLjdre1gruO6lNZeG
 B3bcU17UP5KRCm5kyId9iz8cFn2eHXTa9DIB2e1F5n5lzB9HcWGZYE9httxILZrqmxvY
 NdeQ==
X-Gm-Message-State: AOAM531ealpMGxu8Zk6z8FGzNU4cyg/J1MClostu8W9OrxSGyWDhZfr6
 30pNWki4DHaHj9LYYmlNtiePKOzfPtc=
X-Google-Smtp-Source: ABdhPJw35HqF3ZjssyHn/UOSrDZ5l/gwsM+pD3UYkZksJ9N/8eqHLXTzgTIoUI0o2SZXNpEJJUULnQ==
X-Received: by 2002:a17:90a:4f85:: with SMTP id
 q5mr8157503pjh.42.1614758747054; 
 Wed, 03 Mar 2021 00:05:47 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm22260887pfv.84.2021.03.03.00.05.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 00:05:46 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Wed,  3 Mar 2021 16:05:17 +0800
Message-Id: <1614758717-18223-9-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH 8/8] ARM: stm32: add initial support for
	stm32h750
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

From: dillon min <dillon.minfei@gmail.com>

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/mach-stm32/board-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
index 011d57b488c2..a766310d8dca 100644
--- a/arch/arm/mach-stm32/board-dt.c
+++ b/arch/arm/mach-stm32/board-dt.c
@@ -17,6 +17,7 @@ static const char *const stm32_compat[] __initconst = {
 	"st,stm32f746",
 	"st,stm32f769",
 	"st,stm32h743",
+	"st,stm32h750",
 	"st,stm32mp157",
 	NULL
 };
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
