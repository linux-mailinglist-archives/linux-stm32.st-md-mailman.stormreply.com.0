Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D999FF010
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Dec 2024 16:01:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D781DC78032;
	Tue, 31 Dec 2024 15:01:55 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F5ABC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2024 15:01:50 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aae81f4fdc4so1524080166b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2024 07:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1735657310; x=1736262110;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PSLeprPe5FTHWRveLENPgw9n1qZNAvdFfzbO7p/6mz8=;
 b=hkudU8IGQ2NNN9of7LxZ+atGIZWUyOElyLs1cUDkOHxQZ5KJLvCBPNSK+HvNtiEFqo
 fJn3oH+F3qZInxQjgP3EGhlSIGwf/+92AbbhSSKCF0aCVbYl/B/CyqIz4vvsKouqcvNS
 OQbNNsWr5eDV0//T3t/+J+U5uMM6MpEFJQCFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735657310; x=1736262110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PSLeprPe5FTHWRveLENPgw9n1qZNAvdFfzbO7p/6mz8=;
 b=G2Z5PzCocPxNK/FXQ7TBjAhOlOIZgl33pPd23o1TO2aRbtciOQARjN1LUo0naqPDMy
 6fqsVHxX/sgflOa20lwTMvzxxC/iQ9OcSH6QO5V1nAx+4iteM5y+yOKoeHVDlIgt7fvb
 oGzoteSUqqdEO3X5UjFr/4KUiPnx0OReNH9Zy8k2KzIbHDIig5hC288zJZipJBQUC4vj
 rY7E8sceUqvg5P5+psx74aZMr/yuVs5dsswnUunLySCSVXPsROEDOC+zFY/1In45fcay
 P8iW4A9mKBlMOZ0+AnqQE85dp88oFxJJ9n88dF+AfGIvF5Ib6jNUR/Hwwza8ZoQfBhq2
 BMyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9BLG0sTBSVGJID4Is1sOqqOJkjgCdu6ngFXjIvnC+B+2ZCRN5dA2HURt/HkxLDGRXK5Vgs2luRydNsA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyyQYDrHn5tJ3+aHpLNkXzlMnfA1DFB3TjRhvTSKBvARjPNXgJD
 BVpbKAptsNHN+hpClNDPli3O6RZP/eKF3fG1sz9cOecs+w2yTj699UGpg300++s=
X-Gm-Gg: ASbGncsDugsQph7QP6kFuzkugS04K8Wgv1+LKxDZipS8LUubFuawCHirKwLAq06y839
 taToZRy1Ld1RWyf0AoqwRjkPJiLJmZMs5KPm3CnaWGtIWvPDPASkQPGt4eMiyB/OCtu2lwO5Oid
 cr1VEOt8LravOCloYcPzumD/8P981Ckpcifk8P4+74ZfcpjfVXDRyE4rvsihLOzgosaDMx+SyRO
 EyN4NyjGTlUCFt1XKQrS+hwdFt+egSzaJyLvn7gpCX61XWKTm+LH4+hqKqvT7fFxifJ6Iblizzd
 8tNaow6lAFa+swMiWTmGLw==
X-Google-Smtp-Source: AGHT+IGfEOn6eiAOcKUt+G4AdS/vhANNPsxMNquB07uGQCrXQb511fcC05DereMIXHKoyNQ8gZOavg==
X-Received: by 2002:a17:907:3f0a:b0:aa6:96c4:ad62 with SMTP id
 a640c23a62f3a-aac34217fddmr2955209066b.58.1735657310070; 
 Tue, 31 Dec 2024 07:01:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e89598csm1575905766b.56.2024.12.31.07.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2024 07:01:49 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 31 Dec 2024 16:01:41 +0100
Message-ID: <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH 2/2] dt-bindings: clock: st,
	stm32mp1-rcc: complete the reference path
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

All other paths referenced in the file follow a scheme starting from the
Linux root. The patch adjusts the single file that deviated from this
scheme, making it consistent with the others.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index ca75b1972470..e72f46e79b90 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -21,7 +21,7 @@ description: |
   =================
 
   All available clocks are defined as preprocessor macros in
-  dt-bindings/clock/stm32mp1-clks.h header and can be used in device
+  include/dt-bindings/clock/stm32mp1-clks.h header and can be used in device
   tree sources.
 
   Specifying softreset control of devices
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
