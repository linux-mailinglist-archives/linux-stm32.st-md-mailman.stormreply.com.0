Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F19519F7C6
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 16:19:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50AF0C36B0B;
	Mon,  6 Apr 2020 14:19:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 509C8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 14:19:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 036E46gw019312; Mon, 6 Apr 2020 16:19:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : subject : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=MDWrPWm65LgQvAsdXgU1HJgPbeJd38r+v9dG901gsDI=;
 b=QttZ/kCDnJiSM+aueKiZpnGgUtpdJCJ1Fxktvc5ugQWnSg5UAknfcTXlGsLFB0MIjXtb
 fWCEf6BnzAyJdD9GNtfEOkq5Q036AMS/6AQxljl/nKoUAs72k1VEYBMyhcaCREpWTa1Y
 nFUmfcAJPPDExsevSHrJTNACHy7HRm3IJYTc5AXH9jrovHX4KAnEkWjhQWGtZfjxonow
 iN6hr/dMiYUSMkwFXlQqbx9D2pRskjswwLBfs+KKjB2wbHb+qF/z6raO6feD8G8IPX+F
 s21mFizapfSZ0EPJIUKJLLG8+KhEiTzMmfjCHaskyl557PHkvV78/wyznkaBOvBR6xXF 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 306fc9th31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 16:19:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E290100034;
 Mon,  6 Apr 2020 16:19:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3958F220A2E;
 Mon,  6 Apr 2020 16:19:00 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.45) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 16:18:59 +0200
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
 <20200324205210.GE119913@minitux>
 <4f5e6dd0-5deb-8036-0a94-eb7055744f35@st.com>
Message-ID: <c0eed724-78b7-f8b6-cab4-de06e426d7d1@st.com>
Date: Mon, 6 Apr 2020 16:18:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4f5e6dd0-5deb-8036-0a94-eb7055744f35@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_08:2020-04-06,
 2020-04-06 signatures=0
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

On 3/25/20 5:57 PM, Arnaud POULIQUEN wrote:
> Hi Bjorn,
> 
> On 3/24/20 9:52 PM, Bjorn Andersson wrote:
>> On Tue 24 Mar 10:04 PDT 2020, Arnaud Pouliquen wrote:
>> [..]
>>> diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
>>> index 020b1cd9294f..c2465e7ebc2a 100644
>>> --- a/drivers/tty/Makefile
>>> +++ b/drivers/tty/Makefile
>>> @@ -34,5 +34,6 @@ obj-$(CONFIG_PPC_EPAPR_HV_BYTECHAN) += ehv_bytechan.o
>>>  obj-$(CONFIG_GOLDFISH_TTY)	+= goldfish.o
>>>  obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_ejtag_fdc.o
>>>  obj-$(CONFIG_VCC)		+= vcc.o
>>> +obj-$(CONFIG_RPMSG_TTY)		+= rpmsg_tty.o
>>>  
>>>  obj-y += ipwireless/
>>> diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
>> [..]
>>> +static struct rpmsg_device_id rpmsg_driver_tty_id_table[] = {
>>> +	{ .name	= TTY_CH_NAME_RAW },
>>> +	{ .name	= TTY_CH_NAME_WITH_CTS},
>>
>> I still don't like the idea that the tty devices are tied to channels by
>> fixed names.
> 
> This point has been discussed with Xiang, he has the same kind of requirement. 
> My proposal here is to do this in two steps. First a fixed name, then
> in a second step we can extend the naming using the implementation proposed
> by Mathieu Poirier:
> 
> [1]https://lkml.org/lkml/2020/2/12/1083
> 
> Is this patch could answer to your requirement?
> 
> if requested i can I can integrate the Mathieu's patch in this patchset.
>  
>>
>> This makes the driver unusable for communicating with any firmware out
>> there that provides tty-like data over a channel with a different name -
>> such as modems with channels providing an AT command interface (they are
>> not named "rpmsg-tty-raw").
> 
> I'm not fixed on the naming, any proposal is welcome.
> If we use the patch [1], could be renamed 
> "rpmsg-tty". then for AT command could be something like "rpmsg-tty-at"
> 
> But here seems we are speaking about service over TTY and not over RPMsg.
> 
>>
>> I also fail to see how you would distinguish ttys when the firmware
>> provides more than a single tty - e.g. say you have a modem-like device
>> that provides an AT command channel and a NMEA stream.
> 
> Today it is a limitation. In fact this limitation is the same for all RPMsg
> devices with multi instance.
> The patch [1] will allow to retrieve the instance by identifying
> the service device name in /sys/class/tty/ttyRPMSG<X>/device/name
> 
>>
>>
>> These are the reasons why drivers/rpmsg/rpmsg_char registers a "control
>> device", from which you can spawn new char devices. As I've said before,
>> I really think the same approach should be taken for ttys - perhaps by
>> just extending the rpmsg_char to allow it to create tty devices in
>> addition to the "packet based" char device?
>>
> I'm not very familiar with the rpmsg_char so please correct me if i'm wrong:
> 
> The rpmsg_char exposes to userland an interface to manage rpmsg channels
> (relying on a char device). This interface offers the  possibility to create
> new channels/endpoints and send/received related messages. 
>  
> Thus, the application declares the RPMsg channels which is bound if they matches
> with the remote processor channel (similar behavior than a kernel rpmsg driver).
> There is no constrain on the service once same service is advertised by remote
> firmware.
> 
> In addition, a limitation of the rpmsg_char device is that it needs to be
> associated with an existing device, as example the implementation in qcom_smd
> driver.
> 
> If i try to figure out how to implement TTY using the rpmsg_char:
> I should create a rpmsg_char dev in the rpmsg tty driver. Then application
> will create channels related to its service. But in this case
> how to ensure that channels created are related to the TTY service?  
> 
> 
> I would also expect to manage RPMsg TTY such as a generic TTY: without
> extra interface and auto mounted as an USB TTY. this means that the
> /dev/ttyRMPSGx are created automatically at remote firmware startup
> (without any application action). For instance a generic application 
> (e.g. minicom) could control an internal remote processor such as
> an external processor through a TTY link. 
> 
> Then we have also similar RPMsg driver for I2C and SPI virtual link. So extend
> the rpmsg_char to support TTY seems not a good solution for long terms. 
> 
> For these reasons i would prefer to have a specific driver. And found a solution
> to allow user to differentiate the TTY instances.
> 
> Anyway I am very interesting in having more details of an implementation relying
> on rpmsg_char if you still thinking that is the good approach here.

Do you think you would find time to move forward with this discussion?
I would like to prepare a v8 to fix issue reported on v7, but as your comments
challenges the driver itself, i would prefer that we first find solutions
that address your concerns.

Thanks,
Arnaud

> 
> Thanks for your comments, 
> Arnaud
> 
>> Regards,
>> Bjorn
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
