Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9764D8527
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 13:40:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C578C60462;
	Mon, 14 Mar 2022 12:40:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F014C5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 11:35:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22EBWYBV002344;
 Mon, 14 Mar 2022 12:34:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=gzZetz8uIO8QVguQiPIzqXy+BNmMroJKm7BS91uPLTY=;
 b=IpUAG91SFtfliCpoXCeORRgDy7i2Dp5dxLQcPco02WhvSOyIzYm0VS3XvhJiDzvIgd7C
 u9G1NxWKo3a8VRCghT2vugfsZyoJIO/Hn6a4vSTg61jxGoZ+C5br4MpSaaKruxK6Pm+B
 ckCUqLR3ls5HmcB1grORkNqVF4AMzN2mMpZ3CqebZpeRnjh87h1FiYk8c0TT8iztdtTK
 1gEVBOiSEwE1naORojjZMbrGWUvyiAo9L9XOFoaVuzOYSoyXWY7EZ6iFauY7L3YuIttY
 e8aGVSMt91gdN0YcmkdQ00B0Yyznn8NpOJ+qa92yYLBQl4wIZs+YMqTl9gIMx1Hbqyv0 pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et4x3r0fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 12:34:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1FA310005D;
 Mon, 14 Mar 2022 12:34:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B49821BF46;
 Mon, 14 Mar 2022 12:34:48 +0100 (CET)
Received: from [10.201.23.19] (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 14 Mar
 2022 12:34:47 +0100
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Alain Volmat
 <alain.volmat@foss.st.com>
References: <cover.1647167750.git.mchehab@kernel.org>
 <dc5be62a56ac19c6f49f4c8432558fd7b0efe7e6.1647167750.git.mchehab@kernel.org>
 <20220314083942.GA526468@gnbcxd0016.gnb.st.com>
 <20220314121454.7432e231@coco.lan>
From: Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <1122a956-0650-f948-512b-d3447e34df30@foss.st.com>
Date: Mon, 14 Mar 2022 12:34:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220314121454.7432e231@coco.lan>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_04,2022-03-14_01,2022-02-23_01
X-Mailman-Approved-At: Mon, 14 Mar 2022 12:40:39 +0000
Cc: linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Leon Romanovsky <leon@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Dmitriy Ulitin <ulitin@ispras.ru>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-media@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
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

Ideally we would like to stick to sti/ and stm32/ at same level, as it 
is done in various other locations:

./Documentation/arm/sti/
./Documentation/arm/stm32/

./arch/arm/mach-sti
./arch/arm/mach-stm32

./drivers/media/cec/platform/sti/
./drivers/media/cec/platform/stm32/

./drivers/gpu/drm/sti/
./drivers/gpu/drm/stm/

./sound/soc/sti/
./sound/soc/stm/

Is this possible to keep those media folders as is ?

Best regards,
Hugues.

On 3/14/22 12:14 PM, Mauro Carvalho Chehab wrote:
> Hi Alain,
> 
> Em Mon, 14 Mar 2022 09:39:42 +0100
> Alain Volmat <alain.volmat@foss.st.com> escreveu:
> 
>> Hi Mauro,
>>
>> I don't think stm32 should be put within the sti platform folder.
>> sti and stm32 are 2 different platforms from ST Microelectronics.
>> STi refers to the platform with SoCs such as STiH407/STiH410 and STiH418
>> while stm32 are all STM32 ones. Those two platforms aren't related.
>> What about having a folder stmicro or stmicroelectronics (too long
>> probably :D) with the 2 folders sti and stm32 into it ?
> 
> Yeah, a folder like "st", "stm" (New York Stock Exchange uses this name),
> "stmicro", or even "stmicroelectronics" with either two folders on it
> or two separate submenus work from my side.
> 
> I would prefer to have a short name there, like "st" or "stm", but it
> is up to you to choose whatever works best for ST Microelectronics.
> 
> Just let me know what works best and I'll change it at the patch.
> 
>>
>> Alain
>>
>> On Sun, Mar 13, 2022 at 11:51:58AM +0100, Mauro Carvalho Chehab wrote:
>>> As the end goal is to have platform drivers split by vendor,
>>> rename stm32/ to sti/stm32/.
>>>
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>>> ---
>>>
>>> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
>>> See [PATCH 00/24] at: https://lore.kernel.org/all/cover.1647167750.git.mchehab@kernel.org/
>>>
>>>   MAINTAINERS                                               | 2 +-
>>>   drivers/media/platform/Kconfig                            | 2 +-
>>>   drivers/media/platform/Makefile                           | 2 +-
>>>   drivers/media/platform/{ => sti}/stm32/Kconfig            | 0
>>>   drivers/media/platform/{ => sti}/stm32/Makefile           | 0
>>>   drivers/media/platform/{ => sti}/stm32/dma2d/dma2d-hw.c   | 0
>>>   drivers/media/platform/{ => sti}/stm32/dma2d/dma2d-regs.h | 0
>>>   drivers/media/platform/{ => sti}/stm32/dma2d/dma2d.c      | 0
>>>   drivers/media/platform/{ => sti}/stm32/dma2d/dma2d.h      | 0
>>>   drivers/media/platform/{ => sti}/stm32/stm32-dcmi.c       | 0
>>>   10 files changed, 3 insertions(+), 3 deletions(-)
>>>   rename drivers/media/platform/{ => sti}/stm32/Kconfig (100%)
>>>   rename drivers/media/platform/{ => sti}/stm32/Makefile (100%)
>>>   rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d-hw.c (100%)
>>>   rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d-regs.h (100%)
>>>   rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d.c (100%)
>>>   rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d.h (100%)
>>>   rename drivers/media/platform/{ => sti}/stm32/stm32-dcmi.c (100%)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 7711a5ea125e..620705e0f043 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -12046,7 +12046,7 @@ L:	linux-media@vger.kernel.org
>>>   S:	Supported
>>>   T:	git git://linuxtv.org/media_tree.git
>>>   F:	Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>>> -F:	drivers/media/platform/stm32/stm32-dcmi.c
>>> +F:	drivers/media/platform/sti/stm32/stm32-dcmi.c
>>>   
>>>   MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
>>>   M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>>> index c3594807f8d7..cf373bfbca1b 100644
>>> --- a/drivers/media/platform/Kconfig
>>> +++ b/drivers/media/platform/Kconfig
>>> @@ -95,7 +95,7 @@ source "drivers/media/platform/samsung/s5p-g2d/Kconfig"
>>>   source "drivers/media/platform/samsung/s5p-jpeg/Kconfig"
>>>   source "drivers/media/platform/samsung/s5p-mfc/Kconfig"
>>>   source "drivers/media/platform/sti/Kconfig"
>>> -source "drivers/media/platform/stm32/Kconfig"
>>> +source "drivers/media/platform/sti/stm32/Kconfig"
>>>   source "drivers/media/platform/ti-vpe/Kconfig"
>>>   source "drivers/media/platform/via/Kconfig"
>>>   source "drivers/media/platform/xilinx/Kconfig"
>>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
>>> index 6a766acfbe37..e3dd2331003a 100644
>>> --- a/drivers/media/platform/Makefile
>>> +++ b/drivers/media/platform/Makefile
>>> @@ -40,7 +40,7 @@ obj-y += sti/bdisp/
>>>   obj-y += sti/c8sectpfe/
>>>   obj-y += sti/delta/
>>>   obj-y += sti/hva/
>>> -obj-y += stm32/
>>> +obj-y += sti/stm32/
>>>   obj-y += ti-vpe/
>>>   obj-y += via/
>>>   obj-y += xilinx/
>>> diff --git a/drivers/media/platform/stm32/Kconfig b/drivers/media/platform/sti/stm32/Kconfig
>>> similarity index 100%
>>> rename from drivers/media/platform/stm32/Kconfig
>>> rename to drivers/media/platform/sti/stm32/Kconfig
>>> diff --git a/drivers/media/platform/stm32/Makefile b/drivers/media/platform/sti/stm32/Makefile
>>> similarity index 100%
>>> rename from drivers/media/platform/stm32/Makefile
>>> rename to drivers/media/platform/sti/stm32/Makefile
>>> diff --git a/drivers/media/platform/stm32/dma2d/dma2d-hw.c b/drivers/media/platform/sti/stm32/dma2d/dma2d-hw.c
>>> similarity index 100%
>>> rename from drivers/media/platform/stm32/dma2d/dma2d-hw.c
>>> rename to drivers/media/platform/sti/stm32/dma2d/dma2d-hw.c
>>> diff --git a/drivers/media/platform/stm32/dma2d/dma2d-regs.h b/drivers/media/platform/sti/stm32/dma2d/dma2d-regs.h
>>> similarity index 100%
>>> rename from drivers/media/platform/stm32/dma2d/dma2d-regs.h
>>> rename to drivers/media/platform/sti/stm32/dma2d/dma2d-regs.h
>>> diff --git a/drivers/media/platform/stm32/dma2d/dma2d.c b/drivers/media/platform/sti/stm32/dma2d/dma2d.c
>>> similarity index 100%
>>> rename from drivers/media/platform/stm32/dma2d/dma2d.c
>>> rename to drivers/media/platform/sti/stm32/dma2d/dma2d.c
>>> diff --git a/drivers/media/platform/stm32/dma2d/dma2d.h b/drivers/media/platform/sti/stm32/dma2d/dma2d.h
>>> similarity index 100%
>>> rename from drivers/media/platform/stm32/dma2d/dma2d.h
>>> rename to drivers/media/platform/sti/stm32/dma2d/dma2d.h
>>> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/sti/stm32/stm32-dcmi.c
>>> similarity index 100%
>>> rename from drivers/media/platform/stm32/stm32-dcmi.c
>>> rename to drivers/media/platform/sti/stm32/stm32-dcmi.c
>>> -- 
>>> 2.35.1
>>>    
> 
> 
> 
> Thanks,
> Mauro
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
