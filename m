Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AA3308C2
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2019 08:39:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CD85C5F1EA
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2019 06:39:33 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3823C5F1E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2019 06:39:31 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 20so3476009pgr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2019 23:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ICFTAiKSf2WEzyVIUIY8aH5uQWN1lQV5+leEube4wOk=;
 b=yINLZjD+HVEFLHnmBFCdaPByQVMX2rctt7beGazUFTz8SHp0i6GnldmLXvhO0SP1Mz
 7fX8RkgnOgIIb2Yw3l4Y21M7JGbNFv+YLDPL4/l3XsYsQVW6gGUyANu0YsgWNQx5IlxX
 f8QIY1qI8vwu0jLKn8vFzYaePqLd2NGNmIQb162ZDMIqMlOf6tQ6II45zLwA26CK+O7n
 dPe+qTtVVsiNhNaoSnBeLdaoeawx1YDrAajs+58G5KKSDFRSeaBUkt09kb13GOd2gdBQ
 YMgtz5njgfXJCFAJkcKQM4lP6OFfh6dx1xvguxX/bK2i0l/RfWExcQGo9P//Xyf2munI
 VRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ICFTAiKSf2WEzyVIUIY8aH5uQWN1lQV5+leEube4wOk=;
 b=br+2JxrquvGmW8cZPFd1QTe55pGlugYh6/wUPy0w5WGKUGdNsWoZEwqvbtNFMvwXNF
 R/sJXwi+0+Y83jDR5lrxKA6zg7NqkvuVe47ca1iccXa56dANdsO0ykmr+WGW52sZu9ZP
 EWgcA64wezBVfy0FimTTiU0batj3Dkg1thsqyxe0RdDVEx2gWTXJFRuHwXWjALhmoca3
 uQz5cSc44AOBNTCCX6q10GXRvu3zURmdCxpfYh1/Qm9UTdL9DK2ymKInvSSBqU+3i8FP
 LZu5SYsBXNiWFGYgr2lAI/iZRND3YyhZ024tO6gS7XmnkxXtX6OcuZhrBvLbpR/P9Wja
 QWVg==
X-Gm-Message-State: APjAAAVoUf1DYkePzsKNcvdCOGvvVfxf+WTYA3Q9898U4q+LLgbZyJJS
 vvCrQb8Q82WhFA3VjMQjVZxv
X-Google-Smtp-Source: APXvYqznyxZqc7FxorCk79gSUVlxMAYRL8gfbuzZWRdj6FY2XyPDB/CbxTdwXToIOIdbggnpYI8PVg==
X-Received: by 2002:a17:90a:d3d7:: with SMTP id
 d23mr6850098pjw.26.1559284770391; 
 Thu, 30 May 2019 23:39:30 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:72cb:ebf2:a51d:3877:feab:5634])
 by smtp.gmail.com with ESMTPSA id y12sm4644158pgp.63.2019.05.30.23.39.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 23:39:29 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com,
	robh+dt@kernel.org
Date: Fri, 31 May 2019 12:08:48 +0530
Message-Id: <20190531063849.26142-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531063849.26142-1-manivannan.sadhasivam@linaro.org>
References: <20190531063849.26142-1-manivannan.sadhasivam@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 3/4] dt-bindings: arm: stm32: Document
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
