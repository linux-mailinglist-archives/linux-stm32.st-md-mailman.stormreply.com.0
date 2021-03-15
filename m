Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A28C33AF05
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 10:45:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22E27C57B51;
	Mon, 15 Mar 2021 09:45:11 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49047C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 09:45:08 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so14050768pjc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 02:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tOoCblnGCn0autrjLck7UDYY0V/VfAyg4OpABraTu5c=;
 b=cSgn3/VrdJ9K+fHgQvj0JRj+1ixTvuzgxw53V+BWiOOuuJGfVeU6aWLE/rkTeFKtNt
 Gg6ap+5Qfj6Mr7M7izHyeWOuHsN2PvAwWroYfAr9x4c2hP7/cDH3NOecfAn/yW7WDtTR
 3NWols9NvFyDVAjeRUZa0X+E1WEFxEHoHqCE/rjpIE94BoKUG4KNmb9aqybPpDej3JTP
 yS2clI/MKhGlrjCyYMiAXzTo95TFxPsVsAWNviOwBicaMCEnedgipg3KEMmtHf2VhsDG
 B8FvhoPtdUB7x4ektSH1BGL+a0BrEaUbvxBshC03evEz7N1BpYeGMBie7TIcMTfXVKv3
 7AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tOoCblnGCn0autrjLck7UDYY0V/VfAyg4OpABraTu5c=;
 b=pS2OmE41CoBtgbZrZlCQRgQAgnUxHBcDoHqsD9UTXP9m3wx5O/m3Yl1ukk/ngRpf4O
 7Pac81NTB/w/cz9Whxmh0yvL1wCJwhouQVu0pbA+LVrSF0TeJAUcDXs3M+x+s542nyEH
 gjOWXx+X02wYMGaUwe7UAto5+fWQ9fViSI9cFwlYu8JrA4jvwqKKgSgToD16enpDKBBD
 iVn5LLz/kojZhS3CJmGZxWnDDChRA7WjrtsoaQxN508QnO7R7TqkRUPXePkGSQYBU5UI
 ypb3nQkCh0Dtj7feyZ73aRZ+xb9ohZ5LNNg/jyYhc1y4S646Qkd7cZJPx2nFGYLMsE4e
 6CUg==
X-Gm-Message-State: AOAM533zzJnYxgug7ThlJ4hBeYIFF3WhD28ScrJU8Nk7iOJKxp97DrKE
 T+QZAS2/vn+IqNKDhxyYLs4=
X-Google-Smtp-Source: ABdhPJyrNAck3eIUhrE0yMFv47thj1GYls2iF80EGKKoMadENg1YpPbxk+Hs4Yu+2BpC7WZD0SQy5A==
X-Received: by 2002:a17:90a:a584:: with SMTP id
 b4mr11793403pjq.186.1615801506942; 
 Mon, 15 Mar 2021 02:45:06 -0700 (PDT)
Received: from localhost.localdomain ([120.245.122.54])
 by smtp.gmail.com with ESMTPSA id 14sm12780811pfy.55.2021.03.15.02.45.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:45:06 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@st.com, erwan.leray@foss.st.com,
 linux-serial@vger.kernel.org
Date: Mon, 15 Mar 2021 17:43:52 +0800
Message-Id: <1615801436-3016-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v3 5/9] ARM: dts: stm32: add
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
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
