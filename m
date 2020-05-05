Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6342E1C5A4E
	for <lists+linux-stm32@lfdr.de>; Tue,  5 May 2020 17:01:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 247D2C36B38;
	Tue,  5 May 2020 15:01:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F14FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2020 15:01:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 045El9ne016435; Tue, 5 May 2020 17:00:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IbLvmIr+VxgtqpaSuIKBL6LNWk+1yxMvrL3mHUlR5/g=;
 b=VtSgjuMRko+aYlOPzneie7sscr9XnTQSkMWmK01QoI3OZ7EaHWKpRlTrqXhFV7gSu/T4
 vNQuihrzJhVBbM68FXy4lx67khWj5M6vd9LFVbofc3IZ12ai1LQ7olLSMYQ9SN4g7FQV
 N2Oj1qUJZjBdq1WmaDv5bDdc4fERIKmGJRBggimnaaV2xPJqSGAIAOWdMfxbg3Et0ouD
 D+TYgsMld7vlAE2VLNBFn9Sqs+EIiBRb+1KxiMmVCBNpfXvvcGgZgBiQ5LlARKRkCxDu
 d3+AKcqG0xgyWmZus6dQNY85nOS2FCOpcvL26nsQnaV0uJMqPdN0+XEnCNtvXgElyfZI TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rxb20sdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 17:00:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F05210002A;
 Tue,  5 May 2020 17:00:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag7node2.st.com [10.75.127.20])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4BC382B0E9F;
 Tue,  5 May 2020 17:00:54 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG7NODE2.st.com
 (10.75.127.20) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 May
 2020 17:00:53 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 5 May 2020 17:00:53 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Greg KH <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH v3 2/5] bus: stm32: Introduce firewall controller helpers
Thread-Index: AQHWIq93zmKMzoYdMEeJzuj6lP5gO6iZb0WAgAAFxQA=
Date: Tue, 5 May 2020 15:00:53 +0000
Message-ID: <3f15fefa-b70f-5d20-c19b-3c42140a104c@st.com>
References: <20200505073308.22914-1-benjamin.gaignard@st.com>
 <20200505073308.22914-3-benjamin.gaignard@st.com>
 <20200505144013.GB838641@kroah.com>
In-Reply-To: <20200505144013.GB838641@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <57CCBC245F8373439B28D87A7A5EB0EF@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_08:2020-05-04,
 2020-05-05 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 2/5] bus: stm32: Introduce firewall
	controller helpers
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



On 5/5/20 4:40 PM, Greg KH wrote:
> On Tue, May 05, 2020 at 09:33:05AM +0200, Benjamin Gaignard wrote:
>> The goal of these helpers are to offer an interface for the
>> hardware blocks controlling bus accesses rights.
>>
>> Bus firewall controllers are typically used to control if a
>> hardware block can perform read or write operations on bus.
>>
>> Smarter firewall controllers could be able to define accesses
>> rights per hardware blocks to control where they can read
>> or write.
>>
>> Firewall controller configurations are provided in device node,
>> parsed by the helpers and send to the driver to apply them.
>> Each controller may need different number and type of inputs
>> to configure the firewall so device-tree properties size have to
>> be define by using "#firewall-cells".
>> Firewall configurations properties have to be named "firewall-X"
>> on device node.
>> "firewall-names" keyword can also be used to give a name to
>> a specific configuration.
>>
>> Example of device-tree:
>> ctrl0: firewall@0 {
>> 	#firewall-cells = <2>;
>>        };
>>
>> foo: foo@0 {
>> 	firewall-names = "default", "setting1";
>> 	firewall-0 = <&ctrl0 1 2>;
>> 	firewall-1 = <&ctrl0 3 4>;
>> };
>>
>> Configurations could be applied with functions like
>> firewall_set_config_by_index() or firewall_set_config_by_name().
>>
>> firewall_set_default_config() function will apply the
>> configuration named "default" (if existing) or the configuration
>> with index 0 (i.e. firewall-0).
>>
>> Drivers could register/unregister themselves be calling
>> firewall_register/firewall_unregister functions.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>> ---
>>   drivers/bus/Kconfig          |   2 +
>>   drivers/bus/Makefile         |   2 +
>>   drivers/bus/stm32/Kconfig    |   3 +
>>   drivers/bus/stm32/Makefile   |   1 +
>>   drivers/bus/stm32/firewall.c | 266 +++++++++++++++++++++++++++++++++++++++++++
>>   drivers/bus/stm32/firewall.h |  75 ++++++++++++
>>   6 files changed, 349 insertions(+)
>>   create mode 100644 drivers/bus/stm32/Kconfig
>>   create mode 100644 drivers/bus/stm32/Makefile
>>   create mode 100644 drivers/bus/stm32/firewall.c
>>   create mode 100644 drivers/bus/stm32/firewall.h
>>
>> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
>> index 6d4e4497b59b..843b356322d9 100644
>> --- a/drivers/bus/Kconfig
>> +++ b/drivers/bus/Kconfig
>> @@ -203,4 +203,6 @@ config DA8XX_MSTPRI
>>   source "drivers/bus/fsl-mc/Kconfig"
>>   source "drivers/bus/mhi/Kconfig"
>>   
>> +source "drivers/bus/stm32/Kconfig"
>> +
>>   endmenu
>> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
>> index 05f32cd694a4..5e0e34b10235 100644
>> --- a/drivers/bus/Makefile
>> +++ b/drivers/bus/Makefile
>> @@ -37,3 +37,5 @@ obj-$(CONFIG_DA8XX_MSTPRI)	+= da8xx-mstpri.o
>>   
>>   # MHI
>>   obj-$(CONFIG_MHI_BUS)		+= mhi/
>> +
>> +obj-$(CONFIG_MACH_STM32MP157) 	+= stm32/
>> \ No newline at end of file
>> diff --git a/drivers/bus/stm32/Kconfig b/drivers/bus/stm32/Kconfig
>> new file mode 100644
>> index 000000000000..57221e833e2d
>> --- /dev/null
>> +++ b/drivers/bus/stm32/Kconfig
>> @@ -0,0 +1,3 @@
>> +config FIREWALL_CONTROLLERS
>> +	bool "Support of bus firewall controllers"
>> +	depends on OF
>> diff --git a/drivers/bus/stm32/Makefile b/drivers/bus/stm32/Makefile
>> new file mode 100644
>> index 000000000000..eb6b978d6450
>> --- /dev/null
>> +++ b/drivers/bus/stm32/Makefile
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG_FIREWALL_CONTROLLERS) += firewall.o
>> diff --git a/drivers/bus/stm32/firewall.c b/drivers/bus/stm32/firewall.c
>> new file mode 100644
>> index 000000000000..95f716cf926f
>> --- /dev/null
>> +++ b/drivers/bus/stm32/firewall.c
>> @@ -0,0 +1,266 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
>> + * Author: Benjamin Gaignard <benjamin.gaignard@st.com> for STMicroelectronics.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/list.h>
>> +#include <linux/of.h>
>> +#include <linux/slab.h>
>> +
>> +#include "firewall.h"
>> +
>> +/* Mutex taken to protect firewall_list */
>> +static DEFINE_MUTEX(firewall_list_mutex);
>> +
>> +/* Global list of firewall control devices */
>> +static LIST_HEAD(firewall_list);
> Why is that needed?  Why can't you just walk the list of devices on this
> "bus/class" if you really wanted to?
>
> Along those lines, why is this going around the driver model and
> ignoring it?  Shouldn't this be a bus and you have devices attached to
> it of the specific type?
This part of the series is only a a set of common functions and bindings
that I plan to reuse for futur STM32 SoCs.
The 'real' bus implementation is in patch 4.

Benjamin
>
>
> greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
