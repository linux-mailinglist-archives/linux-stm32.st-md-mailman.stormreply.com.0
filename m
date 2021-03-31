Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D01934FB87
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 10:29:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 227F5C57B5E;
	Wed, 31 Mar 2021 08:29:10 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 552D0C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 08:29:07 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id x26so14067057pfn.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 01:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J8EA9tflx1qSoAm/gZUALECzHKvmRKxVZk9N222UGws=;
 b=RJNjoT/EsPgBrVpj3PWLbdOmYQYr7PEtKuj3m/bsNCPg1DXp35cJDtPn1sqCCjO3g+
 RYOOLwlipnT8jat/bjixkGh/Gyb6tHwW2p3iVh33ddlaHplr0swdm0kNIhMRMZ/R0wXs
 yd4j20Jqay7IF49Ksmmm6UpAEtu05XIxPk5Su1IF8YoVeYGlLie7RroMfnKnmNM0FHv6
 X5TebVyx1B2kR46wZiznaIsxUELIFq0V654OLWuBNBW7FK8KKQ6Frj256LCg2A0UEmLV
 MFe5T9ABxWSM0hpc5lF3zqUp2qOGcIveBJKiH1uSWkd+FyAgZj+O61fYH1mmN4RvN1l6
 sTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J8EA9tflx1qSoAm/gZUALECzHKvmRKxVZk9N222UGws=;
 b=QiDrrR4sFuaNrTbvF3xfgH7eGJvvRR9uHGfB0PkBlgdCLZHhhdAGSCwZR5EMqDQ7KR
 zHJtJd6s3AyQF8S9xJ+KCqq20wknMKfG5Gadfbi5O+KQ7DCx8sgFJt6TMLnsJ6UugTAH
 mmk7582qW3gnshji7MA4YtdTXhHc47Grgi4dAo6+Lwt/4QpST7gkj03f00p7KJsixz0N
 0M86auGp3hPksaXLsrnQ5pZv+ld8TzlTO/xCrGre4yofHoWIs6cJVxg+buntbAfCWcXQ
 o8ERNms85LMriBO+BLQ4SKC5uu5ikm9bPk3Zku34jtd8GzQ4iYG6Nbcf4MfAuIuag7Vi
 /y7w==
X-Gm-Message-State: AOAM530MZbTd/SlP6EAhoL4vilji8aeMmt8x88zgcb9SblqT4PnkCKzK
 AZUhwDn+PtUqE7WURTer4W8=
X-Google-Smtp-Source: ABdhPJyh97m0QgSx+iSbD3AjZq6ol9a6k/87G6JH0Ooh63dZyC/HysbIP2JFcldc6r4RjFzzOkqapA==
X-Received: by 2002:a65:47ca:: with SMTP id f10mr2263311pgs.206.1617179345885; 
 Wed, 31 Mar 2021 01:29:05 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id v1sm1420991pjt.1.2021.03.31.01.29.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Mar 2021 01:29:05 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, pali@kernel.org, mchehab+huawei@kernel.org,
 andrew@lunn.ch
Date: Wed, 31 Mar 2021 16:28:41 +0800
Message-Id: <1617179325-6383-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617179325-6383-1-git-send-email-dillon.minfei@gmail.com>
References: <1617179325-6383-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v9 2/6] dt-bindings: arm: stm32: Add
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
v9: no changes

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
