Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FA43429BC
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Mar 2021 02:56:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FB07C58D5D;
	Sat, 20 Mar 2021 01:56:51 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EAAEC58D5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Mar 2021 01:56:49 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id w11so3750046ply.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 18:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NZqCG1BKSopctCZmH8MjxDzkFx6uDWuPlT5Y4Y0AE4Q=;
 b=frzQP6Zrz7NAje5ocuXuKRjW8oXfDthDtHOBsW4rTw1GPYDlTJxnWKAOEwMWsHFd0o
 X8ducxiNn2UgFMDiiFAls7nxZkhfIie//B/7CzE68WitjNUQ0zhjfKVI/fM9dnuZduEa
 vCgqwkesklnfnfeHkRV1cix7alp1MJ6bM78313LBYwkMcfHmZbwHH71YPSOekOOhBfp0
 LqslE9Gc6AWgPVZdtjYgxFC9gEZCjlD6KlrGzIL0aaiqq/7tVojQ7L5VLhGOrX/BgWnC
 ppHJFyM5wRTXOGnl9EmrgRyh4hFO+Zs+FLlszb2bGHOofDif41Bz17U095nIq6vrR/US
 tm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NZqCG1BKSopctCZmH8MjxDzkFx6uDWuPlT5Y4Y0AE4Q=;
 b=TydtcqhzDtbDc/6O3o0EBSNf9T5QpsLSgLgc6orfoSQcHXTs6m5Oe1Kjb8UP12XDXf
 Zs0QT8sPY9BRDXQLBBRN7jjggqcVvhlehpHBk/3jIeufUfj8kjY11riUHBk3lGcyQlUb
 XgFREgGjCplxMergwPpMGr/W39DXVkWVi38aUBhLDIKmwJWdRSb0+Ic7lKcpjmSUcT/1
 pDxKDiTB3fuT4ZmeVhjf6srLCgf28twISKkktuAP/F4dpGtMdu0553W/7sP7ZcGtWUW2
 2estu+XMaaQIg0g90S1WamdtkQB6Vm7Kuhh/YzDqjRmfvZfLYUDu6y/DdUnDV4wuGt5U
 yybA==
X-Gm-Message-State: AOAM5331kFZGcyOgPZkv1gJfdws7UpxWgNNuAnG50UlWr9Jn80EvO/0q
 AmxVtmfk0ezy8EQfWpXVqfiyO+ZC9+PYOYo7
X-Google-Smtp-Source: ABdhPJxwZo6kRPPnRKE5RmrlkQ0bmgXeR87LlgDSM7i4D1+trkj1aBL8lLhzh2HAC3guEeCSWyze9w==
X-Received: by 2002:a17:902:8d8a:b029:e6:b2ea:9074 with SMTP id
 v10-20020a1709028d8ab02900e6b2ea9074mr17180579plo.30.1616205408157; 
 Fri, 19 Mar 2021 18:56:48 -0700 (PDT)
Received: from localhost.localdomain ([204.44.111.4])
 by smtp.gmail.com with ESMTPSA id y7sm5755904pgp.23.2021.03.19.18.56.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Mar 2021 18:56:47 -0700 (PDT)
From: dillon.minfei@gmail.com
To: alexandre.torgue@foss.st.com, rong.a.chen@intel.com, robh+dt@kernel.org,
 a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Sat, 20 Mar 2021 09:56:19 +0800
Message-Id: <1616205383-24114-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1616205383-24114-1-git-send-email-dillon.minfei@gmail.com>
References: <1616205383-24114-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v4 5/9] ARM: dts: stm32: add
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

v4: no changes

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
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
