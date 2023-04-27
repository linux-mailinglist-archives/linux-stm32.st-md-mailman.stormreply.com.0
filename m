Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F09D86F0D5F
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Apr 2023 22:45:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAEF6C6A5FA;
	Thu, 27 Apr 2023 20:45:48 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 932D6C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 20:45:46 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-959a3e2dd27so1077478066b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 13:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682628346; x=1685220346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hf8K+LPV3HpQoodPsHclIndfavzTHfh5H+b7Pu9+qX0=;
 b=lYQb9N0DXJFaYlcVpdVJTsWypegS4pxbOgWG4uYPWRv0tlbBFBKpgdjjuIJ7l89OKn
 MjxoNkkecvtACZfe3IMOjhngU6dFPvHM6Jb0dKqxdqG2fY33lE5vlStJ4DhOLLou9+Oc
 EFPe8U5O53BQC+dflc06JM2/KRewWS9Fgm8wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682628346; x=1685220346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hf8K+LPV3HpQoodPsHclIndfavzTHfh5H+b7Pu9+qX0=;
 b=dSkWCoi3npObKhLxVpmT2xynNLS0UJfb7Pvw4QNMVTng1Wz0lS1QJqfXGGwronHJhN
 ft/bWpIKm+3cH1W+GmFH2tSZd3vDTWwJb62E4GCR+WeQ1BB1MNVT5lmqeJb5Lp9SC+IC
 f6F3Lmqh/YHu+mCH9bVsY+ZlLP1sRQ9cHvH0sPjS2hdnrrcsUZQgklumUw6K7qur/luh
 A3fGg/iph1ARGfi3njJwjo5mqqdlhkgfOSYP9iDEAREWosxs7VxYDQBOlF960Ck1sHrL
 2KLdNCr2k+v4hhhcCAchJdaLfRetooXg1g1zyIMGg/b6uaQZ4gmreJ9r+L4tiCaTtJj6
 FQrw==
X-Gm-Message-State: AC+VfDwXPCp7AMvm+JGnmcVD6uoRAMz/9Wv09ITOXLV4b5gg1rTxKiR2
 NzDlkGSGYRi17HcLe6kk3Lerwg==
X-Google-Smtp-Source: ACHHUZ7f+2fEQbl7Qy1ajgnJooRSCuUwsjTRMFmMCuy0tPNeKm5PO7GL8KTfujgsTrfBLu+ShkBDpA==
X-Received: by 2002:a17:906:9b86:b0:957:758e:df57 with SMTP id
 dd6-20020a1709069b8600b00957758edf57mr3360655ejc.65.1682628346138; 
 Thu, 27 Apr 2023 13:45:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-99-194.retail.telecomitalia.it. [87.5.99.194])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a170906bc4c00b00947ed087a2csm10171360ejv.154.2023.04.27.13.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 13:45:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 27 Apr 2023 22:45:36 +0200
Message-Id: <20230427204540.3126234-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230427204540.3126234-1-dario.binacchi@amarulasolutions.com>
References: <20230427204540.3126234-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-can@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>,
 Wolfgang Grandegger <wg@grandegger.com>
Subject: [Linux-stm32] [PATCH v2 1/5] dt-bindings: net: can: add "st,
	can-secondary" property
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

On the stm32f7 Socs the can peripheral can be in single or dual
configuration. In the dual configuration, in turn, it can be in primary
or secondary mode. The addition of the 'st,can-secondary' property allows
you to specify this mode in the dual configuration.

CAN peripheral nodes in single configuration contain neither
"st,can-primary" nor "st,can-secondary".

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../bindings/net/can/st,stm32-bxcan.yaml      | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
index 769fa5c27b76..de1d4298893b 100644
--- a/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
+++ b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
@@ -21,11 +21,22 @@ properties:
 
   st,can-primary:
     description:
-      Primary and secondary mode of the bxCAN peripheral is only relevant
-      if the chip has two CAN peripherals. In that case they share some
-      of the required logic.
+      Primary mode of the bxCAN peripheral is only relevant if the chip has
+      two CAN peripherals in dual CAN configuration. In that case they share
+      some of the required logic.
+      Not to be used if the peripheral is in single CAN configuration.
       To avoid misunderstandings, it should be noted that ST documentation
-      uses the terms master/slave instead of primary/secondary.
+      uses the terms master instead of primary.
+    type: boolean
+
+  st,can-secondary:
+    description:
+      Secondary mode of the bxCAN peripheral is only relevant if the chip
+      has two CAN peripherals in dual CAN configuration. In that case they
+      share some of the required logic.
+      Not to be used if the peripheral is in single CAN configuration.
+      To avoid misunderstandings, it should be noted that ST documentation
+      uses the terms slave instead of secondary.
     type: boolean
 
   reg:
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
