Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD50192EC6
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2020 17:58:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3F07C36B0B;
	Wed, 25 Mar 2020 16:57:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1BBEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2020 16:57:57 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02PGquT7027578; Wed, 25 Mar 2020 17:57:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=765SUSoYfp3NkYF15kCDHOpVCNo5Ahc9UvpYL/PCA/M=;
 b=zbqieNq2sJ+MTi1bySzVUNs74mUZsYfbjmdlLQiSYqxZV+MhSPgzhG1o3mYW2HgbC7HQ
 +epC4/SMzj9/qm+moIedwP6F3+I+PpQZplQ3QqED2Pj9V46qCJZd7GyHT6ZDkZ7pscP6
 Nea5jRdfpG9yq/x8g3HeEZjKPebeQ5okDQqQ+lmBk+D4M+6DyFDPLGWAyERiToCWu445
 SPsu+ohZqI7ATzaBKgOv6A0OkumloeCC51JF1EuybFteSvfwWpAtn0CZYNdEl6TWL92z
 t5Rh9Vz2DzYXd0FVx9aSs1g7RRWlgEqPbePIGmlwwGGOwPBQ811TS+M7Jf6XzycToS1y ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw9k06txh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Mar 2020 17:57:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 120B910002A;
 Wed, 25 Mar 2020 17:57:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F40222BEC4A;
 Wed, 25 Mar 2020 17:57:44 +0100 (CET)
Received: from lmecxl0889.tpe.st.com (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Mar
 2020 17:57:36 +0100
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
 <20200324205210.GE119913@minitux>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <4f5e6dd0-5deb-8036-0a94-eb7055744f35@st.com>
Date: Wed, 25 Mar 2020 17:57:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324205210.GE119913@minitux>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_09:2020-03-24,
 2020-03-25 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 xiang xiao <xiaoxiang781216@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien DESSENNE <fabien.dessenne@st.com>, Jiri Slaby <jslaby@suse.com>,
 Suman Anna <s-anna@ti.com>, linux-stm32@st-md-mailman.stormreply.com
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

Hi Bjorn,

On 3/24/20 9:52 PM, Bjorn Andersson wrote:
> On Tue 24 Mar 10:04 PDT 2020, Arnaud Pouliquen wrote:
> [..]
>> diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
>> index 020b1cd9294f..c2465e7ebc2a 100644
>> --- a/drivers/tty/Makefile
>> +++ b/drivers/tty/Makefile
>> @@ -34,5 +34,6 @@ obj-$(CONFIG_PPC_EPAPR_HV_BYTECHAN) += ehv_bytechan.o
>>  obj-$(CONFIG_GOLDFISH_TTY)	+= goldfish.o
>>  obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_ejtag_fdc.o
>>  obj-$(CONFIG_VCC)		+= vcc.o
>> +obj-$(CONFIG_RPMSG_TTY)		+= rpmsg_tty.o
>>  
>>  obj-y += ipwireless/
>> diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
> [..]
>> +static struct rpmsg_device_id rpmsg_driver_tty_id_table[] = {
>> +	{ .name	= TTY_CH_NAME_RAW },
>> +	{ .name	= TTY_CH_NAME_WITH_CTS},
> 
> I still don't like the idea that the tty devices are tied to channels by
> fixed names.

This point has been discussed with Xiang, he has the same kind of requirement. 
My proposal here is to do this in two steps. First a fixed name, then
in a second step we can extend the naming using the implementation proposed
by Mathieu Poirier:

[1]https://lkml.org/lkml/2020/2/12/1083

Is this patch could answer to your requirement?

if requested i can I can integrate the Mathieu's patch in this patchset.
 
> 
> This makes the driver unusable for communicating with any firmware out
> there that provides tty-like data over a channel with a different name -
> such as modems with channels providing an AT command interface (they are
> not named "rpmsg-tty-raw").

I'm not fixed on the naming, any proposal is welcome.
If we use the patch [1], could be renamed 
"rpmsg-tty". then for AT command could be something like "rpmsg-tty-at"

But here seems we are speaking about service over TTY and not over RPMsg.

> 
> I also fail to see how you would distinguish ttys when the firmware
> provides more than a single tty - e.g. say you have a modem-like device
> that provides an AT command channel and a NMEA stream.

Today it is a limitation. In fact this limitation is the same for all RPMsg
devices with multi instance.
The patch [1] will allow to retrieve the instance by identifying
the service device name in /sys/class/tty/ttyRPMSG<X>/device/name

> 
> 
> These are the reasons why drivers/rpmsg/rpmsg_char registers a "control
> device", from which you can spawn new char devices. As I've said before,
> I really think the same approach should be taken for ttys - perhaps by
> just extending the rpmsg_char to allow it to create tty devices in
> addition to the "packet based" char device?
> 
I'm not very familiar with the rpmsg_char so please correct me if i'm wrong:

The rpmsg_char exposes to userland an interface to manage rpmsg channels
(relying on a char device). This interface offers the  possibility to create
new channels/endpoints and send/received related messages. 
 
Thus, the application declares the RPMsg channels which is bound if they matches
with the remote processor channel (similar behavior than a kernel rpmsg driver).
There is no constrain on the service once same service is advertised by remote
firmware.

In addition, a limitation of the rpmsg_char device is that it needs to be
associated with an existing device, as example the implementation in qcom_smd
driver.

If i try to figure out how to implement TTY using the rpmsg_char:
I should create a rpmsg_char dev in the rpmsg tty driver. Then application
will create channels related to its service. But in this case
how to ensure that channels created are related to the TTY service?  


I would also expect to manage RPMsg TTY such as a generic TTY: without
extra interface and auto mounted as an USB TTY. this means that the
/dev/ttyRMPSGx are created automatically at remote firmware startup
(without any application action). For instance a generic application 
(e.g. minicom) could control an internal remote processor such as
an external processor through a TTY link. 

Then we have also similar RPMsg driver for I2C and SPI virtual link. So extend
the rpmsg_char to support TTY seems not a good solution for long terms. 

For these reasons i would prefer to have a specific driver. And found a solution
to allow user to differentiate the TTY instances.

Anyway I am very interesting in having more details of an implementation relying
on rpmsg_char if you still thinking that is the good approach here.

Thanks for your comments, 
Arnaud

> Regards,
> Bjorn
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
