Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 247E638294E
	for <lists+linux-stm32@lfdr.de>; Mon, 17 May 2021 12:04:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFDC6C57B75;
	Mon, 17 May 2021 10:04:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D2BFC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 May 2021 10:04:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14HA2mZL005468; Mon, 17 May 2021 12:04:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sEJrkV+PRh8YyBsUrW6p2Qmd2mVyyFFa4+vqrgyw2So=;
 b=aaSJ52COxAqVNSyfYlbcW8O7QuCZ5LSJG2JnSm+G8OdVP06VqMTUn2LQRstQuqcfCIge
 CqDGSibfSj1SZyxvZ5p6dOaLSTTRDG4f9Qzh0t6ruRjJz4rC7cjbFbnSMbZbo1XUbvrR
 yaPvXJxns48YCPdVgUlGRBagZyEkky9GJ5LTmmeMPEZMDlqtjEbPnayI4siAH9ArFdl9
 P8EofIUfM5tkBdV3S/wMpmtkn9kuHbTuT+CAmyJ25dyEPDgCnuVp1HpdBMlCPk+WFLS2
 3kSVDtOI9ysI4O2wSDv/o7IYbTMPD8tVS3MI+LDsDpEtlH81uvXStQIXRbLaXoNDt+wX Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38kmb2rufx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 12:04:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 801D710002A;
 Mon, 17 May 2021 12:04:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D4202248D1;
 Mon, 17 May 2021 12:04:31 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 12:04:30 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
 <20210429135507.8264-6-arnaud.pouliquen@foss.st.com>
 <20210505164159.GB1766375@xps15>
 <5a41e653-4d75-c5d5-a8e3-e247a50507f3@foss.st.com>
 <20210506161125.GA1804623@xps15>
 <e54fb7ce-41c9-4282-22d0-3188af81dc0f@foss.st.com>
 <20210507163113.GA1907885@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <17df93bf-a055-5519-f6e5-ab4751a81ebf@foss.st.com>
Date: Mon, 17 May 2021 12:04:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210507163113.GA1907885@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_03:2021-05-17,
 2021-05-17 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 5/6] rpmsg: char: Introduce a rpmsg
 driver for the rpmsg char device
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

Hello Mathieu,

On 5/7/21 6:31 PM, Mathieu Poirier wrote:
> Good morning,
> 
> On Fri, May 07, 2021 at 11:30:30AM +0200, Arnaud POULIQUEN wrote:
>> Hi Mathieu,
>>
>> On 5/6/21 6:11 PM, Mathieu Poirier wrote:
>>> Good day,
>>>
>>> On Wed, May 05, 2021 at 08:25:24PM +0200, Arnaud POULIQUEN wrote:
>>>> Hi Mathieu,
>>>>
>>>> On 5/5/21 6:41 PM, Mathieu Poirier wrote:
>>>>> Hi Arnaud,
>>>>>
>>>>> On Thu, Apr 29, 2021 at 03:55:06PM +0200, Arnaud Pouliquen wrote:

[snip...]

>>>>>> +};
>>>>>
>>>>> The sole purpose of doing this is to create instances of rpmsg_chrdevs from the
>>>>> name service - but is it really needed?  Up to now and aside from GLINK and SMD,
>>>>> there asn't been other users of it so I'm wondering if it is worth going through
>>>>> all this trouble.
>>>>
>>>> It is a good point.
>>>>
>>>> Just as a reminder, the need of ST and, I assume, some other companies, is to
>>>> have a basic/generic communication channel to control a remote processor
>>>> application.
>>>>
>>>> Nothing generic exists today for a virtio transport based implementation.
>>>> Companies have to create their own driver.
>>>>
>>>> The purpose of my work is to allow our customer to use RPMsg without developing
>>>> a specific driver to control remote applications.
>>>>
>>>> The rpmsg_chrdev char is a good candidate for this. No protocol, just a simple
>>>> inter-processor link to send and receive data. The rpmsg_tty is another one.
>>>>
>>>> Focusing on the rpmsg_chrdev:
>>>> We did a part of the work with the first patch set that would be in 5.13.
>>>> But is it simple to use it for virtio transport based platforms?
>>>> If we don't implement the NS announcement support in rpmsg_chrdev, using
>>>> rpmsg_chrdev for a user application seems rather tricky.
>>>> How to instantiate the communication?
>>>
>>> Since we already have /dev/rpmsg_ctrlX user space can instantiate an 
>>> using that interface, which is how things are done in the GLINK/SMD world.
>>>
>>> Wouldn't that cover the usecases you had in mind?
>>
>> I have in mind that to make RPMsg easy to use, we need a generic driver with a
>> basic user interface to send end receive data, that supports the NS announcement:
>> -  remote side could instantiate it.
>> -  an instantiation of the device by a Linux application generates a NS
>> announcement sent to the remote side (for instance to create a channel for debug
>> trace).
>>
> 
> The communication using a rpmsg_chrdev should be happening in two different ways,
> i.e RPMSG_CREATE_EPT_IOCTL and RPMSG_CREATE_DEV_IOCTL (as you had in a previous
> patchset). 
> 
> From user space communication using a rpmsg_chrdev should be initiated in two
> different ways, i.e RPMSG_CREATE_EPT_IOCTL and RPMSG_CREATE_DEV_IOCTL (as you
> had in a previous patchset). 
> 
> Regarding RPMSG_CREATE_EPT_IOCTL, patches 1, 2 and 3 take care of the legacy
> compatibility and I am quite happy with that.  In this case the driver works the
> same way regardless of the transport mechanism - virtio, GLINK or SMD.

Ok i will send a new revision including only this ones, and continue the updates
in a new patchset.

> 
> Then there is instantiation with RPMSG_CREATE_DEV_IOCTL.  That creates a new
> channel (with endpoint) when coming from /dev/rpmsg_ctrlX.  When we have that
> functionality we can make the rpmsg_chrdev available from the name service, making
> sure the end result is the same regardless of source of the request (remote
> processor or user space).  I was under the impression that functionality would
> be part of an upcoming patchset.
> 
> Unless I'm missing parts of the story, proceeding this way should cover all the
> requirements we talked about.

From my windows, there are 3 remaining features:
- capability to instantiate rpmsg_chrdev from the remote side (NS announcement)
- capability to instantiate rpmsg_chrdev from local user application
  (RPMSG_CREATE_DEV_IOCTL)
- capability to send a NS announcement to the remote side on  rpmsg_chrdev local
instantiation using RPMSG_CREATE_DEV_IOCTL. This one could be more tricky to
implement as the endpoint can be created after the channel.

To simplify the review while keeping the overall picture in mind (and perhaps
prioritize based on other companies' interests), Please, just tell me what would
be your preference in term of splitting and next step.

> 
>> On the other side, the initial work requested by Bjorn seems to be reached:
>> de-correlate the control part to be able to reuse it for other rpmsg devices.
>>
>> I just have the feeling that we are stay in the middle of the road without the
>> patches 4,5 and 6 to have a first basic interface relying on RPMsg.
>>
>>>
>>> As you pointed out above rpmsg_chrdev should be light and simple - eliminating
>>> patches 4, 5 and 6 would yield that.
>>>
>>
>> My concern here is more about the complexity of using it by application, for
>> platforms that rely on virtio rpmsg transport. For instance applications need to
>> know the notion of local and remote RPMsg addressing.
>>
>> Based on your feeling, here is my proposition for next steps:
>>  1- resend a version a version with only patch 1,2 3 + the patch to clean-up the
>>    #include in rpmsg_char
>>  2- switch back to the RPMsg TTY upstream.
>>  3- extend rpmsg_ctrl IOCTLs to allow instantiate RPMSG_TTY from Linux userland.
>>
> 
> Introducing RPMSG_TTY makes sense if a serial controller is only accessible from
> the remote processor.  On the flip side it is an overkill if we just want a raw
> message passing mechanism.  For that the rpmsg_chrdev driver, with the above
> extention, should be used.
>  

Yes the rpmsg_chrdev should be the default one to use for basic communication.
The main purpose of the RPMSG_TTY (from ST company POW) is to easy the
transition in term of communication between an external and an internal
processor based on a serial link. It provides an abstraction layer that the
application does not have to manage the transport layer.

Both seem to me interesting to implement, but let's continue to focus on
rpmsg_chrdev first.

Thanks,
Arnaud

>>
>> Then, we can come back to patches 4, 5 and 6 depending on the feedback from the
>> users.
>>
>> Does this proposition would be OK for you?
>>
>> Thanks,
>> Arnaud
>>
>>
>>>> The application will probably has to scan the /sys/bus/rpmsg/devices/ folder to
>>>> determine the services and associated remote address.
>>>>
>>>> I don't think the QCOM drivers have the same problem because they seems to
>>>> initiate the communication and work directly with the RPMsg endpoints ( new
>>>> channel creation on endpoint creation) while Virtio works with the RPMsg channel.
>>>>
>>>> By introducing the ability to instantiate rpmsg_chrdevs through the NS
>>>> announcement, we make this easy for applications to use.
>>>>
>>>> And without rpmsg_chrdevs instantiation, It also means that we can't create an
>>>> RPMsg channel for the rpmsg_chrdevs using a new RPMSG_CREATE_DEV_IOCTL control,
>>>> right?
>>>>
>>>> That said, If we consider that the aim was only to extract the rpmsg_ctrl part,
>>>> I'm not against leaving the rpmsg_char in this state and switching to the
>>>> rpmsg_tty driver upstream including the work on the rpmsg_ctrl to create rpmsg
>>>> channels.
>>>>
>>>> We could come back on this if requested by someone else.
>>>>
>>>> Thanks,
>>>> Arnaud
>>>>
>>>>>
>>>>> As such I suggest we don't go out of our way to expose rpmsg_chrdevs to the name
>>>>> service.  That way patches 4, 5 and 6 of this set can be dropped.
>>>>>
>>>>> Thanks,
>>>>> Mathieu
>>>>>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
