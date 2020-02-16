Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A924160C53
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2020 09:08:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1510FC36B0E;
	Mon, 17 Feb 2020 08:08:25 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07B3BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 13:09:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u6so16437885wrt.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 05:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tvEL8XnoDDDhJQlXis+I/7w3i0GDb/4zBR+iz8nChnM=;
 b=ANCfJbi3lxVWxfXdaHspdZaflNulvt7zkwgyAowutB2HsQvuU0nsGoh5Wqx+vRWPja
 kwfDa8w0uJAx9KlP8c6HjNPXWh+d5hJ/F0oyUkPbUkwXMyiLUjcHO0WRD1Qzw4SYdmbQ
 joIPP+2RopZRPNnYWKojDLP0+vLxwyaFuwDJ2KySU0UaYLy4b3hBwMzDOVX44lHqYBgj
 QDUbGfbUl4NaVRK+XbzRSifmEgn0yIKeC2XGr5IeDo3G+Jvd7uAJUjNY5UpOeD5nNE1B
 qcMuFvjPkDbA3N/nj9PHB1RQTg3t1L5OzdkU43ZxOJAJnlCu+GxEzF7RAVm8PoO9fjAG
 pueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tvEL8XnoDDDhJQlXis+I/7w3i0GDb/4zBR+iz8nChnM=;
 b=n2GtqRuJXAcwHU/GYY8V0nCNHWBkIvU7nrtWPwfuvcyqlnvSERbMYk9v5Ho7ge5puH
 UnCx/K5bptJywm0ZfE2rwugdIluk7zL+DIW1KPW5hKWl8ZFso8eHlgRAbVO2Ow/7qYoj
 riOjf12HW9/tGLQAIEhoGQ7C9gjDSzA3u1j5+0/L6g038RkwjEOsCZO7fGvBO/epYoEH
 7BAW3O7co7QAIcbn6p8oM/JlVVm9kSByBJxtwvN2h1nAiFdRCfqihJXuXlayf630f8qK
 ntzwyKlOQeWu+ftrXevI2nVYdkrp68mrVRKtHnkRdO/BoBFO/dNgNIJ1ixV6npge6Foa
 SSRA==
X-Gm-Message-State: APjAAAUykiweaARh61d8gFjkNI17NNsh1cQzslML9eyOaaFrsgohD2iF
 QysSgfWT6FpgX6NkXnyErgQ=
X-Google-Smtp-Source: APXvYqziHWt5hYUHIy4pUIFjT8JvtyU6AKXR/9w0NkI9dxoCdNmyzFFsR2OMMhFcHeJGw4h9m/JRIw==
X-Received: by 2002:a5d:54c1:: with SMTP id x1mr15424575wrv.240.1581858555439; 
 Sun, 16 Feb 2020 05:09:15 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:3868:8500:68a0:3d5f:3add:6e47])
 by smtp.gmail.com with ESMTPSA id x6sm15747748wrr.6.2020.02.16.05.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 05:09:14 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Rob Herring <robh@kernel.org>
Date: Sun, 16 Feb 2020 14:08:41 +0100
Message-Id: <20200216130841.4187-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:08:23 +0000
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] MAINTAINERS: adjust to stm32 timer
	dt-bindings conversion
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

The commit 56fb34d86e87 ("dt-bindings: mfd: Convert stm32 timers bindings
to json-schema") and commit b88091f5d84a ("dt-bindings: mfd: Convert stm32
low power timers bindings to json-schema") converted some files from txt to
yaml format in ./Documentation/devicetree/bindings/, but they missed to
adjust MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  no file matches F: Documentation/devicetree/bindings/*/stm32-*timer*
  no file matches F: Documentation/devicetree/bindings/pwm/pwm-stm32*

So, repair the MAINTAINERS entry now.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Benjamin, Fabrice, please ack.
Rob, please pick this patch.
applies cleanly on current master and on next-20200214

 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0d86490c2c6..9175b59e2b4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15923,8 +15923,7 @@ F:	drivers/*/stm32-*timer*
 F:	drivers/pwm/pwm-stm32*
 F:	include/linux/*/stm32-*tim*
 F:	Documentation/ABI/testing/*timer-stm32
-F:	Documentation/devicetree/bindings/*/stm32-*timer*
-F:	Documentation/devicetree/bindings/pwm/pwm-stm32*
+F:	Documentation/devicetree/bindings/mfd/st,stm32-*timer*.yaml
 
 STMMAC ETHERNET DRIVER
 M:	Giuseppe Cavallaro <peppe.cavallaro@st.com>
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
