Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C59BBB75
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D688AC7A823;
	Mon,  4 Nov 2024 17:18:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 453B7C78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:24 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-37d4dbb4a89so618784f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233464; x=1730838264;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UiZ7/G9UNkzspOjV6MuvUoqfRxBzDKu6uAviqklHEbU=;
 b=McZPDDQT6obbkUWPsz6qDYE/H0Cea7KXUoLT0eXnTs2kf1cryYGDtcaNKvyVSZhiIR
 i2oBNytnBdPXdvUHY+IPkRdBr6Enr0mcKuCgXrEve/2XaLlOkCBRAX570jKy3MLLnEjo
 wOIxWtb09BwCnOu5BbbgOVZ0aUyxaeNsnIo5hvm+s2eBgVLWSGFfMvPtwwzMl6hxN91L
 KyD1mowFpqp1qmeUFmaNOaScQwrLIBFMMzb75GA+hsZ7nGIB2j5Rocif1DYXxV5+rLd5
 YqGbxeAMKkstIW4TwtmXj5CxrPp2RnEpKIL5ryaJmrFn7IWHHpqbVvUfWUpj2bR7GTkY
 Nc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233464; x=1730838264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UiZ7/G9UNkzspOjV6MuvUoqfRxBzDKu6uAviqklHEbU=;
 b=I/lg5NpMDqR5ttjknfFbxipnPo5VG2jUDJ+rFxBG7mSifoXEMic9x10gSS54jo5LSs
 NgcARlmgqaGoqQk9VPDLIMF3Mfm+h1lp9HNjpEnotn7igB5cOCspFPVBsSgJH3djvMUp
 WUkWx999MHxo9ZTC+xD1m91RjU+C6XGhEu5K/CrFh3nBF1wgmrlSgMmey25o+peqXD8n
 cVTFieTFEjmx9G8xHuS1lDM5FOJahlpwG8LepEhyBT892A9AJZZvhO7bBVY8ewOdw5h8
 0u1hybE8IpF70rDH9qnzsv3/SYNMEg70jPRoQ/qqsyZZBVNXqHsymb31FQ+70LuWRjK5
 4BGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf0OVOAKrm5h4kjDDItADoxKWcnb6n/h6YXbZfFEqb+eMlf7kyhqhI2PwPMCgNPWArRaeTA2k/IUFm3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxCBeLy/oNOBIbHGtXJXLU1DsU7teBTwBKHWxCQCyc5Vvb54nBt
 7JmsykKUbY4t5j49vUhWrRSPl5E7ETCvzkLMWmxhVc+JfYMZxpw7
X-Google-Smtp-Source: AGHT+IHyg5QfVoIB0g8cY8WdGJ+yLFIaLjBBCklyUO2y4aO27Z1LJKejcrpTkw72xrOIrnw0gtfwbg==
X-Received: by 2002:a05:6000:184e:b0:37c:d0d6:ab1a with SMTP id
 ffacd0b85a97d-3806121f5ebmr4369116f8f.12.1730233463587; 
 Tue, 29 Oct 2024 13:24:23 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:23 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:44 +0000
Message-Id: <20241029202349.69442-19-l.rubusch@gmail.com>
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
Subject: [Linux-stm32] [PATCH v4 18/23] dt-bindings: altera: add binding for
	Mercury+ SA2
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

Update the device-tree binding for the Enclustra Mercury+ SA2 SoM.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 87a22d2a4..31af6859d 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -61,6 +61,16 @@ properties:
           - const: altr,socfpga-cyclone5
           - const: altr,socfpga
 
+      - description: Mercury+ SA2 boards
+        items:
+          - enum:
+              - enclustra,mercury-sa2-pe1
+              - enclustra,mercury-sa2-pe3
+              - enclustra,mercury-sa2-st1
+          - const: enclustra,mercury-sa2
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
