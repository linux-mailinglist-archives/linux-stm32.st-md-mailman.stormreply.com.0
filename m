Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F121CED89
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 09:04:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9163EC36B3E;
	Tue, 12 May 2020 07:04:06 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 319BBC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 07:04:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t11so5746263pgg.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 00:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KnWhTxSokldqb010DnL4ORytzuGapXn7Hq520J7Za+c=;
 b=IjYwOS6yRJWzajwfxnyfRcGRgJufp90e2oizEGjmBih5am4Peqs//yI9PBpIboOzU2
 CZO7EDNpWbHzsF18edURJPTllwO9BZ79aBFYNtwcsZc6DFIZn8+alqC2s201mzhMJIkp
 3TcZmcgqnP3O5Sm7JeURdw7TyVUFJLRHTd4KqVs/bfP71TM6mTago+ifRJxbMabCZ5RU
 J7Rr93CevBl/XszLMpKAZXHFq488StrTbq+2a4M6QafQj1cDTCotx7X+cLzxoodu9eff
 fQnABVAI8DBaYWFsxbNkWlX8fqB/s7u68B+d7DEwdHDMFVEM8vQPZzyRaKh7wm1EUakk
 jn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KnWhTxSokldqb010DnL4ORytzuGapXn7Hq520J7Za+c=;
 b=RUaz9Dl0VDlzXtqRg/nQZTlErn8cU/i/IQLGM1+KER74o3TLqLrLA0ncQ5Z9PzQLC3
 HaOllCp3njEp5q5OnEwQz3gqj3axlbhhpUR7Grm5kW3whYRzmTIGi3TLS8rSewrupT3K
 Ms5p0XKeBj/fz2LoTx8MekLgNP9WsQREBq6/3beOpFWXzyq1vP4rSzGtw4w0sVM/W81X
 1x7/kX2uIze71CoyjFVq5a3BwDAithHwtGZJXph9l7zXwSrVx4K2Nv0+t7df5SMldmuM
 ArDCSSI1emVRNnAjkaA4wC22NhFjTqysxISSHvg7h5GrXtFWZ98FERH8eiv/D7iqJuOb
 YLxg==
X-Gm-Message-State: AGi0PuYp+4L8yLB0c2qn3e+TERKQ3F3mCI9nGePciTPyDmBfnz6MMmm8
 ZcN2jF1FsXJtZVBfYBfWc8I=
X-Google-Smtp-Source: APiQypJgzsQrvrMxxxS1gIKRvHu2KK37xvZy80d20Mc2DmCk4cb+KwcWxqzPiseDTD0DXbnIzfEGlQ==
X-Received: by 2002:a63:9801:: with SMTP id q1mr19050050pgd.447.1589267041774; 
 Tue, 12 May 2020 00:04:01 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id 62sm11016369pfu.181.2020.05.12.00.03.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:04:01 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Date: Tue, 12 May 2020 15:03:35 +0800
Message-Id: <1589267017-17294-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon.minfei@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 3/5] ARM: dts: stm32: enable ltdc binding
	with ili9341 on stm32429-disco board
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

Enable the ltdc & ili9341 on stm32429-disco board.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Changes:

V3:
    change dts binding compatible to "st,sf-tc240t-9370-t"

V2:
    none

v1:
    none

arch/arm/boot/dts/stm32f429-disco.dts | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f67..4475e40 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -49,6 +49,8 @@
 #include "stm32f429.dtsi"
 #include "stm32f429-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "STMicroelectronics STM32F429i-DISCO board";
@@ -127,3 +129,40 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&ltdc {
+	status = "okay";
+	pinctrl-0 = <&ltdc_pins_f429_disco>;
+	pinctrl-names = "default";
+
+	port {
+		ltdc_out_rgb: endpoint {
+			remote-endpoint = <&panel_in_rgb>;
+		};
+	};
+};
+
+&spi5 {
+	status = "okay";
+	pinctrl-0 = <&spi5_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpioc 2 GPIO_ACTIVE_LOW>;
+	dmas = <&dma2 3 2 0x400 0x0>,
+	       <&dma2 4 2 0x400 0x0>;
+	dma-names = "rx", "tx";
+	display: display@0{
+		/* Connect panel-ilitek-9341 to stm32 via ltdc*/
+		compatible = "st,sf-tc240t-9370-t";
+		reg = <0>;
+		spi-3wire;
+		spi-max-frequency = <10000000>;
+		dc-gpios = <&gpiod 13 0>;
+		port {
+			panel_in_rgb: endpoint {
+			remote-endpoint = <&ltdc_out_rgb>;
+			};
+		};
+	};
+};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
