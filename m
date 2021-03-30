Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA634DE62
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 04:29:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B05CC5719E;
	Tue, 30 Mar 2021 02:29:17 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F15DC5719D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 02:29:15 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso6143668pjh.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 19:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XKGtGSsjwoHtJFr3M0CNb0hFT3328bYsnKTNhdz1+J0=;
 b=KCUUKPoEkJSxEAY+pq0+lHepheu2iead7MOhXCLlUWFZATTIGIezl1oyYDl2XyzBW2
 nMWduP5Z+ElmbTF6ta4y9euJjqLAQKWX0ICYibeZoGbKiDvtKvfmLfw1yva9hmRw5wNc
 Cjgqz3fbddFbJ1U+bEAR3+64q72hrBkVb5MeUmMHR8BZ73ukt72e82Xup+D4vPCZPVkl
 uGGjYuSgJ1eOig08HKufxtz3PjDEg2BfBP6BMOmWRX0mwDiVbfrhOsbiyeZwcdBlSQSE
 3hlkgoPojKk4+//cf/DWgULq4AY9L4Tls2DYj9CVPkeKZ5U28VRXeDSy6EkAdgLg0FT3
 wB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XKGtGSsjwoHtJFr3M0CNb0hFT3328bYsnKTNhdz1+J0=;
 b=iye6GkxiwNh4XYIamxUkQDKudTYtk0K9mhkKhutZRhyi6DRvkudR/vq3BNhDHSAN5c
 /GoZOyM/YnVp9A20FdcOqo/MrPz0blRyV26UhgwkCO2pZyK5WBCJ1GGzFNnc+eLBgrCb
 fuMPSfYI6TH5Fh9zIsLjrOraTxc+VIuazxVyJQEMqgTEiWx1IJ8T/0c6pICtV5BFJc8y
 pHha0/nWBjOzrSlCdrXdiPzxItW0MB+EJc1GyaQa95Q9YDxsilSkaZdkDtVmrTUFGTt5
 sGC/kUkVbWXlQoH9/G9h2lBS6XdrUIEA/NSYeNIczxkxPgbKdXFaAIeyIG3cPmgPJquy
 rx7Q==
X-Gm-Message-State: AOAM531FJe+0IoJd2i5lOxSDADdw251OzGjp+vQ4XSOCXphDw5es7Y9/
 muB/Ae4mi2G5EDLMI+Elq5s=
X-Google-Smtp-Source: ABdhPJzdSx7869JvXOsXcy/+RGdQeHVpD2NpRnN6n/+s3hjGKuhnPU67L9sUEA7gWa8XR26TzckNpw==
X-Received: by 2002:a17:902:c40b:b029:e7:32fe:1ce with SMTP id
 k11-20020a170902c40bb02900e732fe01cemr18602326plk.44.1617071354019; 
 Mon, 29 Mar 2021 19:29:14 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i13sm17681385pgi.3.2021.03.29.19.29.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Mar 2021 19:29:13 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com
Date: Tue, 30 Mar 2021 10:28:54 +0800
Message-Id: <1617071338-9436-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617071338-9436-1-git-send-email-dillon.minfei@gmail.com>
References: <1617071338-9436-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v7 2/6] dt-bindings: arm: stm32: Add
	compatible strings for ART-PI board
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

Art-pi based on stm32h750xbh6, with following resources:

-8MiB QSPI flash
-16MiB SPI flash
-32MiB SDRAM
-AP6212 wifi, bt, fm

detail information can be found at:
https://art-pi.gitee.io/website/

Signed-off-by: dillon min <dillon.minfei@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v7: no changes

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index e7525a3395e5..306e7551ad39 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -53,6 +53,10 @@ properties:
           - const: st,stm32h743
       - items:
           - enum:
+              - st,stm32h750i-art-pi
+          - const: st,stm32h750
+      - items:
+          - enum:
               - shiratech,stm32mp157a-iot-box # IoT Box
               - shiratech,stm32mp157a-stinger96 # Stinger96
               - st,stm32mp157c-ed1
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
