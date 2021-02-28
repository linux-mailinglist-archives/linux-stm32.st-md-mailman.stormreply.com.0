Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDDC327314
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Feb 2021 16:44:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 684FBC56635;
	Sun, 28 Feb 2021 15:44:02 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A58F8C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:44:00 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id h4so9777990pgf.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kd0YghoHnRn1mBUwhGTbwacmxzju25Ib/4IpfEdWlpA=;
 b=KvkvtAkNI0QKvsovqYsGVX2uMWtYl3mduRmTnCgqZJR7iN2nDYJ8qaNwMZxiGKAbop
 sF9X3S5eZjSs6EKRv19d8JnOivfcFAIAMZQWO6NPG5XTB0tPaf2elzXIiRtBbV4ZsHll
 Dc8kZDfEI8mZj5iTlKBV37btYp4bpqnZC7Mik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kd0YghoHnRn1mBUwhGTbwacmxzju25Ib/4IpfEdWlpA=;
 b=b3gbXRrm2Nlp+4KxHcdUk3Oq8YkiqjP/egPFvPZyP6bfJ9LQT5qfWQsGxbgREH2+z4
 /DOSV3bLMlRt1CmS/JLmMYcXnaUxh3dtK9+Eul63TUAsZ6/rkl5gNvNIXmlK5aIzto7S
 oREqmlwGdTZE48dYckwSS9Esi3v6pwIEMHeTHXJO7xGefDNJQSWYRAA8uWbKMa+ekEu/
 61zj0em8T0FCk9FQ7b4J0XyfxrjRjEpXhsTc1wI2cyCX/hdoSMwm5Ku/cEqirJkQPTmp
 NWTaf0IJhDW4xsof7UHnUhboillVvym4zrvhlNYrSekuO2gwh7EXt4T8tMlYS15fsL5W
 HeMg==
X-Gm-Message-State: AOAM531hyM9Heb5UWemcWwXHN8ICMFhsKsuucYaEhRY6Z09YQC15wCCK
 NgBY3KpmWW6jI+x8G5lEIMMYtA==
X-Google-Smtp-Source: ABdhPJzda2cb80p0BH45zcK4anFLVV7cVoO6nYlRZR16HAIEGs/07fILqqKVlGE3EEPhkcN9SEeitA==
X-Received: by 2002:aa7:8b59:0:b029:1e9:8229:c100 with SMTP id
 i25-20020aa78b590000b02901e98229c100mr11558659pfd.19.1614527039214; 
 Sun, 28 Feb 2021 07:43:59 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id j3sm13522133pgk.24.2021.02.28.07.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:43:58 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Sun, 28 Feb 2021 21:13:17 +0530
Message-Id: <20210228154323.76911-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228154323.76911-1-jagan@amarulasolutions.com>
References: <20210228154323.76911-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 04/10] dt-bindings: arm: stm32: Add Engicam
	MicroGEA STM32MP1 MicroDev 2.0 7" OF
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

MicroGEA STM32MP1 is a STM32MP157A based Micro SoM.

MicroDev 2.0 is a general purpose miniature carrier board with CAN,
LTE and LVDS panel interfaces.

7" OF is a capacitive touch 7" Open Frame panel solutions.

MicroGEA STM32MP1 needs to mount on top of MicroDev 2.0 board with
pluged 7" OF for creating complete MicroGEA STM32MP1 MicroDev 2.0
7" Open Frame Solution board.

Add bindings for it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- updated commit message
Changes for v2:
- collect a-b

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 56b7e0b800b3..255d3ba50c63 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -67,7 +67,9 @@ properties:
 
       - description: Engicam MicroGEA STM32MP1 SoM based Boards
         items:
-          - const: engicam,microgea-stm32mp1-microdev2.0
+          - enum:
+              - engicam,microgea-stm32mp1-microdev2.0
+              - engicam,microgea-stm32mp1-microdev2.0-of7
           - const: engicam,microgea-stm32mp1
           - const: st,stm32mp157
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
