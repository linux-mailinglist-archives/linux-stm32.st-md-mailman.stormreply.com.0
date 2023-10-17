Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8797CCE1E
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Oct 2023 22:34:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 514EAC6C838;
	Tue, 17 Oct 2023 20:34:07 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A774CC6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Oct 2023 20:34:05 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-6c7bbfb7a73so4174739a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Oct 2023 13:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697574844; x=1698179644;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KRrz5g1aSnyLW5lEPOvcNKexij9vwV1ZcmYt4LIdaa0=;
 b=HfS/1STc+nJIP/Q+AJa+IroAM0cBtH/DILrHb8OU5O5TfnPwXkEbS/M4kwTngJEBSg
 /ac60QhuYpuBuWcP3OtPVwZhn0JvAC4RQSqrJZwKixo4kmOZwtNThYeIjRjJvredqUF3
 YUeYT/WUaBIRsET+mLV8Opw78cnG7BYqSfvcfwaP3Cp+++G+yPq+AI6XpCs8sB24eDyc
 q/fmVEy5aaHTfMOG/a+chA/HfvHE5idLtFiXith9n2nYrilrC+njntmrjPzTNlCb9s+R
 +OSmNUDtcWIg3u1uwrQ7TMyQwfPgEV8oaAYjKiQtmCmigYEmFZTDqiX5pw0s54mdCOsa
 40cw==
X-Gm-Message-State: AOJu0Yzx35smT7+oAFJhS1xON81yR+KlBccrfTpu8UoWxB+j6kmAOzdB
 GMZmZIguwuQsM8fvCH2rdA==
X-Google-Smtp-Source: AGHT+IFQaKQoaiOWi29VFPHOmrVG3na2dpNZRIZ/gBXhMeGnZwm9Ellq+8oszZwYDp/iCkEXOL2NCA==
X-Received: by 2002:a05:6830:71a6:b0:6c0:ef3c:5ab4 with SMTP id
 el38-20020a05683071a600b006c0ef3c5ab4mr4003506otb.0.1697574844449; 
 Tue, 17 Oct 2023 13:34:04 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g20-20020a9d6b14000000b006b99f66444bsm380588otp.71.2023.10.17.13.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 13:34:03 -0700 (PDT)
Received: (nullmailer pid 2698572 invoked by uid 1000);
 Tue, 17 Oct 2023 20:34:03 -0000
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 17 Oct 2023 15:33:51 -0500
Message-ID: <20231017203352.2698326-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [Linux-stm32] [RESEND PATCH] spi: stm32: Explicitly include correct
	DT includes
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it was merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Acked-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/spi/spi-stm32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index ef665f470c5b..e6e3e4ea29f9 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -13,7 +13,8 @@
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
