Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D049FDCAA
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Dec 2024 00:33:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7551DC78039;
	Sat, 28 Dec 2024 23:33:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF2CEC78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 23:32:54 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3862f32a33eso3795487f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 15:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735428774; x=1736033574;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yp6YLaS3wbdHHh56yyPBMz3HOcQbYn0L1NBzbosE89U=;
 b=mB0Qdg15ybv3A47kUebJM1IH/H2J9RSbu6JjM/DDHyDCXvdtlDdJpHe+18aEM89vdE
 aNk0V3/LAIG8SLDkKI+R/1SQQVPTTiGpsd7NCVfFK5BW/eJC2lDqccwioBA58ou4XyON
 d0WbaNgOS8qc8nnu/A4cUtZeY2RifCzjlJJuPIZVXsTLpa//99kyNA1c3XeFdUlavKkM
 uKMSzASjFEYhGm4Tf9LhL/0ngsGQR3ZUyA/Zdyf5DezXlHL/faqaIh7gCBHLer/EMNfN
 vLkrCPGeBb6zpYRRRHBR0H8wk1FVF8bf6uLaa5zCit+9ln6ah5VRPksg0dB1RiPeQz7A
 oHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735428774; x=1736033574;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yp6YLaS3wbdHHh56yyPBMz3HOcQbYn0L1NBzbosE89U=;
 b=ou0R26Z9+eDODclUaw8Zo2mHyJJMbslKLXusb62fHqJZvucBi+QHvM40Dh3ES7d0E6
 Rrp7TuIM1cCkaLkwNtcdstqBelIO0J2uD8/4f1wIN6lcL5vjdJfyDJRPRpEsWle3UH2+
 gOYWXGz1DmZt/bRN5mFij24z9MnaIQJanAr66S3uPhkVaJZwmCuoy/njqjrm6nqCasrv
 w1lC4qaTU1HcgTIK1I3geP13OlOBaiHAMWCg4RPQogXD3Y6FCFhL1euXXfdxaCTzUgrK
 6JXbxqOEVxzZ73MJBJElgJjrK9+PwtPttG+hps/xrddki0w5Syj+fZn31KHEbrcTuSQT
 Ux4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwsJsUgvfDRmtbDs+aaqW1xyCSQlEeRc5gAiAxQuEQHgwgEi3acrnDpIIPE4/8ngnltX4wsx/Tzj1JGQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwmILS9wAWTTA+miqGBMAk1WCpHqwdo4ZLxN9l8FPAQeQIa3aZa
 m0aGeO2Ys5Z01AaxbY76emuYsh+m9aGN2vwMkARZF2YpiuyhCTBa
X-Gm-Gg: ASbGncso2LVoW054JuURNOsbuKrTdHaSMLnSaipeLKhuzlaEQlauZQmCYilvZp1xt65
 URXYtO1Bn5JkjAd/Eh5A90J/DwSef7Nq5Bxb5W68m6vdSvF1xiEu1RKNTONNSM/YozCH9LGaheh
 BGh0nA6m1vpsJcMiQmuvE/m+BD0GUy/CgCqN1SkNT0D8SZdLS1EWSD8fRfupbrSS5ZdRVE2hT9O
 wRpz0qZR8vWLKjX7C53/ZMz2YScM8GdLonvhjsQUFF6kTuWre1BWmbMwA==
X-Google-Smtp-Source: AGHT+IH9Pxly1KkOAngXtmnCTp49btuhnhudeYM8IucjVtpMMTrprdVjqVAvd4Ltow0b92P3+UAzuA==
X-Received: by 2002:adf:ab0a:0:b0:38a:50fa:d582 with SMTP id
 ffacd0b85a97d-38a50faf3cemr1893012f8f.59.1735428774217; 
 Sat, 28 Dec 2024 15:32:54 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8474c2sm25616331f8f.55.2024.12.28.15.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 15:32:53 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:39 +0100
Message-Id: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJeKcGcC/x3MQQqAIBBA0avIrBPKFKSrRIjpVLPQRCuC6O5Jy
 7f4/4GCmbDAwB7IeFGhPVZ0DQO32bgiJ18NohWyE0LzM3l7oEnBBOvyzlEqrWa0i+97qFXKuND
 9H8fpfT9Zpv3sYQAAAA==
X-Change-ID: 20241228-update_pm_macro-e4585beafd33
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=giHUQnI8ap63UVqjMPzoWtpyquzmfVZTDzUG6P1RK5Q=; 
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqaIFUIX99U52dYXyKTHv3kUYpiB1NgWDXmQ
 fbeWDg8/+6JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKmgAKCRDnIYpo1BLC
 tcMtEACBJ0gPdEh3A9kQDku4xnQ3prDDj0BroWFCemcZ3uDele37akkQ207mrAPUnUAf9Zjo6nc
 lFC566Wdx1jXko5eOVPaPJ/edqebt3W2r4sk2Y3mZcT6m2+MeO43BR2XfjjNXzSxDSYp6zSh0QM
 R0urFraGthT4o2d/WeZBebYnfPMfCemp8aA5KA3NDlRTDs0AdY8BNKiLKl2eaRuZno4DUuK2ibI
 zw8rWXkJHld/dOAL+sm+Z4L5PnkRFnUCDk/IXDiJuHWiYlKzwX7G2FP1s1r/fAIFg4rtm2x8wCo
 guwnv5TNvItP1xk1dOqmdxOqboQdx7O6Zxg6aE0iz/LFB0oU/cV0tTZJQaI1mg9LSJQqjF9tFiD
 ws0ugN8G4DLBVUJotARGmqBcWIyIzHZpP1u0UBpnM58l87bG1qK+9CLt2EnCUELhVgdz+QOqtfm
 mU6LioIYAoEFxMPlYDjFTK++GHJ28PO9vOfanD8WFpAIHbUrJJyWXXyI28hKfcBLOXPuxN5kmny
 YUc+xSr1t+hM1ger7KHjGW4dpzEpAOtWwYvYzk+WgMOn1vYeBqWC6x8LaEeN/qOGS+4ajhwrqj1
 c3PTO7zspLoPoHi7uMoGHkGtePff2MI9uzzYdWnKAQW3+iftKa3RtY8hFgxDar0iu0ldblZHZnB
 sISlnpXRGIpbxKw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] Switch from CONFIG_PM_SLEEP guards to
	pm_sleep_ptr()
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

Prevent the use of macros, and rely instead on kernel configuration for
power management.

This series makes the same change over six different drivers:
usb-st-dwc3, sdhci-st, st-spi-fsm, ahci_st, sti-dwmac, spi-st.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Raphael Gallais-Pou (6):
      usb: dwc3: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      mmc: sdhci-st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      mtd: st_spi_fsm: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      net: stmmac: sti: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      spi: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()

 drivers/ata/ahci_st.c                           | 6 ++----
 drivers/mmc/host/sdhci-st.c                     | 6 ++----
 drivers/mtd/devices/st_spi_fsm.c                | 6 ++----
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 8 +++-----
 drivers/spi/spi-st-ssc4.c                       | 6 +-----
 drivers/usb/dwc3/dwc3-st.c                      | 6 ++----
 6 files changed, 12 insertions(+), 26 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241228-update_pm_macro-e4585beafd33

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
