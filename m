Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 771683385C1
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 07:24:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42A94C5718D;
	Fri, 12 Mar 2021 06:24:59 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D1CDC5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 06:24:58 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so10572227pjg.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 22:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ow35VJCAyiM2ahQVLOKFiDoREaatNuXBdABSN/7hXxo=;
 b=rhxWSX6CcvyXICsK6BDSSieYqe40PCrdnRzZHtABqXSM3s+hSwYher+cyqfllv+WhC
 KY7aooUSbryYtIvO+giYXt3iDRDqChBPQPaa8LD8OgxZt/Is346J97150MecIFbIgv3E
 mv5g97HOYkLYE1b4HjikfsUqm+PPArtW02pL7UKQ6ifZzCJO3p6BX0cui5sp/qGXyZPR
 G5vOMq9OixiXCpnvDdEEjBWO0DJ8NwssZ4Q7ZhD3uJ28iW52qQqpTqxM+qNKtrhsOL+k
 UkdJ2s3xSCQ4boqbNfk4scrjUYvNmwPPsveRzfQ/soG9M32gWVXQNIdEls2suz+3vMBa
 4Llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ow35VJCAyiM2ahQVLOKFiDoREaatNuXBdABSN/7hXxo=;
 b=XSScmq0M/WCmUPbk/aNONq3kE79zqg8etRc6CKp9ipABVtkrtAhaTFYyfutSeg9Wds
 LuvEV1Jausa4kEiaxd6g1KQ2368olui0Krp+ojUywQ6/1KbazecYoGt1jvmEnbLBce1m
 bcNsyQ8ngcJ4gUdIUZpnefQcwwD+w41YR1FNluDvkoy/XUj/E0KwrbTfO9xvck2DgBTk
 enLFqDirju7Dk9NCdn25IXj8c3/aTYWbyfw28G3eeHp/EREd7yAf/4H0ff5NOQllGzst
 0vMG7WXbmtrrR1TS52b/gRrZlSovsv4CQXcLoVZohJGyTbnA9kw6ZzBZSI74WJJQBqH0
 s/rg==
X-Gm-Message-State: AOAM532ER9/Htpd+hzN3GJ/BzCOmgU7k+ERPD3WWEb1y+WflnCV8DKQD
 ohU1+NV/cBP62Rvp00ssp78=
X-Google-Smtp-Source: ABdhPJyUMtijuEbCFPABICgGSbC+EGr890FDHd/+HYvvwtIkSNpgu32499FoNY51uB5a0HbKTNSzQg==
X-Received: by 2002:a17:903:22c1:b029:e5:f70f:b7a9 with SMTP id
 y1-20020a17090322c1b02900e5f70fb7a9mr11968152plg.15.1615530296820; 
 Thu, 11 Mar 2021 22:24:56 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm4048406pfb.157.2021.03.11.22.24.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 22:24:56 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Fri, 12 Mar 2021 14:24:31 +0800
Message-Id: <1615530274-31422-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
References: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v2 5/8] ARM: dts: stm32: add
	stm32h750-pinctrl.dtsi
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

This patch add stm32h750-pinctrl.dtsi which just
reference stm32h7-pinctrl.dtsi

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v2: no changes

 arch/arm/boot/dts/stm32h750-pinctrl.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32h750-pinctrl.dtsi

diff --git a/arch/arm/boot/dts/stm32h750-pinctrl.dtsi b/arch/arm/boot/dts/stm32h750-pinctrl.dtsi
new file mode 100644
index 000000000000..24e99970167c
--- /dev/null
+++ b/arch/arm/boot/dts/stm32h750-pinctrl.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
+ * Author: Dillon Min  <dillon.minfei@gmail.com> for STMicroelectronics.
+ */
+
+#include "stm32h7-pinctrl.dtsi"
+
+&pinctrl{
+	compatible = "st,stm32h750-pinctrl";
+};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
