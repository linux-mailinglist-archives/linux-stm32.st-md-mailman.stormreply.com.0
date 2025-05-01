Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 798F0AA5E79
	for <lists+linux-stm32@lfdr.de>; Thu,  1 May 2025 14:37:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24859C78F98;
	Thu,  1 May 2025 12:37:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B837FC78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 May 2025 12:37:18 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so14277395e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 May 2025 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746103038; x=1746707838;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fnvyeixn+1Lgru4M/HCqjV6TyqEDVE1iM8aBdkxEhXY=;
 b=ZFlSSyytQExmF54AG888doG1SvoCMe95FGz1wJaDTP6UNkPoY25onjR+HSRW9BbCqP
 ttkc82AY5YWspCgAUrd3088HHNoY7fC7R+eIrA6yEu4qxhBE3aHcFXWcNwSdxa5PFXXJ
 XtD+SvRZGZi6wGMQ+tgGnzE4Gf7LNLqgqEkqew55Wq5DiNW1DDKQGXQXt55blTwlFizs
 GlgwFKJ7cxwW/Ib7QBm0BCAr3bXIcpnFQj7kcVSnvAEclvxRxmgD6P5w0qYVm57rbnfM
 09HvZ/tfZ2as73rBThvzlAuwVqCN4C3dgP27rOULrvBq4845hvhzYIfosP0Bp5jdf7uj
 PKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746103038; x=1746707838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fnvyeixn+1Lgru4M/HCqjV6TyqEDVE1iM8aBdkxEhXY=;
 b=KySzUOWNY3+HtW+Zpx/hNexhogDvzhpBRhw+WMUwlXmkXa+QS7dHNbBajR9KmcjEBp
 8rS4W2oBe5Il4ei2UpR/kRJW51cgeupDf4DUbcXhOnRb2+Ua5IM70JE2arOe+JG8WSi3
 5AUaAt/OOZYEPCM7nvfxk2ZD33bLpXEwEGjX0LDXVCnjyiaII0yPkN6N9pSUrO31EaGF
 qIPp5rLmVmfdMOlNOaXYJfPVuyeHe81ws4h91S6B91AvJNFM1XvMNyV/4C+78v3+Qhtn
 EcRk+ZsnoDRZXqki6hvj0B+K76FVD7ZoTwfidIMkB+gRSgxn1/J6olwfniW7vwRDaVOq
 UxfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXejNXqPcZrZcnML3ygUAiB3F9+iYZtvV9anSLoInoAsTfq6DJ66XllWMyXh49N2vm7fRpRpB4gDQSjvQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywgike6SeJo8BFU77QSKU8iHhqe2P4wRxcLtx22fp2kfiDD/wy0
 6D0SIZ37q08wSs5Eqil/JaAIZ0VB/swAnqMEYa8F6/jGeDiXGCN9
X-Gm-Gg: ASbGncusWc7Ckfe9B82iDxn49S1VtFu7IZjybEGyOl18lVPdCalUNQeD50HlX834tqT
 CaI1rfmnzqRBC3jHqnKBCorbepdFRZJCSPpGzAYBi18aCw57z5zjwEkOqzRxb89ZQyjKteAgp5G
 tUdwsfF+o/jc+HCDr8y+nHO7aXG7pT//IxH6hpmoFXNXqN7oBCDKDPRzXPduYPRjesfCbQHEIjf
 71cwVmRKR3ChazLm5msYyd+ATFD3GoXg8regd3nF56BQopCAEmAegmYdj6Q6EwitgD5f/fKuXh1
 JdShYrryy3JPGqDTmqTxfIR3iNdY9XqqsbZ09kgumf4n+oObsH04+IVxxuQqAYsy
X-Google-Smtp-Source: AGHT+IH6jzylsn0GgewBtvvu8wy8bqEIx48tCATSZ1CDXZXmV5fbpP4GZv7mMB68aJ7aMPXOZZnKJA==
X-Received: by 2002:a05:600c:4206:b0:43c:ec72:3daf with SMTP id
 5b1f17b1804b1-441b72ece6cmr13060585e9.14.1746103037909; 
 Thu, 01 May 2025 05:37:17 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f0e:4490:d947:2c92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc469sm11144765e9.6.2025.05.01.05.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 05:37:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>
Date: Thu,  1 May 2025 13:37:08 +0100
Message-ID: <20250501123709.56513-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: timer: renesas,
	ostm: Document RZ/V2N (R9A09G056) support
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the Renesas OS Timer (OSTM) found on the Renesas
RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
other RZ families, so no driver changes are required as `renesas,ostm`
will be used as fallback compatible.

Also include RZ/V2N in the list of compatibles for which the `resets`
property is required.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 9ba858f094ab..bc421882cbc2 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
+          - renesas,r9a09g056-ostm # RZ/V2N
           - renesas,r9a09g057-ostm # RZ/V2H(P)
       - const: renesas,ostm        # Generic
 
@@ -59,6 +60,7 @@ if:
           - renesas,r9a07g043-ostm
           - renesas,r9a07g044-ostm
           - renesas,r9a07g054-ostm
+          - renesas,r9a09g056-ostm
           - renesas,r9a09g057-ostm
 then:
   required:
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
