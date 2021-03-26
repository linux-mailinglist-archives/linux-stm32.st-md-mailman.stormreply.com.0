Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F8E34A63A
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 12:15:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24CD5C58D5E;
	Fri, 26 Mar 2021 11:15:28 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2142EC58D5C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 11:15:25 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so4105541pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 04:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bPpEBr2VNoEucElp60nsPa9fsdYETM52GmgTsr1VV5w=;
 b=IYuTYcTRms+QwLVCSrjm5uBdCHbX2jp8Krrt3XJ5qltPrPl48oYpfD9SYO1IwvIPZH
 FJyfVNstmmLT8ad75L5TGtj7dylWZaKUnxHivjmbk248CT98ZcyNag2nsjqv8gY+S7AX
 eVAaQ5YPhuSHl4/bhqi+UvZWoatTrD8WFv9lGwsOJfmMsxpreIsaEM0XBO1ZPrplZffD
 yYyctlzBblvcuUeMnGTkxLTkMhAApdotlmeTcWiuHVxNkfvd1qdgA93/qwLCSVBbgay1
 kcNax34mnDUYbaA4sXnRgk2g6XSbeW5WFL4iD9x21splUppZ7QFbf0JNO/rOdwiZui7j
 uRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bPpEBr2VNoEucElp60nsPa9fsdYETM52GmgTsr1VV5w=;
 b=QoqvgXBxKk5nlavpOmMlck1UFVuccRUlRXBxy6kqk+NmJkokTycGmUGFQeGYWqGotY
 UAY2nmaI0XxvLwEe1bV7ktLPpTEIVubq3r2HdNYNb03kHSMXuV+OoH2BQJoEQg3GoAmV
 LYmx268nSCgwvayq8JMwqIrs7JrnxtgWlNJ2UEAqjmfurCmuEE2UXEevBO55uM9C7uKQ
 hDdAggTU8SlIhqPW5t88ogucmuKe88pXkh8tWTNFa5C1I8/cNKPyqBEZ9R1oKPMrsyUM
 9oBPcEUO9GqoAUEotJAOVXpANwZFt07z4NC5UVP2tg1qD8KeIFQcoWLqfaQ8kY21veSi
 pa0Q==
X-Gm-Message-State: AOAM532h/T+j4joBfUG2VdGeA/9exET2ai2abJwjJX4ci/bd0t5hKohV
 t+n6fkpxmcNgbFoPhm9KXak=
X-Google-Smtp-Source: ABdhPJwd5T+kpADDMnMHcg+MZmHelEtQ3t7nsJWs6qhXcjRS2jUsr1ahQTDjO+ghsKV8EJhjZp+ruQ==
X-Received: by 2002:a17:902:8a95:b029:e7:1029:94be with SMTP id
 p21-20020a1709028a95b02900e7102994bemr13865648plo.26.1616757323780; 
 Fri, 26 Mar 2021 04:15:23 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id l3sm8108414pfc.81.2021.03.26.04.15.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 04:15:23 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com, erwan.leray@st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Fri, 26 Mar 2021 19:14:58 +0800
Message-Id: <1616757302-7889-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616757302-7889-1-git-send-email-dillon.minfei@gmail.com>
References: <1616757302-7889-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v6 5/9] ARM: dts: stm32: add
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

v6: no changes

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
