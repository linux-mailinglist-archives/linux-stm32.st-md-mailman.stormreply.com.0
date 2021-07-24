Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D9B3D448B
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jul 2021 05:44:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 542E1C597AD;
	Sat, 24 Jul 2021 03:44:27 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C79FC597AB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jul 2021 03:44:25 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso11717244pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 20:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SJz83ejABGMbQ2Eo9CZm9YSYODNjLXFLcuNMYaINnuE=;
 b=iFe8DxMo9KoTmBPe+SHB9albjxjUiD/wzCtv1hzbQsxPtYkKy0gdZxiIix2NyHralt
 8OU76Er2NVYEyqpt9OiH6K14mFhyEsGB3s6MvcJIXTRUb97VfkALnk9fCP4XmAdkvXTy
 1Y0KR3GX69z+5uxVGUAG3B9yCf8RshUCKUrK0qL3BMx+uhTGP8mQgdcFbsL8HfgJYi+m
 B/TudAFAcUFaaWIagLjFSduRriA8RVL2Q5n5FEw12SSNArEfms+WTSnBJkK+Um2kxAi1
 lA25N9NG0tZXH8BG9KGxp9UoeDguUoAhNpJwCLH8Nwx9j9T0akVEv5mqt9gxzoaDGpOw
 RmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SJz83ejABGMbQ2Eo9CZm9YSYODNjLXFLcuNMYaINnuE=;
 b=mz5sI6HKyGmuGAAPc25YrWLIVf3BfmQXQOx2nFMGtEgSL22eSGjVvVw8DaqR6JywnS
 fQL5yYZaOJOJX+DZbKzemzUYpT8xBp7M9jD2EcTGoNbn+J290/OQ10AGh+kMAorvy5Hj
 2Z4zynmP6TF9g/egrxFc3NEpEQPRKiydCdAl6QkyEImD18ZCNAKsI3BGO32MmBbFq8M8
 SMERHSXk8JdluD1WvPL1n3JWrcmlKESxLEystH+4Z4MxydZsNYOfdgqd6cC6vJhXyEVF
 /j3fz643+ovQtoiFqNQ6W7DPCpFfxX/W0N3zEx3Wrh10lS02MeMtCizXRK6YzGtlR22F
 Fw9Q==
X-Gm-Message-State: AOAM533Ok1VeA+o8xcUZFtq8flm5JWa+JvV+slPI/Tcbd23aZ/5zgzVe
 Z8vFrN2D/wDSgru8IhgdDso=
X-Google-Smtp-Source: ABdhPJxCVwwsBuIPEgilZ54pQuKM4Kct1PiMGYn4+2ejYooVZncuhDWJo8bl5S5Id+St+Ycz5XBTpQ==
X-Received: by 2002:a17:90a:f02:: with SMTP id 2mr7326015pjy.75.1627098264318; 
 Fri, 23 Jul 2021 20:44:24 -0700 (PDT)
Received: from localhost.localdomain ([23.228.102.68])
 by smtp.gmail.com with ESMTPSA id c17sm35118733pfv.68.2021.07.23.20.44.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Jul 2021 20:44:23 -0700 (PDT)
From: dillon.minfei@gmail.com
To: laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, noralf@tronnes.org
Date: Sat, 24 Jul 2021 11:44:02 +0800
Message-Id: <1627098243-2742-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 2/3] ARM: dts: stm32: fix dtbs_check
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
v4: no change.

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
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
