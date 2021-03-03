Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13B32B5DA
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 09:05:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8130C57B71;
	Wed,  3 Mar 2021 08:05:43 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3C91C57B70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 08:05:42 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id i10so6542803pfk.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 00:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=st1vx7fKQLzxFkGKwYEuz/lE5O4hxc+f/JnhKV6iha4=;
 b=od5bZTQKOk9miWkdziN+KibuenscYrT/Im69f8ugS3nBIxLH1knCm+7EIBuTPWRpfV
 BMYZGCfm/NdvN+UY3kBI8mpVmBxaNbWAUERnBEHyN9oLbp8qYtXC3LgvZquMatl7hT9k
 0Y7WpcFPhyRB/fA/BLViODjE8PSick43BiaGNBPOulozsqzfg26WbA4heJtgnv/VZSgy
 18XupCnYvplpSc/6B3DuCwYzynvB0DkFg8I9ohWENsMpEkkDfa5XoSJLK8uerQGerhYM
 jwGUgJqMBrJoCbWKrMq6gVb9GpdFnopVpTB1iUOxHaP0D2DPqvECh97PhAPpicXhMhTl
 HSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=st1vx7fKQLzxFkGKwYEuz/lE5O4hxc+f/JnhKV6iha4=;
 b=JHu/Mkd5JM6FnctJUQhXzbQ4JqJyhBAJWj74W2tA3aNKAwZ0comaBBksNhVwBpIjYW
 Lm9PZNcYI4+rB6tbw/bgKQlGxP1NROPbcT4e0ShR7+GZ8GE4OshADZU6nM1xk57hPBLN
 t2JlRX0WxfXcugWM4N9d8ZwXQ05WEvjg6RYGOQDG6nNGTVAsOi8dIHSRdQopPtGp0esU
 FHVEDu6lxid6oVY/1k65VCjJBPIfnlOcko230DzmrcbPp34zh0Vaf85C1idkFLqJGTVf
 Y1h+c3Xm4VUoaLYgfyv8wpfsxH65kjp3lVwRZVL5A7PD9eHnOGl6G6/x/Fhxv45tGEFe
 ossQ==
X-Gm-Message-State: AOAM533FuLJ4J4Yntf7mUZ5nzmFV7vo/kHiLZhP42pUIHsBIkiQvBgtF
 Y7R3Xoep5uMD0jxbyxKqTNY=
X-Google-Smtp-Source: ABdhPJy1ohWbHQtNZLuoMaqeU0ZGZk8ZMkBTKH9qA5TBGWkq+iivUTkdhQjtl5lIYs/SKc6g2CNYOg==
X-Received: by 2002:a05:6a00:16c7:b029:1bc:6eb9:ee47 with SMTP id
 l7-20020a056a0016c7b02901bc6eb9ee47mr24245037pfc.0.1614758741273; 
 Wed, 03 Mar 2021 00:05:41 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm22260887pfv.84.2021.03.03.00.05.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 00:05:41 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Wed,  3 Mar 2021 16:05:15 +0800
Message-Id: <1614758717-18223-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH 6/8] ARM: dts: stm32: add
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

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
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
