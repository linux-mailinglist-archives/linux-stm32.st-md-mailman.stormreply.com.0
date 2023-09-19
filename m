Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 786377A5CB4
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Sep 2023 10:36:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22600C6C821;
	Tue, 19 Sep 2023 08:36:15 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BE06C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 08:36:13 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2bcb50e194dso85319091fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695112572; x=1695717372;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N5NhVCKkYOu64uwVPHARrnvpzesl8pDt3ArYQZAwDH4=;
 b=LydedOg9XbLOm5N07hycWib7q1IJi4v5z3lUnh1izvQ8iDjI88P4huTUjZxyDVRcrC
 5oGMapNk9z4YdVqpa80HChijwlxJ3svdpLLZ65jPmTqgFSeOrZVQLaJgbmYh17pzc/9u
 zrxhxY/OP57Gby5iQGBzCWwPVnyS/uPbQptL/48LupIaOLGNIcrOiH27ZiuxHf7tEjSP
 j8IHCHhU3nxogP2JxYosb5GlTrAqLQvU0diNxgbT/CIGYWCcOPnZdpXU681OtvrCjfGl
 vhT5mqskIcXyr2WYq2HboXBk81kH/1QW28BB7SOIGQEAUvdE3xUz/WYoZPyCu3Px3a0m
 QNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695112572; x=1695717372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N5NhVCKkYOu64uwVPHARrnvpzesl8pDt3ArYQZAwDH4=;
 b=WfTze+4G7/yjpzIKUbTG6WdvujT+5hb1DntRxv+pkdZqMTolNiVBG1TB6cIQ/RyNBO
 mnYbzd0GDOfsYxWcQaz7DXCCCksZzBUtnYf5XezLY3s+ViZNjKOQgzJiog2yfz+17wRG
 +f21QINfk2VwcNor9iI4lYMrwTY8cWDHA+++dsVyrokJF9pMVJ7c62+OsW9Z1PkGFhnz
 rnf9/T57kqh3tDpXzBLpQs9+Y2evdtszREbKLsUeu/rWgfM93e5LplKSpFAgvIeGWg77
 qyqsRtqb44vkfgaL7BNqy5rWAysFlHXlPQOTYlbpb2TLGDjbQIE2aU0cn4B7ZSzV6D7C
 O8zQ==
X-Gm-Message-State: AOJu0YzZ/HVv1ax9jscmHlPL221xWRNdr26L7JZJdqPLS2xxzQLyiGWq
 DrN0KQyDY9qk9h1xHx6oE9u7zMOElU183AWh
X-Google-Smtp-Source: AGHT+IHdGGsaZuZKGb51rVUdXj/Ben++8s/lC0j6WlJ58HaRtIyBR8ilVWoP+LrufSQJ2BIcaBFRcg==
X-Received: by 2002:a2e:781a:0:b0:2bb:985f:8479 with SMTP id
 t26-20020a2e781a000000b002bb985f8479mr8944877ljc.48.1695112572019; 
 Tue, 19 Sep 2023 01:36:12 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a2ea0d6000000b002bcd992d006sm2502774ljm.87.2023.09.19.01.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 01:36:11 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 19 Sep 2023 11:35:52 +0300
Message-Id: <20230919083553.35981-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 1/2] dt-bindings: stm32: document
	MYD-YA151C-T development board
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

Add new entry for MYD-YA151C-T development board.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 4bf28e717a56..5252b9108ddc 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -140,6 +140,11 @@ properties:
           - const: engicam,microgea-stm32mp1
           - const: st,stm32mp157
 
+      - description: MyirTech MYD-YA15XC-T SoM based Boards
+        items:
+          - const: myir,myd-ya151c-t   # MYIR MYD-YA151C-T STM32MP151C
+          - const: st,stm32mp151
+
       - description: Octavo OSD32MP15x System-in-Package based boards
         items:
           - enum:
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
