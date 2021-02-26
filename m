Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EED325DE2
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 08:04:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AEA2C57B61;
	Fri, 26 Feb 2021 07:04:04 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AC12C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 07:04:02 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id o38so5663818pgm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 23:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H5ONZrvpdGLBeEhP6dKpELUCZIs/O1Jms+ZGZ6m8aRE=;
 b=aL/RX4iF+lAsGmuu8/h3m/g6zn1OpiBbgiaRvlCad1bFGvJGUfoe+2ycg26HaBalse
 Gsw8WzGl6pnGuUhjoej7BTef7XuPuOdeNL9tW2fax1WFBEgHAdL/WoOubQEh5nzpe4CM
 O7TwCMvb2lZtHO2MjqFDrKL3itgVTCz5XA5G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H5ONZrvpdGLBeEhP6dKpELUCZIs/O1Jms+ZGZ6m8aRE=;
 b=eDAcSXdWpQHMbrJDqpGzQhOWRdCiRay+nk+zAFzTFkjvO1ZsnpxfpcknOt++nKkZoW
 +Ahf2n+6MqG/vHUMqJHymqwP5xDA7FK4gBE7srsxjzHB8HkKCcXOEg271aj7aMcFKX2W
 J/EHhj9NHphsTRCWvgP/dMDwByDQTdbHO0me+L7iQmYMulqGrQT0BJKoB3QyuaadWxGL
 UHlLKISV7VDtd54C+AnCKWPjWLTmh4+CZ0jgocSiD9B+XvFZMp/96ksw5C+aZAdlOPJR
 NjO5fn6GwnDOBZyxQ/zVpqsnAUuPk1+4+zW/14BN5DFl1x+maxBsRq+RgON2dc/KfJAT
 evKw==
X-Gm-Message-State: AOAM530q4fx3/57r8Jbi5BDKUiHiNwmu7qyVtQKCvMW1YCZ467RSG23e
 SFCmdop9+No4ArZXPuklk+xjnA==
X-Google-Smtp-Source: ABdhPJxx8z91KvufB3lW59XRA6jNw4jec5ae8E8yWQhj2M5jtLWHmpJmAUE3uraSNBQrsOBUJiGnxg==
X-Received: by 2002:a63:708:: with SMTP id 8mr1692787pgh.277.1614323040857;
 Thu, 25 Feb 2021 23:04:00 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.220])
 by smtp.gmail.com with ESMTPSA id f7sm7592156pjh.45.2021.02.25.23.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 23:04:00 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri, 26 Feb 2021 12:33:03 +0530
Message-Id: <20210226070304.8028-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210226070304.8028-1-jagan@amarulasolutions.com>
References: <20210226070304.8028-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 09/10] dt-bindings: arm: stm32: Add Engicam
	i.Core STM32MP1 EDIMM2.2 Starter Kit
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

EDIMM2.2 Starter Kit is an EDIMM 2.2 Form Factor Capacitive Evaluation
Board from Engicam.

i.Core STM32MP1 needs to mount on top of this Evaluation board for
creating complete i.Core STM32MP1 EDIMM2.2 Starter Kit.

Add bindings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- new patch

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 3e45516403ce..01f595b8ae1b 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -67,7 +67,9 @@ properties:
 
       - description: Engicam i.Core STM32MP1 SoM based Boards
         items:
-          - const: engicam,icore-stm32mp1-ctouch2    # STM32MP1 Engicam i.Core STM32MP1 C.TOUCH 2.0
+          - enum:
+              - engicam,icore-stm32mp1-ctouch2       # STM32MP1 Engicam i.Core STM32MP1 C.TOUCH 2.0
+              - engicam,icore-stm32mp1-edimm2.2      # STM32MP1 Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit
           - const: engicam,icore-stm32mp1            # STM32MP1 Engicam i.Core STM32MP1 SoM
           - const: st,stm32mp157
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
