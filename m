Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD019FDB05
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2024 16:00:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0805C78032;
	Sat, 28 Dec 2024 15:00:49 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BECE0C78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 15:00:47 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-aaeecbb7309so625274766b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 07:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1735398047; x=1736002847;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zGjy0+pcVkOcyNsRikjnUlsDE+kBpL3hB1hR4GAE8IQ=;
 b=Sa8V9stfMZsni/Wz+FqbRyDhiYcaq/6wYpS/t23pnhodMg9Nx9/5ulz4pnedzWESO8
 FnOFIJSHz6a58JTfzgtgqFgGHcO/MbYVKmsv9LIUu4ejFQ32G46xuPdMpjf2Be/XS9yN
 OTyg7mNmovVkhCY2kDRKblVeV9QwL+SRHPklg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735398047; x=1736002847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zGjy0+pcVkOcyNsRikjnUlsDE+kBpL3hB1hR4GAE8IQ=;
 b=gfokSR5tdjZmN1ww4ydgUHQmiR59DsmVzDOPVQxZUYBAvNQuj01N8WO/HJFAUkXSdi
 MmXCUIn1cnxWz5T9a35ktiqjzkU3wHMXnRH8ip9fVXS5AyLTgvPBnyjpNYpbTxs+5Nza
 9pE0W8i66a2CeAdj3Z2FotWYNOJOxQ5vnpS4hGFSEIoWsrEXy5hhc0PBxkg/wxDnAHFq
 uStm5bsmBELShUGeviuJVQmfNMmZ7HFRR/r/yKFTjOQh/H0zv1kD9f5j4sDJqz2laphv
 78oWI4fFt90vzLxrdkppJTJBkQ1vYWtOOb5Mnmjbrk+M/Fs8K4jhrfSApObjwfs8oLmf
 SCow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxXaM8ATw0hUD1uLVyKNG2ATvLIqxc/2+oDqd8tKfISM2V3HX8J6XaX41OTa4j8pkobt5N5CXwken3Wg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywxcfh+MApAC/iZXRoJ1Jlp2Zi/XV44q2ebRn/92LIETu0VmqHx
 nJRMcDlqlYEJMqkwL/BPmKsHMDBO1HP7mcznS32Wpw/SGfd5e5o/ds6itmoB6dA=
X-Gm-Gg: ASbGncv1j6HV8d50XY1rXaqkq4GX3VfpiAiZK63Xg4i9pccfqesY7zH0BYEDt9HYJaG
 HLK3eY5rWWb3ng1MlKnpqRIbZ5d+0c1hIu9a7UBDoj5OmGE5fDXyjErB9JnelQKdp5gGELKvzIx
 vp8qvw3Mh0O8EAel9nB7jTGJxzsJ+CrNH8qA4SkCwzl3C50sypLh06z0AHjiTkQ0diDY8q5Rzjd
 FijBKNS6aMAJMSTNIiM1nzTB8XhJYvV6C/fVpzFWAddtGi9SdRqEKxITpMd3kPNQrk+GXJBQxJD
 VI7vg5LW+odV3i9BCd96kQ==
X-Google-Smtp-Source: AGHT+IGn+STomeh91UKdY7nI+qTGSbWPadCuY71lDdmY/fsFuuR1EUm5XjU/DazYxX+1lVKGryxiiw==
X-Received: by 2002:a17:907:9621:b0:aa6:6f92:74b1 with SMTP id
 a640c23a62f3a-aac2ad7fa01mr2850887066b.13.1735398046567; 
 Sat, 28 Dec 2024 07:00:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e89514esm1258974666b.74.2024.12.28.07.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 07:00:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 28 Dec 2024 16:00:30 +0100
Message-ID: <20241228150043.3926696-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-can@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [PATCH] dt-bindings: can: st, stm32-bxcan: fix st,
	gcan property type
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

The SRAM memory shared pointed to by the st,gcan property is unique, so
we don't need an array of phandles.

Fixes: e43250c0ac81 ("dt-bindings: net: can: add STM32 bxcan DT bindings")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
index de1d4298893b..c7510b00954a 100644
--- a/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
+++ b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
@@ -63,7 +63,7 @@ properties:
     maxItems: 1
 
   st,gcan:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
+    $ref: /schemas/types.yaml#/definitions/phandle
     description:
       The phandle to the gcan node which allows to access the 512-bytes
       SRAM memory shared by the two bxCAN cells (CAN1 primary and CAN2
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
