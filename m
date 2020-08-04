Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6109423BFF4
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Aug 2020 21:28:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 288C0C36B3A;
	Tue,  4 Aug 2020 19:28:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B06EBC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Aug 2020 19:28:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E42F822CA0;
 Tue,  4 Aug 2020 19:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596569318;
 bh=nHtU3jC68K1szov6StQnB9nGWj8YGb5ZSEYff2gaNZg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=x3CJiubP9wgIU42gAEtOSgXFF600wkRT/BddRn49+S/ZUrq7GkjK4innamltxZyDi
 NIxLMqMT7Wl/HZflJWFHTUWhx1bWWYIxiwvK/ZkN/CUzEcO0KUGkenjp+uA4QSU5i8
 Ghjn108+3bhzjIs8Hm3l4L9nKfLDG9phid8fml0A=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org
Date: Tue,  4 Aug 2020 21:26:54 +0200
Message-Id: <20200804192654.12783-14-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Lihua Yao <ylhuajnu@outlook.com>,
 Cedric Roux <sed@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Linux-stm32] [PATCH v2 13/13] ARM: s3c24xx: camif: include header
	with prototypes and unify declaration
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

The s3c_camif_gpio_put() declaration in
include/media/drv-intf/s3c_camif.h header was different than definition.
Fixing this allows to include that header to also fix the W=1 compile
warnings:

    arch/arm/mach-s3c24xx/setup-camif.c:28:5: warning: no previous prototype for 's3c_camif_gpio_get' [-Wmissing-prototypes]
       28 | int s3c_camif_gpio_get(void)
    arch/arm/mach-s3c24xx/setup-camif.c:56:6: warning: no previous prototype for 's3c_camif_gpio_put' [-Wmissing-prototypes]
       56 | void s3c_camif_gpio_put(void)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 arch/arm/mach-s3c24xx/setup-camif.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/setup-camif.c b/arch/arm/mach-s3c24xx/setup-camif.c
index 2b262fae3f61..4046afaad645 100644
--- a/arch/arm/mach-s3c24xx/setup-camif.c
+++ b/arch/arm/mach-s3c24xx/setup-camif.c
@@ -7,6 +7,7 @@
 #include <linux/gpio.h>
 #include <plat/gpio-cfg.h>
 #include <mach/gpio-samsung.h>
+#include <media/drv-intf/s3c_camif.h>
 
 /* Number of camera port pins, without FIELD */
 #define S3C_CAMIF_NUM_GPIOS	13
@@ -53,7 +54,7 @@ int s3c_camif_gpio_get(void)
 	return 0;
 }
 
-void s3c_camif_gpio_put(void)
+int s3c_camif_gpio_put(void)
 {
 	int i, gpio_start, gpio_reset;
 
@@ -64,4 +65,6 @@ void s3c_camif_gpio_put(void)
 		if (gpio != gpio_reset)
 			gpio_free(gpio);
 	}
+
+	return 0;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
