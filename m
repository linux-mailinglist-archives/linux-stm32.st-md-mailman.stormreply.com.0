Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 456F1CDD38
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2019 10:27:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E4A2C36B0C;
	Mon,  7 Oct 2019 08:27:04 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94253C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 08:27:02 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id z6so10258859otb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Oct 2019 01:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VKymJxaLp2SF18G9ExdMOsAdXsmgBDVfrU/If3JZGxo=;
 b=ZOROTOWgB9ce8wvtzqis8ETuK5Un0HB6Z5vNq7kSon661ODiRAgXuMEOEabmhffvZN
 UbEHAAHeN979CpWllJxJKffA0vi1FjoruNvpLtE6eJcPydwz7QLylDjT05BXjWbtAbkF
 gI2NcdbBHaRpSwU6jkkmp9L1clJZr7ns62EIOUYYCFu0B19buqDk3LwSmvVhIgfD6mhB
 UJfIt4iYMUoMTqL+faq9IE2PWH2n6uIRIUhkVsZKIxNgfyP4kZzUgcQ4+CY7z3FKIBb4
 QGMTf2D1vdpuo2qjg5nDWahYiQ3DxLtdUo+Furw0Etp/eKRIMfHLpwLpqNbyEivIybWB
 q/lQ==
X-Gm-Message-State: APjAAAUSIwNBkA6jX/DdsnhKQzmfJWCIY3VK6645CknE2T3PvTxoA62p
 19jrvsQK3sNdkRay5iOpMZaPJSDIite0Z8xMpww=
X-Google-Smtp-Source: APXvYqxEOkV8nJCSllSqxdkQVypo90wcNgBvYDBNSKRgpoLJCvXTnmOdSLlUAojqzzfR9rCgupdlwodIFF5kpYpgt28=
X-Received: by 2002:a9d:17e6:: with SMTP id j93mr20339687otj.297.1570436821298; 
 Mon, 07 Oct 2019 01:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191004145544.5066-1-krzk@kernel.org>
 <20191004145544.5066-3-krzk@kernel.org>
In-Reply-To: <20191004145544.5066-3-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2019 10:26:49 +0200
Message-ID: <CAMuHMdW0DSujexoGq4CJAYP40DvMcigk08aEnyQ72haY6jds5Q@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci <linux-pci@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, ac100@lists.launchpad.net,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 scsi <linux-scsi@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, esc.storagedev@microsemi.com,
 linux-security-module@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-input@vger.kernel.org, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 driverdevel <devel@driverdev.osuosl.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 openipmi-developer@lists.sourceforge.net,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-raid@vger.kernel.org,
 Jiri Kosina <trivial@kernel.org>, Linux MM <linux-mm@kvack.org>,
 netdev <netdev@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, dmaengine@vger.kernel.org,
 linux-integrity <linux-integrity@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [Linux-stm32] [RESEND TRIVIAL 3/3] treewide: arch: Fix Kconfig
	indentation
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

On Fri, Oct 4, 2019 at 4:57 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
>     $ sed -e 's/^        /\t/' -i */Kconfig
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

>  arch/m68k/Kconfig.bus                  |  2 +-
>  arch/m68k/Kconfig.debug                | 16 ++++++++--------
>  arch/m68k/Kconfig.machine              |  8 ++++----

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
