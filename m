Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3319A3D09E1
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jul 2021 09:41:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC417C5A4C3;
	Wed, 21 Jul 2021 07:41:47 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A8BEC5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 07:41:45 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id t9so1096916pgn.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 00:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+x+f7PVXVcjHLEa5oy45MfmPR9ugBPOg1ZaiimxyB3U=;
 b=jKVLhLjvLVl7Wec2cQKnTeigp+0iVu7nuEaJ3MBEjV0ohly6Ehi639hu0Qzu7aIPX8
 W79uGjJptJZvaf0LJitfBFQ4RnohYxegnaJF/NzoG9Y/1UNyv9/5Xrt1CZ27UsnQgZUN
 mSHLOtDCUqR4gofeY6zRttrvLlhbyMrDd03QrDmOE//F3MAjiHmMxBkmwnUHdM3ieHXi
 31szerUxwpEAPWRlIWcbcWBwJygCfuuJmiKvDO7yXbaLdqIPqOr2XTdwpZNivaMyoBvV
 IVuSS3Sfa0UEyTycIjqQOimgcjHbbC9jJp5LJrN775RLr9u3CCSXCneF+lAJM14miNHp
 DGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+x+f7PVXVcjHLEa5oy45MfmPR9ugBPOg1ZaiimxyB3U=;
 b=HdhTVO0Fknomf/8eUI/HIBa5N3m/vRRtWpF8QHxf99snvg4y9lONNaYp6MKN+xa24x
 YDZR5o7fXdjCqrY2QwFe64cAsRInXHHYTAVGG1Gv0bOCAmPmNIrSVPgBQrCsUEUouqUI
 MAQbbQJJLQn5A9bUOYrZMkgeHb/sbtn+A4aHzZzXDX9+FeFDGyatXRHmpBiKxL7Nrrba
 +rZovEXa7sYxPUZ6J+zx/7HaG7AQgZAcdzkmJT784DOnNvnRJa8hLIRsGQDQIBl1SjaZ
 u0hvGfiAB7qPcK70YdMRhD7IFQGfHAvs8mubToFg5SpLABXkHmIsigd4xt7m7xiY3GGN
 JhhA==
X-Gm-Message-State: AOAM532Lzx284t1dAYdBbIg8IQj7GL92ScYnJZW6809tDQ6imUzIakkr
 t0I8HAe7W+46VaG8fRneJDU=
X-Google-Smtp-Source: ABdhPJwm/gorGk3PKzcSSUiK20jrDXjD35yudvyAPAcVMS7CyY9Wf44Ly7TLgQ6i2zj1IskD7/4ubA==
X-Received: by 2002:a63:5c04:: with SMTP id q4mr34409484pgb.127.1626853303934; 
 Wed, 21 Jul 2021 00:41:43 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i8sm4841867pjh.36.2021.07.21.00.41.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Jul 2021 00:41:42 -0700 (PDT)
From: dillon.minfei@gmail.com
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, linus.walleij@linaro.org,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com
Date: Wed, 21 Jul 2021 15:41:27 +0800
Message-Id: <1626853288-31223-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 noralf@tronnes.org, Dillon Min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/3] ARM: dts: stm32: fix dtbs_check
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

so, append "ilitek,ili9341" to avoid below dtbs_check warning.

arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
['st,sf-tc240t-9370-t'] is too short

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
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
