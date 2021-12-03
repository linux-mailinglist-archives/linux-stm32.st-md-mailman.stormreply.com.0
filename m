Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEF3467BDD
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Dec 2021 17:54:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0916BC5F1D5;
	Fri,  3 Dec 2021 16:54:58 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFC5FC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 16:54:56 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id b68so3423524pfg.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Dec 2021 08:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=isD7Q48pSZyTSxUPY+SX0kuqDdCvE+4V1M1EMjA4pu0=;
 b=p1UDPhfrtzIFaMGZYqCBKPhDtmQCWiWZXBd6rU5SQTJH4iPujxYVEcRAuGxUT5ONjN
 YhhdWkoJ8YnG6K37IJCP6WAjAl7MVHCoxW8wxpr92Tvl74LYQFKrHJAnCY6wQvoB/E41
 IM35EKsmatWXn+aFTfWLQkCA0m3BMENUTLKNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=isD7Q48pSZyTSxUPY+SX0kuqDdCvE+4V1M1EMjA4pu0=;
 b=p+PLiF5HueCbysN3WM1dJg1LfHYPKfXp3uGzkrL17KN1S7Jytv+Ntih8FFUgHaMUVk
 pIYyXGB1s+6cLr7kA2hqwtOvHue0SSJTdcSicjXWZReZ5iVcmxmXa9vL3XP/F8u417gU
 WmzKoisTAO27itrnIm7q0SEOiOA1Ri6GQNrNSI527o3EZEnvjuBaLUSuDQe84GnmxmJ0
 4wXm6k32ox5q1DPmKhHKgFs+Ce5SpWzC3vIfFEGNW/rnEGRxEY8A8KFj6Bhn8LxTM9D3
 lD8LMalQP1lnbVd/l9S12YVqg4ksxiU7QVSg5zZApXKIB/8tmHaagCG8HUzURXzIguZ/
 QLag==
X-Gm-Message-State: AOAM533pbEuzPddZYeLqu02HGxlWCqENH8UUiINTBaX2Su9KBmUrpxB+
 VTEt/cDaA8h5Iv4rScByZEv98g==
X-Google-Smtp-Source: ABdhPJy1iMboAef3tWtVfwYbSEF9CS9tsF5faLwxCGXQL0UkpRa1KEgfFQVcyKXdVzVwMRCGpFVL0g==
X-Received: by 2002:a65:6799:: with SMTP id e25mr5362073pgr.293.1638550495475; 
 Fri, 03 Dec 2021 08:54:55 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:9d21:588c:4f26:8400])
 by smtp.gmail.com with ESMTPSA id s72sm2783693pgc.69.2021.12.03.08.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 08:54:55 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  3 Dec 2021 22:24:34 +0530
Message-Id: <20211203165435.8042-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203165435.8042-1-jagan@amarulasolutions.com>
References: <20211203165435.8042-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Rob Herring <robh@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/3] dt-bindings: arm: stm32: Add Engicam
	i.Core STM32MP1 C.TOUCH 2.0 10.1" OF
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

i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.

C.TOUCH 2.0 is a general purpose carrier board with capacitive
touch interface support.

10.1" OF is a capacitive touch 10.1" Open Frame panel solutions.

i.Core STM32MP1 needs to mount on top of C.TOUCH 2.0 carrier with
pluged 10.1" OF for creating complete i.Core STM32MP1 C.TOUCH 2.0
10.1" Open Frame board.

Add bindings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes for v3:
- collect Rob A-b 
Changes for v2:
- Fix line-length warning 

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index bcaf7be3ab37..b07720ea9611 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -77,6 +77,7 @@ properties:
         items:
           - enum:
               - engicam,icore-stm32mp1-ctouch2       # STM32MP1 Engicam i.Core STM32MP1 C.TOUCH 2.0
+              - engicam,icore-stm32mp1-ctouch2-of10  # STM32MP1 Engicam i.Core STM32MP1 C.TOUCH 2.0 10.1" OF
               - engicam,icore-stm32mp1-edimm2.2      # STM32MP1 Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit
           - const: engicam,icore-stm32mp1            # STM32MP1 Engicam i.Core STM32MP1 SoM
           - const: st,stm32mp157
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
