Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB4A01B49
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Jan 2025 19:15:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E637AC78F6F;
	Sun,  5 Jan 2025 18:15:38 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17293C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Jan 2025 18:15:38 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5d84179ef26so21303552a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Jan 2025 10:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736100937; x=1736705737;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ngcCwmTO+RIG/baergO/2VLeRq3P88V5Zllx9oRRwrs=;
 b=G4x6mwu1XmnnZCkHSuVfwhuGI9IXmoEYzoEQTaA0VD/ykWgjefZy6cHJg1p82M2CEj
 iN0B2+lbbvmS6+lc0174L5r3j2ivMEP4Xgf+xNw6zO04+PQ5vfhdR5daAyQSP5O1ifme
 fy2Yg/9d7z/83mWfS/JQ+txJ8eRd/FZH4wc0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736100937; x=1736705737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ngcCwmTO+RIG/baergO/2VLeRq3P88V5Zllx9oRRwrs=;
 b=UuuaeC1TVZE/6smn2q8QtIsrRU/xeUThiLNWyjHqr4j+zTlFlPP2TWI69bT91bIDAT
 wL317YJ9K3nCyaUbfF7M7IDvmyCDxUMHVLQpG4GMslsRG9YdD895mWb3HnwLcfdfzjUj
 bDHibY93lhsTY4AcOBj5RRCoQcvcNVsB4QMutNfUqUhHIzPWZCFg5ViOnzbAi/gtAOXf
 p/9brab2resZlXQkNUKTs19imvlmFtZYPPXKLex8yB0BRSm6nqdrcYtnnbqMMXB92vwZ
 HmkPhvO+CNvObCSHYANTiSA6lqBnmFqRFqitWZvrrB6o0jJiTpGebEkOMY7zwN9CNItp
 wIvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaQTergpfsn2QLVSha4HkRxYNgNK/ZXfJHOfzFPI+lR8LHVLX6yMDIdB0oo6NT/ZqHwjG7O21LtDDJIg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwobxShSgDgX7CILknnl7Bqtkoqc1aRSo4TyvaX7aX8Cy9J9vGh
 R8LMfgEJoPIStigo/5pI6nwAW0UIgO6PKPyetn2c97jS3x8jl+Bs5kcqejlcA38=
X-Gm-Gg: ASbGncuN/FB0TwBKWGr4Y/H8mvH/JmOAsj5O+s/4TJLad8ecqYmNSoli4g6Xvp4lLwK
 N+xad26hM/cMjkAXyjsTAEMFWv+BMnsVihioS/KDTPLHmUolMjq5uumNBBhocfVUPNf7RIzv76D
 H5gF8utfkIrmwTHILbY+wl5GiyA8LI2d9OnB6T507+5VrZlu+03omvFvZMUaQ4NQUTA+cWw+YJ8
 S7RZrV1FV5JFinrnF2jBDADIQzR36dURTI/4v0mN7SuDAQOeuUJaai/d/5d02vdtFhX1Bn2TtdH
 UgyU0XlnlloQXIAH/QsYLiRVRAlRM5aR6sWTkGYg2+DZpYfOb4XKEnNjbqcIt7LrmDCHthppYx+
 h4IbkT55apcC9So2RiQ==
X-Google-Smtp-Source: AGHT+IHxEDK9nG2Mi+Pm0wOh++nf130PTCB6/hhMGClugIlI0HI6FjgJGvhFReNL/vJEU6H89u69cA==
X-Received: by 2002:a05:6402:4305:b0:5d0:e014:dee2 with SMTP id
 4fb4d7f45d1cf-5d81de160f9mr56356151a12.27.1736100937450; 
 Sun, 05 Jan 2025 10:15:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 10:15:37 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  5 Jan 2025 19:14:15 +0100
Message-ID: <20250105181525.1370822-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/6] dt-bindings: clock: stm32fx: update
	reference due to rename
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

With the conversion of Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
to JSON schema, the reference to st,stm32-rcc.txt is now broken. Therefore,
let's fix it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 include/dt-bindings/clock/stm32fx-clock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
index e5dad050d518..b6ff9c68cb3f 100644
--- a/include/dt-bindings/clock/stm32fx-clock.h
+++ b/include/dt-bindings/clock/stm32fx-clock.h
@@ -10,7 +10,7 @@
  * List of clocks which are not derived from system clock (SYSCLOCK)
  *
  * The index of these clocks is the secondary index of DT bindings
- * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt)
+ * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml)
  *
  * e.g:
 	<assigned-clocks = <&rcc 1 CLK_LSE>;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
