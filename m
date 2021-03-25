Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC473488E4
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 07:19:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D33EBC57B5F;
	Thu, 25 Mar 2021 06:19:44 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 886DFC57B60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 06:19:42 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so3681621pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 23:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hMTMgDP5KgynP82z79q6WdnAk8Vb5kqZCsaqfEY6s6w=;
 b=ZUzX3kSMQx0D3ecxwsVzDU7oykbu3A4V/Be9Rg3fxvHz4pXA16tVgS8F5LelhuaD+j
 DPeDeJF0q2Gk032lhqq0nvgfinR5X1NdwV8DYSwVLbcuP31ymHJHAY3RD57x+4RDoAxz
 gRpDt4+IQWCJCEBXWV82vZZSsUkfymnAt/NraHa9ScsG4tEhRFRbBki8p8CbUMfCKn7+
 YdInz2MlbAssdqmUf1gtJMAOMdXbD7WJPxe4QSQnuEjW0IuOPG+Z+X0jd0gyJ++Rc5je
 YJyTh/rK02guSJOACfX7KFEnlUmf/zOHDutiA5+ljmM1ABd/P4aHXayx/zz1dMhlTGOl
 ib2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hMTMgDP5KgynP82z79q6WdnAk8Vb5kqZCsaqfEY6s6w=;
 b=UKsuxCDPnOT19WZy40Q7cRT+aAjcd30LYwQIo7+0S0IJZ66Z3NlfMOCP0n2e5Ojhuu
 EPb3LfElZf4MO4etDZNshTX1r+8vpDFwLQCsttZVzJkNqFH2u0X6ileui0NsKcmKPnqG
 bQkZU/erqv1NFWYyd87GC5WRPvLiD9jvPbXkYwfqgQ3l4JvMecGHqaW8pQidUOrWb4RZ
 O3FraceGUlDoVmHWurY2vYkJm6LgUeLmqpbqwQP5Mp8iFSOZ0iRpra1xPqB2LIPdbh0m
 IDlky4W9EYLsxSKrs3+9pw11JQgV9NJS5MoKg5dKGDGxlG7Df8PGolANJHNmylLR6eq7
 LrgA==
X-Gm-Message-State: AOAM533AJPnf4GEX8wT9gImLsvXJm8mb0pkjuhn0tyL3bLw1To+Hdrub
 vTy4xCWQaY+ZTxnvOqFvrtM=
X-Google-Smtp-Source: ABdhPJxsn1s7ZxAnDAyfj8LK68kGgP/q0iGXelo6xxh8qY6gTqMDj903e3alPP9rxHrNFtWFIbmfag==
X-Received: by 2002:a17:90a:cb0a:: with SMTP id
 z10mr7385707pjt.170.1616653181218; 
 Wed, 24 Mar 2021 23:19:41 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id b19sm4393086pfo.7.2021.03.24.23.19.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 23:19:40 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com, erwan.leray@st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Thu, 25 Mar 2021 14:19:18 +0800
Message-Id: <1616653162-19954-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616653162-19954-1-git-send-email-dillon.minfei@gmail.com>
References: <1616653162-19954-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v5 5/9] ARM: dts: stm32: add
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

v5: no changes

 arch/arm/boot/dts/stm32h750-pinctrl.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32h750-pinctrl.dtsi

diff --git a/arch/arm/boot/dts/stm32h750-pinctrl.dtsi b/arch/arm/boot/dts/stm32h750-pinctrl.dtsi
new file mode 100644
index 000000000000..ef8c4d881dba
--- /dev/null
+++ b/arch/arm/boot/dts/stm32h750-pinctrl.dtsi
@@ -0,0 +1,12 @@
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
+
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
