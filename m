Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2379E6D97
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 12:51:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13A13C6DD9D;
	Fri,  6 Dec 2024 11:51:30 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95C28C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 11:51:22 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e3990bbe22cso1912918276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2024 03:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cornersoftsolutions.com; s=google; t=1733485881; x=1734090681;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q62PPXsE+VSeYwcr9qAvv8yZnUeLKqIqrisYrdVxhtU=;
 b=T+tjLxwhS+68jbQ7vev8VkFfpqqaDYMReu8uwxDFhluk0e2J8GTjxWlqGJFIvBN73o
 sTzfM31sfn7y7h5ADEIWR6+vn1dUL7E+LrE95U4dI0DniTteVEPK96wkGi38oQpRuvti
 /EJhiTL+5XDhY7ts3PMNhbi95z3vzOIeJekCKD9wzGnER+BnOR6RompDZJT5rhEW89ct
 0p+XiwRxv6OZIUALwoH6TRM2CtnCS/dfQfHOJATlldQflM9B8OWuHkNTzciD33fo6xQi
 4+s4+HTvX0qCwprXwMmFV3mBIG1Z/UaV+8zsPMO8pU7HnkQ938T1O1zJULv4gd0zCP5T
 Nz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733485881; x=1734090681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q62PPXsE+VSeYwcr9qAvv8yZnUeLKqIqrisYrdVxhtU=;
 b=s8LiMYwsCQF+l0ifNYW3OVyNW/CRds+bh64RcNtKFPvxvG5OOwW+hqcN9sDind0PnU
 Turb/61x6kA7FVehAOY+lxlhWQ2Zkzy2bp2uSdhdgIplbe05Q6Z3GtO6z3ugVYgXNOcV
 gahKx2PJNjjkxubJUWlB/JIGvaCHAwvBBLta0rltTkxaaIvFM9kWXxJgT+5erJmRWV/e
 SyeloAf37xduiZ4ufwYOhtJyAOzC3/tJAS/UiGhD8ciFmizMKwbWCVIlzxG9NWsxuwec
 dvfdkgdxADTRY5XBfX1OOq85MLHONYEZThIa+ptMFUFl83zcBuiypxZl1QMEczMqEuOL
 LJ2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqcife5jFEPAGyL5IngtTzlOthxfaxDz8z8Gkk3yloYdf6lbAUZwdu+fo43shctmIe1IRZPtwhHVVVGA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzKvqHkvqeE1stcIYj+kwtStd+DMYKOfvRL/wkElGG1lwRC2AMI
 yeC30roGMBJZE6Tkltz/TzLHOs/5VW3g5RkafF6XC3FeSEC8d4bm/foiUSBJxKI=
X-Gm-Gg: ASbGncuaetiMjIWkFFl1EkvtIQ2d0IBa0EQeIXpgv+TQePbRrEvOGx2RHW4kxVr1qEq
 NGUH1aGZA71qTWl3GFUuoaxJ20P8/qVeeH5UEfowGJ23hRmxSnuMq9zt3G6c4MjjBaNomgOiaZR
 XR83SHtm7rexWAz/YywPmaSDax3LvhZp/I/XGdXSo6Fqv5QA+Zawsvil2ud53rOILwo7isYtv3O
 qTRodRoAAQGioGBUiO+5F/jvUzNOcBbMMf8hM9vgaQ142TLDDLOvZqaDYr+qY83m0tW3ar5kODr
 i0lBodC1BvuCLeR36iBUSJiUI68=
X-Google-Smtp-Source: AGHT+IG4eyt1sQPkyNP04ZtSf+u7M13/3ucraXNd9uqXuxzTv7vxnzMKhLqN6poDe47NCkgRh5GBaA==
X-Received: by 2002:a05:6902:2388:b0:e39:787e:d9a with SMTP id
 3f1490d57ef6-e3a0b786147mr1906937276.53.1733485881356; 
 Fri, 06 Dec 2024 03:51:21 -0800 (PST)
Received: from ken-engineering-laptop.tail1e0d8d.ts.net ([47.196.152.243])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-6efee2fc130sm802467b3.4.2024.12.06.03.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 03:51:21 -0800 (PST)
From: Ken Sloat <ksloat@cornersoftsolutions.com>
To: 
Date: Fri,  6 Dec 2024 06:50:18 -0500
Message-Id: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ken Sloat <ksloat@cornersoftsolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: dma: st-stm32-dmamux: Add
	description for dma-cell values
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

The dma-cell values for the stm32-dmamux are used to craft the DMA spec
for the actual controller. These values are currently undocumented
leaving the user to reverse engineer the driver in order to determine
their meaning. Add a basic description, while avoiding duplicating
information by pointing the user to the associated DMA docs that
describe the fields in depth.

Signed-off-by: Ken Sloat <ksloat@cornersoftsolutions.com>
---

Changes in v2:
    - Remove redundant comment regarding dma-cells val
    - Reference bindings doc for DMA controller

 .../devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
index f26c914a3a9a..b7bca1a83769 100644
--- a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
+++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
@@ -15,6 +15,16 @@ allOf:
 properties:
   "#dma-cells":
     const: 3
+    description: |
+      Each cell represents the following:
+      1. The mux input number/line for the request
+      2. Bitfield representing DMA channel configuration that is passed
+         to the real DMA controller
+      3. Bitfield representing device dependent DMA features passed to
+         the real DMA controller
+
+      For bitfield definitions of cells 2 and 3, see the associated
+      bindings doc for the actual DMA controller in st,stm32-dma.yaml.
 
   compatible:
     const: st,stm32h7-dmamux
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
