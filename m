Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E36941E4D
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2019 09:55:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55C1CC5DBD9
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2019 07:55:24 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80502C5DBD8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 07:55:22 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id e5so6281186pls.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 00:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Fl90wvGVk9jQf/e3ED2nkXc10vHdjJ0BRJ8wEykJJm4=;
 b=DyFfgQQEx33mWJYiam6MYxvlG5nNkiPk4WCy+71VVasj+drxJg4JufGNFag39gfBEH
 zSr0p6ZySEs9Vb4s9fSruFnjk083UoQt1dAJ4v9r36BI/G4+w6wc6YDXy8MznwFvb6PI
 xzXGKBOgdDXnJ6KvOtldHLy7rk0UPyZ/Ft0P8nTKlNScfLIYyaBJhBdneF3HNjOtP5Dw
 J6CAweQoC3TLOnsXB9kf9xDoMJQKV8fdD2/AOPlBBy8PnfnoUFUrNt4PZ4G0cSrX/2BG
 1p34vLC0YZAaptN62xEiP6S45+MFJgjIVD2HV14gVazd9qNgNEjFwswjK/vwsWG+xD0L
 vgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Fl90wvGVk9jQf/e3ED2nkXc10vHdjJ0BRJ8wEykJJm4=;
 b=rtIRLR/ImpRznwoGUs9Vhlgasl1wHPbuySYSsGMjPH9yVDc8QM7h/LfBb4bfFdqz/Y
 gQVMnPt4Wp5N3Rdik7/lRP8CWqOKdHX6/+eu3dHIYJlSY1F1majR+KSLyeDFeeRqrL9/
 hVXR8A21z0txCVUf7g+E07RqEG/KIpeOkaHrV97b8jwuTksPy7dIXV13PBw3sb9SIp3C
 4gE+ae9JF3sV8c9/e84H/YcpZE0tfLM0dUzZx7bG6weIA93AM4EVZAA5sRlGQSolTqEk
 5is7E4GCe3sm+4uX3k6zcADN/Wb3qs6Wur7BYhbpIIWi91v74eBZTxIM71RtnIv18hkK
 34eg==
X-Gm-Message-State: APjAAAUA3IZWgMBx2fMIh9Rvpragdhq4JSM72tSPkDB/keP4I5oyUqMa
 v30nuRrilSVKuj6PnXG6lkNz
X-Google-Smtp-Source: APXvYqxWBYUdZW2Y4YlWacoCLLvBzvetdV8f6Kh7h4YdWN/CXwrhdOPQFCd141iMalRdxN8KCq/8mw==
X-Received: by 2002:a17:902:61:: with SMTP id 88mr3378053pla.50.1560326121013; 
 Wed, 12 Jun 2019 00:55:21 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:894:d456:15b5:9ca9:e3ec:c06a])
 by smtp.gmail.com with ESMTPSA id b15sm16846399pfi.141.2019.06.12.00.55.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 00:55:20 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com,
	robh+dt@kernel.org
Date: Wed, 12 Jun 2019 13:24:50 +0530
Message-Id: <20190612075451.8643-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612075451.8643-1-manivannan.sadhasivam@linaro.org>
References: <20190612075451.8643-1-manivannan.sadhasivam@linaro.org>
Cc: devicetree@vger.kernel.org, loic.pallardy@st.com,
 linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 3/4] dt-bindings: arm: stm32: Document
	Avenger96 devicetree binding
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

This commit documents Avenger96 devicetree binding based on
STM32MP157 SoC.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index f53dc0f2d7b3..4d194f1eb03a 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -25,5 +25,7 @@ properties:
           - const: st,stm32h743
 
       - items:
+          - enum:
+              - arrow,stm32mp157a-avenger96 # Avenger96
           - const: st,stm32mp157
 ...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
