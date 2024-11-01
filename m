Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C709B88B8
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 02:44:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54FCDC78034;
	Fri,  1 Nov 2024 01:44:06 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D90AC78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 01:43:59 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-71808b6246bso840630a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 18:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730425438; x=1731030238;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CbOKOQ6cXn7wwdr6Ntm3B7T5w6pad7a2v3ZbayC5AN8=;
 b=neBfS93Yqfr2t84jiYn8r95Sw52bq8FKeQy1R/CiShCsHuVpi28paNmvewCziya32g
 V8bh3JtB7DX6UnJMcpC6Ken2ihCXxum4bXCqNGduHXJFJ/d8XKICoY7GW6tVezRWSrCk
 ex9t8eyIAF/KXzsGVt0/ivHSCKucqrh3a1C6TcT7/mvKK9MF/Lv8fNhoGnYMKizqedxR
 doYjfarWWYQSxWmxo/v/o2FJCDuNi8dQmeH/IvJ8lyWnfoDRlhd7zmFpVDGMHOTj3jp3
 GGceDcQOaxl8GtNTbIglB2pmNVF2n66ip+HNkABEzk7dV43x9u2li7A8R/MWE1N0cVTw
 LS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730425438; x=1731030238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CbOKOQ6cXn7wwdr6Ntm3B7T5w6pad7a2v3ZbayC5AN8=;
 b=palPm5m8U4bMsmfDXFLqnErs9TdCsOaMvBrhsDHSr9lzaMtrG34YZ7PqOXFT1uTePz
 Zio/FqkdXfOD/5a1eHsod+onHjRIYEnlGT9s5c+sJLLhcfuwVrdaRfBzj40p8kIUlvis
 VF4z3ZI5NQj2o0hFk27F9og6/UEYvj+JjB6VKTTxbePzTVdaXKXT/U5BNGay2E307fRL
 W9yCNyiz0r/tM338H0QdBBF6w11ont08c1HfdVAVKneQJsUjlI8MQGqN1gD4W76sgeSK
 rRsYU+CZ0saAM3hm9Ft9m/oROkrJpUS9pyTGdeSELrXPLZtoda9FoliLmuMHykShIWJI
 S3iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSvCF1DvZrRdIQcoNVYqnQ1XVwIAFOOtb0lOXM1wHsYwEDXy8Ez/N/Q4YkwsYLVxhlNQDUvsScKvhumQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNx1HSE+63zYq8HBzQuObsZTauKdJylNGByzZcDIktscxALuY6
 jM3x6qBpOC3NUyZxDGH8C2CAEtXewKEZDzXgciR3AFrEG9Adxu/t
X-Google-Smtp-Source: AGHT+IG2sb4YVVz0VFvLk0SRUEvu5cS8s5UH9lKMcZltZ6rlJph6ABKzjSAYEOkurbMSWKYOqwCwCw==
X-Received: by 2002:a05:6870:c8d:b0:288:6ce7:6d6b with SMTP id
 586e51a60fabf-2949ed34d30mr1772814fac.5.1730425437875; 
 Thu, 31 Oct 2024 18:43:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc1ed422sm1773674b3a.77.2024.10.31.18.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 18:43:57 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri,  1 Nov 2024 09:43:24 +0800
Message-ID: <20241101014327.513732-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 0/3] riscv: sophgo: Add ethernet
	support for SG2044
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

The ethernet controller of SG2044 is Synopsys DesignWare IP with
custom clock. Add glue layer for it.

Since v2, these patch depends on that following patch that provides
helper function to compute rgmii clock, and this patch are marked as RFC:
https://lore.kernel.org/netdev/20241028-upstream_s32cc_gmac-v4-4-03618f10e3e2@oss.nxp.com/

Changed from v2:
- https://lore.kernel.org/netdev/20241025011000.244350-1-inochiama@gmail.com/
1. patch 1: merge the first and the second bindings patch to show the all
            compatible change.
2. patch 2: use of_device_compatible_match helper function to perform check.
2. patch 3: remove unused include and sort the left.
3. patch 3: fix wrong variable usage in sophgo_dwmac_fix_mac_speed
4. patch 3: drop unused variable in the patch.

Changed from v1:
- https://lore.kernel.org/netdev/20241021103617.653386-1-inochiama@gmail.com/
1. patch 2: remove sophgo,syscon as this mac delay is resolved.
2. patch 2: apply all the properties unconditionally.
3. patch 4: remove sophgo,syscon code as this mac delay is resolved.
4. patch 4: use the helper function to compute rgmii clock.
5. patch 4: use remove instead of remove_new for the platform driver.


Inochi Amaoto (3):
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 105 +++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 257 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
