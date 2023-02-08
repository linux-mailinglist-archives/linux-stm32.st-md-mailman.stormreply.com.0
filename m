Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1085A68F777
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Feb 2023 19:54:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A170BC6A5E8;
	Wed,  8 Feb 2023 18:54:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB92AC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 18:54:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DC2A617B8;
 Wed,  8 Feb 2023 18:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB21C433D2;
 Wed,  8 Feb 2023 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675882473;
 bh=xTtM9WlSf7bwExmahb6XOjPHbEjpNPb+C9ZLErT3mV8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kJN28UveNEt23ZFALxkKRAduymcXqKXXhl5ZE6krYfbalb6HMbzHo9qeVzvcHI7Wm
 H7S6jcL16vD7PqCbUM676t6Ujn2JFJPW6F8SYQEY0t+JColJ5tdmzL8HnmWP59Mv+N
 h1XG21jruiC7Pqu0lZhIHvhdf8KfE3r2XiOfPuEIw7UtbGW+1gt8cYhRh3sZd6iQB0
 OKQT0joBdQfoYqU3AXs0x+0ro+BNaKQvYiFcCdFS93pX8FTqdLs62iSLZQceti8ikH
 8vqlPouh7hbFMq94LAL+5Wj+RTZZwiFzYMUZ+IE2R0duumYDsHSZLH3uCg57RDgxC5
 5i80rfFHy/R9Q==
Date: Wed, 8 Feb 2023 19:08:33 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <20230208190833.532cd60c@jic23-huawei>
In-Reply-To: <d6c659d8-2e5c-cb60-d950-685c4ba319e2@foss.st.com>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-5-gatien.chevallier@foss.st.com>
 <20230128161217.0e79436e@jic23-huawei>
 <d6c659d8-2e5c-cb60-d950-685c4ba319e2@foss.st.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, edumazet@google.com,
 Oleksii_Moisieiev@epam.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, kuba@kernel.org, arnaud.pouliquen@foss.st.com,
 pabeni@redhat.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 4/6] bus: stm32_sys_bus: add support
 for STM32MP15 and STM32MP13 system bus
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

On Tue, 7 Feb 2023 15:12:23 +0100
Gatien CHEVALLIER <gatien.chevallier@foss.st.com> wrote:

> Hi Jonathan,
> 
> On 1/28/23 17:12, Jonathan Cameron wrote:
> > On Fri, 27 Jan 2023 17:40:38 +0100
> > Gatien Chevallier <gatien.chevallier@foss.st.com> wrote:
> >   
> >> This driver is checking the access rights of the different
> >> peripherals connected to the system bus. If access is denied,
> >> the associated device tree node is skipped so the platform bus
> >> does not probe it.
> >>
> >> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> >> Signed-off-by: Loic PALLARDY <loic.pallardy@st.com>  
> > 
> > Hi Gatien,
> > 
> > A few comments inline,
> > 
> > Thanks,
> > 
> > Jonathan
> >   
> >> diff --git a/drivers/bus/stm32_sys_bus.c b/drivers/bus/stm32_sys_bus.c
> >> new file mode 100644
> >> index 000000000000..c12926466bae
> >> --- /dev/null
> >> +++ b/drivers/bus/stm32_sys_bus.c
> >> @@ -0,0 +1,168 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> >> + */
> >> +
> >> +#include <linux/bitfield.h>
> >> +#include <linux/bits.h>
> >> +#include <linux/device.h>
> >> +#include <linux/err.h>
> >> +#include <linux/io.h>
> >> +#include <linux/init.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_platform.h>
> >> +#include <linux/platform_device.h>
> >> +
> >> +/* ETZPC peripheral as firewall bus */
> >> +/* ETZPC registers */
> >> +#define ETZPC_DECPROT			0x10
> >> +
> >> +/* ETZPC miscellaneous */
> >> +#define ETZPC_PROT_MASK			GENMASK(1, 0)
> >> +#define ETZPC_PROT_A7NS			0x3
> >> +#define ETZPC_DECPROT_SHIFT		1  
> > 
> > This define makes the code harder to read.  What we care about is
> > the number of bits in the register divided by number of entries.
> > (which is 2) hence the shift by 1. See below for more on this.
> > 
> >   
> >> +
> >> +#define IDS_PER_DECPROT_REGS		16  
> >   
> >> +#define STM32MP15_ETZPC_ENTRIES		96
> >> +#define STM32MP13_ETZPC_ENTRIES		64  
> > 
> > These defines just make the code harder to check.
> > They aren't magic numbers, but rather just telling us how many
> > entries there are, so I would just put them in the structures directly.
> > Their use make it clear what they are without needing to give them a name.
> >   
> 
> Honestly, I'd rather read the hardware configuration registers to get 
> this information instead of differentiating MP13/15. Would you agree on 
> that?

Sure, if they are discoverable even better.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
