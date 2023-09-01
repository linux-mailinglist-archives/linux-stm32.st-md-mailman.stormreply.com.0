Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2426778FBD3
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Sep 2023 12:39:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC340C6A615;
	Fri,  1 Sep 2023 10:39:18 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BE4EC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 10:39:17 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-4ff8f2630e3so3275873e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Sep 2023 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693564757; x=1694169557;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i8h3vDWr7fflQk4W9uFGrkkvahLzbgYVzTlEuqGP3F0=;
 b=DB1TkiAFl5kc8cwS7jJd4w1jlsIoSwD8htD9Xya/EWWjrEPdl0DH/CpNgyCNmh5IIF
 w130Gv5ezUwR3LH1YxQjN43fEE87LZo9t/XWwjiskybzU/n7IXxEYSjdrNVCOQAIPIt5
 4uVueO0iN/mO/uaM1yoS/6vvC/RWRYRYAxJedL3DFcuNYSL6YtqZf+mxghjaHMVFqNk+
 aoXo1eXyN4IQKkY8thPiGPcEwAHVPUUZy1vs96lnVWR7jWN/G/oFv3/ydH6+uXSCHGym
 4wrjQqkIMMWU0qVUQMwpCLbugUrIgRXVUukQMCue0gJHDADP/nPP7w+ZN36zsXg8d8hV
 2k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693564757; x=1694169557;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i8h3vDWr7fflQk4W9uFGrkkvahLzbgYVzTlEuqGP3F0=;
 b=cprrc3vS8DIX9Zg/eNcZBcsEAWCdcIG0fTKUzqKqBwcG+QbH+JEMScpyAtEdgSqhJS
 C59FZQKL4pgQzzceDYuOGqeYK/Ix0xaCz6+9wniT1xx60Jkh8kqcEuS9b6oT/tkzS3MJ
 EtThRXY7YYj4QUg44fiqYPY9xtUhd4igOEsKmc5UmUOB+t5kimZJgE3IvL7hauIV8w7Q
 abU4oeMEL1R0TZEgQBT4TJCQTsiJ86Z+M+feuoCW7j48MfPlzWpK8CEdc701wP2kBzJl
 NV7zAjHHCKZejtOgEV6VZ6VlR4UnrvkKdyOsNHmTpRHNIVUDDptylS+VUvq9TvDbTSLw
 VmTg==
X-Gm-Message-State: AOJu0Yxq8AqwJAmB1VhtZ+fd2UR6LCjKzvPV7fg93KAoXT+aKAnBUssz
 cC1tCwWtcqIq3H2BgsEWAU0=
X-Google-Smtp-Source: AGHT+IG4nuljqfBeFv1EMp/yRFHH5n6AvOtPvpgH1KQmEH81NMpnFtXoHqM6ZmyBQWYAoTZ4wJRmlg==
X-Received: by 2002:a05:6512:a8e:b0:4ff:7f7f:22e7 with SMTP id
 m14-20020a0565120a8e00b004ff7f7f22e7mr1847780lfu.17.1693564756806; 
 Fri, 01 Sep 2023 03:39:16 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
 by smtp.gmail.com with ESMTPSA id
 r1-20020ac25a41000000b004fe10276bbfsm611863lfn.296.2023.09.01.03.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 03:39:16 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: inux-arm-kernel@lists.infradead.org
Date: Fri,  1 Sep 2023 13:38:55 +0300
Message-Id: <20230901103856.31091-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: stm32: document
	MYD-YA15XC-T development board
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

Add new entry for MYD-YA15XC-T development board.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 4466b455bffa..1bde704bcd65 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -140,6 +140,13 @@ properties:
           - const: engicam,microgea-stm32mp1
           - const: st,stm32mp157
 
+      - description: MyirTech STM32MP15x SoM based Boards
+        items:
+          - const: myir,myd-ya15xc-t   # MYIR MYD-YA15XC-T STM32MP151C
+          - const: myir,myc-ya15xc-t   # MYIR MYC-YA15XC-T STM32MP15X SoM
+          - enum:
+              - st,stm32mp151
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
