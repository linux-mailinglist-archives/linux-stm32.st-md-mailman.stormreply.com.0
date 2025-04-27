Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE91A9E07A
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Apr 2025 09:44:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C922C78F86;
	Sun, 27 Apr 2025 07:44:13 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6CE8C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 07:44:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso34379045e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745739851; x=1746344651;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpQyYzT4X9HKnHUwrDxKtpV4uiqgR6fRfhBMNjhjrS0=;
 b=fv5orsPmYE0uH7unx47TaFA5ZJO8/0OXq47O9tKUUOOExrCu/CPZar24nVztoDLxX3
 ExEwidK0FH8FKl6qtWLu9Y2lj1yBq2EPDvsgHA0kurX5nCv2ILcqPJGBB6mdOwPCDtGf
 fX/1kcVCpZOn9OpooH8zPxugoL5vnznK5flGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745739851; x=1746344651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpQyYzT4X9HKnHUwrDxKtpV4uiqgR6fRfhBMNjhjrS0=;
 b=S0096SG208ndv49Wh2V21ZWLgESO66AykiujxeI7GH2HksqSLXa2HIMOVSWfCMRWeR
 Lsye0HdptuElZ/2Mbn9mEXq2VzI32H9MxEIF1x3vYALJa80d2WJ1A4a1L7kG/t885wlE
 qhB/BM5G+J/LGqEgNzlrC9AIsbSco9zWal7qw59oGetaROm0mdLsFnUlgB49Z2fK04Y1
 lgamYU4LFdKETif7l1pQPM+Q2D0hYzEXXcgoiUCt04KcW6e1mtldDV5Oc0U2S2OZoWrK
 gR1k9a9XLvDCeseTC+4reZ0lmu4Rg+HPCtf0ulcU/J3vI4PHx2PIoi0oUhyLAoT/F9IG
 979A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKkuEm7SIdRHyFjvhWphKlh5nwtyodF68JXqQWegBTCqtHwYRJzWSocAp9dFViRq6Sect6jAWQ7eISOQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5skPHZO3qtM/WVxawbtgbk5sx6Y+ALl1SVV6m3TzAEGzQrDur
 6XKzRpmMDe5zOzCl+w4oNPQcXwI1G6c2bOy7H3mLKcYQYOs8CCOyrSt+Bn3kqcs=
X-Gm-Gg: ASbGncvs/j4Wf7IjeO+ntKadhySFZnH5dqWlqvqFo31DHBhaEQqfCjT3QHOsPtuDmII
 nzbwuuJ6Bc46SLaNgSGE+RuPcDDgPFFFgrCcQ7w1gbtCUDBCJzysPN28PZ9TdMJcX6r5lejT2J5
 gELi5yOwit8oAXW0XwmFuPA5QAr4cuxEz95ztmmFOlF5b0GPbTVEV0lT0qXv4/1o/Sb4vMvykzc
 ZvH1DESsDG7/4wHzGLXm13r5Hemqaxf2amRSINdUJRHjpPv+L3UGY6XdbjN5wGwo8/2fJm4+TAC
 5LqFwE6TIENTZLDSJFq7V5rMkYgqxLcI7rQ1+qYJ2L/W17OKzOdSEV7evBexJ8yIkftp/GrShZF
 dgjvKDA==
X-Google-Smtp-Source: AGHT+IHnx27fFK0oDHbVYzNEsRJgFRPiklQgqUZhae0lH9ygvIp4VX+fSkkY91P89JAIMZaLdkoxOQ==
X-Received: by 2002:a05:600c:a15:b0:439:9e13:2dd7 with SMTP id
 5b1f17b1804b1-440a64c159cmr74150165e9.2.1745739851229; 
 Sun, 27 Apr 2025 00:44:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 00:44:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 27 Apr 2025 09:43:21 +0200
Message-ID: <20250427074404.3278732-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 devicetree@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/8] dt-bindings: arm: stm32: add compatible
	for stm32h747i-disco board
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

The board includes an STM32H747XI SoC with the following resources:
 - 2 Mbytes Flash
 - 1 MByte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 5fee2f38ff25..75ef877530f9 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -42,6 +42,10 @@ properties:
               - st,stm32h743i-disco
               - st,stm32h743i-eval
           - const: st,stm32h743
+      - items:
+          - enum:
+              - st,stm32h747i-disco
+          - const: st,stm32h747
       - items:
           - enum:
               - st,stm32h750i-art-pi
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
