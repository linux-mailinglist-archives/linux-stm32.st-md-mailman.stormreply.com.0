Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1C2395CF9
	for <lists+linux-stm32@lfdr.de>; Mon, 31 May 2021 15:38:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AB7EC57B5A;
	Mon, 31 May 2021 13:38:50 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BBFEC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 May 2021 13:38:47 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id z1so10076503ils.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 May 2021 06:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FJjTP/aMtqc95h7+azyzF9qSKsr/2y4gqn+xle7LyA4=;
 b=heyb59WwAkoo3d550Gfx+nOEE7udb5QadEk30NQjR81DMMP541K4kBh9LSkJmenfjH
 +jGbFluE/8FogycBNvn+EpULSNIoDvMnZ6gFgRI/2dnKWmCe0+ID4oG4kjg4jsrWoNGI
 PFkxOHS84LJl4KdPUheo2Ka8ti6wrr3rmPDi9pokVgUNWCUp7tphci/sniJDhmNauf/6
 qTxtmI8HO006XBvp555rAowDeA+EA7l08oyLa6BmuGu/KxouskWgTZfRaHaPlZAF+ewX
 yC5FAPV88ZhGC+Xjfcc9+4vkIYBgFFKSQDm8IySQSuhvpBtQ11eZvwnOazex2NnDo3bP
 queQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FJjTP/aMtqc95h7+azyzF9qSKsr/2y4gqn+xle7LyA4=;
 b=f9jwfFD5I8moDo/gQLR5rbBigSGox8gEaxE4dAjr/VFvZ5dZ0F47HXMBiSnJQ8e8ys
 dpSEahI/3O5evYEpKnT/UFxIqCttjK+SYGuLV9RUA9mn2WPnxe2no2cHLJhF2XkbLPvB
 ss+giudc6SNmCWCqpNkY7aqj+wa7vc7tXQAFtAq427ral8yEb9GVVRUOxG95zh/qLkfS
 M56udNO9/Qlt87niZPaf7nYYiSG63ICS/ECtc0LZ9DDENWKbUknf+chVltkQVh4CXzLt
 Eott7iXJfXAf95Tw25Ze9x3g+AV4l51P78L3PseI1ERKWbGg7uiMbgOV+fRu4/MDjUnr
 mfiA==
X-Gm-Message-State: AOAM532NCWsO3pC4bsdNnW70yCbp2Nb5l35wGRxjs8XzjKGmXO5VOcGe
 T3RNGfQSxYpSDx7qkLptJyH2BLYjtV/bsGX266w=
X-Google-Smtp-Source: ABdhPJzInzYfNyLDllaW2Mkniq7b/0y2WuE7ZzTjpk/mSq+yI9xt4IeRksqfNZYWsGRb20tjpuNsU0Af4gb/pwAGGrU=
X-Received: by 2002:a92:a302:: with SMTP id a2mr17309700ili.184.1622468326383; 
 Mon, 31 May 2021 06:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
 <401eb514-27bd-03f6-f7a5-22604882b28a@foss.st.com>
In-Reply-To: <401eb514-27bd-03f6-f7a5-22604882b28a@foss.st.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Mon, 31 May 2021 21:38:10 +0800
Message-ID: <CAL9mu0KScM+imZKVd8pfdm+8hDkRpvMVhGF6cgaEnNiLpkfjoA@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 alain.volmat@foss.st.com, christian.koenig@amd.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 0/4] Fix the i2c/clk bug of stm32 mcu
	platform
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

Hi Patrice

Thanks for your time to test my patch.

On Mon, May 31, 2021 at 9:20 PM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
> Hi Dillon
>
>
>
> On 5/14/21 1:02 PM, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > This seriese fix three i2c/clk bug for stm32 f4/f7
> > - kernel runing in sdram, i2c driver get data timeout
> > - ltdc clk turn off after kernel console active
> > - kernel hang in set ltdc clock rate
> >
> > clk bug found on stm32f429/f469-disco board
> >
> > Hi Patrice:
> > below is the guide to verify the patch:
> >
> > setup test env with following files(link at below 'files link'):
> > [1] u-boot-dtb.bin
> > [2] rootfs zip file (used in kernel initramfs)
> > [3] u-boot's mkimage to create itb file
> > [4] kernel config file
> > [5] my itb with-or-without i2c patch
> >
> > This patch based on kernel commit:
> > 88b06399c9c766c283e070b022b5ceafa4f63f19
> >
> > Note:
> > panel-ilitek-ili9341.c is the driver which was submitted last year, but not
> > get accepted. it's used to setup touch screen calibration, then test i2c.
> >
> > create itb file(please correct path of 'data'):
> > ./mkimage -f stm32.its stm32.itb
> >
> > HW setup:
> > console:
> >        PA9, PA10
> >        usart0
> >        serial@40011000
> >        115200 8n1
> >
> > -- flash u-boot.bin to stm32f429-disco on PC
> > $ sudo openocd -f board/stm32f429discovery.cfg -c \
> >   '{PATH-TO-YOUR-UBOOT}/u-boot-dtb.bin 0x08000000 exit reset'
> >
> > -- setup kernel load bootargs at u-boot
> > U-Boot > setenv bootargs 'console=tty0 console=ttySTM0,115200
> >                     root=/dev/ram rdinit=/linuxrc loglevel=8 fbcon=rotate:2'
> > U-Boot > loady;bootm
> > (download stm32.dtb or your kernel with itb format, or download zImage, dtb)
> >
>
>
> Thanks for these informations
> I was able to load and boot DTB and uImage directly in SDRAM as you suggested,
> i saw Linux logo and kernel log on the STM32F429-disco display,
> but i can't reach the login.
>
> The last kernel log i got is :
>
> Starting kernel ...
>
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 5.13.0-rc1-00082-g9dbbd5cb6240-dirty (nxp11987@lmecxl0573.lme1
> [    0.000000] CPU: ARMv7-M [410fc241] revision 1 (ARMv7M), cr=00000000
> [    0.000000] CPU: unknown data cache, unknown instruction cache
> [    0.000000] OF: fdt: Machine model: STMicroelectronics STM32F429i-DISCO board
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000090000000-0x00000000907fffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
>
> [...]
>
> [    2.637564] printk: console [ttySTM0] enabled
> [    2.747984] panel-ilitek-ili9341 spi0.1: get optional vcc failed
> [    2.758986] spi_stm32 40015000.spi: driver initialized
> [    2.795733] i2c /dev entries driver
> [    2.849955] stmpe-i2c 0-0041: stmpe811 detected, chip id: 0x811
> [    2.922030] stmpe-ts stmpe-ts: DMA mask not set
> [    2.965729] input: stmpe-ts as /devices/platform/soc/40005c00.i2c/i2c-0/0-0041/stmpe-ts0
> [    2.991570] stm32f4-i2c 40005c00.i2c: STM32F4 I2C driver registered
> [    3.058262] [drm] Initialized stm 1.0.0 20170330 for 40016800.display-controller on min0
> [    3.665951] panel-ilitek-ili9341 spi0.1: initialized display rgb interface
> [    3.765208] Console: switching to colour frame buffer device 30x40
> [    4.014269] stm32-display 40016800.display-controller: [drm] fb0: stmdrmfb frame buffere
> [    4.212737] Freeing unused kernel memory: 324K
> [    4.287300] This architecture does not have kernel memory protection.
> [    4.401202] Run /linuxrc as init process
> [    4.478622]   with arguments:
> [    4.555069]     /linuxrc
> [    4.595406]   with environment:
> [    4.672213]     HOME=/
> [    4.712511]     TERM=linux
> [  206.785289] random: crng init done

I guess you didn't add the rootfs to uImage I sent you.
Could you post all the logs from u-boot startup to kernel log end.

If possible, you can try my suggestion.
- tar -jxf stm32_rootfs.tar.bz2
- add stm32_rootfs to your kernel config( enable initramfs)
- make O=YOUR_KERNEL_OUT zImage dtbs LOADADDR=0x90008000
- create itb file (combine dtb and kernel, initramfs) by mkimage
  ./mkimage -f stm32.its stm32.itb
  (before above command, make sure you correct stm32.its adapt to your env)

This process will make u-boot to load the kernel more simple.

Thanks.

Best Regards.
Dillon


>
>
> I can't test your I2C patch.
>
> Patrice
>
>
> > -- setup ts_calibrate running env on stm32f429-disco
> > / # export TSLIB_CONFFILE=/etc/ts.conf
> > / # export TSLIB_TSDEVICE=/dev/input/event0
> > / # export TSLIB_CONSOLEDEVICE=none
> > / # export TSLIB_FBDEVICE=/dev/fb0
> >
> > -- clear screen
> > / # ./fb
> >
> > -- run ts_calibrate
> > / # ts_calibrate
> > (you can calibrate touchscreen now, and get below errors)
> >
> > [  113.942087] stmpe-i2c0-0041: failed to read regs 0x52: -110
> > [  114.063598] stmpe-i2c 0-0041: failed to read reg 0x4b: -16
> > [  114.185629] stmpe-i2c 0-0041: failed to read reg 0x40: -16
> > [  114.307257] stmpe-i2c 0-0041: failed to write reg 0xb: -16
> >
> > ...
> > with i2c patch applied, you will find below logs:
> >
> > RAW---------------------> 3164 908 183 118.110884
> > TS_READ_RAW----> x = 3164, y =908, pressure = 183
> > RAW---------------------> 3166 922 126 118.138946
> > TS_READ_RAW----> x = 3166, y = 922, pressure = 126
> > ....
> >
> > files link:
> > https://drive.google.com/drive/folders/1qNbjChcB6UGtKzne2F5x9_WG_sZFyo3o?usp=sharing
> >
> >
> >
> >
> > Dillon Min (4):
> >   drm/panel: Add ilitek ili9341 panel driver
> >   i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
> >   clk: stm32: Fix stm32f429's ltdc driver hang in set clock rate
> >   clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
> >     kernel startup
> >
> >  drivers/clk/clk-stm32f4.c                    |   10 +-
> >  drivers/gpu/drm/panel/Kconfig                |   12 +
> >  drivers/gpu/drm/panel/Makefile               |    1 +
> >  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 1285 ++++++++++++++++++++++++++
> >  drivers/i2c/busses/i2c-stm32f4.c             |   12 +-
> >  5 files changed, 1310 insertions(+), 10 deletions(-)
> >  create mode 100755 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
