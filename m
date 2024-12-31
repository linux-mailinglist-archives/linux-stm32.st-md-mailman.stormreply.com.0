Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F069FF00F
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Dec 2024 16:01:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C37AFC78013;
	Tue, 31 Dec 2024 15:01:55 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CB85CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2024 15:01:48 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d3ecae02beso12254375a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2024 07:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1735657308; x=1736262108;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TfpchHbExO0XW754q8DbjVQ1byQNlSKH4QhxgnPxvYU=;
 b=aJ+yLYBmpSrpbP52dUApN2jWSXXoR62xP+ekhkxACznjpQRQSO26zTyaWrXhv7xFk0
 83qA+stenGNBwZrp0OS5si7KCgxV98sTbCMSsEPEImU/LHWXLkc1Nb02Bf009+9obJmO
 MI4+suTaf1htJpyyFmnswJkdXrTv3y0Hdr9LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735657308; x=1736262108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TfpchHbExO0XW754q8DbjVQ1byQNlSKH4QhxgnPxvYU=;
 b=a3J5nCJFK8tAkiGqYmSbNOTPTbozcpU6nSt07D1TzMWkBYMle3Mmc1ih5bAmAK8Dgd
 S48JBea4E1FYtHQYlE1ZLKB/7QFMWD0arrg5nSZlBKj8zJZ1A5SU4TT9XmtZLFB2VX4M
 QTm5NkrISa8f736DLJv2lOjGR3gAFgVC0+qpQnPeBZe0O+tWYR8YLs4IrAziZ0PsH8vF
 tqucyiuLHvVIGh7K91fJVYzPKLLvZ7PIjntz48FNEWokjWmBnZu+2HK3rBEKnUYrKRFq
 u9sg5K7fMb957m4HhjTxvqjd3w3BGWyEuliwqV2MvQtGTyxYox/X+IY8Kg/Mq3c6H7Ai
 srZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB9n/Y1THsEtf5Sm2LZ9GuL7TXbengUei4oHxt2tP4sA0eWGDhJv40ZVfE7YkQPMDz7PU14jOqIwNJXA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxkuF6bucK5vYbMq/VXsGiAD5210vIR1I5X8CAujZuftSW1HJ4w
 ifL5JRn6FP5v5h7u2RRWZzmD67YEq/WBzjkHJVPBeVHZ/zHG2kPlVegr6o7U6rU=
X-Gm-Gg: ASbGnct0j8V7yrZPPOtfCxDWS40X99JJBeBMAt3gtFZAWwNOpcfnGuuhMPrv1Hax8uI
 fKJQT9jy1IsdKjum82BEtugahfznwbxxgP2QT3Z/CSw19OVoGOgBUJBLbQRxCwS9HRTtiK7geUS
 wG5AtkJDzP0391KVRWj1UtN0l5zFegljXkiu+UHFG5VSAOiIfH9+k8y40Fr9CsFXHEVX/AAlveM
 JmblgBTfPwetpoGV2my/7wQde8dhDlhHVxgJdEpMN6V48WkWVdsHeInB29Ppz7aPWQU38shnSUy
 ALwm0ui4qhI+azNspVcrjw==
X-Google-Smtp-Source: AGHT+IFTYNVf4PANRTY/pECtc8/bJhsdH1GsC3hZP7+Sn/hJKwsBL1qJz0Y+j7y+5zffKEeOjC6D9w==
X-Received: by 2002:a17:907:2cc5:b0:aa6:8676:3b33 with SMTP id
 a640c23a62f3a-aac3464f929mr3338245566b.47.1735657307900; 
 Tue, 31 Dec 2024 07:01:47 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e89598csm1575905766b.56.2024.12.31.07.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2024 07:01:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 31 Dec 2024 16:01:40 +0100
Message-ID: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: clock: st,
	stm32mp1-rcc: fix reference paths
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

The path of the two files was wrong even at the time they were added.
Let's fix them so they can be correctly referenced.

Fixes: 722dc8a1d5c8 ("dt-bindings: rcc: stm32: add new compatible for STM32MP13 SoC")
Fixes: 20107d7328cc ("dt-bindings: rcc: Convert stm32mp1 rcc bindings to json-schema")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index 9b3aaae546cb..ca75b1972470 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -40,8 +40,8 @@ description: |
           = 0x180 / 4 * 32 + 0 = 3072
 
   The list of valid indices for STM32MP1 is available in:
-  include/dt-bindings/reset-controller/stm32mp1-resets.h
-  include/dt-bindings/reset-controller/stm32mp13-resets.h
+  include/dt-bindings/reset/stm32mp1-resets.h
+  include/dt-bindings/reset/stm32mp13-resets.h
 
   This file implements defines like:
   #define LTDC_R	3072
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
