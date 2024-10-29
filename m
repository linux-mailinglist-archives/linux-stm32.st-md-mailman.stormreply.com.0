Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E4E9BBB6F
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 387BAC78F8B;
	Mon,  4 Nov 2024 17:18:38 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA896C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:13 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-37d570728ebso734310f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233453; x=1730838253;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozG3F0d45Tc8g66cKQj6Gpf5cSc5WnMCj2YvzIalGjA=;
 b=X7WoJ2vzm24yJcCTsvgRSE5V7ZXd9HVoCeyaw46vfb4p8Xpckmit3mIc04y3+TV38R
 4cyyMfpptMKp2h15kJpgfjQ52TzVQ8M9YgaG+QcO/yMtfoV+8dRH1OdHtLCu2+jLulJz
 3kO5HBDhN/mAD7+shZdftdxnKQAVmA6Vry3RCQ8ch78KG+zJB7tBsJS6JeqLhE4NRw7s
 XFnGqCgajm8241ZAcNbfJ4OgeUBFv7CKNc+sSUJkeOvc+/44e9boHoHS/A46s+/iLRGp
 9oD4zitX3NnvMayCq9mjXtZbjkO8Ng8pzLBgg9izjtTyxP4FbC9CbQVJa1N28xjxsBBC
 Bpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233453; x=1730838253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozG3F0d45Tc8g66cKQj6Gpf5cSc5WnMCj2YvzIalGjA=;
 b=sLLtuVqOvuWZ1Oxq1BeuA0NUzMl1TZt0wYQ6WHke/bDZ60N7KRnmelOWVsOZmCUosO
 XCdiOFujLi8mwPBcG163MhRaLhrFGdD8IuQyVVgFsSKNJI2nDHoG6w4kQqylLaZrNR1/
 bc/4Vc88AnUhb/qvaBq0TnJDIdDStuaiv4MnJFnJPOEwwB5ANsL0mv0ZFBKe4GAvqEYF
 xB3svSWvZc51S1yrmfunaPHRUjPvrZwAHK8yYnn/xrrAnqLvzoF5CvJQf8w0vHERIUBe
 +AJmog300YDeh2LiG42AKzfP+FQTSzU13SpvpRJCa+rO1Vsv8pOv7kQ4uYhV6qd7MxwU
 hYEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJgI59Fc/qHSuJ+ny+llM7oHM3x3ZjgevLycwgYj6XFjCE8SZgUIzAtVmxqN1lr0e2g+N57s6z8tVAKw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx7QKshkue6nTNXcNMrlPwE+B0aEYIpH9b9nS4bh2t8oETgDh3v
 UUpXZgz+ekGS+av6rvY7zmg8s1VPGX6LfV4pvY98XdSSvELuve5Y
X-Google-Smtp-Source: AGHT+IGHbXNtpVeRkay6QoXYzvaEQf3MjkyLQHiS5jkm/oeLQ1Uj4ljCcnFMbwCNEC3ab9YAHsxiog==
X-Received: by 2002:a05:600c:468d:b0:42c:aeee:80c with SMTP id
 5b1f17b1804b1-4319ad74341mr49011315e9.9.1730233453136; 
 Tue, 29 Oct 2024 13:24:13 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:12 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:38 +0000
Message-Id: <20241029202349.69442-13-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 pabeni@redhat.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dinguyen@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, l.rubusch@gmail.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, s.trumtrar@pengutronix.de,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 12/23] dt-bindings: net: snps,
	dwmac: add support for Arria10
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

The hard processor system (HPS) on the Intel/Altera Arria10 provides
three Ethernet Media Access Controller (EMAC) peripherals. Each EMAC
can be used to transmit and receive data at 10/100/1000 Mbps over
ethernet connections in compliance with the IEEE 802.3 specification.
The EMACs on the Arria10 are instances of the Synopsis DesignWare
Universal 10/100/1000 Ethernet MAC, version 3.72a.

Support the Synopsis DesignWare version 3.72a, which is used in Intel's
Arria10 SoC, since it was missing.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 15073627c..d26bb77eb 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -26,6 +26,7 @@ select:
           - snps,dwmac-3.610
           - snps,dwmac-3.70a
           - snps,dwmac-3.710
+          - snps,dwmac-3.72a
           - snps,dwmac-4.00
           - snps,dwmac-4.10a
           - snps,dwmac-4.20a
@@ -88,6 +89,7 @@ properties:
         - snps,dwmac-3.610
         - snps,dwmac-3.70a
         - snps,dwmac-3.710
+        - snps,dwmac-3.72a
         - snps,dwmac-4.00
         - snps,dwmac-4.10a
         - snps,dwmac-4.20a
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
