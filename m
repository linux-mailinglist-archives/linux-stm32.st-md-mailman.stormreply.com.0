Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6365F4778
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Oct 2022 18:24:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D793C63327;
	Tue,  4 Oct 2022 16:24:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72C0FC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 16:24:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294BuvS5022266;
 Tue, 4 Oct 2022 18:23:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yDMKyG65ckdC56hoAnM4nP4F4DEhQI3AW8B11BrUlAQ=;
 b=lH268rpkEPHoxuFVf3Cp3y9sJ/n2RIAc+d6vJA5LZac6+1UILc+iGaqk08+KYbyszyiO
 8Lcp5NcB8rol/XYkSTDMFeLPsdF4Ot7L9hcGsYG5K4fyHlM43FemJR1i/YJi6W9kqxRw
 IXFM463RP4Zj9LrUpzAkCnlWD3gQ6G98dopMfNEKxlIcCWzrxdzNUZjG6XzNdiktiiGA
 5SQatfa4tGsBcq7bSOehZsV0wSPwpEHaPlzBrFVFNkAypn8LRXMPwTUpc2pqWmUFXdzT
 DJ4zc0OIpYJtpoDLS4wJ6hRaOrUXXRbmH8BDVafsSxk4dpN7/JKBUg72jExPtmOcwgCN 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jxapc1xda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 18:23:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 128A610002A;
 Tue,  4 Oct 2022 18:23:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 848FF245510;
 Tue,  4 Oct 2022 18:23:43 +0200 (CEST)
Received: from [10.211.7.73] (10.75.127.121) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 4 Oct
 2022 18:23:40 +0200
Message-ID: <97d1e574-ab68-cbd8-9300-b1a81f2dc2a9@foss.st.com>
Date: Tue, 4 Oct 2022 18:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220921135044.917140-1-arnaud.pouliquen@foss.st.com>
 <20220921135044.917140-5-arnaud.pouliquen@foss.st.com>
 <20221004143954.GA1479221-robh@kernel.org>
 <fa229aa5-5fb7-eb18-3b8a-59d8a98ccaba@foss.st.com>
 <CAL_JsqLnm7+YQAiSeCk5Db1oNcg=rwJd4Fnve4j+-ssC-dZOHQ@mail.gmail.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <CAL_JsqLnm7+YQAiSeCk5Db1oNcg=rwJd4Fnve4j+-ssC-dZOHQ@mail.gmail.com>
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_07,2022-09-29_03,2022-06-22_01
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-stm32] [PATCH v9 4/4] remoteproc: virtio: Create
 platform device for the remoteproc_virtio
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



On 10/4/22 17:43, Rob Herring wrote:
> On Tue, Oct 4, 2022 at 10:18 AM Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
>>
>> Hello Rob,
>>
>> On 10/4/22 16:39, Rob Herring wrote:
>>> On Wed, Sep 21, 2022 at 03:50:44PM +0200, Arnaud Pouliquen wrote:
>>>> Define a platform driver to manage the remoteproc virtio device as
>>>> a platform devices.
>>>>
>>>> The platform device allows to pass rproc_vdev_data platform data to
>>>> specify properties that are stored in the rproc_vdev structure.
>>>>
>>>> Such approach will allow to preserve legacy remoteproc virtio device
>>>> creation but also to probe the device using device tree mechanism.
>>>>
>>>> remoteproc_virtio.c update:
>>>>   - Add rproc_virtio_driver platform driver. The probe ops replaces
>>>>     the rproc_rvdev_add_device function.
>>>>   - All reference to the rvdev->dev has been updated to rvdev-pdev->dev.
>>>>   - rproc_rvdev_release is removed as associated to the rvdev device.
>>>>   - The use of rvdev->kref counter is replaced by get/put_device on the
>>>>     remoteproc virtio platform device.
>>>>   - The vdev device no longer increments rproc device counter.
>>>>     increment/decrement is done in rproc_virtio_probe/rproc_virtio_remove
>>>>     function in charge of the vrings allocation/free.
>>>>
>>>> remoteproc_core.c update:
>>>>   Migrate from the rvdev device to the rvdev platform device.
>>>>   From this patch, when a vdev resource is found in the resource table
>>>>   the remoteproc core register a platform device.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>> ---
>>>>  drivers/remoteproc/remoteproc_core.c     |  12 +-
>>>>  drivers/remoteproc/remoteproc_internal.h |   2 -
>>>>  drivers/remoteproc/remoteproc_virtio.c   | 143 ++++++++++++-----------
>>>>  include/linux/remoteproc.h               |   6 +-
>>>>  4 files changed, 82 insertions(+), 81 deletions(-)
>>>
>>> [...]
>>>
>>>> +/* Platform driver */
>>>> +static const struct of_device_id rproc_virtio_match[] = {
>>>> +    { .compatible = "virtio,rproc" },
>>>
>>> This is not documented. Add a binding schema if you need DT support.
>>
>>
>> Mathieu also pointed this out to me in V8, you can see the discussion here [1]
>>
>> Here is an extract:
>> "Yes I saw the warning, but for this first series it is not possible to declare
>> the associated "rproc-virtio" device in device tree.
>> So at this step it seems not make senses to create the devicetree bindings file.
>> More than that I don't know how I could justify the properties in bindings if
>> there is not driver code associated.
>>
>> So i would be in favor of not adding the bindings in this series but to define
>> bindings in the first patch of my "step 2" series; as done on my github:
>> https://github.com/arnopo/linux/commit/9616d89a4f478cf78865a244efcde108d900f69f
>> "
> 
> Okay, since I only just started checking this (in a more reliable way
> than checkpatch does).
> 
> But why do you need the DT match entry if it is not usable yet? You
> could just add that in later when the binding is defined. Review of
> the binding could say that 'virtio,rproc' should be something else and
> you'd have to change it.

Probably because I am too formatted to add a compatible when I create a driver,
this solution yet logical did not come to my mind...

I will send a fix to suppress the compatible.

Thanks,
Arnaud

> 
> Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
