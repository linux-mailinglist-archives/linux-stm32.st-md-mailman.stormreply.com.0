Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6C07455AE
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 08:58:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1254C6B469;
	Mon,  3 Jul 2023 06:58:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63542C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jul 2023 10:31:46 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-312824aa384so3823244f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jul 2023 03:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688293906; x=1690885906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+9HNwsfm1QcsCZ6i0OtSLp++3UaVesUVHugZWgXamS4=;
 b=XIxUYIDaYrAcbCaZjAOJQA6qry3INr7EmhUAmmfwz7ZGkmJXBwZ389ldYtx44Fxt9E
 2CsHd48uhVy09DoBYa3O0J7jURA7Q9V0BindDZkXmr9VDg8Yawltw8Ks89Q69MIx7AO2
 t4sQsgFCAd+iUrPCyKy8ZOpwqw/JQ78AZ/+RMC88gCrkSL58CaGHgeRgORFGnjuLmYms
 g3Znk8LwmFb8aJTd5kOU2IwmB8EnWAtTsL0EVPclr0MkQEjtZWT3pKZnVNPlbM2Vskap
 qOFYX0QlMOVct8XAl+bjkUlJ09FCa7Z17yXTyFTTigR7JUVqRLpme8hjkEYMO7tiHqFg
 l4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688293906; x=1690885906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+9HNwsfm1QcsCZ6i0OtSLp++3UaVesUVHugZWgXamS4=;
 b=hgQ95hLEB31KvkYWAfTbxIhw9jTMNoHafqUT4giTT+RqJBbjaEUtXa1DE8m0onPTA3
 j2QqNAIZxxg9nd0zKSVlRwvVOQqQ3sktsy+hPJC57zRAf+eNo9pZxGgJq1waHIUgDoRc
 8+w1RNmbdQZ0axC11OWRRx+B7XoP4QlB8tref51ncqs/ZVEz91tpMvUUmx4vzd7Fx4aD
 DYs7yP98+apWE/dRpSqtVAad9dN30c1ogB5Ng5Ph+eFoVFW6ez7KJW7geB0wvBeHTAT9
 v5/x5fmVXlFlbZ4SDN2AZTbBLe0S+AmdWzxN9MhAYuwaOvhkpPG+bNCEDy82nn5wctE9
 OIeA==
X-Gm-Message-State: ABy/qLZ1JWbpra96KyvC8Cxyy2waZPhG+MAXW58Ly5+Koi0FQJCT3GID
 QtdnU8KRTeUlQGP/EwfvjjQ=
X-Google-Smtp-Source: APBJJlFdbrMVw4b6z234EX++g7sa7brYPo9YLyT5rx35Vbecfts+aFRsmuqCwHuvCLX2q+adLIcNtg==
X-Received: by 2002:adf:e80f:0:b0:313:e20c:b8e8 with SMTP id
 o15-20020adfe80f000000b00313e20cb8e8mr5448993wrm.30.1688293905642; 
 Sun, 02 Jul 2023 03:31:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:32f:1f0:ae0b:3bc8:c743:b2d8])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c205300b003fbc2c0addbsm7265041wmg.42.2023.07.02.03.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 03:31:45 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun,  2 Jul 2023 12:35:16 +0200
Message-ID: <20230702103516.139440-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Jul 2023 06:58:45 +0000
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ARM: dts: st: add buswidth property to
	stm32f429-disco
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

The ili9341 is left without a mandatory buswidth to properly communicate
between the SI bus and the display. Add the device-tree property.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 arch/arm/boot/dts/stm32f429-disco.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 3b81228d46a2..5eaf95afc8c7 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -197,6 +197,7 @@ display: display@1{
 		spi-3wire;
 		spi-max-frequency = <10000000>;
 		dc-gpios = <&gpiod 13 0>;
+		buswidth = <8>;
 		port {
 			panel_in_rgb: endpoint {
 			remote-endpoint = <&ltdc_out_rgb>;
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
