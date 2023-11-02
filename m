Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B91867E1CFD
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 10:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75B09C6DD62;
	Mon,  6 Nov 2023 09:08:31 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32641C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Nov 2023 19:38:02 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5b383b4184fso16225547b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Nov 2023 12:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1698953881; x=1699558681;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+YxDo5I+EX0yrxCfQAZ7+uuLIS/24nsDH11HDbkhlEo=;
 b=qYDfCfhtSfY6b0mEC5jTg0MbJuELLQk0BHrBwYJXLGetEFpudj4aG7S/08C0YG2axq
 iispPDxli+woOn0S0HZ/UiWBgXy3RHUv9XCOWrLLbCm8PRjIOWu70OMqkGB3bfxKFxLR
 cQPNhYXItNYAlFY4kdOb5EMzjj8auGD8uoROA3fHe+RvOIFPHGaWDWEece+Id+ri02Y7
 jd5nQPCDdGnUdwRa1VevDbmmax35XNLDR5Q3NfThabE//AOwCMUuhFWIkZeXv5iTVyrF
 u7viC/j+pZ77kR8sERJ2TjC0sgHN7Luz/QF/YJqdxtQ8nS5InNx3p0w/E+zwhcXhhq3a
 Dp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698953881; x=1699558681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+YxDo5I+EX0yrxCfQAZ7+uuLIS/24nsDH11HDbkhlEo=;
 b=uH4ea/5/jA4HfNvpkttLfUgJJSR8DfCnzKgWNBgvKkLq5CH8CEovNwUFZxDtUl5XID
 kA2nt+FyWLAkqIF/bBJmTDcOI2kTQnmVB9xh+vGWvlGwQuhYuhQ08zJ05RDw2uMciJqX
 bCXoKjkTBWeQwbVsrs52GHqMHHVH0EZQUwHoaBUO0Y4OgoVA4W4dERdiYHrlYm+f1qyO
 mt86ZNSz17J4WwpsDOwWSLRQ2I+MaHEkHng3WAqehsWUBTUHtR4q9n7j/S05+K7ie2H7
 BI7TAwEnSBai/do/j9V94G5ur5fNX715vylziqseqMxyLCBNKLj+MigMHeqTw0MCpQIX
 o2nA==
X-Gm-Message-State: AOJu0Yw+G5e8JjWEqCkma3znI1Ug2QjLoCOzFveihwiC4FmoB1RAl0Hh
 ACZZvG4L8dsqb/6wNYkFxj+kpQ==
X-Google-Smtp-Source: AGHT+IEZoJ1CRKlf8Tf6WDEq6K7gFBAfOJEJb5tFuGsIrr/px8RBoV3gByLjxFR9jKsU8noJVGElOw==
X-Received: by 2002:a05:690c:ed0:b0:5a7:b53f:c304 with SMTP id
 cs16-20020a05690c0ed000b005a7b53fc304mr883688ywb.37.1698953881190; 
 Thu, 02 Nov 2023 12:38:01 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a0ce90a000000b0065b260eafd9sm30654qvo.87.2023.11.02.12.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 12:38:00 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu,  2 Nov 2023 15:37:20 -0400
Message-ID: <20231102193722.3042245-4-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102193722.3042245-1-ben.wolsieffer@hefring.com>
References: <20231102193722.3042245-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Nov 2023 09:08:29 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH v2 3/5] dt-bindings: spi: add stm32f7-spi
	compatible
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

The STM32F7 SPI peripheral is nearly identical to the STM32F4, with the
only significant differences being support for a wider range of word
sizes and the addition of 32-bit transmit and receive FIFOs.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 Documentation/devicetree/bindings/spi/st,stm32-spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index ae0f082bd377..5754d603f34f 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - st,stm32f4-spi
+      - st,stm32f7-spi
       - st,stm32h7-spi
 
   reg:
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
