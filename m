Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D2734E3A7
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 10:58:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFC93C57B54;
	Tue, 30 Mar 2021 08:58:42 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D95CAC5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 08:58:40 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso7315846pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 01:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iREGzC2sZl/DyY2RLlvOKGuuLCaggN30UKHaeQRB7RQ=;
 b=dR1izMvh+/HTAyMkC6XOLt24pm2NywT4UmnbWq6sLnIhPLKctYtF2kra5Y0DJnyV24
 VuaF4FOJOK80+NWhxME51lwuFt5on1y5gvOgu6/n1bNzFdFA4G3AIL+bpXm6YwbfWp5m
 5j9XxGsVlqW88+jMBIBD42oDHP0F2QfccNsFEBQACV45x5oem6t0vgBWIZHOHyZ9Vqa+
 JoB7Ftb+V7kwOzCgiExKhChEuGESkWpqznZ84Ifjaa3bsQpsRDNLCH+kgZ+rCJsUVmYY
 wyKJhPUNAXyf0PaLqPuKBL90AjFrSoMcVoGb3gQmQ5feB6lU2EleFDq7W9WixHjPBcXH
 HkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iREGzC2sZl/DyY2RLlvOKGuuLCaggN30UKHaeQRB7RQ=;
 b=nz2Tzk5HnH4tCEAIzelwVZlsWepfGIpx0Mr+DcUxCY09/PUk6U2FXXd5n2LnhnFic9
 jiApvwStBWOa6l+teX4gMpp1l9pxZuZMhwARRJbiG029g1fTXtmZ2np9oCwZsGySFsov
 9Q27GW8THjMQZ/ma8pVepyahBgo3A3BvYvO1tJ3+XKlzosnzc8GzdCiEvCUZsD+FjqxI
 H6GQ0Y8B2t/sBjZFCKNhpAIlYPRBhSkwEf8ygSRO54z381ffV2F6Kb0bIe0ySAOLpnwQ
 xty3jsjozAlO3PKzYKpxHbg5tk/CBqh3bqE6yR+KtTRoFe0VK7Z0USDQccHkhgOUUWNG
 oOSQ==
X-Gm-Message-State: AOAM531fpFTUHb/9cbb7/B7MEyqGvQcbskf/yQ8x9asGk0W2V4J5ZiiE
 wHK1bLX3e5mUnILiHh9QLEc=
X-Google-Smtp-Source: ABdhPJzviLeP5ntIfm2q5brVsYs5JCoAYowXWGq+Nm1e70jjBVNbuBrt0B331QtPpsVbs2jdumfu8g==
X-Received: by 2002:a17:902:8497:b029:e6:f01d:9c9f with SMTP id
 c23-20020a1709028497b02900e6f01d9c9fmr32689394plo.7.1617094719480; 
 Tue, 30 Mar 2021 01:58:39 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id y8sm20952642pfp.140.2021.03.30.01.58.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Mar 2021 01:58:39 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com
Date: Tue, 30 Mar 2021 16:58:20 +0800
Message-Id: <1617094704-10040-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617094704-10040-1-git-send-email-dillon.minfei@gmail.com>
References: <1617094704-10040-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v8 2/6] dt-bindings: arm: stm32: Add
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
v8: no changes

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
