Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43197B3DAE2
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Sep 2025 09:16:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6C66C3F950;
	Mon,  1 Sep 2025 07:16:16 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 167EFC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Aug 2025 22:52:04 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4b30d24f686so26998571cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Aug 2025 15:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756594324; x=1757199124;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xrZ1qN3DYmU2M5pGPX1QKTcsDyaZXEbX9yPyZzRw9Ug=;
 b=Ne8zY2BOcpg9ECf2eBBapL16nzxV6rN804y0e/x3EiS8Sqs7OPuXVcuJpOntc8UbAo
 KqwHcn98F1EAPh3Nj892YWBnbKgCRxMZLkH/ftU7fZ0BqwKtxpUhB1xcMZGPaKErlrcT
 9Y4RmlnJ7vVthyr0wynuXzFci9yhDkZLK4db07s02UxGvTJHEu34uUQkSJ5q39AI9DPk
 0dYfQn289cLoJ2dYKImDGGzUrc3JMkE+vS6Kr6fDw0NzWgRnFBH09lmtDd2ycMTN0wdx
 HRSTmIQuiYd3EZ0Kt4d44nYiTPRlX7Sp8BZBIcbTf2aKmttdFsLxGNZeG2kl55woU149
 g1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756594324; x=1757199124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xrZ1qN3DYmU2M5pGPX1QKTcsDyaZXEbX9yPyZzRw9Ug=;
 b=ccSXgr/TP8QVegVUfzoSmpGBHtV6uXFz0wScErhOtZBtbaM3pxuGMvuTdo4F/ZU38E
 lACjk/TDj7PDCowr7jqOp4fp7EYxlhBp+EfRBEtNCeVvCsyAXOYHnYUMFto5Ec/OLABl
 sY3ktxZHRljh/yolHEcAE51+jUlx/mGxmFxW5f7jVv2ZIQvqdmlWmjaj78PZtm9ZHpnE
 zzPWkEhwdXS/NMM1ka60eGA9buVU0ZhMCaptmJq/62x6UzujBl2UWrpNCkJJduE76jIy
 lRTQwKbmkFSApj0eWuWwKVLVVWDBufsh5dBHuo1kKCCSgy+5McU+uyhtat7iKRpfYBd9
 RFMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmhT6JlYXTBNPiOYDRdrzlmyDGJihkgduFJmafohQr1Ubd0AL8AAwLTm+9gfyNrejqj/if95kUX6Dh6w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwctBxvi0QOJqFwvsED7Nt0Nh2Ukf+gffb3Pg5eVi2El372NNGP
 uHPU1oXLI07WgExRcEWebW5QIRksF+TdiDfq/akuQojfzVYChO8XGS8=
X-Gm-Gg: ASbGncu2IharFpbmDx1Wi0AwZIgPjWv3D1epd+D1pxtgjAHl99I6+neIgiVdWbes6Nc
 o3v3v7nQk7WG2gS23Y4Dlw6qmqFDZUDALmyduyCILIPNjotdaBe2XvVk3eRvMq38G/IE8NT7yLK
 +Bsg7BhtljNNS8v1qpraodvAHB49l3uYJ/XwRdnnvrQ+q6Ahiot1lGoA+BjREBKoAlypHX6Y+sQ
 +ogYqWGo13T4bZKzuVEo2odA36pnoEweiRXi1xc+VgRt+Nq3AdO+g/V5H3a546LGHIRIGT93yqF
 eQ8CO6lG3F5cjOlcIT32MABLu+QGEnGhOBC3GUylYrpcnMeWeZOxEUpBOKKyF/Icih1WIBOzO3h
 2892T9RCBWSrZT1RUKlROGEotqqKL5HfhUa00QtTnTe+gaH0XlCpbqJsl
X-Google-Smtp-Source: AGHT+IHj1Y7mSbhB/V78RbLpZrF2ojqkt4iRIfegSDPVQpLKIbvDqEpOolWmEiXgivm+8z/ghRL4WQ==
X-Received: by 2002:a05:622a:2284:b0:4b1:103b:bb84 with SMTP id
 d75a77b69052e-4b31db67395mr34440651cf.62.1756594323672; 
 Sat, 30 Aug 2025 15:52:03 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:68e:c28d:1818:9595:da56:53b9])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b30b67894bsm38752341cf.33.2025.08.30.15.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 15:52:02 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: mcoquelin.stm32@gmail.com,
	robh@kernel.org
Date: Sun, 31 Aug 2025 00:51:15 +0200
Message-Id: <20250830225115.303663-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:16:14 +0000
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, jihed.chaibi.dev@gmail.com, krzk+dt@kernel.org,
 shuah@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: stm32mp151c-plyaqm: Use
	correct dai-format property
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

The stm32-i2s binding inherits from the standard audio-graph-port
schema for its 'port' subnode, audio-graph-port requires the use
of the 'dai-format' property. The stm32mp151c-plyaqm dts file was
using the non-standard name 'format'.

Correct the property name to 'dai-format' to fix the dtbs_check
validation error.

Fixes: 9365fa46be358 ("ARM: dts: stm32: Add Plymovent AQM devicetree")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts b/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
index 39a3211c613..55fe916740d 100644
--- a/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
+++ b/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
@@ -239,7 +239,7 @@ &i2s1 {
 
 	i2s1_port: port {
 		i2s1_endpoint: endpoint {
-			format = "i2s";
+			dai-format = "i2s";
 			mclk-fs = <256>;
 			remote-endpoint = <&codec_endpoint>;
 		};
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
