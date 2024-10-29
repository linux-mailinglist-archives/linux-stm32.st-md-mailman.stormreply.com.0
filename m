Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2099BBB79
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B3A4C7A82B;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09064C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:31 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4314e64eba4so4874975e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233470; x=1730838270;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+/XbmEWC0pF4C6y9sizpz5a4/Nkx6ZhAqpplNpnUb20=;
 b=BQltYU9cVCbwE1GjWIwN/418Jn0kV03xh+oxZRNRTCZznAKPAbe7gPDt/GKy+Yo01Z
 2bTvWBmbWixBiTLipdyMOa2YXhFxRfZluYOZ/fPuDEohYzN0MP2wkGEcODBX7EHuE3vf
 /DbuMmyIK1qfs+BAKfcvSXXYiB3OpH16E8fqKoBSu9DTlJLqy+P5WFiPfuSECY9SesnP
 t4Vy609DiJvydFjQM3eUWS4qB0jvh8cvNLNxg7M5YNX+9ujvF/vGQNupgBW8/JyDaiKp
 01qwZyEfNm1uiUYvUg+r4ap95Yw+tZJEFFErcVBupWzqCrZbwRmb8OZpdQ+RkCHNhdEt
 c6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233470; x=1730838270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+/XbmEWC0pF4C6y9sizpz5a4/Nkx6ZhAqpplNpnUb20=;
 b=M6v8jlyRPPbnrs4jqr4P/F6JdokQFAIJT62ZAtRVh3P/ZcPyugNGo5cet//2mO3M7r
 +C6WwY72YFIY0I5YI6kdJV0kq1+KmX4FNoeCjSQ7ENb8kiY79vA8WzV6ejPTGgG/KtuL
 iDpUaPvSM6yLt/xK07tG2RkwpWpOcVWNsC6X4NuxdMIa/Ax7FaCnBsBBaUbC9QdwhiW4
 9Z3oY/PzGLcGU7+IP4E7lgxq/e3ko/cL0zslxnPoZp6WFbQ3bdeeGjzpU4ny8jZQXPM6
 WAA/APWrQa0aleM6eXtfq53jIP4ThphJabLETgPYjlofVD+WsHMoPSXVBfzt1Gtmvy7Z
 V3mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcivTCLI5e6cIXACb1XYcvX5YBJ/rD9U+LLdWONot8RH685Wf4DQ5C7LVzpoIhAo6zJwcn+ts603lYLg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywtpdrmi3NIOxue7MiOyqUhJtvQrme+nfqrITQZ2f/q0zldwc+4
 DipYNScKUv7P8eWhu0I95d5No7mZ8a4cEmkGKfDl7YY/p/U9GFopQiP3Ng==
X-Google-Smtp-Source: AGHT+IFeavUh9Ar+9ynVIaIAr6yW4KMEe1TsLPjWkPYnSTeBsy+x87ewnsyJPz2/5d7A+QJihIa3VA==
X-Received: by 2002:a05:600c:35d5:b0:42c:aeee:80b with SMTP id
 5b1f17b1804b1-4319ad748cfmr49058445e9.8.1730233470329; 
 Tue, 29 Oct 2024 13:24:30 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:29 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:48 +0000
Message-Id: <20241029202349.69442-23-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 pabeni@redhat.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, dinguyen@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, l.rubusch@gmail.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, s.trumtrar@pengutronix.de,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 22/23] dt-bindings: altera: removal of
	generic PE1 dts
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

Remove the binding for the generic Mercury+ AA1 on PE1 carrier board.

The removed Mercury+ AA1 on PE1 carrier board is just a particular
setup case, which is actually replaced by the set of generic Mercury+
AA1 combinations patch.

In other words a combination of a Mercury+ AA1 on a PE1 base board,
with boot mode SD card is already covered by the generic AA1
combinations. There is no further reason to keep this particular case
now in a redundantly. Thus the redundant DT setup is removed.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 51f10ff8e..1561f0164 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -31,7 +31,6 @@ properties:
       - description: Mercury+ AA1 boards
         items:
           - enum:
-              - enclustra,mercury-pe1
               - enclustra,mercury-aa1-pe1
               - enclustra,mercury-aa1-pe3
               - enclustra,mercury-aa1-st1
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
