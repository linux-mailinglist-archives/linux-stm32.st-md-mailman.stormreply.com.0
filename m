Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6119AF66F
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 03:10:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFD8DC78F6A;
	Fri, 25 Oct 2024 01:10:34 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2C21C78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 01:10:26 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7204dff188eso621943b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 18:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729818625; x=1730423425;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sYpfrlq0V0bV9nsDJv9ukMK1/gCt1wSxEcrYWbmTl9Q=;
 b=P4Kz0sUDttrPlk0EJ5VyBDDufpjUNeQlzPH+fev6wU32kmdy687JU3SeOZkh0g3HOn
 80PqwMwBZn543fmtIDn80VGFUZcnWdXOf3EQsijph7NjMVrYXcPOMTiynqZbUdOK1u+t
 ylXCh12smwDwxOVGhPlGA7Ih/uowqT4i/nxXeNb7/K/ml6cwFcuGZ4YV+Y70V1SpJDdB
 uA13ly41wTqAZTLoXMIaXIUxRVVLM3A/Zxmk9hYBVEqZGIqH5YW4GA2jH+0ivYaIER0K
 eohEdPxh0iiM/F0IH+hQnxSSY1lMEAwaipa8PPe9G3blflXnfYbxTSJl0HLshi8VW6a5
 B+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729818625; x=1730423425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sYpfrlq0V0bV9nsDJv9ukMK1/gCt1wSxEcrYWbmTl9Q=;
 b=deEKzRU/nxKyrlEmWBBNxa0dUGhe+ZWrbP4/xp23a94kbNXVoTzfcBGJPLY07f6zY2
 c8tyjYP+1iCuXDPynWB0XgSEqanpBIcRBWP+31wTzK4FC7s34xaaPtTCRgyV7isa02py
 HfRaRVBWUwkPdrsEHFdw7jLbSEpsZQbXA+cwos+283M4p3YVA1pBnwypXEYilsBYGKsB
 gLsf32NmMRvarJW/6xfg0I8EjiDn8u8TUU2beqQrGdLlZxpl1jHOxAGuqot0+84+29Ma
 75C6T6PsNqWJPOCi7xLaRDB5tXvk0aAds/OAvfobba9bJ98ALZvggjc1hqhwPOEkMDK+
 DNtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr0VLPg5XfFW77cDPrFvmVuZJ2PH58jiwryKFaotDmDEw2k3LKVixwGWJBseoHNz8JVCVRvBC0lRguxA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwwCr9ZjshVW/dNzOofoCVHldWoe2IK5t4NcT3UptcE22AYK+lU
 bU9cWfJJ7qXD+dtj6aUck4JJ51o6hB4yBO2KYZH20oC4v4g5gu/z
X-Google-Smtp-Source: AGHT+IFpOd28fEHMTcKxVcGsg5KEPz6mrlaxZYvtZFvJjTxq2WDoP6vXaOQgIFHT9LXF1AJwY1a6nA==
X-Received: by 2002:a05:6a00:190e:b0:71e:4c86:6594 with SMTP id
 d2e1a72fcca58-72030a51d13mr11382153b3a.10.1729818624886; 
 Thu, 24 Oct 2024 18:10:24 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a0b9b1sm53397b3a.133.2024.10.24.18.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 18:10:24 -0700 (PDT)
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
Date: Fri, 25 Oct 2024 09:09:56 +0800
Message-ID: <20241025011000.244350-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] riscv: sophgo: Add ethernet support
	for SG2044
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
helper function to compute rgmii clock:
https://lore.kernel.org/netdev/20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com/

Changed from v1:
1. patch 2: remove sophgo,syscon as this mac delay is resolved.
2. patch 2: apply all the properties unconditionally.
3. patch 4: remove sophgo,syscon code as this mac delay is resolved.
4. patch 4: use the helper function to compute rgmii clock.
5. patch 4: use remove instead of remove_new for the platform driver.

Inochi Amaoto (4):
  dt-bindings: net: snps,dwmac: Add dwmac-5.30a version
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 109 +++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   3 +-
 6 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
