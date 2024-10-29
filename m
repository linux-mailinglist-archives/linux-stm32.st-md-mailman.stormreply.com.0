Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B849BBB73
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA286C78F9F;
	Mon,  4 Nov 2024 17:18:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE76FC78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:20 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d4ee8d15aso611384f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233460; x=1730838260;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RcSzd2hHGzMI1nKPL5Zq2z/Pr8ApxfIMOQ8qhhepbX8=;
 b=nJNdC3B1V8gN9CA8DmhNDhtfqkIv3ZzRuS1WF5xvInK/nL15fh5C1G6H1+40Boe1mk
 ixWBk3LH0ViW8Vwl49Ro6qKi+yoqv63+tBSvxMThZmqS1J7SQhUNHdyny9maBqHk0U7o
 FviJYZG5P62lZvwT/SfEEkvf+zUtVmJP18TkfUgdX9LzV4bcGR8iRxm6RLChN4w2wQ1s
 WLfqvAUKRfiPQ5lcLOds06P7wRCmP4g3z1Ke/poVF22i3MvpyznlMgL9QG0XwZzX4yER
 enb23S+5PupvO236wh0T1pv32d35Pr+fnEtpFuq/koT0COOpoJAZyV4KjwGbYq10TjY6
 5tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233460; x=1730838260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RcSzd2hHGzMI1nKPL5Zq2z/Pr8ApxfIMOQ8qhhepbX8=;
 b=GlT0QLgjPVcPQJAR+N7NdPeC3Z4d8VfJuqTc6z6pyRbiUGis0Evrz/1zeVMnaN35wb
 ZzGCohGrE4u0RBCk7nqoRoAS8cHbsPZwu1gKG6ZCFHA5d+dO1FJtfh1DSdoorSGVsaBR
 Q992ZBi1uADtPaNFVaGqJwML7jECKBC45p971wVHdjjNbs23NwZ0IY1kL5int/8ay3Wq
 wLdOmw4oGJWBiD1nllWvFULy87bHm/Xl/XeibIVob00KBM/HdmfKevruUz07lOhDFDaO
 A+/47jgungf+cN3xD6JjWkC1om8YC/kbD/hvJHveaPdXWOJquPkln6eexRyzf0BbqVvP
 bNzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQLUJswOw7xT5/omrUSx5IvZwanb3Y418lUhiinfqof26AvxUKI7MRONYy5H4OsA2ip1sP4N1pXuTACg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy/iMPRy1gH0K67dm+/zCq3xavubbC8YGodSHUpW+HxhfOC8o+T
 1DuD072hnDwpZP95WCWq9ExKk05Kf8rkEENQZlw3ItfosTuUAGxA
X-Google-Smtp-Source: AGHT+IFthbx5sF59M7JPXFTbmXBHaYzdi4tE1rj9Q7V6VVETB6DSTEN3Pzofg+o0yDuJbijtUURebA==
X-Received: by 2002:a05:600c:4fd4:b0:42c:aeee:e604 with SMTP id
 5b1f17b1804b1-4319ad41ba8mr47526965e9.8.1730233460330; 
 Tue, 29 Oct 2024 13:24:20 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:19 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:42 +0000
Message-Id: <20241029202349.69442-17-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 pabeni@redhat.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, dinguyen@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, l.rubusch@gmail.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, s.trumtrar@pengutronix.de,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 16/23] dt-bindings: altera: add Enclustra
	Mercury SA1
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

Update the DT binding for the Enclustra Mercury+ SA1 SoM

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 8c7575455..87a22d2a4 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -51,6 +51,16 @@ properties:
           - const: altr,socfpga-cyclone5
           - const: altr,socfpga
 
+      - description: Mercury SA1 boards
+        items:
+          - enum:
+              - enclustra,mercury-sa1-pe1
+              - enclustra,mercury-sa1-pe3
+              - enclustra,mercury-sa1-st1
+          - const: enclustra,mercury-sa1
+          - const: altr,socfpga-cyclone5
+          - const: altr,socfpga
+
       - description: Stratix 10 boards
         items:
           - enum:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
