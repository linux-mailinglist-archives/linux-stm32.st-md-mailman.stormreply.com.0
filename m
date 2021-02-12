Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB834319E00
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 13:14:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6959C57B5B;
	Fri, 12 Feb 2021 12:14:36 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 504CFC57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 12:14:35 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id p6so4032818qvm.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 04:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZF5NYOTPzb69Gy7SXzsmlFc2ufq8pLJB8ZkxKUF4FAI=;
 b=Ga3mew42ijkMgzZTymuZhgziBa7GfGyxP/sUENT/oaQm4Ks/rw54Vb/MEAgxCVIAuP
 xpd06dY2jnPYYUE9RETNoYnHuHFp3e+0+/POzIweMNWkSW0MjoHwIWUnMVLLGZaxxTh8
 cEk0G1RBGM5U/z6HNt1wy94+gmYRo7tvaMzAy2rv6WMUa1hFaiFidBMa1zxWfi9U0Ewp
 QQ6KaHAWRisgavcUS02nf8wCLHBQsVlJaAmM5soKtI3Bu4VERuX9slcHYfAgeH0MwiZV
 odm6K0SR1fDGBQEXYQrdgpuGgvUccmvBmZsvK/S+NKjyrJd60a+sj4f5rYcWmSWYQFCN
 tnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZF5NYOTPzb69Gy7SXzsmlFc2ufq8pLJB8ZkxKUF4FAI=;
 b=DWnNQYasC+/QaDDoJ9/QylEO3fW4wwc3WoVyenO6xJQaAM1dMK5yxnuLi7HcBbEMZ/
 nhHFQ+oKWcOdiNeqFfO8Je/RqCenzfTV8vtnXx2w93c8wefm/4qDxQbZ+mysZRW+8HPf
 YcluWHttPwkNLg3mh5zEGtgjAeat4ZtzaVVqY35Jl95THWcg2QT4W+INTAY5GwIumz2i
 3X4ETeXu4JWVU8NCfzEfgXccGXjXx0jtEoMIDBvlUedw/6WC4DzpTrrzEdiV0N90WcCz
 q7CtruJI/9ZBOy0h1UTtxB19JjGY+v+7UrfKforEiHeSnIWJdVv94Xqye0crLjv0Uz8c
 BPlg==
X-Gm-Message-State: AOAM531azQ/DgmX+11G+msUD5+ZCqphNdS/TS94YzhpscYYqv6KTSczt
 2/jFx5+C4YkHJV4ZU2F7eek=
X-Google-Smtp-Source: ABdhPJxXtUVkYuMwGjYX4LL7Bmxk+a7OIIF7oZBwaewzQOS89EHeFy3G5Es/jtwqWQBlAOihBPa9aQ==
X-Received: by 2002:a0c:fcc4:: with SMTP id i4mr2247752qvq.57.1613132074308;
 Fri, 12 Feb 2021 04:14:34 -0800 (PST)
Received: from localhost.localdomain ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id y135sm6278534qkb.14.2021.02.12.04.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 04:14:33 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 12 Feb 2021 21:13:30 +0900
Message-Id: <74ca1dd85fde4356fe403a524b502282abf4467b.1613131238.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1613131238.git.vilhelm.gray@gmail.com>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v8 06/22] counter: 104-quad-8: Add const
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
quad8_functions_list to match functions_list.

Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 70383b792ec6..af4e0503b074 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -193,7 +193,7 @@ enum quad8_count_function {
 	QUAD8_COUNT_FUNCTION_QUADRATURE_X4
 };
 
-static enum counter_count_function quad8_count_functions_list[] = {
+static const enum counter_count_function quad8_functions_list[] = {
 	[QUAD8_COUNT_FUNCTION_PULSE_DIRECTION] = COUNTER_COUNT_FUNCTION_PULSE_DIRECTION,
 	[QUAD8_COUNT_FUNCTION_QUADRATURE_X1] = COUNTER_COUNT_FUNCTION_QUADRATURE_X1_A,
 	[QUAD8_COUNT_FUNCTION_QUADRATURE_X2] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_A,
-- 
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
