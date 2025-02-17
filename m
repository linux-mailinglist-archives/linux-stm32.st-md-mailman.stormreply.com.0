Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AB1A3950A
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 09:21:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56472C78F99;
	Tue, 18 Feb 2025 08:21:20 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18C79C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 15:59:06 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2210d92292eso50083795ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 07:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739807944; x=1740412744;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FjCy/ZffARgeuZcf1GFTdyg+YmqrhzszPwnoHjKDmPE=;
 b=N9LDQxMqTl+V1pW5nUgCoIMHU0Zc0aJi2K+FFMfd0CPW4DKgm82vxeJI71VbJomYIZ
 tHe5chQrdpnIRKibxczeukM699mn4ADDHSClPT4XFFAOyrHoXRH064pxa9/lVFMdsUi8
 CwBmBbeRwZBbFNKyPr1BrXbziEqHXfT6V00FLPN8HdqEkoDhBj71wDZUYd4q8d51uWYu
 9SUcgbDWDMP5UVc09I3KdWDwAstk013oge/FzDWEBhDkMal0gqqzfm2IyOsJZlgAAJ/Q
 629vf4//IY/62appIWbHd3ROaiYI7c/v3qkrxx3rcOH/pGyRXRusuUUNG6Nyg6p2R/K+
 QimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739807944; x=1740412744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FjCy/ZffARgeuZcf1GFTdyg+YmqrhzszPwnoHjKDmPE=;
 b=PJFSj5f36e/Qmc6SSXvUAhZlnVDGdiTMSfse0Pt6o2P2bH4axytvuHPncrwuLrY++f
 OM6S0kkrM/FcjsA05tEqnUYK5N2i0SYMhmW10yNS3DloLBVuMDI3FI6tnlLkLv86sjlw
 to7EOOhDCY2ppOAeDSC/l/fKbL/lDFxqfxEKlbBeuqGJvyi2ePso6yVKhurIlstoD35n
 +JSCPSEbDzSZMERxQPTg1LyRo9g5VmhOi2GyVJ7dNQrSWcp8+GUMfKYuJ7fBnQfRkl0+
 PmCMmRQBGraip+yFYerLau4JvSHYm+SSVwxz/oRaaaXY00x1CbcD4OmKIveM3cI5HQhD
 V0Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWULgX9BakUoUJoaLj8dkjqu3UIFsX3af4jXlcBoC2k0EsCXmQCNbZ+lFd4vlKu66AryiB8rp2hvcuYZA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyKkyF1onK2TpvMFoiqbXEA35z1/vfWv4itKkCp+VsLNZo5sxnb
 3LfAjT0m4Tjz0ut4WYJVVTFnJAg4PAnPANnTMknok2JvdIKhiug9
X-Gm-Gg: ASbGncu0ncCiiR7/F6XOCU+SjQWluVOksBnP7LmnqNPrLM/HAgJ5W4BSfS3YG0FPgQD
 px0Jb50XEI8Ipf2Op175zLKtp1py0pgIo8LZJM5foi9gHpN3OklOK5bd1wLxeoea7bzE6g2ZOEr
 BCWTydgAJV7FkHX1dz80lOtxvAUmaIHrYUAjtMQz11EIigrExS78CKqr1q1hGFZh40nu/emYx9/
 j0xvwdiZkBkIALtN0bdlSTcuTXFXW5awGW2bYP9v0IyyCj2YvcOBiHeLyKoCKT5fWGeXAzFSUTf
 9+thyT/6oPoWtjsxZsmK
X-Google-Smtp-Source: AGHT+IHXyootXyMJ7WqJlzjvmqadmtDWJcQg4Y1jgPTTSE29jnJtzuRXNyecLpmO6L5BqF58tIKC/w==
X-Received: by 2002:a17:903:22c7:b0:216:3e87:c9fc with SMTP id
 d9443c01a7336-22103efc0d3mr183904045ad.5.1739807944475; 
 Mon, 17 Feb 2025 07:59:04 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.205])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d55858d6sm72826895ad.223.2025.02.17.07.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 07:59:03 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Mon, 17 Feb 2025 23:58:33 +0800
Message-ID: <20250217155833.3105775-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Feb 2025 08:21:19 +0000
Cc: lkp@intel.com, netdev@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 linux-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>,
 visitorckw@gmail.com, Huacai Chen <chenhuacai@loongson.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: Use
	str_enabled_disabled() helper
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

As kernel test robot reported, the following warning occurs:

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:582:6-8: opportunity for str_enabled_disabled(on)

Replace ternary (condition ? "enabled" : "disabled") with
str_enabled_disabled() from string_choices.h to improve readability,
maintain uniform string usage, and reduce binary size through linker
deduplication.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502111616.xnebdSv1-lkp@intel.com/
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 96bcda0856ec..3efee70f46b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/ethtool.h>
 #include <linux/io.h>
+#include <linux/string_choices.h>
 #include "stmmac.h"
 #include "stmmac_pcs.h"
 #include "stmmac_ptp.h"
@@ -633,7 +634,7 @@ int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 		}
 
 		netdev_dbg(priv->dev, "Auxiliary Snapshot %s.\n",
-			   on ? "enabled" : "disabled");
+			   str_enabled_disabled(on));
 		writel(tcr_val, ptpaddr + PTP_TCR);
 
 		/* wait for auxts fifo clear to finish */
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
