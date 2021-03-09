Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C9332684
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:21:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9CFEC57B78;
	Tue,  9 Mar 2021 13:21:16 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43D08C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:21:15 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id g4so8757272pgj.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZWre/5BlgKXL1iyhEnRSRabCNrSj07MKqwX9rpON0N0=;
 b=EPzgiswKRcoUeRnTBjq6Tx6uWKKDlWfj9SXcpEIGX2skUnRDOEjyOUn+jjyGxouEEv
 YMCtoqmhuTgfDRjRy1NYIHZVORxf4YhW8Kz4z8O5QQ8NEDV5RfsFvfs5pzaVEOoTjMDJ
 8s2C1k8e7ZHi/cDyYDaAuNjVNgUzNKTI5Z/RUdmDiRyMkvBsJSI7l9tcffOce9RNxK/h
 gMy9LgWYczmXXhK+QOos5Wb/c35vxbnrxV1oHjrVYv6NK//hd1qMDrXIWg3i/rN5ljJw
 sjdOGduippNTDY+jLvalvicHZymCaCWQnU0RBGfdcjx+nYIjZzu/qE/SKH5exRTqg0i7
 iAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZWre/5BlgKXL1iyhEnRSRabCNrSj07MKqwX9rpON0N0=;
 b=oTg942siES98IR9ikL/5a0uXYY+eA8JnxPpGUNx3fwTUueZN1RA536wLBH8v8eJKxu
 O3WPWZytTpZ3I5WjWflKfez8xE4+vvK0QabTo0BCyE73GT584nlGi3zuMdvgsqflwOU7
 ssvl1GgxJDfYvqvnlhKuGnZDtySZNUbscNyFjl2KLreOJV3Vt+R0jiKOFVXd6hkrJy3U
 ybRnhwfkZjyGVhSP0BAHssOTW/fAsWGnkdpwJHoUBWvml/n1moK8aAD7NP3VsVO8PDuq
 iiKb4SxMW430lfNUZc3nOvexbTgD/CpTmPTmCmLMO7wlIzQxM0xefhUk5TLj3jWVkV/Y
 WUFA==
X-Gm-Message-State: AOAM5337z4tr5zq2G+h1eNjN5FsSTjGahSHssX5EdaWZ94KwqqYindsh
 Q+dqTbz8ZBuhz3QYGVRGrmo=
X-Google-Smtp-Source: ABdhPJx+4sNzc6b+jcn9nwYXMErpaUoVChItdCn/vQu7L4lcitioJp3OEfACaGLCYqRp1bdW5bK69A==
X-Received: by 2002:a63:5014:: with SMTP id e20mr24895866pgb.152.1615296073915; 
 Tue, 09 Mar 2021 05:21:13 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:21:13 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:25 +0900
Message-Id: <fcfbb9a605bf094e11a3ae436257e11c5186ef44.1615293276.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1615293276.git.vilhelm.gray@gmail.com>
References: <cover.1615293276.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v9 12/33] counter: 104-quad-8: Add const
	qualifier for actions_list array
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
quad8_index_actions_list and quad8_synapse_actions_list to match
actions_list.

Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index ae89ad7a91c6..09d779544969 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -305,12 +305,12 @@ enum quad8_synapse_action {
 	QUAD8_SYNAPSE_ACTION_BOTH_EDGES
 };
 
-static enum counter_synapse_action quad8_index_actions_list[] = {
+static const enum counter_synapse_action quad8_index_actions_list[] = {
 	[QUAD8_SYNAPSE_ACTION_NONE] = COUNTER_SYNAPSE_ACTION_NONE,
 	[QUAD8_SYNAPSE_ACTION_RISING_EDGE] = COUNTER_SYNAPSE_ACTION_RISING_EDGE
 };
 
-static enum counter_synapse_action quad8_synapse_actions_list[] = {
+static const enum counter_synapse_action quad8_synapse_actions_list[] = {
 	[QUAD8_SYNAPSE_ACTION_NONE] = COUNTER_SYNAPSE_ACTION_NONE,
 	[QUAD8_SYNAPSE_ACTION_RISING_EDGE] = COUNTER_SYNAPSE_ACTION_RISING_EDGE,
 	[QUAD8_SYNAPSE_ACTION_FALLING_EDGE] = COUNTER_SYNAPSE_ACTION_FALLING_EDGE,
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
