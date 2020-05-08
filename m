Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FB01CA1D4
	for <lists+linux-stm32@lfdr.de>; Fri,  8 May 2020 06:13:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 213D1C3FAC7;
	Fri,  8 May 2020 04:13:24 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 618B6C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 04:13:22 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w65so262009pfc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 21:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=n63i3r0L2IRpeGMKN7qKGLKSiEkxvDfFBuN0D82sIKo=;
 b=f549fH1riIbuo8ah1TTsCCpm1ZZXn7S2OPcoVIKseqS3u3naNxt2u5u2yue9ia4f35
 aukn+x9RoVtzRotGy89BFThqOsN+8Hvz0BiPwBjQEETQ9gD+zhB0cqzrEvTxKYQDvgwF
 ZZ3vzEx4Edbtr92ALNFDitl/XcwHHmoK6aBBirRzTJb2giYxmR8LHalrm8FHTOBuhSD6
 hR6zDTJluoRElYuNmnpxzdsWrJvQ2QN2cyG5asOiU16f9ANpVcSJF4/7QDMMFK9+ZPgV
 k0NVAlaHzH3PUoYp+3/40hIKX2qcANGDt4gxjc+LWJBv7LnVGgOCTAESa5PmQ5zQMZyR
 da5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=n63i3r0L2IRpeGMKN7qKGLKSiEkxvDfFBuN0D82sIKo=;
 b=IYOW5pfLfA9fY96PzpAk7hAK5HMbdV6UgLkh5exOC0eJsMnMUhyM1PgntmwXiKh6OZ
 68/0HI05pFeh9W7SKCJFQ+WIBE1fXJYWzovflHCjrxDPWGcZDDDq1cZ3qiUgSecmLfJB
 1MW3rFKtUzSAiOEFSQuPnOf6W0avwWD3LZGt8LgqFEsCQuOn8xA5xvwJhPy7G4UuyyAB
 bfW3kn3mBFKDwaB7kYWhgfbKi7v8XUmsV7oKVzpgjsmfSU4f9iLl3pZ58XvqhlITLRXz
 jDemBma10jmDDv2n+n9zDy3lnSlh+AuTrxb9otBOx1NPqmtIqbPX3iwURwLrPVhkgtN/
 iYEQ==
X-Gm-Message-State: AGi0Puao5SXr85YKja98CPAAGKbM96j0BmTf+bFdGvww83gs1KI1alld
 q+PMj2S+nxS2YbskckgWb3g=
X-Google-Smtp-Source: APiQypKy7XAhc6hawzdj77Xs0oeZFyq8G/VpqAn061VrqG5U+MNUQKe6OKJlyeRDZxXp18aM4MdX/g==
X-Received: by 2002:a63:da49:: with SMTP id l9mr508966pgj.432.1588911200789;
 Thu, 07 May 2020 21:13:20 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id h12sm314868pfq.176.2020.05.07.21.13.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:13:20 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Date: Fri,  8 May 2020 12:13:09 +0800
Message-Id: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/5] Enable ilitek ili9341 on
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

This patchset have following changes

V2: verify ilitek,ili9341.yaml with make O=../linux-stm32 dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

V1:
    add ili9341 drm panel driver
    add ltdc, spi5 controller for stm32f429-disco
    add ltdc, spi5 pin map for stm32f429-disco
    add docs about ili9341
    fix ltdc driver loading hang in clk set rate bug

dillon min (5):
  ARM: dts: stm32: Add pin map for ltdc, spi5 on stm32f429-disco board
  ARM: dts: stm32: enable ltdc binding with ili9341 on stm32429-disco
    board
  dt-bindings: display: panel: Add ilitek ili9341 panel bindings
  clk: stm32: Fix stm32f429 ltdc driver loading hang in clk set rate.
    keep ltdc     clk running after kernel startup
  drm/panel: add panel driver for Ilitek ili9341 panels

 .../bindings/display/panel/ilitek,ili9341.yaml     |  68 +++
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi             |  67 +++
 arch/arm/boot/dts/stm32f429-disco.dts              |  40 ++
 drivers/clk/clk-stm32f4.c                          |   5 +-
 drivers/gpu/drm/panel/Kconfig                      |   8 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 561 +++++++++++++++++++++
 7 files changed, 748 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
