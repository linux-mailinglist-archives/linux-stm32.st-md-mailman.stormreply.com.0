Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD1A3D336C
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jul 2021 06:06:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E491C5A4CD;
	Fri, 23 Jul 2021 04:06:53 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63411C597B8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 04:06:51 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso2131518pjs.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 21:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=RKdaEsPfAlKUYrkBK+n66uijIOWgcmdfoucBJb81UlI=;
 b=JlI8qQBVsqJolo4J6+lssAhVLAW4WI0h44RDmyWUIozpf+HOYMa6oBPQY1CYaiETlJ
 e0p86s7S0YEN67eYMoIL15B+yq73t8iZ2B1TS4Mt68w8NCbsCDQgCYD5NoQMX8Q/yFd7
 jLFu7ikQ7oHqAbsSavkh78zOBk+wGcGqGUQHmiViMybrCSnku6302tIgpPX/KakAGv3P
 7SyQ7QMGWrrYhdcT70+tQwFpqylL89y4fD72k9u3B2/UKDFohUYhUBaG92avHjQwYlAw
 mIa8fRBZRpH3chTO8D5m7mSFqhNVESnOh2YHa/806R7tW+ymgaHxrT9fVuGf82ZJo7i0
 A77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RKdaEsPfAlKUYrkBK+n66uijIOWgcmdfoucBJb81UlI=;
 b=F1NCu5S8isLl/9nv/Z/k4pq6Z7OlsaldwByhv0ys4Rz9nij7U5lGwMd+3bUIGgA2T2
 nbW9FOMpUx7jSPsnPF7FDq600rtO5W7d2u6ZPfAWLiXtcgkLr7SoD++LFwHzi4MDjxH6
 qF0C/ao4kZouo4L6k/iZXUiXKZjZWJX8w4xOgfW6gfyAQ2ziUQTsearH+VVIoeVnQVp2
 pxN3cXkw8y210uVbwYKBi6TXPmS0TKJU4w2GielmUWWVfTbRB172LKPYjBYwDBR3o7MA
 6i3n84llo2XO8jbprs5c1X1B7sKiKj3oTkva7iN4+Dg6FtehHbiORc0gMF4dS0QKE8ci
 hOMQ==
X-Gm-Message-State: AOAM530MRmEuVCjNM7rgCUjXFcHmRbrs1C7ugkaouvrjgTK5QMqCAxm4
 wOjDLDbDp+dHFv/Bq+dvQns=
X-Google-Smtp-Source: ABdhPJwNAAij7z5rx88FKTHLGOz5rOgz5z1mKMYlcOKEJ1KRn7lreB7XIeJuFyi4DPC2Jc0gvis/mg==
X-Received: by 2002:a63:1d47:: with SMTP id d7mr3132259pgm.44.1627013209715;
 Thu, 22 Jul 2021 21:06:49 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id p3sm35474910pgi.20.2021.07.22.21.06.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Jul 2021 21:06:49 -0700 (PDT)
From: dillon.minfei@gmail.com
To: laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com
Date: Fri, 23 Jul 2021 12:06:40 +0800
Message-Id: <1627013203-23099-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 noralf@tronnes.org, Dillon Min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/3] Add ilitek ili9341 panel driver
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

v3:
- add Fixes tags.
- collect reviewed-by tags from linus and jagan.
- replace DRM_ERROR() with dev_err() or drm_err().
- remove kernel-doc markers from struct ili9341_config{}.
- reorder include headers.
- remove the struct device *dev from struct ili9341{}.
- restructure the ili9341_probe() function, add two ili9341_{dbi,dpi)_probe()
  to make it more readable according to jagan's suggestion, thanks.

for the full drm driver exist in drm/panel need Sam and Laurent's feedback.
so, not cover this part at this time, will be update in v4.

v2 link:
https://lore.kernel.org/lkml/1626853288-31223-1-git-send-email-dillon.minfei@gmail.com/

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

 .../bindings/display/panel/ilitek,ili9341.yaml     |  78 ++
 arch/arm/boot/dts/stm32f429-disco.dts              |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 786 +++++++++++++++++++++
 5 files changed, 878 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
