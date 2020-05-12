Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0591CED7B
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 09:03:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8B59C36B3B;
	Tue, 12 May 2020 07:03:46 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6590BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 07:03:45 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id hi11so9057042pjb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 00:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mipxNW7wlMfxMGzhO28Zqov8GTbtGeGtVOGitUJWy1g=;
 b=jhsgIyTPnDqRWSwbXSvTHyprY40KS9vAbW6rcrOxqvOdnjjSCNpBTwLTElgpNEzgCv
 B/hU4Z8wkqrvGJHq59AS0U9JQ6yXrwGMFmB8kBkBvf7nXAqmNJ0jZaejbMa5GQZuvEBS
 eLoZmX4dAQxHnMwTz0F++g+Q9cMlfwGAGLMmpOWVa6HNkUWlnh6e16A5ZPiiELLtULyY
 z563mUjwWwpWancdRnp0L6fRRlwklxrRA5iRY5cvzd2FlBcT9lSknFeoiEuJJfdTgctn
 X/bMM/ECf64aLI5IcgeQibHurIkmnmOFetTDvjvalW3B8d+rNzxbwXeZHB3ykoTPHH3C
 BXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mipxNW7wlMfxMGzhO28Zqov8GTbtGeGtVOGitUJWy1g=;
 b=G3aMIWvE6HQ0qq6d5whkkr+C1V1NmypyLFDUCxUNskcFq7z4qPr7a7pTWv9nsSPutB
 Ao/wHBFmTR8/kQCtalcSoA0kRYvPFuCxGFUFL2nPvzO1r/dF5/bDynKsjB1glL0WeLZn
 +etzBDFRZMN9fFUYjt7g53xRt302UmsibIdDmaHx+WVFs9g5dxGsOmlwdxU4R1zivHik
 a/LuaFM1hui6VfoIg93mzfhnMMd4h4IwWvbCcIoJ/z3Q1Ea33k/e+8enQCGVruPgXh95
 JtLwt5SWAqqyV/1/C5l8Am2M0QFoXL0hlFIkQGzmUe1ID2P6fTjzWwM29X1s7er+2OEb
 GWqg==
X-Gm-Message-State: AGi0PuZwX3s23fYOR9a1NJ5ad+NtzcyV2NURk4e3zPGm94uBK10D43aP
 9Rf0vmKQWuGLVOxLGHm7QBY=
X-Google-Smtp-Source: APiQypKGhdYXmj/mC8uQ3bBGAeu+OpMtK+0m3u5lxy4OVl4GniR0xQaSDQxS0oHIcUIBNStrnMsqkg==
X-Received: by 2002:a17:90a:db53:: with SMTP id
 u19mr25689708pjx.41.1589267023718; 
 Tue, 12 May 2020 00:03:43 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id 62sm11016369pfu.181.2020.05.12.00.03.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:03:43 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Date: Tue, 12 May 2020 15:03:32 +0800
Message-Id: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon.minfei@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/5] Enable ilitek ili9341 on
	stm32f429-disco board
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

From: dillon min <dillon.minfei@gmail.com>

This patchset has following changes:

V3:
    merge original tiny/ili9341.c driver to panel/panel-ilitek-ili9341.c
    to support serial spi & parallel rgb interface in one driver.
    update ilitek,ili9341.yaml dts binding documentation.
    update stm32f429-disco dts binding

V2: 
    verify ilitek,ili9341.yaml with make O=../linux-stm32 dt_binding_check
    DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/
    ilitek,ili9341.yaml

V1:
    add ili9341 drm panel driver
    add ltdc, spi5 controller for stm32f429-disco
    add ltdc, spi5 pin map for stm32f429-disco
    add docs about ili9341
    fix ltdc driver loading hang in clk set rate bug

dillon min (5):
  ARM: dts: stm32: Add pin map for ltdc, spi5 on stm32f429-disco board
  dt-bindings: display: panel: Add ilitek ili9341 panel bindings
  ARM: dts: stm32: enable ltdc binding with ili9341 on stm32429-disco
    board
  clk: stm32: Fix stm32f429 ltdc driver loading hang in clk set rate.
    keep ltdc     clk running after kernel startup
  drm/panel: Add ilitek ili9341 driver

 .../bindings/display/panel/ilitek,ili9341.yaml     |  68 ++
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi             |  67 ++
 arch/arm/boot/dts/stm32f429-disco.dts              |  39 ++
 drivers/clk/clk-stm32f4.c                          |   5 +-
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 700 +++++++++++++++++++++
 7 files changed, 890 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
