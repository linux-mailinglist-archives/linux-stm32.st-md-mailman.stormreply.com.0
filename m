Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ECD3385BE
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 07:24:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90CA8C5718D;
	Fri, 12 Mar 2021 06:24:49 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1013C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 06:24:47 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id 18so1161969pfo.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 22:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SYdrQ24/4v3uJHKlu6wjCzOv/6QqD5AM/KsNyKqxTg4=;
 b=UYMwAAPYv7H136+Rhso+ej56Yja02jS0XTUEvEqGQlFGg9CTfYfdLVGBxIqJS0jeAL
 q08J5YpCHY+IzJHX+RzfTDCDn5AKnUdPuheXGNYpb5/1jYhGgy8Jc4BJxNbiZtxoUU/O
 gAqGzjle3h0cP7bq4/zL4pw79LOIXRWoAyAr8MvFEwOwMD7aHLqTxIwFApoQ308VlGo8
 gJoWed8mC9hyuNIBH4o6w9OMGEyiaydygkW7+lZ1UZSnC7f8w88cKE38Id2FIiMRy+CA
 AMERDgrR/QtT+qCJvqdHjZyicaO1DqwdK1RvU5EH+dhSCpU3HjOtKVofRJAd4vXFLGTo
 8vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SYdrQ24/4v3uJHKlu6wjCzOv/6QqD5AM/KsNyKqxTg4=;
 b=mB6JLxzR9fKI0nUSXCm9JfXv9JWpzbijlkf5oU7ATQ6r/8eNriOilUVVR0uSpFMmQS
 k5xsT5Rl3OFRAMOPaKtmSgpoaPiHMSS8tj4CCF7ok5dBSM/80z+bExBiuNhbDuIQSgpk
 dSLejgyvQeou0+KrICG96zer9UIEhQQShzryD/jA4xNERi2bAYW8e2SG4HCsj4BeHrgU
 3Q9mUtU6PggEJ0TidX2seU+YVnfzMt2vHG164S+9TdD9BbknX8i6qat0zHylACEnN0SQ
 7oPYUahNxbwM/ERSiX9z0tCWL/SH+XuCv9N48Qnm+IiNEXDZ/GRQReum7Oq1sEaaXcDP
 BxpQ==
X-Gm-Message-State: AOAM532POx9K9zAIFbjpd7i6Cvrsq0K6APn57mbYXYY5DYIyJijdLr+3
 qsi8KNlSnYHpkguzXq1N3m4=
X-Google-Smtp-Source: ABdhPJwvKrIVsZZ1IluVeJdz38oYuu6rGttLYx860TPP5L/6l7Q1pDS5DqI/pjhZhkPQB+moHNxblA==
X-Received: by 2002:a63:5952:: with SMTP id j18mr10621393pgm.397.1615530286516; 
 Thu, 11 Mar 2021 22:24:46 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm4048406pfb.157.2021.03.11.22.24.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 22:24:46 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Fri, 12 Mar 2021 14:24:28 +0800
Message-Id: <1615530274-31422-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
References: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v2 2/8] dt-bindings: arm: stm32: Add
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
---
v2: no changes

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
