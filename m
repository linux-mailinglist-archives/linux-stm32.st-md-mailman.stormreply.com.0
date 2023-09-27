Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0ED7B0422
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Sep 2023 14:29:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4B64C6907A;
	Wed, 27 Sep 2023 12:29:35 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0B19C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 12:29:34 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-323344eae8eso3583523f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695817774; x=1696422574;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MqrlAO5sztrD1NimOBbmkaeWGCBRbknzZR3MhxUtqJk=;
 b=BhhccI3Yx86aP/+z38R6J9GZRyxqJIHfXcqFabWnA6gOgIhTYzahkQrTx9ohD8aT8S
 3750aGrJmA08JAfcUnYVnDAcCDusJaHPwUUmFkozs3Z8mJ8/i8pPS/piJo+8MdGa8IqE
 4//v/BOHFRuMz6qReyTejKmVsGRFrmJMmAFvqtfjoxJ3+meBQpEaDZJHeuHcFg7pcrRv
 T+l6d0IacQkGE3W3bcCXQakb6DLAzA8CUz3zhrx0drc6lPQdUc/8bJh08FvO0io5AD2o
 eKQgtVJ1ZLMCU7gKOt629YZh5clROsQX9a9uZ6DMDC0/uJMlNzwFNMWmbdVO9+G1+k8q
 y0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695817774; x=1696422574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MqrlAO5sztrD1NimOBbmkaeWGCBRbknzZR3MhxUtqJk=;
 b=Nwx4zbH5DuttvwcHW8i/Pox4KDcka2/iQ3onzwK/4/H1VsgLaVOtcjFXrenma8nTqM
 FgZRq2Eq1dQd/Fg3qrGGJ5ZgRqNxfEW64XsP3KOKRvZHsSeraoJLudBccPyuTgkQWQwk
 +fMyMZ9N+/Ln49WG+F2mPxb7xvjd6A3FDu0l4WQ+jNS4anblShGjsnk+vsrhXnRy9HWu
 TKy1+gQIO2O1HNGIUC1KJUSE0kLymvbKGPiC3013moFhkb1TdTBLgqxH9SqUTXFfNea9
 fFR6FuqkhaNFLBKk0ImhWTRusZfmke5mKuc+aDdoY4BYYb5CEAGfk4AT7UjApQDcWHBx
 s2aw==
X-Gm-Message-State: AOJu0Yz2sF/pRtwkiGUTvCRvdziUM44QiZcSCNtR//kinN0WOtAsU+ck
 JI8/mQr+mZkBoo/ik5xT0YA=
X-Google-Smtp-Source: AGHT+IF5xtLdTh5ebA3MvomjOgILvnz4IhFIHGw6vrUOiVXXmVjun0KXM08k7tob5hnd5+T2RFQvmA==
X-Received: by 2002:a5d:5348:0:b0:315:8a13:ef17 with SMTP id
 t8-20020a5d5348000000b003158a13ef17mr1430106wrv.65.1695817773679; 
 Wed, 27 Sep 2023 05:29:33 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 8-20020a05600c230800b004042dbb8925sm4521218wmo.38.2023.09.27.05.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 05:29:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Simon Horman <horms@kernel.org>, Andrew Halaney <ahalaney@redhat.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 27 Sep 2023 14:29:27 +0200
Message-Id: <20230927122928.22033-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH 1/2] dt-bindings: net: snps,
	dwmac: DMA Arbitration scheme
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

Document new binding snps,arbit to program the DMA to use Arbitration
scheme. (Rx has priority over Tx)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 5c2769dc689a..4499f221c29b 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -442,6 +442,12 @@ properties:
     description:
       Use Address-Aligned Beats
 
+  snps,arbit:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Program the DMA to use Arbitration scheme.
+      (Rx has priority over Tx)
+
   snps,fixed-burst:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
