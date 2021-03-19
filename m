Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9702D341A90
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:01:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60DD1C58D5C;
	Fri, 19 Mar 2021 11:01:16 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BEF0C58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:01:15 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so6543087pjh.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zNHAzRgGiY7J7G+f8mmaWum3SKthte+B3myyLZXUAyY=;
 b=s02yFLPcTuICIO7+C+BcSoFLEftjPfweIg/sH113MKfHNgrEzsrKNyvl57Zx991Zns
 JffwM12TkhbgTzson9zRHyQKSGthzQpmLJz0PhC4zULJ97p280R246dAdVyjXaP1GQpH
 myWBIk8K5T5IokWp6IkefEMjawq3mX0O4OLv9V+JMno5CAcq4OMqyN2yUv4vlfl+nM+8
 gIhsxUtpY+0keiQMZfN9UbuZ3M4rxMxHRO7GAgdR0YmL9HY8gE9fXpS0pS8MvKmeq8D7
 rEAZT8Sw2YGQpUOcD63K+9pmeblQ7IIlwDkPM1URLEws02FJ+IW4lg73xbj9MWPrZ+Ag
 vnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zNHAzRgGiY7J7G+f8mmaWum3SKthte+B3myyLZXUAyY=;
 b=TjUP3LWN3BYf6cWE3R61TaPsENWTXcP0d4TrrddsPTAN02sKUFAllT2phWTXdDImYE
 FOENJY65oNpLseVsdXPOFvt6Q2ZkcMBFArcP1imxuWjPJITWCdHHyvGaMCEWST5KDlN3
 rTYXxNQ7lFyUYOExzqtT+W9NvYgeB06J7p0zZmcVJaiiDB1WYmAmIZZn1KhaA1I6fuub
 Bdhw1O16SSz595Hnvi8cyhu5S7xqQdibwlUbiPcvmE7ogMh+Wb0UyZE77hHoAY5KZHa1
 FnLkayg0ZHBExU6Ct3pVz8GqpFH/fwPzjhvlwXKr5TbBhvAYLVXLXcWWMCDocp6Gy5H+
 EjrA==
X-Gm-Message-State: AOAM533YCvPXwW6vS5p96xBqXYIsnBHGV/ZXzI42ISgolWRyJxm4hQHT
 /y0Icz5WvgJ+lsXtKDsvTz8=
X-Google-Smtp-Source: ABdhPJwcq2BYLCh/FKajfLUwOFiyLFNcNr3jYX5SAAIA1CUfh2Eckv5FIvqSO9atPlmB9lma39Ql3Q==
X-Received: by 2002:a17:902:b78a:b029:e4:8ce6:fb64 with SMTP id
 e10-20020a170902b78ab02900e48ce6fb64mr14236203pls.77.1616151674053; 
 Fri, 19 Mar 2021 04:01:14 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:01:13 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:21 +0900
Message-Id: <a39062103d8e4ca5eb65c3c02b58571e62019de3.1616150619.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v10 02/33] docs: counter: Fix spelling
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
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
