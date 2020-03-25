Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB0D192757
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2020 12:39:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 436EFC36B0B;
	Wed, 25 Mar 2020 11:39:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B086DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2020 11:39:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02PBcHT8012148; Wed, 25 Mar 2020 12:39:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=IKim3Xrqtf88BUV0cETRyKlfZMoXZJdXAJgzXfc7ej8=;
 b=Q81BYoQ5S1HP6Hhh26a82T8AlJ5bTS5gMpOaof6g5MavbT/3E1ujnEqd8QNtAeFmvtFF
 4okDn1rSjveVz+kMO2Bwoead2CwgUK2Rch6gD/njoCsHXkXX3D3DaLwDn4XVIE6Tn3Cy
 aXSXdBKrDGUJUQIwqeO9uMW+N7l3GTBAaG1IrI5zGumgjg0YfZr5nplJA1ztVO0LFQjY
 YjEFRAhbPCCRtkhFlZhrG0zi8dHHhVsiKfaS8PltfDfu+PZA3k9qzuwGbEaeJuphgZzE
 uBT0HhvmMlX41c5xAITqgvlgwA6uZ/hBNxHZmVStdwki4VWjArm8hzPzOlzhq2joUI2P yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw8xe5kbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Mar 2020 12:39:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC1E2100034;
 Wed, 25 Mar 2020 12:39:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDA102A7882;
 Wed, 25 Mar 2020 12:39:22 +0100 (CET)
Received: from lmecxl0889.tpe.st.com (10.75.127.51) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Mar
 2020 12:39:13 +0100
To: Randy Dunlap <rdunlap@infradead.org>, Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, <linux-kernel@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
 <8821448b-3c6e-6277-06d2-9be7f81de9e9@infradead.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <a10069d7-e495-5dc2-7b0f-c8aed0f9e279@st.com>
Date: Wed, 25 Mar 2020 12:39:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8821448b-3c6e-6277-06d2-9be7f81de9e9@infradead.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_05:2020-03-24,
 2020-03-25 signatures=0
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Suman Anna <s-anna@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 xiang xiao <xiaoxiang781216@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 2/2] tty: add rpmsg driver
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

Hi,

On 3/24/20 6:44 PM, Randy Dunlap wrote:
> Hi,
> 
> On 3/24/20 10:04 AM, Arnaud Pouliquen wrote:
>> This driver exposes a standard TTY interface on top of the rpmsg
>> framework through a rpmsg service.
>>
>> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
>> per rpmsg endpoint.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  Documentation/serial/tty_rpmsg.rst |  45 ++++
>>  drivers/tty/Kconfig                |   9 +
>>  drivers/tty/Makefile               |   1 +
>>  drivers/tty/rpmsg_tty.c            | 417 +++++++++++++++++++++++++++++
>>  4 files changed, 472 insertions(+)
>>  create mode 100644 Documentation/serial/tty_rpmsg.rst
>>  create mode 100644 drivers/tty/rpmsg_tty.c
>>
>> diff --git a/Documentation/serial/tty_rpmsg.rst b/Documentation/serial/tty_rpmsg.rst
>> new file mode 100644
>> index 000000000000..fc1d3fba73c5
>> --- /dev/null
>> +++ b/Documentation/serial/tty_rpmsg.rst
>> @@ -0,0 +1,45 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=============
>> +The rpmsg TTY
>> +=============
>> +
>> +The rpmsg tty driver implements serial communication on the RPMsg bus to makes possible for user-space programs to send and receive rpmsg messages as a standard tty protocol.
> 
>                                                                          to make it possible
> 
>> +
>> +The remote processor can instantiate a new tty by requesting:
>> +- a "rpmsg-tty-raw" RPMsg service, for TTY raw data support without flow control
>> +- a "rpmsg-tty-ctrl" RPMSg service, for TTY support with flow control.
>> +
>> +Information related to the RPMsg and associated tty device is available in
>> +/sys/bus/rpmsg/devices/.
>> +
>> +RPMsg TTY without control
>> +---------------------
> 
> extend underline under "control"
> 
>> +
>> +The default end point associated with the "rpmsg-tty-raw" service is directly
>> +used for data exchange. No flow control is available.
>> +
>> +To be compliant with this driver, the remote firmware must create its data end point associated with the "rpmsg-tty-raw" service.
>> +
>> +RPMsg TTY with control
>> +---------------------
> 
> extend underline length.
> 
>> +
>> +The default end point associated with the "rpmsg-tty-ctrl" service is reserved for
>> +the control. A second endpoint must be created for data exchange.
>> +
>> +The control channel is used to transmit to the remote processor the CTS status,
>> +as well as the end point address for data transfer.
>> +
>> +To be compatible with this driver, the remote firmware must create or use its end point associated with "rpmsg-tty-ctrl" service, plus a second endpoint for the data flow.
>> +On Linux rpmsg_tty probes, the data endpoint address and the CTS (set to disable)
>> +is sent to the remote processor.
>> +The remote processor has to respect following rules:
> 
>                                respect the following rules:
> 
>> +- It only transmits data when Linux remote cts is enable, otherwise message
> 
>                                               CTS is enabled,
> 
>> +  could be lost.
>> +- It can pause/resume reception by sending a control message (rely on CTS state).
>> +
>> +Control message structure:
>> +struct rpmsg_tty_ctrl {
>> +	u8 cts;			/* remote reception status */
>> +	u16 d_ept_addr;		/* data endpoint address */
>> +};
> 
> Is that struct packed or padded?

It's packed as payload of the RP message and so define is global size.
This struct is misaligned with the code.

I will take into account your comments in next version.

Thanks for the review,
Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
