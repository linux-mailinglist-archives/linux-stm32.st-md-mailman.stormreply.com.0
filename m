Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A71743807E2
	for <lists+linux-stm32@lfdr.de>; Fri, 14 May 2021 13:02:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FF0EC57B53;
	Fri, 14 May 2021 11:02:41 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 616D0C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 11:02:39 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id j12so17791077pgh.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=g7DkEbR2JcQCbOxkMhdC26BeBE1YwkunloMTb/SDIZc=;
 b=TPBiLWV/NQn/o4Os0P4M/SsGh0ZuidyhHWzGQieQPX0qaKdDvntKEKGuI2k+UWP9UV
 0JFkGypQMuPK9kdymjMT64VZofeIz/FLcvpZCvW+PhnPxq1r4pWFKWwjKZ45IqUlKIqI
 xnRQgvBUQOvQCunnoMxY32zrpKwgT9WQ0PAbnwPaFGvjoGBlsTaTnBi8sp2dFyd+FcWM
 a7cOOgn+mMaTwe2xrA11UcqPbOPVi8xMo/BtDOIt73434TAsPV5ngVnQFTWLVl9ixZfV
 Efmz2Rji/0z1brCmNAums5zhFOO+uLGKXDgUTMsDJwBi/KnhY+lqIew0SINYzuNVSfzS
 zw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=g7DkEbR2JcQCbOxkMhdC26BeBE1YwkunloMTb/SDIZc=;
 b=pDBbG2rYFtogOI8xxiFNfQPkNh6U8eFxqs2cVu47+5dbNe8+5lEfeLI+LLkfe9u1ma
 NL+2w9mOpfG1ve09tA4ILFCFhbHAvfmv6IQSASyHMq0TXWmJI1FNYXckEVexwrpk1F1k
 ek0xX7OvkghUIUyL3G9bP2jky9FnzYMTQaOWXVhcpg8gTNqSvEvhtlg7n9XnFWfoxTAj
 bLq0hUXrAR5WbTtE7a+8Po03hC5ynC+2aJDwZ+fC1C0yRQPWBIi54jJCpi5pXoRGmgMJ
 EFAx2gu24t+rjxAXkMpFflEum6aZ4NFIla46o8e0w2z970+HuYFE2tchNvaCbW+GCfyu
 xK1A==
X-Gm-Message-State: AOAM532u/s0RW3m3vqwbS8ExYVDcqXNaJCRUj/zQ2w8LMhcqucMLwlI1
 nVY79yYuKO82kQiSCXdStg4=
X-Google-Smtp-Source: ABdhPJzI0fGVTZCZdc30Z3TaVpb0GVm4cmbsGmevnEN/twwgl1TCynmfAE+pe70r417S9GkSp3vXSA==
X-Received: by 2002:a63:465f:: with SMTP id v31mr13437876pgk.6.1620990157678; 
 Fri, 14 May 2021 04:02:37 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 202sm4193402pgg.59.2021.05.14.04.02.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 May 2021 04:02:37 -0700 (PDT)
From: dillon.minfei@gmail.com
To: patrice.chotard@foss.st.com, pierre-yves.mordret@foss.st.com,
 alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, mturquette@baylibre.com
Date: Fri, 14 May 2021 19:02:28 +0800
Message-Id: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: sboyd@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/4] Fix the i2c/clk bug of stm32 mcu platform
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

This seriese fix three i2c/clk bug for stm32 f4/f7
- kernel runing in sdram, i2c driver get data timeout
- ltdc clk turn off after kernel console active
- kernel hang in set ltdc clock rate

clk bug found on stm32f429/f469-disco board

Hi Patrice:
below is the guide to verify the patch:

setup test env with following files(link at below 'files link'):
[1] u-boot-dtb.bin
[2] rootfs zip file (used in kernel initramfs)
[3] u-boot's mkimage to create itb file
[4] kernel config file
[5] my itb with-or-without i2c patch

This patch based on kernel commit:
88b06399c9c766c283e070b022b5ceafa4f63f19

Note:
panel-ilitek-ili9341.c is the driver which was submitted last year, but not
get accepted. it's used to setup touch screen calibration, then test i2c.

create itb file(please correct path of 'data'):
./mkimage -f stm32.its stm32.itb

HW setup:
console:
       PA9, PA10
       usart0
       serial@40011000
       115200 8n1

-- flash u-boot.bin to stm32f429-disco on PC
$ sudo openocd -f board/stm32f429discovery.cfg -c \
  '{PATH-TO-YOUR-UBOOT}/u-boot-dtb.bin 0x08000000 exit reset'

-- setup kernel load bootargs at u-boot
U-Boot > setenv bootargs 'console=tty0 console=ttySTM0,115200
                    root=/dev/ram rdinit=/linuxrc loglevel=8 fbcon=rotate:2'
U-Boot > loady;bootm
(download stm32.dtb or your kernel with itb format, or download zImage, dtb)

-- setup ts_calibrate running env on stm32f429-disco
/ # export TSLIB_CONFFILE=/etc/ts.conf
/ # export TSLIB_TSDEVICE=/dev/input/event0
/ # export TSLIB_CONSOLEDEVICE=none
/ # export TSLIB_FBDEVICE=/dev/fb0

-- clear screen
/ # ./fb

-- run ts_calibrate 
/ # ts_calibrate
(you can calibrate touchscreen now, and get below errors)

[  113.942087] stmpe-i2c0-0041: failed to read regs 0x52: -110
[  114.063598] stmpe-i2c 0-0041: failed to read reg 0x4b: -16
[  114.185629] stmpe-i2c 0-0041: failed to read reg 0x40: -16
[  114.307257] stmpe-i2c 0-0041: failed to write reg 0xb: -16

...
with i2c patch applied, you will find below logs:

RAW---------------------> 3164 908 183 118.110884
TS_READ_RAW----> x = 3164, y =908, pressure = 183
RAW---------------------> 3166 922 126 118.138946
TS_READ_RAW----> x = 3166, y = 922, pressure = 126
....

files link:
https://drive.google.com/drive/folders/1qNbjChcB6UGtKzne2F5x9_WG_sZFyo3o?usp=sharing




Dillon Min (4):
  drm/panel: Add ilitek ili9341 panel driver
  i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
  clk: stm32: Fix stm32f429's ltdc driver hang in set clock rate
  clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
    kernel startup

 drivers/clk/clk-stm32f4.c                    |   10 +-
 drivers/gpu/drm/panel/Kconfig                |   12 +
 drivers/gpu/drm/panel/Makefile               |    1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 1285 ++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-stm32f4.c             |   12 +-
 5 files changed, 1310 insertions(+), 10 deletions(-)
 create mode 100755 drivers/gpu/drm/panel/panel-ilitek-ili9341.c

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
