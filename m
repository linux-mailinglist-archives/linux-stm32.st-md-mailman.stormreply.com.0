Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A5A4D970B
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Mar 2022 10:03:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12D8DC60468;
	Tue, 15 Mar 2022 09:03:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C697C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Mar 2022 09:03:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22F4JpZr013528;
 Tue, 15 Mar 2022 10:03:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0ouzyT1rFXeSjPxJyzhJcbxpSD0Ueawx3dFZ0P2dIG0=;
 b=NlBqvGPm9NAUgA1qN+TGAL45p5hlHEsUU1xX9ZQpHndbTIOIccCQunO7+JOEHJRrWUv2
 NHBGgvynWPmRc2LQ9EMxTUrniKfMdxU4bsNRJRQ0MK2+Nt90eVr3nFtYGfpUF2Y2cWZc
 zuL9BMUvRPVUOJyc1/hHSLSIOsvfCTI8sDY9YSbM74Gq0Q6mYzgWsse3esOeAw4suKRd
 ml/bWeIDJPAEbA+YcTlDLXYYNESC1D9csFhT7bpqGagAOJMnruNYi9qFMNg+5BUEuTpm
 AGG/mVvzVVOyj5da/gy3XRlz3u/XLSUy8z2p7ILWKbCSUQjvwZXPCOCzRWMR3uilDjwm 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et63h54ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 10:03:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77A3810002A;
 Tue, 15 Mar 2022 10:02:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A39C92138E7;
 Tue, 15 Mar 2022 10:02:54 +0100 (CET)
Received: from [10.201.23.19] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 15 Mar
 2022 10:02:53 +0100
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1647167750.git.mchehab@kernel.org>
 <dc5be62a56ac19c6f49f4c8432558fd7b0efe7e6.1647167750.git.mchehab@kernel.org>
 <20220314083942.GA526468@gnbcxd0016.gnb.st.com>
 <20220314121454.7432e231@coco.lan>
 <1122a956-0650-f948-512b-d3447e34df30@foss.st.com>
 <20220314141008.13e32acd@coco.lan>
From: Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <8a4782f3-53d0-7af7-2034-e31879efbc45@foss.st.com>
Date: Tue, 15 Mar 2022 10:02:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220314141008.13e32acd@coco.lan>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, Leon Romanovsky <leon@kernel.org>,
 Dmitriy Ulitin <ulitin@ispras.ru>, Alain Volmat <alain.volmat@foss.st.com>,
 linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Dillon Min <dillon.minfei@gmail.com>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Eugen Hristev <eugen.hristev@microchip.com>, Ming Qian <ming.qian@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH 17/24] media: platform: rename stm32/ to
	sti/stm32/
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Mauro,

sti and stm32 architectures don't have the same maintainers nor same 
mailing list as you can see below:

ARM/STM32 ARCHITECTURE
M:    Maxime Coquelin <mcoquelin.stm32@gmail.com>
M:    Alexandre Torgue <alexandre.torgue@foss.st.com>
L:    linux-stm32@st-md-mailman.stormreply.com (moderated for 
non-subscribers)
L:    linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
S:    Maintained
T:    git 
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
F:    arch/arm/boot/dts/stm32*
F:    arch/arm/mach-stm32/
F:    drivers/clocksource/armv7m_systick.c
N:    stm32
N:    stm

ARM/STI ARCHITECTURE
M:    Patrice Chotard <patrice.chotard@foss.st.com>
L:    linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
S:    Maintained
W:    http://www.stlinux.com
F:    Documentation/devicetree/bindings/i2c/i2c-st.txt
F:    arch/arm/boot/dts/sti*
F:    arch/arm/mach-sti/
F:    drivers/ata/ahci_st.c
F:    drivers/char/hw_random/st-rng.c
F:    drivers/clocksource/arm_global_timer.c
F:    drivers/clocksource/clksrc_st_lpc.c
F:    drivers/cpufreq/sti-cpufreq.c
F:    drivers/dma/st_fdma*
F:    drivers/i2c/busses/i2c-st.c
F:    drivers/media/platform/sti/c8sectpfe/
F:    drivers/media/rc/st_rc.c
F:    drivers/mmc/host/sdhci-st.c
F:    drivers/phy/st/phy-miphy28lp.c
F:    drivers/phy/st/phy-stih407-usb.c
F:    drivers/pinctrl/pinctrl-st.c
F:    drivers/remoteproc/st_remoteproc.c
F:    drivers/remoteproc/st_slim_rproc.c
F:    drivers/reset/sti/
F:    drivers/rtc/rtc-st-lpc.c
F:    drivers/tty/serial/st-asc.c
F:    drivers/usb/dwc3/dwc3-st.c
F:    drivers/usb/host/ehci-st.c
F:    drivers/usb/host/ohci-st.c
F:    drivers/watchdog/st_lpc_wdt.c
F:    include/linux/remoteproc/st_slim_rproc.h


but anyway, if this is really important for you to have a top folder to 
group all ST stuff, we prefer to have "st" prefix than "stm":
 > 	./drivers/media/platform/st/sti/
 > 	./drivers/media/platform/st/stm32/

But one more time, our flavour is to stick to:
 > 	./drivers/media/platform/sti/
 > 	./drivers/media/platform/stm32/


Best regards,
Hugues.

On 3/14/22 2:10 PM, Mauro Carvalho Chehab wrote:
> Em Mon, 14 Mar 2022 12:34:47 +0100
> Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com> escreveu:
> 
>> Hi Mauro,
>>
>> Ideally we would like to stick to sti/ and stm32/ at same level, as it
>> is done in various other locations:
>>
>> ./Documentation/arm/sti/
>> ./Documentation/arm/stm32/
>>
>> ./arch/arm/mach-sti
>> ./arch/arm/mach-stm32
>>
>> ./drivers/media/cec/platform/sti/
>> ./drivers/media/cec/platform/stm32/
>>
>> ./drivers/gpu/drm/sti/
>> ./drivers/gpu/drm/stm/
>>
>> ./sound/soc/sti/
>> ./sound/soc/stm/
>>
>> Is this possible to keep those media folders as is ?
> 
> If we add them under:
> 	./drivers/media/platform/stm/sti/
> 	./drivers/media/platform/stm/stm32/
> 
> They'll both be at the same level.
> 
> It has been increasingly hard to maintain media/platform, as the file
> become too big and disorganized. Sorting it per-vendor seems to be the
> best thing, as it will keep things better organized.
> 
> As a side effect, with such kind of change, it is now possible to
> have a MAINTAINERS entry that would point to a mailing list and/or
> some SoC maintainers/reviewers that should be c/c to all patches
> affecting drivers/media/platform/<vendor>.
> 
> Thanks,
> Mauro
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
