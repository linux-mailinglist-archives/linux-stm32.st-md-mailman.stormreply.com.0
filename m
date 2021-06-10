Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE313A366A
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 23:45:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA8F6C58D79;
	Thu, 10 Jun 2021 21:45:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04E1BC58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 21:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623361545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sg0e7jXQsTWhtJdkPVNcldGSCJQVzZfo88rGKEyxbVM=;
 b=Le1mk+6fklxWVA4JYCeuVB8O0/sYniXtcyffwRsp47ox9YZvY8bRH/eZaPXONPYDu6q003
 cKl+WCDZymCjIWOtqYcQD/IF75nxj9Lcfbk9Vv7pG6TwR2LT6EJsyjasc/BFjpnNG9s1Tn
 tGM8z0fMrb9YianBue97fybaxYACfps=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-RHa18-EzMbKFsVfrEAxqVg-1; Thu, 10 Jun 2021 17:45:41 -0400
X-MC-Unique: RHa18-EzMbKFsVfrEAxqVg-1
Received: by mail-oi1-f198.google.com with SMTP id
 s17-20020a0568080b11b02901f6e9faaaddso1898412oij.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 14:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sg0e7jXQsTWhtJdkPVNcldGSCJQVzZfo88rGKEyxbVM=;
 b=kpTXVlWn0a5CPjbRbLEmZIGeSw/avyrHKw9XdewXK8bLSkn1YKMiu7ajZt8cpzXrQi
 nxGYblKR8WzCrKzuwXcaFi2ND74OeHgQ/0aDDUhyc+9IUjjNzAKLU89fTGbcJnXsIrzK
 /caNonqzmlAqO1ZCceL1TlbaUbkn/GwBV5Krl70EUaHbhy9RCgGPWdB+jQU/vUAfZo8B
 RYMXEXlcbPxWg14T80ealmGyTP4DfNCxi52Hh1uwa7Ph/5OgJwRP5Bd80e0hADKFsiL4
 Jlz9QEKmskZA6y6rbRLc6n9JYsGW6Lp0P71Qf6RG18X6nmTbhMLEeySKa/YoOiPrzjyO
 DY6A==
X-Gm-Message-State: AOAM530ZcNvBYDUTJH1XV5EvhXauIBh2pL4/GsH6QQRDck19b1I8Kygc
 ddVlogZ2+5M23u8BxvBzKmRO9975JAnW51Hld4SNC4CtW5NQC+z1O7+fTgpoBWFMAkFyapl7Tm8
 MhqIcPZbYHcIyuUb53QcDtI8GMYe7KdsridocVxUD
X-Received: by 2002:a9d:6087:: with SMTP id m7mr370788otj.318.1623361541284;
 Thu, 10 Jun 2021 14:45:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXb9l1V2GdEF4zDsZ9LozrWKOCTW8y6roYjcLTL2ZDJoW3I+XShj/h6JSCX5VGU9bVCgQ4yA==
X-Received: by 2002:a9d:6087:: with SMTP id m7mr370744otj.318.1623361541117;
 Thu, 10 Jun 2021 14:45:41 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id i15sm881839ots.39.2021.06.10.14.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:45:40 -0700 (PDT)
From: trix@redhat.com
To: robh+dt@kernel.org, tsbogend@alpha.franken.de, jic23@kernel.org,
 lars@metafoo.de, tomas.winkler@intel.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, nbd@nbd.name, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, apw@canonical.com, joe@perches.com,
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, zhangqing@loongson.cn, jbhayana@google.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com, Soul.Huang@mediatek.com,
 shorne@gmail.com, gsomlo@gmail.com, pczarnecki@internships.antmicro.com,
 mholenko@antmicro.com, davidgow@google.com
Date: Thu, 10 Jun 2021 14:44:34 -0700
Message-Id: <20210610214438.3161140-5-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610214438.3161140-1-trix@redhat.com>
References: <20210610214438.3161140-1-trix@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Tom Rix <trix@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/7] drivers/soc/litex: fix spelling of SPDX
	tag
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

From: Tom Rix <trix@redhat.com>

checkpatch looks for SPDX-License-Identifier.
So change the '_' to '-'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/soc/litex/Kconfig  | 2 +-
 drivers/soc/litex/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/litex/Kconfig b/drivers/soc/litex/Kconfig
index e7011d665b151..c03b1f816cc08 100644
--- a/drivers/soc/litex/Kconfig
+++ b/drivers/soc/litex/Kconfig
@@ -1,4 +1,4 @@
-# SPDX-License_Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0
 
 menu "Enable LiteX SoC Builder specific drivers"
 
diff --git a/drivers/soc/litex/Makefile b/drivers/soc/litex/Makefile
index 98ff7325b1c07..aeae1f4165a70 100644
--- a/drivers/soc/litex/Makefile
+++ b/drivers/soc/litex/Makefile
@@ -1,3 +1,3 @@
-# SPDX-License_Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_LITEX_SOC_CONTROLLER)	+= litex_soc_ctrl.o
-- 
2.26.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
