Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DFC319DFC
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 13:14:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AA6BC57B5B;
	Fri, 12 Feb 2021 12:14:13 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32315C57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 12:14:12 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id x3so6488873qti.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 04:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l9MVM1xcNi7V1HTtwx+BbT8RtO64EAjisI3WqrvzlhM=;
 b=QcUZkZomdc1mBWtdJCbI8UkHhb0aAtHBnqRDKPasQ4dnD76ls/uIzGfxJtzRk2UN5w
 inQFS+mJjFkLeHMuho3EMLTTixJp4Qh2qlLAvIQwgwaTDf/+cmjKWgYflveVEYH71q2j
 WAgblfQ8eqCROJSBU6h6V4bhq33sUCJjqZ8I+yr80am7twLzHNORpuWb1zQ6ezmZErtr
 cdnfMPP7rRLeCftiz67UsB/NzkJDY5faMfFiZ49YYlz/FLYxjSO5RQZ3UM83SHZeKeJP
 021WR/8enqbdXwBKGxkLgptdSlCHDUJwE/8of3dzc/iZxMZT/ZsNjfvD8pVV+7m0LqI9
 tUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l9MVM1xcNi7V1HTtwx+BbT8RtO64EAjisI3WqrvzlhM=;
 b=EyPV1VEih5bmZ+xidpTkXAVMt6O+KE9ueGYALxi08IfF9KdkLxyWoKlIYxPla8ifa2
 257YBGosWMLlZBykwY0KE2wTSZJBO2Z0VNoMY2fCSUZTNDSJH03jZE9pd3xXvJ0q8jgN
 uBpZjqsr66FtfWKaGvemkyiO85mFE0949Su08ysi6Wk4KzoWIIcZM7jHWlHcXDVoMsth
 TjQcxZYw8OWuns7ppWwdQGkhP+SAYvYA85cS9BdolVAvFSb3Dm1imLdObdI45Ropzsoj
 FdihG11CBx86/HMP2o+Sp3rXFm8UbNeX5oqIvJjNDhWiOzhgta8Ye1JFS+7kUp9myfAL
 w9lg==
X-Gm-Message-State: AOAM531vwSoCLZQmj+DrNIr9u97bD8w3zTbhQrrZXxvhobi+YR3rmTBI
 hNYkua3L6sA46496a8qxT9w=
X-Google-Smtp-Source: ABdhPJwihv1BKw1Q0mvejQLLioSu6ygUVQZgDYd/xvUVbf7c7bZduNPZmX5WR9aK4EZVYHRVtVRI8w==
X-Received: by 2002:ac8:149a:: with SMTP id l26mr2030634qtj.210.1613132051207; 
 Fri, 12 Feb 2021 04:14:11 -0800 (PST)
Received: from localhost.localdomain ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id y135sm6278534qkb.14.2021.02.12.04.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 04:14:10 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 12 Feb 2021 21:13:26 +0900
Message-Id: <0f90d3ae0305224abd6350059bcb00ac44bd858b.1613131238.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v8 02/22] docs: counter: Fix spelling
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
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
