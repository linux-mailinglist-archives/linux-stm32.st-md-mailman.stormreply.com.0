Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7031085A934
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 17:46:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A6A4C6B45E;
	Mon, 19 Feb 2024 16:46:12 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA1C3C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 16:46:10 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so4362571a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 08:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708361170; x=1708965970;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U2fCNWiM3gBWDcPsaPzkwgi85IdpiVc9Yy8EhbZ+rUg=;
 b=O2eJtIihb5U8tmOgEe4cfvr0widptP7VwRMOFREN4gVvaBZr49a+GWTvmZVZl8lPci
 gufJLwSENGx5B1ruABy2feQfkrNNtMfPmI8lfgCYVDtO9LTlo/Zb0h4nHu/KOrB6LyPi
 ohkS3Oq86vMI/GfaYqYnQ3U1NyBeScRaOLvsWCqgp0Ks0BYNux/VJTUWomWjbEMHobr9
 haA4Kiu3N5ab1GN9IFa7hzYUY2Tgu/0xb34Ve5UqsW8aDu6612iCiSfQYHV/9hrWU426
 +2GcKvf4/3dNe0fwEkgZUE2HtmDDbtFXr+plUJikrBOD1CuvBNl/LpXGr58bcXZUnRkm
 UvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708361170; x=1708965970;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U2fCNWiM3gBWDcPsaPzkwgi85IdpiVc9Yy8EhbZ+rUg=;
 b=d0aGnI0o6nOG8kqaDLnOz5J/qsc0SJ90FPNoc3p63E8S/LhBkK1qgtmkXMx6EExSHO
 +f7GeADzzR2qVzzgIyuvV6iuXO1+iP9lln6zfSxzAePkQYpUDxVIQGComtDPYCBnN3HK
 Cm1/YdcIVRI+Kjy4/w/y6goX1IVkEOm4JFJkWJeYn/kwlToMbTuh+gvti4M/taSk50do
 Ik4xKAsGBm1thv9owzsLFAaugwnP76VmMc8lCogxrofoNI9JbRb/HkSA+ckqOPEP89vd
 QGSD0qr2nr4kkQDLkmjlrJEuxvpW94lapuVQ90rryidQsQG4qNKiaSm1iAPs/yZadTbN
 UdoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs/PlILqSpBlql3k2dmsmU/rw8JTarxmx3GLcp4ua4mUB7or8hkV8d4oFpUz+BfuXrBjzDEubA/Y2rwhWrnumh7ViFCJssYUj1W4LvwfNKY5kk/2UnfnZJ
X-Gm-Message-State: AOJu0YyVCXXoTPmZ0utO91TVJS7MP2PNIQQANu7Bk+mNOsaPWvhvZLSF
 hbiPjNvQ422q6wpR3RDQ0v3cj3KTcbN02/9xOvtGBfiItAbcL465
X-Google-Smtp-Source: AGHT+IHUtbT6N+I5vRkwIChFpp4DaVBQvNMYjkjPPeteBQ6/TCncEmVXPd5Dkwq3bRCdT1mITTsyYw==
X-Received: by 2002:a17:906:a38d:b0:a3e:5c65:9e27 with SMTP id
 k13-20020a170906a38d00b00a3e5c659e27mr3267359ejz.56.1708361169407; 
 Mon, 19 Feb 2024 08:46:09 -0800 (PST)
Received: from localhost
 (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 hw12-20020a170907a0cc00b00a3d11908bbcsm3051711ejc.203.2024.02.19.08.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 08:46:09 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 19 Feb 2024 17:46:03 +0100
Message-Id: <20240219-stmmac-axi-config-v3-0-fca7f046e6ee@nvidia.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMuF02UC/33NQQ7CIBQE0Ks0rMXAtxbrynsYF0A/7V+UGiCkp
 undJaw0MS4nk3mzsYiBMLJrs7GAmSItvoTToWF20n5ETkPJDAS0AoTkMc2ztlyvxO3iHY1cKdT
 ijLpH51jZPQM6Wqt5Zx4T97gm9ijNRDEt4VXPsqz9HzdLLvgFAHtlYIAObz7TQPpol7lyGT4J+
 EVAIboWtQGjjVTmi9j3/Q153SoGAAEAAA==
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2649; i=treding@nvidia.com;
 h=from:subject:message-id; bh=EEl2gY8IYqh43eRkVKCnR+nEv7c8AQM0pRrgpPbjuZI=;
 b=owEBbQKS/ZANAwAIAd0jrNd/PrOhAcsmYgBl04XQRSUGlGVcdjCZYTd7+y7ZABIFgrEjyjNzO
 nn98yszDTuJAjMEAAEIAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCZdOF0AAKCRDdI6zXfz6z
 ofnBD/9Ra+1UJr4OR3HBMkNheXmxAo23nS23hxgCplfnMgUUIRMTtOoArxbF4SraBlnDFiO1ol2
 S4lq/d6pxJpwMk8NzXUw4mhkZbMC0ZdIkMNQ6swUuD9b+4HLRSlF2blAFkT6j8TuQTkZKH3OiEv
 1OwuMbV2J3DsPYH/R50vrflCaY2qVFdj+QEqLuMLerbknCp8OEO7Rv+QyUeTKLZ1dFHS5QqXkaZ
 ioIPmP9wbhSvTgaoID29Gl4qAjbYm3a2JvgaYjfnOn9BAXnpxv6BB+JGnvO/JOD2ktb5fB2PStl
 plEqcQ3Uyw7S84N+zyti2MMgXegk4bn6KeSP24adJDCdlqCtrQbl1YpIjhfUcLGTa/TIGTs+OwX
 mxdlSaoniOrG9n0JDa7d3ODZiA50G2yQiP9wYscsMZyznTAGauVXZRXljSkp6O8TZz/+Ghldd6v
 iN5HeaBcaBSQLh/JBY2VfukMyRisCMymBIFcY4UhNzeH/o+rr9q9ERKUv4FgnCOFF3KEC7nB5cx
 9yihcWoS56PhiIHW4lRXrDJI++JTUdDLDOVS5Wo1jSn00FergKG9lqTLhJgwciVM+G/16phJ8eK
 8aAqmecwHSMNTvGrlUGoSXiJvcVOBxx3k4y9biWpjRWJ8qT9J7v8y/hvUNY9XI5bYAnFyyQVcCb
 ax0mcUrb5nlU11w==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semit <fancer.lancer@gmail.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/3] net: stmmac: Allow
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
Changes in v3:
- add comments to help explain override logic
- add missing kerneldoc for new parameter
- Link to v2: https://lore.kernel.org/r/20240202-stmmac-axi-config-v2-0-64eab2bab17b@nvidia.com

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
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c  | 11 ++-
 .../net/ethernet/stmicro/stmmac/dwmac-visconti.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 78 ++++++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.h  |  3 +-
 25 files changed, 87 insertions(+), 49 deletions(-)
---
base-commit: 35a4fdde2466b9d90af297f249436a270ef9d30e
change-id: 20240201-stmmac-axi-config-77ea05ea9eff

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
