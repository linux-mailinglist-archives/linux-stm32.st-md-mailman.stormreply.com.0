Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BEF3D3373
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jul 2021 06:07:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6194FC5A4CE;
	Fri, 23 Jul 2021 04:07:00 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 041EFC5A4CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 04:06:59 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso2131744pjs.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 21:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IILYi2BBED19uarLK77YF9MGNtXI5Hu+8bpBHATAL0I=;
 b=kXr7wvE1n7/TKCY9W0ROVKU8LnS+Q14q61PeYSiAkwkZvmRJeFrRuyI2AkNv+A9Nqy
 8xm5Eo/qWe1mk49oAvJk8NggYhPEfliRN4N65Bnt2b+ZV8Lqdq7cpXk5i9XQpZ0blmQ7
 9V/UJ7vBzQLiubZ17ZPkF4g7JiEpx02olOoW0uXusgWr0r6Otguvq+f8gTh4QafrBabD
 r2TnHHeQBg9ztK6H5LRCUiOTUg8vvFCVpViM68F1o2S6PkfaUov/DMAVNKAaSwocFksU
 Uhp4MfE+Kf9OE3GAzr5+vfDSLuoi5aCG4iq2sdQpXg8Y0Tu1MHvLPIWBg3HFTOYdRvs3
 DEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IILYi2BBED19uarLK77YF9MGNtXI5Hu+8bpBHATAL0I=;
 b=HEGeX+SzZ0dp2P8e7vvXShHAIw4oVLjyD4Sx9fHlxTboPJE9N7Wz4GRo9ndTEOJpMm
 OqMvJlD2kCS8O10MIuR6ES0ZDXNGQyHeTBX5H0kZUwmdmlTd36Q+9f6RvAcKoLBAE8o4
 XjFfrAkA1SlbFXSkrhPngA4H5S4KkV5Q1QBlDWjgvEJ8ub0BVen5lEuybCR3NKtZLasg
 /gEYBO1RXfwzh/6TnB1qBxV2TX3l9MlU5DLhgXbElQMX6prD/CIyP2KGjY94mv0zjBFq
 O3cmx4pnBetJq6h0+VlH0KIeAH1B5PxLOwc0QqelsiPi0VMsUOgnR8Jt+JVsIFW6d0U/
 Uw5g==
X-Gm-Message-State: AOAM533pkVHXGcuEMfrh9ae1xmt+GStzbUkwZROZv/fmiqEKqIv9wUF1
 UCa5gD8qB3wmOqpB2iJdFO8=
X-Google-Smtp-Source: ABdhPJzfAN4Dm2094Oc4AXpBDrI+S93x0ZGuxtrf0rg65AiTzxOdCaPAA6zHF0nhMV4hySjMhRpNjQ==
X-Received: by 2002:aa7:9115:0:b029:359:69db:bc89 with SMTP id
 21-20020aa791150000b029035969dbbc89mr2809512pfh.32.1627013217619; 
 Thu, 22 Jul 2021 21:06:57 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id p3sm35474910pgi.20.2021.07.22.21.06.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Jul 2021 21:06:57 -0700 (PDT)
From: dillon.minfei@gmail.com
To: laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com
Date: Fri, 23 Jul 2021 12:06:42 +0800
Message-Id: <1627013203-23099-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627013203-23099-1-git-send-email-dillon.minfei@gmail.com>
References: <1627013203-23099-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 noralf@tronnes.org, Dillon Min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/3] ARM: dts: stm32: fix dtbs_check
	warning on ili9341 dts binding
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

From: Dillon Min <dillon.minfei@gmail.com>

Since the compatible string defined from ilitek,ili9341.yaml is
"st,sf-tc240t-9370-t", "ilitek,ili9341"

so, append "ilitek,ili9341" to avoid the below dtbs_check warning.

arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
['st,sf-tc240t-9370-t'] is too short

Fixes: a726e2f000ec ("ARM: dts: stm32: enable ltdc binding with ili9341, gyro l3gd20 on stm32429-disco board")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
v3:
- add Fixes tags.

 arch/arm/boot/dts/stm32f429-disco.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 075ac57d0bf4..6435e099c632 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -192,7 +192,7 @@
 
 	display: display@1{
 		/* Connect panel-ilitek-9341 to ltdc */
-		compatible = "st,sf-tc240t-9370-t";
+		compatible = "st,sf-tc240t-9370-t", "ilitek,ili9341";
 		reg = <1>;
 		spi-3wire;
 		spi-max-frequency = <10000000>;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
