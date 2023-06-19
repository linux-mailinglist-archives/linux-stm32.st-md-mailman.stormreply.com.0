Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C07735C80
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 18:55:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCEDAC6B454;
	Mon, 19 Jun 2023 16:55:55 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA185C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 16:55:54 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7624e8ceef7so246387485a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1687193753; x=1689785753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=02ex9dynad7/XUY+dlyZ9Dy+Ty8yFfkoa+wDDDcORT4=;
 b=YzxNxTebOFYlTFL51X7nJT30TNgU4PiJI3oAXNKpaje/NRKO2icJqflPfMBSAZJ6i3
 OHWZQODNE+AQthkwQvh6wifkeLMPNYy6DrCMxCsLI9g9I4gj5Z2cjBa9q2Z+WKRFjS/K
 kPKskESPfzqTnpr7Z2Q1nogXg/gayNFcIC1xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193753; x=1689785753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=02ex9dynad7/XUY+dlyZ9Dy+Ty8yFfkoa+wDDDcORT4=;
 b=ExBDqO/+M9NQ3+KT3hnnoCmz3pWoJBgqHiD60rmiKL6rh0oMFLfSyimV9e2rDkcIZr
 squ+jjlLO3+ij1MJrq8Ru+5R1PPHE8qVZaYWbuGlqY5ODhGzZhsqH5Ts8w7tqlJ0gEDh
 W2+Gd/3KqUNq9hZHcSkDaCBdeTRUh7pJCoopthFrF3E77ajZ+e+6kU1vKHmodn/0mEve
 hFHaonbHuhR473MhJAzKbwPduAE8Z45PBPl3Ek7Y8SS149ZXG2aE3mR5z5cpPnzg18SR
 WdFzOdc40E+GUfqrnO6sXyxrOu982KsPNoE+OrOKkSr96l/2cW0RV+WsGdxPkZso9neF
 QcTw==
X-Gm-Message-State: AC+VfDw5Z1q6i4sgGC9SlOwx8qrDrji6RRt+xKh5vUMdzjUdyA6NW6j/
 TLq7Q8amPNSa/rgtfpiKb6DmVw==
X-Google-Smtp-Source: ACHHUZ6VMOy+ibhPH27kT6T6fKcdSaiSXMS43r0itplOStAT+QipHlyzI7gsHs5ngqrDqP1JB9G8KA==
X-Received: by 2002:a05:620a:6582:b0:763:a1a9:3fb7 with SMTP id
 qd2-20020a05620a658200b00763a1a93fb7mr1421965qkn.26.1687193753766; 
 Mon, 19 Jun 2023 09:55:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-79-25-27-4.retail.telecomitalia.it. [79.25.27.4])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a05620a15f700b0075d49ce31c3sm109103qkm.91.2023.06.19.09.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:55:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 19 Jun 2023 18:55:24 +0200
Message-Id: <20230619165525.1035243-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
References: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 5/6] ARM: dts: stm32: set framebuffer bit
	depth on stm32f746-disco
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

The board uses a limited amounts of RAM. The added property halves the
memory footprint required by the framebuffer.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/stm32f746-disco.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32f746-disco.dts b/arch/arm/boot/dts/stm32f746-disco.dts
index cda423b6a874..36612b4c2504 100644
--- a/arch/arm/boot/dts/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/stm32f746-disco.dts
@@ -142,6 +142,7 @@ &ltdc {
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
+	st,fb-bpp = <8>;
 
 	port {
 		ltdc_out_rgb: endpoint {
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
