Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F9F23FF4B
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Aug 2020 18:45:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEC7FC36B26;
	Sun,  9 Aug 2020 16:45:07 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92306C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Aug 2020 16:45:04 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id f24so7070291ejx.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 09 Aug 2020 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H88mI1Spa78eFKDo3i2s+xvsEIQcDrNyhC7EnGO216s=;
 b=Hr0dQiEvmVUgZL4L7p3nMX+qobFHt8gj89ULFPGVZBMlbTvDqQoekVTvPkT3Xjt3qC
 i90nWPF1lXAgQYQj6tyG9Z1+w+lSSr4RX1ONQnwwjzA+ekkUV52soxdGtV/WMfAYm+pi
 9XLV19lkFE9afUEKo1v2USo33E0HmcqzUUi4kC1Z7aR5zhHif2LgW0b+Ta5wdsXDeIfm
 4hOs+OHHQCWcMwdMBSkgJz3EdhZQBkIU5XbeQWd2b8rP9bzjjHEHi3thg7AmUMM/n/Ta
 dkTv62qRz8Kg7g0YT7hYsC+FXC7MVA6Sq2e6ZnZGIGombeLROPt+fREX5qu0Al6pUsxB
 InbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H88mI1Spa78eFKDo3i2s+xvsEIQcDrNyhC7EnGO216s=;
 b=QV6AX+fLzn/pSEAiUB1g+QDPIV/cEw/42iwguigVO6tw+X2xkqp/vvDI2+Wx4uhFRd
 PQinfkoytdycGARJ47V2YP0DUNNUUnz9SXGOKYQ1FCF9xFpbMQpnuObvscU4fL8urVRu
 94R/zjKr1cFiQIcMujMHSSiaj+4pJz+pbPDfwcQYKY+b7OHXUwhBMQ6S9mSLbKycLBPF
 /Trg6cxgCWoqylyB+VqvAs0+1kjQZi3BFrrMzeczcF2zRSXRsLBAUFuvk/TqrTOZVD6F
 RTmPOdgWSPdac+iM6zIf9tw5/KAYoAkYRjyT6uilUVb8XtK4GkCP68+K/KaFEBIM2nTH
 73wQ==
X-Gm-Message-State: AOAM533Z/JMq+3Cxe+xwWnw11nmgQdVHsl7pWBArfQTEry0r6x1oCDts
 E6HdXuxA63zp33J/urrfS90=
X-Google-Smtp-Source: ABdhPJx1xkw0A5gHdxlA02kBB2qFvGFR9pJGK1Jm97xiVxTUdwHuTfRjdK72XmyZs0hdwh/EY50NFg==
X-Received: by 2002:a17:906:924b:: with SMTP id
 c11mr18877533ejx.75.1596991504160; 
 Sun, 09 Aug 2020 09:45:04 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id b24sm10423215edn.33.2020.08.09.09.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 09:45:03 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Sun,  9 Aug 2020 18:44:49 +0200
Message-Id: <20200809164450.289731-2-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200809164450.289731-1-marcin.sloniewski@gmail.com>
References: <20200809164450.289731-1-marcin.sloniewski@gmail.com>
MIME-Version: 1.0
Cc: robh@kernel.org, kuninori.morimoto.gx@renesas.com, arnd@arndb.de,
 mani@kernel.org, allen.chen@ite.com.tw, linus.walleij@linaro.org,
 daniel@0x0f.com, linux-kernel@vger.kernel.org, lkundrak@v3.sk,
 marcin.sloniewski@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 mcoquelin.stm32@gmail.com, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 2/3] dt-bindings: arm: stm32: document
	Odyssey compatible
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

Document device tree bindings of Seeed SoM and carrier board.

Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 790e6dd48e34..3b318fe15194 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -50,4 +50,10 @@ properties:
           - const: st,stm32mp157c-ev1
           - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
+      - description: Odyssey STM32MP1 SoM based Boards
+        items:
+              - enum:
+                  - seeed,stm32mp157c-odyssey
+              - const: seeed,stm32mp157c-odyssey-som
+              - const: st,stm32mp157
 ...
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
