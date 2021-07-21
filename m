Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 881573D09DD
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jul 2021 09:41:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C496C597BE;
	Wed, 21 Jul 2021 07:41:39 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9E85CFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 07:41:36 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id b12so537786plh.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BQot9UItgo6XN+5GjiuK2SpVANWGwz3AoSdzswtxo6U=;
 b=cauIKMH8zc6qx5eC0HA5pKkcJgsEJwskQoocWc6fYrwYD8Yv5uaINCHnaL+FsPoVVg
 FnBIn+54FOCtYfRZfGeMmKuJ1IS7/iZpR44xinqi62wma2K/IMKKZ3ObqW0Ki+nIBoeb
 Ivw43SYUT1MMha6XbeYB3IWtXjfOHD1/LD3awEP6RSfpOTDCgB30Frx7ZOvInVsVD6pY
 obBRiov76RwnQBbNdeuLgvNodYEBw1qylzHLc489yJkW/XBs4VUMQgzBrM2KIRU5gi++
 s/A+zn0JEoZKfaa8fPHCydAKUFtHwoY/T1WUdtTzro+A5pouRPRu54VlEYTRrik9nCJc
 tb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BQot9UItgo6XN+5GjiuK2SpVANWGwz3AoSdzswtxo6U=;
 b=J36g/wXBM7SR2v6sMmVrFhWuhBeVxW4nF3h3aP5JtVQgvKoyLstScQSf+Hl4KKBm8D
 jmg2ZAOeIKZih3I66jonK3ufFnRS4OEm3j4FHZMJuGjuB80hPHU+D93Kc+3gRMzFeQEI
 Ju5t9YjHT3NstSM2xpwyVhYrfqHLWKbBIJSY9hwT0djjRGj5eFB8999FXiSTcdj3AOW4
 emKoPor8APedEbiat0evWraevQeOyXq6PS4OdOoYJ1+p+aGblY6aBSciiaAPWwiKcBQf
 QJsmO97pTn1RHLNCpqEVUmC3w5zkBbr5x63s0xhnRqykTEmGL9BXQQTxTUzjVI5LCscl
 4tRQ==
X-Gm-Message-State: AOAM531ehYSKgj3CgoKIknVgwKNwYFhMwowYzY0dIAduQtrI8qSX2kgv
 EfoQLEsZ1B4nBReDc2mniHw=
X-Google-Smtp-Source: ABdhPJwhNk3YO74f6uSp+4Dh/cuvO4Pe1uHMBx6hL82AB/WyBUffaXaWt4dXRDMjdeEKIlTsxOmukQ==
X-Received: by 2002:a17:902:e8ce:b029:12b:3d80:a028 with SMTP id
 v14-20020a170902e8ceb029012b3d80a028mr26666684plg.47.1626853295180; 
 Wed, 21 Jul 2021 00:41:35 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i8sm4841867pjh.36.2021.07.21.00.41.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Jul 2021 00:41:34 -0700 (PDT)
From: dillon.minfei@gmail.com
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, linus.walleij@linaro.org,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com
Date: Wed, 21 Jul 2021 15:41:25 +0800
Message-Id: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 noralf@tronnes.org, Dillon Min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/3] Add ilitek ili9341 panel driver
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

From: Dillon Min <dillon.minfei@gmail.com>

Since the st,sf-tc240t-9370-t dts binding already exist in stm32f429-disco.dts
but, the panel driver didn't get accepted from mainline. it's time to submit
patch fot it.

This driver can support two different interface by different dts bindings:
- spi+dpi, use spi to configure register, dpi for graphic data.
  st,sf-tc240t-9370-t
- only spi, just like tiny/ili9341.c (actually, this part is copy from tiny)
  adafruit,yx240qv29

I submited the first patch last year, you can find it at [1].
this patch has one major difference from that one, which is replace the low
level communication way, from spi_sync() to mipi_dbi_{command,
command_stackbuf}() interface, referred from Linus's patch [2].

both the two dpi/dbi interface was tested on stm32f429-disco board, if anyone
want to verify this patch, you need apply the clk patch for this board first,
you can get it from [3]

[1] "drm/panel: Add ilitek ili9341 panel driver"
https://lore.kernel.org/lkml/1590378348-8115-7-git-send-email-dillon.minfei@gmail.com/

[2] "drm/panel: s6e63m0: Switch to DBI abstraction for SPI"
https://lore.kernel.org/dri-devel/20210611214243.669892-1-linus.walleij@linaro.org/

[3]
https://lore.kernel.org/lkml/1590378348-8115-6-git-send-email-dillon.minfei@gmail.com/

v2:
- replace vcc regulator to bulk regulators in driver, from linus suggestion.
- fix dtbs_check warnings on ili9341 dts binding check.
- add bulk regulation node in ilitek,ili9341.yaml.
v1 link:
https://lore.kernel.org/lkml/1626430843-23823-1-git-send-email-dillon.minfei@gmail.com/

Dillon Min (3):
  dt-bindings: display: panel: Add ilitek ili9341 panel bindings
  ARM: dts: stm32: fix dtbs_check warning on ili9341 dts binding
  drm/panel: Add ilitek ili9341 panel driver

 .../bindings/display/panel/ilitek,ili9341.yaml     |  78 +++
 arch/arm/boot/dts/stm32f429-disco.dts              |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 778 +++++++++++++++++++++
 5 files changed, 870 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
