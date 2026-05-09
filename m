Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA+qILqP/2ku7wAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 09 May 2026 21:49:14 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CE2501464
	for <lists+linux-stm32@lfdr.de>; Sat, 09 May 2026 21:49:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79193C0693D;
	Sat,  9 May 2026 19:39:41 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45E9CC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 May 2026 19:39:40 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2ba928852a5so20524755ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 09 May 2026 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778355579; x=1778960379;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a5cMbOemj5qCKf6YMBNAikh7EtC1awKMtCwgmYlIPnw=;
 b=D+CgdaGMC0rWV6MATlMogUhHzEo9k3H+r57GNkMyPFx4ZbzCzS7IrusQlLbh7xz+oA
 7no2hH1NvVzKcMmzwk4z7YKk5oCMtruWzTQyU1G8cTkdTJVjMiLlr6PsgpLTsvdjDkbQ
 N54Ow+yhjhYPlcF76UsyPxbAqwynqkYItFRCvyr3d4uZlEN+KOT6crEjIDt1pSgnaKbm
 4R1UkysisGrNOH1JJdyx7LSVZZ5LbXGbYNXK5e9crXyVKqTNqXyprULsz6NDLI0WXZjU
 sbxTQU86zr8StAm0gJxvQKtrKzb7AUSxJUdEJva+NTqQQmtsWc4Qb5+IHa03ZkkpFRWa
 GW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778355579; x=1778960379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5cMbOemj5qCKf6YMBNAikh7EtC1awKMtCwgmYlIPnw=;
 b=O4ifyLW46xLK59vQKIME3WgmBrfAyv8Y6hktm8xSHNgi25j1cNt3R0ukFypJ2OFo1/
 qhI/Z6uisYC4YjElAGBS7vl19DMMaGNbdjk4N5en5zTWXpE0Sy7s9P2WMEiSWMsNfCl4
 Wkf9ZWReBsquje8DtWXaoUmNZShBzf8yiD4VYrF+mHoogz1ruM49YX9CV6lTDxBJgLH4
 27RC3kOdiLvd4HxvPh+M1HijErxS0RVctRod+R1OgT/P+utfjPNpkSBPcS1j5XuAh2hv
 XxpYi0B9wxqkprNT6wQmzLxeqRtVQAAgCaBQklhc+YNwGBJriuy0m3mloDc5Tc/ueedF
 md3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+frCsZEazIBlEppDcRC7FQa4s88GFtP4pu/fEa7y/lyUELBmnoyfc6iZVojcM9ogbiQSGXlkzG4FGN1A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YynaQOBS5vgjRjcFWlGe6RdX/KQppuS9v8dMbGvcIOtMAleVhCg
 pM1jwYRfFEykYe1jftlykeeEue8IwfuGeUyKlgz2wk0mtqig9IpSVH8D
X-Gm-Gg: Acq92OFd+Yz1tWAn76tngysyrv0enhkjE9SrCSznNVG9vj2wcS1K4hBLgZzjhI/wBrB
 RhbvTd1zC0hOucaRc73ng4dbYZYSyd3H7eBHMrDWzVRT7uz4jQ/ZLBXwYnK01RvPvo6QVBad0D/
 WNGR55F83OYG2X54ixz0e/7PUlZTtK7WKk7dd2PECYJpwqpN72bUwDyBHfBYpLvnrWVIM1CZ6Sp
 NtVs7SrLSsdi6YpzWB/m2CrnDFnLuPyY9i2+hbsHgKiZk/Nwl+lF7PCVmbxcwbuqB36mPU3/0ZH
 8Y5CQKECCrzgWB4RVWQdDGs0eS5lNZrAgIdqe96j+5Jbf2bNA+435LJSiESIuiitabBkbw+v0No
 /TAvRCmsLvw/OfRfbtLszheB/YifyYhTsIhOOgUNm9BUztyU65gndavZxJUS0bt6bQO3FaWqvjQ
 PR1YVHp1XlmmiLDgzwFk7tsVhGdf9nzVVn2TcjDrqAX4eq/sfTd9z/eSQnD0qbR3q/PZBYBYNRT
 tZU
X-Received: by 2002:a17:902:e750:b0:2b2:5258:a23d with SMTP id
 d9443c01a7336-2bc7a9ba9c0mr33335675ad.14.1778355578556; 
 Sat, 09 May 2026 12:39:38 -0700 (PDT)
Received: from Ubuntu.. ([49.37.169.14]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1d3fed8sm59690265ad.27.2026.05.09.12.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2026 12:39:37 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lee@kernel.org, ukleinek@kernel.org, linusw@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Date: Sat,  9 May 2026 19:39:28 +0000
Message-ID: <20260509193928.19030-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, manishbaing2789@gmail.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] dt-bindings: mfd: st,
	stmpe: fix PWM schema and drop legacy binding
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
X-Rspamd-Queue-Id: 21CE2501464
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:ukleinek@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-pwm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manishbaing2789@gmail.com,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,body];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.402];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

The st,stmpe-pwm binding is already covered by the MFD schema in
Documentation/devicetree/bindings/mfd/st,stmpe.yaml. However, the
PWM subnode was missing a 'required' properties block. This allowed
Device Tree nodes to pass validation even if the 'compatible'
string was omitted. This omission could lead to probe failures
at runtime.

Fix the schema by adding the missing 'required' block and
remove the obsolete and redundant text binding file.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
Changes in v3:
- Added 'required' properties to the pwm subnode in st,stmpe.yaml
  to close a validation gap identified by the Sashiko.
- Updated commit message and description to reflect MFD subsystem changes.

Changes in v2:
 - Droppped the TXT file instead of converting to YAML, as the
   functionality is already covered by st,stmpe.yaml.
   
 .../devicetree/bindings/mfd/st,stmpe.yaml      |  4 ++++
 .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------
 2 files changed, 4 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt

diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
index df43878fbe18..4bb05d544901 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
@@ -127,6 +127,10 @@ properties:
       "#pwm-cells":
         const: 2
 
+    required:
+      - compatible
+      - "#pwm-cells"
+
   touchscreen:
     type: object
     $ref: /schemas/input/touchscreen/touchscreen.yaml#
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
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
