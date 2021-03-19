Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAAD341A93
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:01:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 114C8C58D5B;
	Fri, 19 Mar 2021 11:01:35 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3643FC58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:01:30 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id l3so5632848pfc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IHsMXHlvFNbqoAQhdtfNE0zKBykgUvZF86//Vvt93y4=;
 b=uRIytIxxH0fuSwhbhHS6b4YfjvyuWeiqfnWivka6MFy9ceMr5uyzm+sQ3oPn0ZAMox
 +fCxTTZuLgrukUbOZpVNuNzprxd3A8676IqPEloktxufGhRUXDhFjlc9IgQ48zOWUny5
 kSUL9qKC3IGQhQON4sjpQd5ucTuEpLUDhp+LzAH0JHTQJS2JXK1IJvGF/laM7UuxVGD4
 Mqk3d/EIrtX1uRUPQqhJMLxnN0zNLYN2cC5rRh9zS+AjkqKn3T2DDN7tGNJcachGYUVF
 44J6hAorf3/jy4z1Q2/WOetkupBcJktiZhzlrltpm3j5LMY3P0RsPxFdMSHJ9tqPenuV
 GnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IHsMXHlvFNbqoAQhdtfNE0zKBykgUvZF86//Vvt93y4=;
 b=JI5uFRJOWDCEog8iAm90qyKd8GcEWf63TqPnWd7uHCUFwEkq814nVHXSSMlZ+q8abR
 8KOvyOVfbd9lpemBme7B47wGJHd+frJsKVf+KByah2BFgnxBjGpNStLaWsa9Tbx6THbE
 3arFZKyQuNjXMk4AwticcFnazjpfYY8h6rlTa0wtB/WiHN65umGdj6FQh5xOxVb3wFJC
 F61lpR4b4OwwhBJzcWHDAJbn7KZTNBx0t2/W3cDu7z1SRAsRiIJDdOwUf8SvPNfMGgns
 gE2UeMIIaJia3QxzcKLeRIW5adxg9UCMpnzyUPwOb1PoryoxsnW4gJiegYoWyhFE3swg
 SG8A==
X-Gm-Message-State: AOAM531bhbhNcwzgSEGVefbhLBXsnTAuLoGOx99BjpkokhlfShMJTwlM
 C82+pT+d4zRMle1NK82UOUs=
X-Google-Smtp-Source: ABdhPJxSWirRoocy1cgAXwgyeqnrSHox94o4V8L5k6ly6ZQmLV2G7nSUjtsEllB2Jw0UZ7t0/O3OyA==
X-Received: by 2002:a65:4942:: with SMTP id q2mr10660452pgs.34.1616151688818; 
 Fri, 19 Mar 2021 04:01:28 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:01:28 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:24 +0900
Message-Id: <203f1b6084ed86a6696eb422bcadc0955c6427bb.1616150619.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v10 05/33] counter: 104-quad-8: Annotate
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
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
