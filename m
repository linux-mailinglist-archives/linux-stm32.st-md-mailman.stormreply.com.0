Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 380DEA01B47
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Jan 2025 19:15:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3794C78026;
	Sun,  5 Jan 2025 18:15:38 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 386A7C78026
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Jan 2025 18:15:35 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-aaf6b1a5f2bso938155566b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Jan 2025 10:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736100935; x=1736705735;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOAsdgxDQEvC5uDcWK+yR25E57Nu26K/3jc3ZbJ9Cg0=;
 b=MHttnT3MPfyOd1U0MTxnsePhQ2IdB/Yh36T6fKZCLuScXwXNtggKnxD35LCXhiLPBo
 UMpuDlDxICEBY/fG6OLOee/EoWkSzlxK/M9lmYj4f0UTMfUG6lGY1g4Cnc5WTl2160h/
 4AEw0KcsSzYnLZ9p+Jzgz9nbhb34TnSx3KL5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736100935; x=1736705735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOAsdgxDQEvC5uDcWK+yR25E57Nu26K/3jc3ZbJ9Cg0=;
 b=ZJC3caDbKP+uuLuAp5Uu11H5TsHJqOjDPbzg/Vsee+AsSFCUS4b196Ygkzoqj4iqCX
 +rySlbqZ1QM5n7rf0lgp0rOncDsRshAylEh7x8UZb1FK4DguTddcFEqYQ5pdBkBLcp4Y
 v5cFgQ/sVBVf1xrO0+g8a4rBrbp3rG2DURBcQ09grTovS6l7wqRvFngiv+yadpj/nYEU
 CnTooW1u7r4omSmvbwsLzj6tNp1+GSqDYnYt5d7B48eHTKM1i5Z+iwA+m2GYWefN09SV
 KoeDkT1stQDzgb9udZVf6fDDWxEkYoee2l37UANGV8EuGocdHQs8fUha7mqdE2UuFmjV
 EerA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTuNSuVVT4E1Pm+8cS4cHKzqGxEPefw279U+BY0/Z91KP80dqBA8Ri6eP9IFlw/36cFAk0iviWwU5NfQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJ+XGNQ5oY1cRpvnHcOn+HPig/ZsZctt4TMBoWfj7rGoKtPbyk
 H2yTG1tfdp6YSifN6kX0lmAI6nCb9zp3g1gN/dTqPQdmvaO5Uku0hmqEWNYdfWg=
X-Gm-Gg: ASbGnctd8au2Nz+NvYFnx7RSkHa9Q2kxWy8Ti+HNOoDjxZDQhhd8yD1rcl4wFOu3JQt
 vCfmeP6AJI+bsZZq+CW83e41DbdxRsbwjg+TvWllBn06Kj6DiZWo8/8uMo4K98z0EIZjbjJQkKI
 e008XTRjO/IlkSxgIOOUiZJS5T7h741iALrbU+tJ00dKDDgU7u2ZLQl0ajNahfMLOmVQjm9LwC/
 aKFyPoCx/kpfrbhchKplmkUhYs2/ilWVjNAD8OvriL+EIA3AnuSztv9bP2U8XNayU+GcnYL6gOt
 uRp2kTguud9RzKgxFZf/0p4N7dnZ8D5n03l5pr2kkzfoBi8sBcwa4kH5S5YjpHW+WPX83c023AO
 +MLvVULvNMrfTxij06g==
X-Google-Smtp-Source: AGHT+IGmgVgc6B2TGyiYFDwVaPwnmHLCNND0P6xPziVSDtm7hEJn68GNvTjYVOhO12g7nBOja7hhAw==
X-Received: by 2002:a17:906:dc8f:b0:aab:a1a8:92be with SMTP id
 a640c23a62f3a-aac080feebdmr5370408766b.5.1736100934660; 
 Sun, 05 Jan 2025 10:15:34 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 10:15:34 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  5 Jan 2025 19:14:14 +0100
Message-ID: <20250105181525.1370822-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/6] dt-bindings: reset: st,
	stm32-rcc: update reference due to rename
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

 Documentation/devicetree/bindings/reset/st,stm32-rcc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt b/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
index 01db34375192..384035e8e60b 100644
--- a/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
+++ b/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
@@ -3,4 +3,4 @@ STMicroelectronics STM32 Peripheral Reset Controller
 
 The RCC IP is both a reset and a clock controller.
 
-Please see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
+Please see Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
