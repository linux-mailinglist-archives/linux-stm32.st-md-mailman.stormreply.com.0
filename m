Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D8D846F7E
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 12:53:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CD18C6DD9F;
	Fri,  2 Feb 2024 11:53:45 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34513C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 11:53:44 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a37296534c5so7048566b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Feb 2024 03:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706874823; x=1707479623;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cElRODCjC8UJ6A1BiMBGDabPtQgXz8GNgekyJrxCdpE=;
 b=dZ1bLLs7DebOtbwPlB94BYnrC4SKbJzma3sGlEdTfyXvFCt4CVn5VBGJO23XlXhE7B
 dcpe11uKfWyan7w4S6TEYJNmGkFIYxcYZ/eeG2xpJ5xlTlPYWuD537orH/RfB3Hwd+JL
 CQKTD1V8Nvm7nrnUOFlkTSJ/YZ8+Y+VI1BWsg7/tjjqvtl2ZMl6PhhzwOp0R30w0cCJX
 4Hv5Au2LwcdkjniQ7YTTkJ5ynq2cDYlsEbvnewq8YdbdCona12Owm3z5pvacSSZgGOlu
 OCbZ+7nLCtMYoekAbG/Ogj1pnTxM9c4ZjbUCkVJJ50McY5c+9eN+uMtJFKFDWuy6fmun
 ac3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706874823; x=1707479623;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cElRODCjC8UJ6A1BiMBGDabPtQgXz8GNgekyJrxCdpE=;
 b=Xo4r1MJDLmCC0jtxYiGWE3COQybi1bH2bZAh+CjrA5EBsRKpHWuZG5y+5hNoBdFahD
 vyUJk+DkSSHEkvl42YDhUPoxacLffA0TVD7gC4GMO5OewnpSesHUJbDm5U0s3gQBNZeb
 r8kgm//F8ycSa3JD5czluEeNTRCm8AEqLjVJHlbp2oedKdlj7gB2dwWgVWq2zZr9lRqs
 Cr8tpxKJP4wssbBb2K+dgCd8O2OEpXIEkKtC19Vhcj4eYe1Ek0+vC801VvU4oVPKhjcC
 F1TRyLOeU8fFbMVmw2pPhPa2CUraOfXkIc+A/PQYHny0JHln/DzSOa8bUYb6RmMqdFUd
 hvXA==
X-Gm-Message-State: AOJu0YyqAGmVxf01XqvOukUE52KSx6QO2Vw6Sg8bUVrQedJCdRLzvDgz
 IY/84WMUrzewjqVjEQle3BjpvTo+NpDZQ/hdr8Xip5NRNv12Sf/muqd89XGg
X-Google-Smtp-Source: AGHT+IEJTHGC+v13fgVvyRQAj1XcHy8pMiYKB3TmEpBtFRyFcsQvvU3UmipyFA1ismU9PrKI/lBNBw==
X-Received: by 2002:a17:906:b2d4:b0:a31:8d44:99d1 with SMTP id
 cf20-20020a170906b2d400b00a318d4499d1mr3752100ejb.12.1706874822695; 
 Fri, 02 Feb 2024 03:53:42 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV71sQHv1MhhN+H6zOv8SWlq9HHSzB2B+5Rz3E8gt2yhQHOhrR4aFyXD8LXq+v0lOXtTOW9ODBoNO4YissBfgMJHtEriHGFxLEIW/kpDHVSbjeWrtuN0crC/1/Z3zjxn4K7+7GyKN2bpvlodqUSg1HucoQEt+1tVw9jZeM7DxZgypVHN68wwjUYPFKXQrWxYuqHhlM+hbfR+q8tvMJQzBQwJY3TPG6E1JfqHejNUb/kN0LZ1/OytqxzsP9D2HG7vCJcHEUBGLvN5e8pO/oYQzSMN9MFaxCyTq+oRPHP36hmIKzHoAkOvqRiJniwhUSsI54XKSFqQIDWGzB1Kqh3/eydcmUxNx+lZGEqQLElDYowX/4hvmwCWZtU1wW1euU=
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a17090611d800b00a35e3202d81sm802192eja.122.2024.02.02.03.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 03:53:42 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 02 Feb 2024 12:53:32 +0100
Message-Id: <20240202-stmmac-axi-config-v2-0-64eab2bab17b@nvidia.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALzXvGUC/32NQQ7CIBBFr9LM2jF0omJdeQ/TBcLQzqJggJCap
 neX9AAuX17++xtkTsIZHt0GiatkiaEBnTqwswkTo7jGQIouilSPuSyLsWhWQRuDlwm1ZqOubAb
 2Htruk9jLejRfELhg4LXA2MwsucT0Pc5qf/g/3dqjwjsRD/pNjm78DFWcmLONC4z7vv8AyLfT/
 r0AAAA=
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2445; i=treding@nvidia.com;
 h=from:subject:message-id; bh=2Fi6uD62P5Yg1+WAmH8+Q39MZE72Tw9+Nbbc48m0FfQ=;
 b=owEBbQKS/ZANAwAIAd0jrNd/PrOhAcsmYgBlvNfF7t3q6ozLOE34PMK/Lq8wJBywTc1EZ197a
 aKpt1FtTSaJAjMEAAEIAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCZbzXxQAKCRDdI6zXfz6z
 oRMUEACRPiJDtcPM8d2BpaIjQB5ftFDCOUoCdNPo8+iwVKJrf9gi+msdAGY2UStiIlt9dmeRP/z
 UdcDMjmKCsVTx91Svd1fnBqpXJ9NTzTMd7YdBJ7IeWbGSbNxSfRiwMoVBQMFILQzZk4ZdxhNVYn
 lBEgVDsxryVum6TF6Og8yhuwqxQdJGxYdzDAjJQ/1SQMBTxu9qjfw1A8gBrUqHfcAGpNPNtnOqX
 kx/+DNvXI7axRcpz3yf8LE3Z45TJhC519Z2dKteAKm9X04eCPc1so+uULLCKODvjMsI2kFpG4yY
 YhVYo8Agol15t+98QLT0c5y48cnVjG1tuy2ZGi5/T5YIlgvkppk5cWhRQ3p7mxV6WjC7ndiLrx6
 lAvDd43OFDOUWoXu8O3/O88w8qZkgCaaBN64fUMgXmlKN1frEST8ub0ywtxZgo6pYx/U9PmuACy
 S50/R6DlFJWdxy8hrKyZLVju0OZJ8LT0A+AWLaPkpH3cPtRYGNzGlV6kn+9/jIUjJD+bQQTsTMf
 hKW2ivMGAJnotWKnyb83IHOL6tmMcK/2uy4Pq5woCciPVJwtG/wCIT8Q0RIywPevLRohTOC7w2l
 iQ67aLgtcbG3l2FdyWv5hx2vjUomjBglyKVfkDmJgwKW1BXa2E3E0B8W6upyOU5xwB2HWDSpgoR
 tGgk2wg6srPE1Sg==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Cc: linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac: Allow
 driver-specific AXI configuration
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

AXI bus configuration can, in most cases, be derived from the compatible
string, so instead of relying exclusively on device tree for the AXI bus
configuration, create a method for device drivers to pass along a known-
good configuration.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- fix bisectability issue between patches 1 and 2
- Link to v1: https://lore.kernel.org/r/20240201-stmmac-axi-config-v1-0-822e97b2d26e@nvidia.com

---
Thierry Reding (3):
      net: stmmac: Pass resources to DT parsing code
      net: stmmac: Allow drivers to provide a default AXI configuration
      net: stmmac: Configure AXI on Tegra234 MGBE

 .../net/ethernet/stmicro/stmmac/dwmac-anarion.c    |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-generic.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-ipq806x.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson1.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c  | 11 +++-
 .../net/ethernet/stmicro/stmmac/dwmac-visconti.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 66 ++++++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.h  |  3 +-
 25 files changed, 77 insertions(+), 47 deletions(-)
---
base-commit: 076d56d74f17e625b3d63cf4743b3d7d02180379
change-id: 20240201-stmmac-axi-config-77ea05ea9eff

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
