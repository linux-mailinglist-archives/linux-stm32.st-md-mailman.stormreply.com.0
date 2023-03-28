Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C24EE6CB821
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 09:33:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FAB7C6A5F6;
	Tue, 28 Mar 2023 07:33:46 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3E1EC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 07:33:44 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id y4so45877308edo.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 00:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1679988824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XLJ+jDIrSZvakcXMeiXZPJ9OyuW2iT0qYiAHEyeO2Pk=;
 b=IuvzJdDPnOdoihfE8rpb6ML6DhTCgt5AqAoK0mzHTDNvm0mdLQ/AGkiYZa7Mo7hBdZ
 uEsaGbkhpR4ckAmk/okfbUSjZZKa5YXBFEkVDw+NThJPuQO6N2Md2KEZL2AfjJI2HPy+
 3aPWXZXXntS1Hm/Q35co8OlDBjYUJlSALPV2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679988824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XLJ+jDIrSZvakcXMeiXZPJ9OyuW2iT0qYiAHEyeO2Pk=;
 b=3eP30uniDm3jjvEh6iUfMu05frEwa3Ry2GRCysgPN+IMkHTjbWdxaAIDEN+d9ugomM
 q4inTikiWZBGnC12saEAMsb4EXM0QNzpjfEsYytw0uz2GbS4N+KMDuIs6nLzN/A9L+zJ
 YuHWrBKCvvhbbafzXRTmtJyxvSEp8Lf2Laz+RABfsA+1uItjwxIck23M6WloTfdahQ4v
 FiEBGircNuq4X9Dnuzee2m0EOwoLgDq9KNvvEMB8OyJk7HsO/bSP+8RUZREd5s6qXvKK
 dqJzSD3LqQtrpdu9QW/A1KkAzJJt1+5Hjrv8+UJsPO34EaBOVRa05hwHbjukBpg7TcOf
 0Qxg==
X-Gm-Message-State: AAQBX9eA+/mXom1sBEnCO+cznEdeHbVvgrJr9m8lQVuoEtqYXU5RSJ9H
 wDzQYnmNC17Q8wzPoRGBdkX1TQ==
X-Google-Smtp-Source: AKy350aUGpDaVX4CRikG6yXjQagHkEfMr4HIcK5RDdByqX6CyW1EKgPOFrD20rNVzZiwL4lT4nEb5g==
X-Received: by 2002:aa7:cac5:0:b0:500:4a5d:af3f with SMTP id
 l5-20020aa7cac5000000b005004a5daf3fmr15247146edt.34.1679988824575; 
 Tue, 28 Mar 2023 00:33:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-0-102-254.retail.telecomitalia.it. [87.0.102.254])
 by smtp.gmail.com with ESMTPSA id
 15-20020a508e4f000000b004fa99a22c3bsm15478850edx.61.2023.03.28.00.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 00:33:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 28 Mar 2023 09:33:24 +0200
Message-Id: <20230328073328.3949796-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230328073328.3949796-1-dario.binacchi@amarulasolutions.com>
References: <20230328073328.3949796-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [PATCH v10 1/5] dt-bindings: arm: stm32: add
	compatible for syscon gcan node
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

Since commit ad440432d1f9 ("dt-bindings: mfd: Ensure 'syscon' has a
more specific compatible") it is required to provide at least 2 compatibles
string for syscon node.
This patch documents the new compatible for stm32f4 SoC to support
global/shared CAN registers access for bxCAN controllers.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Rob Herring <robh@kernel.org>

---

(no changes since v9)

Changes in v9:
- Fix commit description formatting. No semantic changes have been made.

Changes in v5:
- Add Rob Herring's Acked-by tag.

 .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index b2b156cc160a..ad8e51aa01b0 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -20,6 +20,7 @@ properties:
               - st,stm32-syscfg
               - st,stm32-power-config
               - st,stm32-tamp
+              - st,stm32f4-gcan
           - const: syscon
       - items:
           - const: st,stm32-tamp
@@ -42,6 +43,7 @@ if:
       contains:
         enum:
           - st,stm32mp157-syscfg
+          - st,stm32f4-gcan
 then:
   required:
     - clocks
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
