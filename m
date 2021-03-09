Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D1F332675
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:20:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D83ABC57B78;
	Tue,  9 Mar 2021 13:20:24 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8053AC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:20:23 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id a24so6534795plm.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bg5qFyXKAm+O0oZX3oySwuvn9LP/nKtXNZnKHyMJuCw=;
 b=pe3koxT5n4t/VhCCDA7GwX6ehizUjwoZ4L28oLnp3eR51AGzcCWGKtKb9rqj6Q0EHA
 qBEvsEYAssU+tLeuUiK4ZcbSmgCk1mdIohDXLqIE6VFwYT/4BKP7kbaPOuTXRawDyL88
 GTT54CpQgWZB0mB19eZLkVb3d9TMgDJcWLdn465X+/yGqNyTTqKWf6zIzenvd1ZdL1VF
 Zv705GwIH1KWI+EcyxCQW/yd3OkmcjxIc1aZWlULvad1KMomwLYsU2MCR0PJtkkxzBtf
 hWgNAQPJyYRiPtsf/FLMXkn+AEKtzah8PSOohV4QdhPZZ49/DidPBXujvJtB1TiDVW7M
 gh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bg5qFyXKAm+O0oZX3oySwuvn9LP/nKtXNZnKHyMJuCw=;
 b=nTwu4KvPf7LO+utuFwth0Q9MVLIu+ilgQtDf3xeVcTmgGajrl53elPPDD7zhWJDgqP
 bly+El/MItjPZSkEF+xi8NInQlt26EUkQYOf0dTVAEg7bynGJqy6ulepmt3oYrsaEi+x
 1ez4ZGbleUPbN+83cd1Gim15/KTmN2nJkfxCjb2C++NiNKB/egfSpf63bnq373d9WXSL
 1dWfb+Kaucllla3qyv9M/d7u2PGKi2bdFXvzi0B0aDAboznTMhkwutGPjAhqn/mojdyR
 T/MamOFJ5Yxzb/Fx4PEWJPmy5AHW74IO7UxSs5plYykV+tz62my+W+S+nQjbTzIjGAEB
 N+7Q==
X-Gm-Message-State: AOAM531zHNtWGhfEJjEML/8afWTmlTIe0Z0VF5JQOKr0b+bQb+IfI1aL
 J9ALMTicbRMLbKodeeEae7o=
X-Google-Smtp-Source: ABdhPJwOqzhV8kA4WQiAnQbL8enOzmt6KpcxjVrGgHYUAz/sr3uZG4aolV2X49YSZs0b+UU4gthLvA==
X-Received: by 2002:a17:90b:100e:: with SMTP id
 gm14mr4669996pjb.217.1615296022135; 
 Tue, 09 Mar 2021 05:20:22 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:20:21 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:15 +0900
Message-Id: <a474ed8bdbb6acf4dad5d92ed3e36c7fa21e6540.1615293276.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 02/33] docs: counter: Fix spelling
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

"Miscellaneous" is the correct spelling.

Reviewed-by: David Lechner <david@lechnology.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 Documentation/driver-api/generic-counter.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
index b02c52cd69d6..64fe7db080e5 100644
--- a/Documentation/driver-api/generic-counter.rst
+++ b/Documentation/driver-api/generic-counter.rst
@@ -307,7 +307,7 @@ Determining the type of extension to create is a matter of scope.
 
 * Device extensions are attributes that expose information/control
   non-specific to a particular Count or Signal. This is where you would
-  put your global features or other miscellanous functionality.
+  put your global features or other miscellaneous functionality.
 
   For example, if your device has an overtemp sensor, you can report the
   chip overheated via a device extension called "error_overtemp":
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
