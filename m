Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C94A432F3E
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 09:20:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34BE2C5C849;
	Tue, 19 Oct 2021 07:20:29 +0000 (UTC)
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8277C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 07:20:26 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id cjQ2mhtJMx7rIcjQ5mjGUx; Tue, 19 Oct 2021 09:20:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1634628026; bh=kgJd386is3N9Ye7PgKvPx5Oi0YosETJz+W5L4nYgyWE=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=d9fQf6dtgNHdx3ME4+XuMr63QVfFd3STR0ZUXcA+LcGFD19nFgMMm72rVK6BRuEi3
 g/SnWN9TrNeiOZOudqBZbYtVHcHcWGzuhgVgkvgz5GDLQpI+EmO+qQseKbQut5izIN
 gw3ivW4uVY10fgxTnB7uq182nFXwBF2V3OqOZWfGIGSWiS3YDdy6v5quv+658TkTzL
 H/YPMuhJ7Na4/w2XmpyMb9MYe336Ae6n1HL91uFu5ogl/OLiWtCikhH0OyhKZ5R1OD
 kKUpzJRxC2Dm6wjPjK24oM8CFTfYMsccNZhuny/D+344UFH9pZF8xbevrC/AMIJCUX
 ezVSRavyecUSQ==
To: Dillon Min <dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
 <1634533488-25334-11-git-send-email-dillon.minfei@gmail.com>
 <5393e39f-cee8-cbe6-f8fd-203a48b35ed8@xs4all.nl>
 <CAL9mu0+Ea7eQDetJs8He9RNUDOO3UejQVepVLr_LTYqOYeUrXA@mail.gmail.com>
 <CAL9mu0JY-9UuJ9QOXrqYFvSE_LhCw7Lhd+UwnXUsoY2vsRD_mA@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2abb1715-a563-33a1-a369-dbbfcdf1a519@xs4all.nl>
Date: Tue, 19 Oct 2021 09:20:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0JY-9UuJ9QOXrqYFvSE_LhCw7Lhd+UwnXUsoY2vsRD_mA@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfJ/9bdNSgAWg9tIebOU/etIehHiEuD1bxLL/6VXuBbhOTekZksyBWQsap5XJ5c5qOkOh8/sThjbr21VygoF9mGdZLbOu5LLbq7EobhJy4/TffaGpvpg5
 rAgs2BWOMhjPA01HGFNq3Do3sGvIz9skz95qSq+YGyMGeddMDQIrtFcM4vU9UYpHO0nJPgv8Ca1G4bPakkKEj6PIRw0xTkI0CqlBFiw1qUs6vV5QdCMVrnJl
 BV1IMLPVPyc+T+YExONbQfPudjk5wIUSrx+LtElm9OVErbCykhwOrkRY9fYJVfKYqnkkDM7Fcv5lmbzQ0Y0s0D5cJy97+TlNzLcUpJgE1PWqDCOtvJNrVQkf
 117QPfLlJx9RT0jMgNXID4v0Ivz4qZBOQZa8AfpkI3mBIiYG5NC1gKYf8fNAQJtv+d/IiGqxSZe6YS0ibm+KyKimN0gxLWjJQDSLyXeh7WP3IlD1xQvEtIkS
 YipXnCB77WgACELXfytuBCcXZtbFDDumYXUry1VvWI/8JXXipvABqKA7Xe30qhjaMEnrfrd4IMLL1HHx9vl4Mlvyfw8lIwlBRmJXLzwPSDsksimUXlMstYzz
 vUUWGWjmsbLu4msZ6BMPh1eeHuk1/qvqemjndfRyLXIybwa2k7Fcx7R5mnZmDGp4bq75xF14NKqrspFW84q8i/OjpBByV92Hh/EJH4qrWLLSPKern0xl46+H
 mfkcP3/WKc7YqYGve7FVBYehIqfLIuvzsbkJEidCfHlL3bgf7w3cIMrb7QuMKLef7IOULWMd0eR/nxu7oUbghsSZYYreyJpSL0QZ57dJm+dJRybYuhxlSsLK
 P40lapm/fZ486naYf3KiKWXgf+97mdLZ6vvOVFiMuKROZ77w8KMLGPyFQo+7vQ6HhTU0Ykgj7HDtqoNal0SeZodgyt835xyxb0nlyqq9pahq0+Tv/zchpaOc
 xSZjuYz+VzdEo309jr1z/lB+zuo=
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, gnurou@gmail.com,
 linux-clk <linux-clk@vger.kernel.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mchehab+huawei@kernel.org,
 hugues.fruchet@foss.st.com, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, gabriel.fernandez@foss.st.com,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, ezequiel@collabora.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 10/10] media: stm32-dma2d: STM32 DMA2D
	driver
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

On 19/10/2021 04:30, Dillon Min wrote:
> Hi Hans
> 
> On Mon, 18 Oct 2021 at 18:25, Dillon Min <dillon.minfei@gmail.com> wrote:
>>
>> Hi Hans
>>
>> On Mon, 18 Oct 2021 at 17:30, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>
>>> On 18/10/2021 07:04, dillon.minfei@gmail.com wrote:
>>>> From: Dillon Min <dillon.minfei@gmail.com>
>>>>
>>>> This V4L2 subdev m2m driver enables Chrom-Art Accelerator unit
>>>> of STMicroelectronics STM32 SoC series.
>>>>
>>>> Currently support r2m, m2m, m2m_pfc functions.
>>>> - r2m, Filling a part or the whole of a destination image with a specific
>>>>   color.
>>>> - m2m, Copying a part or the whole of a source image into a part or the
>>>>   whole of a destination.
>>>> - m2m_pfc, Copying a part or the whole of a source image into a part or the
>>>>   whole of a destination image with a pixel format conversion.
>>>>
>>>> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
>>>> ---
>>>> v5:
>>>> - remove useless log from dma2d driver.
>>>> - update config VIDEO_STM32_DMA2D description.
>>>>
>>>>  drivers/media/platform/Kconfig                  |  11 +
>>>>  drivers/media/platform/Makefile                 |   1 +
>>>>  drivers/media/platform/stm32/Makefile           |   2 +
>>>>  drivers/media/platform/stm32/dma2d/dma2d-hw.c   | 143 +++++
>>>>  drivers/media/platform/stm32/dma2d/dma2d-regs.h | 113 ++++
>>>>  drivers/media/platform/stm32/dma2d/dma2d.c      | 739 ++++++++++++++++++++++++
>>>>  drivers/media/platform/stm32/dma2d/dma2d.h      | 135 +++++
>>>>  7 files changed, 1144 insertions(+)
>>>>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
>>>>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
>>>>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
>>>>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h
>>>>
>>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>>>> index d9f90084c2f6..0b3bdf56b44e 100644
>>>> --- a/drivers/media/platform/Kconfig
>>>> +++ b/drivers/media/platform/Kconfig
>>>> @@ -476,6 +476,17 @@ config VIDEO_STI_DELTA_DRIVER
>>>>
>>>>  endif # VIDEO_STI_DELTA
>>>>
>>>> +config VIDEO_STM32_DMA2D
>>>> +     tristate "STM32 Chrom-Art Accelerator (DMA2D)"
>>>> +     depends on (VIDEO_DEV && VIDEO_V4L2 && ARCH_STM32) || COMPILE_TEST
>>>> +     select VIDEOBUF2_DMA_CONTIG
>>>> +     select V4L2_MEM2MEM_DEV
>>>> +     help
>>>> +       Enables DMA2D hwarware support on stm32.
>>>> +
>>>> +       The STM32 DMA2D is a memory-to-memory engine for pixel conversion
>>>> +       and specialized DMA dedicated to image manipulation.
>>>> +
>>>>  config VIDEO_RENESAS_FDP1
>>>>       tristate "Renesas Fine Display Processor"
>>>>       depends on VIDEO_DEV && VIDEO_V4L2
>>>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
>>>> index 73ce083c2fc6..46f1c05bc576 100644
>>>> --- a/drivers/media/platform/Makefile
>>>> +++ b/drivers/media/platform/Makefile
>>>> @@ -70,6 +70,7 @@ obj-$(CONFIG_VIDEO_ATMEL_ISI)               += atmel/
>>>>  obj-$(CONFIG_VIDEO_ATMEL_XISC)               += atmel/
>>>>
>>>>  obj-$(CONFIG_VIDEO_STM32_DCMI)               += stm32/
>>>> +obj-$(CONFIG_VIDEO_STM32_DMA2D)              += stm32/
>>>>
>>>>  obj-$(CONFIG_VIDEO_MEDIATEK_VPU)     += mtk-vpu/
>>>>
>>>> diff --git a/drivers/media/platform/stm32/Makefile b/drivers/media/platform/stm32/Makefile
>>>> index 48b36db2c2e2..896ef98a73ab 100644
>>>> --- a/drivers/media/platform/stm32/Makefile
>>>> +++ b/drivers/media/platform/stm32/Makefile
>>>> @@ -1,2 +1,4 @@
>>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>>  obj-$(CONFIG_VIDEO_STM32_DCMI) += stm32-dcmi.o
>>>> +stm32-dma2d-objs := dma2d/dma2d.o dma2d/dma2d-hw.o
>>>> +obj-$(CONFIG_VIDEO_STM32_DMA2D) += stm32-dma2d.o
>>>> diff --git a/drivers/media/platform/stm32/dma2d/dma2d-hw.c b/drivers/media/platform/stm32/dma2d/dma2d-hw.c
>>>> new file mode 100644
>>>> index 000000000000..8c1c664ab13b
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/stm32/dma2d/dma2d-hw.c
>>>> @@ -0,0 +1,143 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * ST stm32 Chrom-Art - 2D Graphics Accelerator Driver
>>>> + *
>>>> + * Copyright (c) 2021 Dillon Min
>>>> + * Dillon Min, <dillon.minfei@gmail.com>
>>>> + *
>>>> + * based on s5p-g2d
>>>> + *
>>>> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
>>>> + * Kamil Debski, <k.debski@samsung.com>
>>>> + */
>>>> +
>>>> +#include <linux/io.h>
>>>> +
>>>> +#include "dma2d.h"
>>>> +#include "dma2d-regs.h"
>>>> +
>>>> +static inline u32 reg_read(void __iomem *base, u32 reg)
>>>> +{
>>>> +     return readl_relaxed(base + reg);
>>>> +}
>>>> +
>>>> +static inline void reg_write(void __iomem *base, u32 reg, u32 val)
>>>> +{
>>>> +     writel_relaxed(val, base + reg);
>>>> +}
>>>> +
>>>> +static inline void reg_set(void __iomem *base, u32 reg, u32 mask)
>>>> +{
>>>> +     reg_write(base, reg, reg_read(base, reg) | mask);
>>>> +}
>>>> +
>>>> +static inline void reg_clear(void __iomem *base, u32 reg, u32 mask)
>>>> +{
>>>> +     reg_write(base, reg, reg_read(base, reg) & ~mask);
>>>> +}
>>>> +
>>>> +static inline void reg_update_bits(void __iomem *base, u32 reg, u32 mask,
>>>> +                                u32 val)
>>>> +{
>>>> +     reg_write(base, reg, (reg_read(base, reg) & ~mask) | val);
>>>> +}
>>>> +
>>>> +void dma2d_start(struct dma2d_dev *d)
>>>> +{
>>>> +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_START, CR_START);
>>>> +}
>>>> +
>>>> +u32 dma2d_get_int(struct dma2d_dev *d)
>>>> +{
>>>> +     return reg_read(d->regs, DMA2D_ISR_REG);
>>>> +}
>>>> +
>>>> +void dma2d_clear_int(struct dma2d_dev *d)
>>>> +{
>>>> +     u32 isr_val = reg_read(d->regs, DMA2D_ISR_REG);
>>>> +
>>>> +     reg_write(d->regs, DMA2D_IFCR_REG, isr_val & 0x003f);
>>>> +}
>>>> +
>>>> +void dma2d_config_common(struct dma2d_dev *d, enum dma2d_op_mode op_mode,
>>>> +                      u16 width, u16 height)
>>>> +{
>>>> +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_MODE_MASK,
>>>> +                     op_mode << CR_MODE_SHIFT);
>>>> +
>>>> +     reg_write(d->regs, DMA2D_NLR_REG, (width << 16) | height);
>>>> +}
>>>> +
>>>> +void dma2d_config_out(struct dma2d_dev *d, struct dma2d_frame *frm,
>>>> +                   dma_addr_t o_addr)
>>>> +{
>>>> +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_CEIE, CR_CEIE);
>>>> +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_CTCIE, CR_CTCIE);
>>>> +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_CAEIE, CR_CAEIE);
>>>> +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_TCIE, CR_TCIE);
>>>> +     reg_update_bits(d->regs, DMA2D_CR_REG, CR_TEIE, CR_TEIE);
>>>> +
>>>> +     if (frm->fmt->cmode >= CM_MODE_ARGB8888 &&
>>>> +         frm->fmt->cmode <= CM_MODE_ARGB4444)
>>>> +             reg_update_bits(d->regs, DMA2D_OPFCCR_REG, OPFCCR_CM_MASK,
>>>> +                             frm->fmt->cmode);
>>>> +
>>>> +     reg_write(d->regs, DMA2D_OMAR_REG, o_addr);
>>>> +
>>>> +     reg_write(d->regs, DMA2D_OCOLR_REG,
>>>> +               (frm->a_rgb[3] << 24) |
>>>> +               (frm->a_rgb[2] << 16) |
>>>> +               (frm->a_rgb[1] << 8) |
>>>> +               frm->a_rgb[0]);
>>>> +
>>>> +     reg_update_bits(d->regs, DMA2D_OOR_REG, OOR_LO_MASK,
>>>> +                     frm->line_offset & 0x3fff);
>>>> +}
>>>> +
>>>> +void dma2d_config_fg(struct dma2d_dev *d, struct dma2d_frame *frm,
>>>> +                  dma_addr_t f_addr)
>>>> +{
>>>> +     reg_write(d->regs, DMA2D_FGMAR_REG, f_addr);
>>>> +     reg_update_bits(d->regs, DMA2D_FGOR_REG, FGOR_LO_MASK,
>>>> +                     frm->line_offset);
>>>> +
>>>> +     if (frm->fmt->cmode >= CM_MODE_ARGB8888 &&
>>>> +         frm->fmt->cmode <= CM_MODE_A4)
>>>> +             reg_update_bits(d->regs, DMA2D_FGPFCCR_REG, FGPFCCR_CM_MASK,
>>>> +                             frm->fmt->cmode);
>>>> +
>>>> +     reg_update_bits(d->regs, DMA2D_FGPFCCR_REG, FGPFCCR_AM_MASK,
>>>> +                     (frm->a_mode << 16) & 0x03);
>>>> +
>>>> +     reg_update_bits(d->regs, DMA2D_FGPFCCR_REG, FGPFCCR_ALPHA_MASK,
>>>> +                     frm->a_rgb[3] << 24);
>>>> +
>>>> +     reg_write(d->regs, DMA2D_FGCOLR_REG,
>>>> +               (frm->a_rgb[2] << 16) |
>>>> +               (frm->a_rgb[1] << 8) |
>>>> +               frm->a_rgb[0]);
>>>> +}
>>>> +
>>>> +void dma2d_config_bg(struct dma2d_dev *d, struct dma2d_frame *frm,
>>>> +                  dma_addr_t b_addr)
>>>> +{
>>>> +     reg_write(d->regs, DMA2D_BGMAR_REG, b_addr);
>>>> +     reg_update_bits(d->regs, DMA2D_BGOR_REG, BGOR_LO_MASK,
>>>> +                     frm->line_offset);
>>>> +
>>>> +     if (frm->fmt->cmode >= CM_MODE_ARGB8888 &&
>>>> +         frm->fmt->cmode <= CM_MODE_A4)
>>>> +             reg_update_bits(d->regs, DMA2D_BGPFCCR_REG, BGPFCCR_CM_MASK,
>>>> +                             frm->fmt->cmode);
>>>> +
>>>> +     reg_update_bits(d->regs, DMA2D_BGPFCCR_REG, BGPFCCR_AM_MASK,
>>>> +                     (frm->a_mode << 16) & 0x03);
>>>> +
>>>> +     reg_update_bits(d->regs, DMA2D_BGPFCCR_REG, BGPFCCR_ALPHA_MASK,
>>>> +                     frm->a_rgb[3] << 24);
>>>> +
>>>> +     reg_write(d->regs, DMA2D_BGCOLR_REG,
>>>> +               (frm->a_rgb[2] << 16) |
>>>> +               (frm->a_rgb[1] << 8) |
>>>> +               frm->a_rgb[0]);
>>>> +}
>>>> diff --git a/drivers/media/platform/stm32/dma2d/dma2d-regs.h b/drivers/media/platform/stm32/dma2d/dma2d-regs.h
>>>> new file mode 100644
>>>> index 000000000000..2128364406c8
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/stm32/dma2d/dma2d-regs.h
>>>> @@ -0,0 +1,113 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>> +/*
>>>> + * ST stm32 Chrom-Art - 2D Graphics Accelerator Driver
>>>> + *
>>>> + * Copyright (c) 2021 Dillon Min
>>>> + * Dillon Min, <dillon.minfei@gmail.com>
>>>> + *
>>>> + * based on s5p-g2d
>>>> + *
>>>> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
>>>> + * Kamil Debski, <k.debski@samsung.com>
>>>> + */
>>>> +
>>>> +#ifndef __DMA2D_REGS_H__
>>>> +#define __DMA2D_REGS_H__
>>>> +
>>>> +#define DMA2D_CR_REG         0x0000
>>>> +#define CR_MODE_MASK         GENMASK(17, 16)
>>>> +#define CR_MODE_SHIFT                16
>>>> +#define CR_M2M                       0x0000
>>>> +#define CR_M2M_PFC           BIT(16)
>>>> +#define CR_M2M_BLEND         BIT(17)
>>>> +#define CR_R2M                       (BIT(17) | BIT(16))
>>>> +#define CR_CEIE                      BIT(13)
>>>> +#define CR_CTCIE             BIT(12)
>>>> +#define CR_CAEIE             BIT(11)
>>>> +#define CR_TWIE                      BIT(10)
>>>> +#define CR_TCIE                      BIT(9)
>>>> +#define CR_TEIE                      BIT(8)
>>>> +#define CR_ABORT             BIT(2)
>>>> +#define CR_SUSP                      BIT(1)
>>>> +#define CR_START             BIT(0)
>>>> +
>>>> +#define DMA2D_ISR_REG                0x0004
>>>> +#define ISR_CEIF             BIT(5)
>>>> +#define ISR_CTCIF            BIT(4)
>>>> +#define ISR_CAEIF            BIT(3)
>>>> +#define ISR_TWIF             BIT(2)
>>>> +#define ISR_TCIF             BIT(1)
>>>> +#define ISR_TEIF             BIT(0)
>>>> +
>>>> +#define DMA2D_IFCR_REG               0x0008
>>>> +#define IFCR_CCEIF           BIT(5)
>>>> +#define IFCR_CCTCIF          BIT(4)
>>>> +#define IFCR_CAECIF          BIT(3)
>>>> +#define IFCR_CTWIF           BIT(2)
>>>> +#define IFCR_CTCIF           BIT(1)
>>>> +#define IFCR_CTEIF           BIT(0)
>>>> +
>>>> +#define DMA2D_FGMAR_REG              0x000c
>>>> +#define DMA2D_FGOR_REG               0x0010
>>>> +#define FGOR_LO_MASK         GENMASK(13, 0)
>>>> +
>>>> +#define DMA2D_BGMAR_REG              0x0014
>>>> +#define DMA2D_BGOR_REG               0x0018
>>>> +#define BGOR_LO_MASK         GENMASK(13, 0)
>>>> +
>>>> +#define DMA2D_FGPFCCR_REG    0x001c
>>>> +#define FGPFCCR_ALPHA_MASK   GENMASK(31, 24)
>>>> +#define FGPFCCR_AM_MASK              GENMASK(17, 16)
>>>> +#define FGPFCCR_CS_MASK              GENMASK(15, 8)
>>>> +#define FGPFCCR_START                BIT(5)
>>>> +#define FGPFCCR_CCM_RGB888   BIT(4)
>>>> +#define FGPFCCR_CM_MASK              GENMASK(3, 0)
>>>> +
>>>> +#define DMA2D_FGCOLR_REG     0x0020
>>>> +#define FGCOLR_REG_MASK              GENMASK(23, 16)
>>>> +#define FGCOLR_GREEN_MASK    GENMASK(15, 8)
>>>> +#define FGCOLR_BLUE_MASK     GENMASK(7, 0)
>>>> +
>>>> +#define DMA2D_BGPFCCR_REG    0x0024
>>>> +#define BGPFCCR_ALPHA_MASK   GENMASK(31, 24)
>>>> +#define BGPFCCR_AM_MASK              GENMASK(17, 16)
>>>> +#define BGPFCCR_CS_MASK              GENMASK(15, 8)
>>>> +#define BGPFCCR_START                BIT(5)
>>>> +#define BGPFCCR_CCM_RGB888   BIT(4)
>>>> +#define BGPFCCR_CM_MASK              GENMASK(3, 0)
>>>> +
>>>> +#define DMA2D_BGCOLR_REG     0x0028
>>>> +#define BGCOLR_REG_MASK              GENMASK(23, 16)
>>>> +#define BGCOLR_GREEN_MASK    GENMASK(15, 8)
>>>> +#define BGCOLR_BLUE_MASK     GENMASK(7, 0)
>>>> +
>>>> +#define DMA2D_OPFCCR_REG     0x0034
>>>> +#define OPFCCR_CM_MASK               GENMASK(2, 0)
>>>> +
>>>> +#define DMA2D_OCOLR_REG              0x0038
>>>> +#define OCOLR_ALPHA_MASK     GENMASK(31, 24)
>>>> +#define OCOLR_RED_MASK               GENMASK(23, 16)
>>>> +#define OCOLR_GREEN_MASK     GENMASK(15, 8)
>>>> +#define OCOLR_BLUE_MASK              GENMASK(7, 0)
>>>> +
>>>> +#define DMA2D_OMAR_REG               0x003c
>>>> +
>>>> +#define DMA2D_OOR_REG                0x0040
>>>> +#define OOR_LO_MASK          GENMASK(13, 0)
>>>> +
>>>> +#define DMA2D_NLR_REG                0x0044
>>>> +#define NLR_PL_MASK          GENMASK(29, 16)
>>>> +#define NLR_NL_MASK          GENMASK(15, 0)
>>>> +
>>>> +/* Hardware limits */
>>>> +#define MAX_WIDTH            0x3fff
>>>> +#define MAX_HEIGHT           0xffff
>>>
>>> I think these max width/height values are unrealistic. Even though the hardware
>>> theoretically supports this, it is causing the memory alloc failures.
>>
>> Oh, I suppose the memory alloc failures test case was fixed, designed
>> by v4l2-compliance , actually it depends on the driver's ability.
>>
>>>
>>> I see that the camera driver has 2592x2592 as the max width/height, so perhaps
>>> that should be used? Or alternatively the max resolution of the video output driver,
>>> whatever that is?
>>
>> I will try 2592x2592, and 2048x2048[display driver]. It fits the
>> camera's output or display input is a good idea.
> 
> Tried 2592x2592 and 2048x2048, both failed on my setup due to the low
> memory size. I'd like to send v6 with max 2592x2592 if you prefer?

Sounds good.

Hans

> 
> fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
>         BA24 (32-bit ARGB 8-8-8-8) 2048x2048 -> BA24 (32-bit ARGB
> 8-8-8-8) 2048x2048: FAIL
> 
> fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
>         BA24 (32-bit ARGB 8-8-8-8) 2592x2592 -> BA24 (32-bit ARGB
> 8-8-8-8) 2592x2592: FAIL
> 
> ~ # free
>                     total          used        free          shared
> buff/cache available
> Mem:          15648        4060        8276           0        3312        7648
> 
> Thanks & Regards
> 
> Dillon
> 
>>
>> [display driver] drivers/gpu/drm/stm/drv.c
>>
>> Thanks & Regards
>> Dillon
>>
>>>
>>> Regards,
>>>
>>>         Hans
>>>
>>>> +
>>>> +#define DEFAULT_WIDTH                240
>>>> +#define DEFAULT_HEIGHT               320
>>>> +#define DEFAULT_SIZE         307200
>>>> +
>>>> +#define CM_MODE_ARGB8888     0x00
>>>> +#define CM_MODE_ARGB4444     0x04
>>>> +#define CM_MODE_A4           0x0a
>>>> +#endif /* __DMA2D_REGS_H__ */

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
