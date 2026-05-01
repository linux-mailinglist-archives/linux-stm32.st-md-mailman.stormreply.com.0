Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIXVDH6T+GmwwgIAu9opvQ:T2
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8E04BCFFE
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1F3FC5A4EF;
	Mon,  4 May 2026 12:39:25 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BC7AC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2026 07:33:19 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-356337f058aso1086465a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2026 00:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777620798; x=1778225598;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eEGH/Mz9b26kwzXLbg9yiEa8TTkjExptNbsoCdY3tLk=;
 b=AuLTRQkigz/L8kC8I1wnvwd0BxtZ+riCO5RcsRaZvCTce+Ye7U40pmVGqQwrVzra4O
 fVWh9zZBamoe5s7ye+earHepN/FI50waKJN0Ax7y7+FEeTOTUAGpLcjXrwDdHLtHEumY
 QS6LpiOFZDK5fSEq02iE5x9alJBrm8S/Sn2mwAZTkG2UxzFPPhHEs5D8OaazEE6T1hTf
 KHkXnkpw84qU99yD3OU2x6gxZWxT0VT3g2t/LdAjoDapLFIvRN8j02aeOWh9Eqdp1KMd
 +o9aGgg4HFM9iYyv5QAvcupTYkROBM6SeCKeDSl9WRBgBRl6fgadQtNdG9WgE0tv62/b
 f5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777620798; x=1778225598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eEGH/Mz9b26kwzXLbg9yiEa8TTkjExptNbsoCdY3tLk=;
 b=S1YJzXUEWze27tBP0OPKipnGOYKxzXDbcr/810P84djB9cPA2ZApj8qgfiBDtpeMWX
 R8HB5Q0X16HemrCZG+/lddVjlPJtMfjCzfiV2xSRA5/V5K5S02PHBrMkKCARXUAI/iAU
 mopc/TdlNUjpSMgTklUw+u62291kgeSomEzK+uRmcvFA2TBZptw1T9dSwyc44w05x/Yj
 MGE+OcPO1IL9T4dwLK18OabuvvwzJc0YG/Ff3M2LFO3p9zuEnaBccVbl2DemlBQG5AgG
 xWLA84fUV47OMjjBfn5lmAsLreaes6NQYt46l74ma0rCEsDhgPREqvF9titVyw18iKPy
 /vMw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+kG9flOiAmWlccvSIMQnAjehtMwwBZi28IHQq9+k8POi9Q80Pdf2446OZC7WdePNbphw4LXkisKdQKqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwUucI5NwLVoM3yzQP+LvNn3vRRRmxssiezL2glDMJkSpMOzIva
 vXfgUp2QfZF6DG9j8IZMLC0cEP2HoNIDcOP1s1KoBVqwkNEgreqw3vKO
X-Gm-Gg: AeBDieuLdyJ/Wz+qB2OEvNBFSrTG3LprCTmlD9T/IbxYDoSLQyPOEryNJ7owORYorKW
 k6bjH7iqbORXbWRlpUxEHeuK9HtjlP9OxTCfs/wbUien8qxcD2PYrcFA95iyRHyMSU916vy6Q57
 vul/1tcW5gan0XtZqE2I7gEWf3JdUadKuMnE1YWh/O/ccM1oqEQe7woRY1gnZ5UXCAd0pSVeIH1
 Ys/lwjsmWy2XXSh14Lte7BoWNzDdzwW3o4cJqbuE1wi0hvyZP99qorJ8J54l19cb8ZBvgfnm5Hv
 5niObpiR1e8QaZaKhE6dgrIUE7lBJ/Aw2WAkVfcU6JEMIh7bjZ6z2li98wcvsaXsctKl9E9y8xs
 JDRPOqFHVXRX7JNMhEOguq0xHz+CkeX+9fDfY1MvQPbycpPVDBYDl/ND1Su1PQAiIpmlGarc7mO
 hVwEnApMDtTfoA7Pg3ZAzCQD9K0y9i+VFzFUSiFkYU5jsIo+rJ6DnnhIwWN2lp05tYP0hZRxvyC
 AesJA==
X-Received: by 2002:a17:90b:55cf:b0:35f:b940:4e81 with SMTP id
 98e67ed59e1d1-364ef501f66mr2206239a91.16.1777620797619; 
 Fri, 01 May 2026 00:33:17 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.148]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-364ebf12bcesm1481466a91.7.2026.05.01.00.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 00:33:17 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: ukleinek@kernel.org, thierry.reding@gmail.com, linusw@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Date: Fri,  1 May 2026 07:33:05 +0000
Message-ID: <20260501073305.5866-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 May 2026 12:39:23 +0000
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, manishbaing2789@gmail.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: pwm: stmpe: convert to DT schema
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
X-Rspamd-Queue-Id: 8B8E04BCFFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[77];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:ukleinek@kernel.org,m:thierry.reding@gmail.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pwm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manishbaing2789@gmail.com,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:thierryreding@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.724];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,linaro.org:email,stm-ict-prod-mailman-01.stormreply.prv:helo,devicetree.org:url]

Convert the STMicroelectronics STMPE PWM controller bindings
from text format to YAML schema.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 .../devicetree/bindings/pwm/st,stmpe-pwm.txt  | 18 --------
 .../devicetree/bindings/pwm/st,stmpe-pwm.yaml | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
deleted file mode 100644
index f401316e0248..000000000000
--- a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-== ST STMPE PWM controller ==
-
-This is a PWM block embedded in the ST Microelectronics STMPE
-(ST Multi-Purpose Expander) chips. The PWM is registered as a
-subdevices of the STMPE MFD device.
-
-Required properties:
-- compatible: should be:
-  - "st,stmpe-pwm"
-- #pwm-cells: should be 2. See pwm.yaml in this directory for a description of
-  the cells format.
-
-Example:
-
-pwm0: pwm {
-	compatible = "st,stmpe-pwm";
-	#pwm-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.yaml b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.yaml
new file mode 100644
index 000000000000..4d5b43c9e7fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/st,stmpe-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STMPE PWM controller
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description:
+  This is a PWM block embedded in the STMicroelectronics STMPE
+  (ST Multi-Purpose Expander) chips. The PWM is registered as a
+  subdevice of the STMPE MFD device.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: st,stmpe-pwm
+
+  "#pwm-cells":
+    const: 2
+
+required:
+  - compatible
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    stmpe {
+        pwm {
+            compatible = "st,stmpe-pwm";
+            #pwm-cells = <2>;
+        };
+    };
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
