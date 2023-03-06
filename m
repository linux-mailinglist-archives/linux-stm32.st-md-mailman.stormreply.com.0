Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AECE6AFF41
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAC38C6A608;
	Wed,  8 Mar 2023 07:00:27 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29CFBC65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 19:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678132534; x=1709668534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ZrKn/GVsbCbQusAgr1EBS9ndoJY9gSV2vmluFfDt5o=;
 b=gAKe6b7sIh15P7c7vUId1A069KlEP95UVSND0VQcq3rtgZibCklAvLdz
 PETqpbBZ8a34iHB1LaY1SR7DTHxu5lwT2453IRA8iOGz2uzxsRN9EgX30
 IaCTbOsfhU8684PTnKnauK6yNPKfG/nQe8nWROcyWmbVnZdXjcypwlRFx
 ZR2lUVVrvxEcRPc1glCi8PN+PduK2dgcaX8WVSEgJDudAASuM6HnGyU+i
 xGFvAlZhfCiyFa2ralWomq7fjO45BxlgtJPMkSi6nQ12LdnGjgifINOfq
 4C7hhQOUDJj9mjFvfhZrYv1tMD9CJh7/DJGTpfPhNqAhYruiVhDD8PEzo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400483854"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="400483854"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 11:55:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005549560"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="1005549560"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2023 11:55:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 491E9154; Mon,  6 Mar 2023 21:56:12 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
Date: Mon,  6 Mar 2023 21:55:41 +0200
Message-Id: <20230306195556.55475-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
References: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Mar 2023 07:00:24 +0000
Cc: Andy Shevchenko <andy@kernel.org>, Semi Malinen <semi.malinen@ge.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Nandor Han <nandor.han@ge.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [Linux-stm32] [PATCH v1 01/16] lib/string_helpers: Add missing
	header files to MAINTAINERS database
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

The header files string.h and string_helpers.h are missing in
the MAINTAINERS. Add them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20544cbdace9..ee157981c4cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8615,6 +8615,8 @@ F:	drivers/input/touchscreen/resistive-adc-touch.c
 GENERIC STRING LIBRARY
 R:	Andy Shevchenko <andy@kernel.org>
 S:	Maintained
+F:	include/linux/string.h
+F:	include/linux/string_helpers.h
 F:	lib/string.c
 F:	lib/string_helpers.c
 F:	lib/test_string.c
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
