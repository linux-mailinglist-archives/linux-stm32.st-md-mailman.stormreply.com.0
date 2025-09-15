Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BADB587C2
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Sep 2025 00:46:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69C04C349C3;
	Mon, 15 Sep 2025 22:46:26 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A289C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Sep 2025 22:46:25 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b07d01fd4fbso487928266b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Sep 2025 15:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757976385; x=1758581185;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=13DnP3wRqU+zsSJbDDW+krsmHK5NNVJV3DHwW0NPTaE=;
 b=Qdh60eadjWKE+ypCJCDdEXZgWY4Gp7Tj9y7VM3vL7T2GtuaUar5QUyDEO2vhA0ZL1n
 dK/44YyDsF5fG6TROZnzBVeEnEFVTIK074L/CBATKv0FpRgmXSM457CNA12zSZp9fnuG
 CoZl2hSm7L/IXugzNnxBe2RJ6uq2+crnamnG2pvgegg0I1LOrdTJBR053BQA9/9IKp0V
 4w6tRIL9gNSHlV/MjX6SEtWteCn4WX6dL8YQ7ecmaSQwqbWXpljRMU3/CndfjwdVGxwK
 DFvxYXXrn1sq40Bf3O957Vqf7bz3/2ngKJB2NJJGEs2k5fYqR2cRgX2Up3NmE/qExtx8
 n4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757976385; x=1758581185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=13DnP3wRqU+zsSJbDDW+krsmHK5NNVJV3DHwW0NPTaE=;
 b=UeLVDZBJous4JcaD+PbbOlTPSsjpJgg3hCiGzcK0+l2/F1meW4FUtgg/jz9O2RVnCo
 Cj/jJzqr7S5f5G0VyBZjFlPV6yGPZoTVmG/wu4UTzVr2ob1WLu977pMYZ/cVzFQNH7z0
 l+CGV8zfc3GFTkH3scKGW5y1BgS+XujpNPGW9HSOHSJqmU6jJz0yuG0nmxXomiQCAaf7
 agGOM48ZtTsUpCnPZ0KGpDUR1JmQ/rxxnVNQWH0XnNYXnvmdaGsO0+xGkr7qE4fcztKV
 he5lpVK32C3DsUpCvmwq6t/nUNqcs230eNOqSEgtFUPd6LpAP1uRoGpcKqEyootGvJrh
 srGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSPlKObHhamCbkfy9Hn9AgpjDUtR9B2vvfL9NVPZqUpOUUgfVxOLaud9d5V2tUvw9/YlSE3/3zScu+7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxQCYWUhKtg3Cv4hvK1KetVAbf2+rAwB0I8OBDz+f8cIBLHrWwi
 db7g7PCxncRRcZ1KbveDaM6KOoLB69kBjopTibrlkbyhD1pkcJcQlTE=
X-Gm-Gg: ASbGncurgUJAp3K90loe79r04B8xwlfx86NmOGyfZduQCotKIi5/iQI5dLihCxuVL/b
 NYC6zQK8cHUe9azmztzJp103xFPIe/2qQYxjeYNq3Pp82l9XW3GMUwKLFHcM8ohIoVKuT2YioVV
 cwqZ0JY2c4fvgibcRjabnOLJyeLGyIffVgyj1V6mLWVArwsl0/WjE6UOIhbqK9nvPRRWCVoKVTx
 iIZSSitS25bqr6qX+iECGkNAmmjppEmM4W0KaAR2ZTyRROSjlLsgWgM2Xor5kYhKVxWxXPFumw8
 akij8UQoW+VshQ7xu7TrYrV2CDEXhy54S0RtWZKoZmyzFNBvu3lA83npkIiQL5IDxNHi83QNKUK
 EOvuTHut90EgPUtzjKX0TdZr6V4t1fT3SKDM86SiEKhdQOoQ=
X-Google-Smtp-Source: AGHT+IFC1RDAQdftftflM3IR9GIxbYxiAqxOMxHqEUoMHehF7YawNWtyqMfqbQIPOxJCVyY9vyzwnw==
X-Received: by 2002:a17:907:1c9e:b0:b04:5385:e26 with SMTP id
 a640c23a62f3a-b07c37a7fcemr1575363166b.58.1757976384468; 
 Mon, 15 Sep 2025 15:46:24 -0700 (PDT)
Received: from localhost.localdomain
 ([2a0d:e487:214e:a6f2:7d6e:32b1:d615:2ff1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd5bfsm1011153366b.63.2025.09.15.15.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 15:46:22 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Date: Tue, 16 Sep 2025 00:46:11 +0200
Message-Id: <20250915224611.169980-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jihed.chaibi.dev@gmail.com, krzk+dt@kernel.org,
 s.trumtrar@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: stm32mp157c-phycore: Fix
	STMPE811 touchscreen node properties
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

Move st,adc-freq, st,mod-12b, st,ref-sel, and st,sample-time properties
from the touchscreen subnode to the parent touch@44 node. These properties
are defined in the st,stmpe.yaml schema for the parent node, not the
touchscreen subnode, resolving the validation error about unevaluated
properties.

Fixes: 27538a18a4fcc ("ARM: dts: stm32: add STM32MP1-based Phytec SoM")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 .../boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi b/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
index bf0c32027ba..370b2afbf15 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
@@ -185,13 +185,13 @@ touch@44 {
 		interrupt-parent = <&gpioi>;
 		vio-supply = <&v3v3>;
 		vcc-supply = <&v3v3>;
+		st,sample-time = <4>;
+		st,mod-12b = <1>;
+		st,ref-sel = <0>;
+		st,adc-freq = <1>;
 
 		touchscreen {
 			compatible = "st,stmpe-ts";
-			st,sample-time = <4>;
-			st,mod-12b = <1>;
-			st,ref-sel = <0>;
-			st,adc-freq = <1>;
 			st,ave-ctrl = <1>;
 			st,touch-det-delay = <2>;
 			st,settling = <2>;
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
