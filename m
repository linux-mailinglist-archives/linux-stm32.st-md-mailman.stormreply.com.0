Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E2F4869C2
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jan 2022 19:25:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E055AC5F1FD;
	Thu,  6 Jan 2022 18:25:38 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DA8AC5F1F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jan 2022 18:25:37 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id s127so4943347oig.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Jan 2022 10:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5h1dR4PNN5NFkFW0+XiCyKA8d8fazWVArSi0BOxk1SE=;
 b=086O7UQZGYPj7uKeBIvPk1jWu46oWRb/d9a6P/Y0dLRnpC3bieUgHyVSB73Jp0pS4B
 +Ntc6YRIQ28QEV9mt33jd+jaAzs7NOrY7tAr6OI8Sai0p5DMp6ErCP6T69PfRxDM/Q3X
 44SeED5wbdUhvuT5a1S+nUJnDhnCeX/3WVBPhEAUrXgz2wCo7ouPzI1M3sH+HcAP5vhF
 RcfO9/WF0uhCjPujcDONs3XCjkc4pdedipQzd5Irb2vSzZY4VYVemmPE8tW4mhYvHLoX
 7hraxRED3ic1EE2gyb0P9aYphPQo5zDfZ4Sf2RzaV8RZ8eGCv5ozgW9LWNztJv5nE3BC
 FVwQ==
X-Gm-Message-State: AOAM533CjmHatHr4Wid53Z5rraBfhlcbsWXlxRPwEAXLf5o3le7dXM+N
 mTsLB5hk4efscfFw37cQLA==
X-Google-Smtp-Source: ABdhPJzepteQkCoDKy1ujIilUFsyTVi5z9LtR0nkVZhj5YPNewotOVWZzrv2vR4uYHaHaLpVu1wZ6A==
X-Received: by 2002:a54:4502:: with SMTP id l2mr3544191oil.167.1641493536337; 
 Thu, 06 Jan 2022 10:25:36 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id r13sm484949oth.21.2022.01.06.10.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 10:25:35 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Thu,  6 Jan 2022 12:25:15 -0600
Message-Id: <20220106182518.1435497-7-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dt-bindings: rtc: st,
	stm32-rtc: Make each example a separate entry
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

Each independent example should be a separate entry. This allows for
'interrupts' to have different cell sizes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
index 2359f541b770..764717ce1873 100644
--- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
@@ -127,6 +127,7 @@ examples:
       st,syscfg = <&pwrcfg 0x00 0x100>;
     };
 
+  - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/stm32mp1-clks.h>
     rtc@5c004000 {
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
