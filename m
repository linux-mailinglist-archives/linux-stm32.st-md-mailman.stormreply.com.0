Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8524E332678
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:20:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50E9FC57B78;
	Tue,  9 Mar 2021 13:20:40 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B067C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:20:38 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id p21so8751091pgl.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fGsMq/or5LrbS6jzzwVkZSD8zHMbssCRETsq5AlmHhk=;
 b=BF2JeSQcBj5jKUajNNhfuC3RoAx40evJrNJ4jcEXKRuM8WUBWCil6hP9b89RjeqSjF
 iZ3CxQf0Cb6OS5BbtCIonpLqvfb4F4SNvpGxRZV6tUojZBRM9sVIuLyq0Lj9P/ktOram
 /8kPcJ3OWmvbqzak0914vmxbQn4e+V0D4Wbe9zJcrlQgXsd8wjBx9qPUjRBgGPJnnig6
 o6qyI2qyS77Oj9JBLyYKJJMiS8QZt2WaAMYoPuL6xFot8HvZGMGi5OI4lYh7AalKKfba
 ehY87TN+zKbUk6LJ4nErVtbaQONWCO/flWpdZ5CFWStInUtpqX+UrKEgDecCz27TXZes
 azuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fGsMq/or5LrbS6jzzwVkZSD8zHMbssCRETsq5AlmHhk=;
 b=KEaNI6yWMNvsDky1Ge/AREbCPMBD8mM6hysbD46J8LhOuWWofZdPedVW0fi3X0QS78
 kGBrbFdWWVtFMvT6SWrVVe0UjHAk7hOIvyhvrieTIxPh9fD9EtDIAhQE1pgiOW9bTzj4
 ZS6EIxLRkgXINRANV+6pgGDLSbIeWuQDzd8JAdnPdOPIf1J8ipdpiSbB8oXy8kR1aULT
 xZL7dsUjlriVz+F5WnGAtIIL/Gw+OJkN/HQb9A0/nwpMFudY1EaEt26ksw3wQhKSz5HB
 /kzYjPumlEgXFMIs7g36pHlJtSnMzHTccpctA2AtW4P3oqhCBEwUlz7WQ7goBJMAeatH
 JT1Q==
X-Gm-Message-State: AOAM533iT3G3k4U1ZIydd6UheFoKFKsjOwQlrNN+Q4DYPcFLPt4SAJE9
 UYCISiXpdIVM6NVvaSn9zJ8=
X-Google-Smtp-Source: ABdhPJxYMcx8TAwzEMsyNljEGsxrjAzaeLrqUb84oaUmvtU0ci1sM9AnHXfbQ8l6WsU4z40xxM0RXA==
X-Received: by 2002:aa7:8d05:0:b029:1ec:b460:f21d with SMTP id
 j5-20020aa78d050000b02901ecb460f21dmr26014314pfe.29.1615296037168; 
 Tue, 09 Mar 2021 05:20:37 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:20:36 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:18 +0900
Message-Id: <97bee75c6b792f49e0b6331c922bd944591206ec.1615293276.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 05/33] counter: 104-quad-8: Annotate
	hardware config module parameter
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

When the kernel is running in secure boot mode, we lock down the kernel to
prevent userspace from modifying the running kernel image.  Whilst this
includes prohibiting access to things like /dev/mem, it must also prevent
access by means of configuring driver modules in such a way as to cause a
device to access or modify the kernel image.

To this end, annotate module_param* statements that refer to hardware
configuration and indicate for future reference what type of parameter they
specify.  The parameter parser in the core sees this information and can
skip such parameters with an error message if the kernel is locked down.
The module initialisation then runs as normal, but just sees whatever the
default values for those parameters is.

Note that we do still need to do the module initialisation because some
drivers have viable defaults set in case parameters aren't specified and
some drivers support automatic configuration (e.g. PNP or PCI) in addition
to manually coded parameters.

This patch annotates the 104-QUAD-8 driver.

Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 233a3acc1377..0fd61cc82d30 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -21,7 +21,7 @@
 
 static unsigned int base[max_num_isa_dev(QUAD8_EXTENT)];
 static unsigned int num_quad8;
-module_param_array(base, uint, &num_quad8, 0);
+module_param_hw_array(base, uint, ioport, &num_quad8, 0);
 MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
 
 #define QUAD8_NUM_COUNTERS 8
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
