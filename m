Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B5D162CE7
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2020 18:31:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3881AC36B0B;
	Tue, 18 Feb 2020 17:31:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B52AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 17:31:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01IHMljZ008997; Tue, 18 Feb 2020 18:31:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=1mjrBYNt2oYEZBjP/5yRehbcb9e0nKwFFgaJCmBPf78=;
 b=G7bilADNu4FbsPE/JMc2tqh/UdRHUvKmtxUKT6O/0tQp4bWSrcyLkbPpWtvBFmbynOpj
 mDEU5DHyODH4shOTkoNBuCBUp0+IbKzfKjpj6rc4Ccp3ZUL/QLzk+y7WM4d6IGhrNf7A
 tOO17njoDivDjwg68/poAWmsFeK42uJ28hobichtv4p/PZUxpamdgKI8IblzAoTOPUd2
 lZo6P9TG/2+bOHQ8YRf2E4eOWvSHFzGwzttHh6hjQEUbD7dZE5fp0JW3aXBzvhHqZYb/
 sYHvSQROij1g7PdXxjCbU5pYup/f44rMdBYWF8tzFEZ1jjVx41W7bFHITytEm0Vxz3XE Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y68dpag5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 18:31:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E637100034;
 Tue, 18 Feb 2020 18:31:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5BD922B7920;
 Tue, 18 Feb 2020 18:31:33 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Feb
 2020 18:31:32 +0100
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200211174205.22247-1-arnaud.pouliquen@st.com>
 <20200211174205.22247-2-arnaud.pouliquen@st.com>
 <20200213200813.GA14415@xps15> <24947b31-bef6-cfb3-686e-80bef6f974e3@st.com>
 <CANLsYkxhWWgVFVe3=5WOYkYGQgV7g+3FvDKRDKi7y9kuk4_G8w@mail.gmail.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <d6e09b93-f287-78a0-a6d9-3d9ea0a5f3d7@st.com>
Date: Tue, 18 Feb 2020 18:31:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CANLsYkxhWWgVFVe3=5WOYkYGQgV7g+3FvDKRDKi7y9kuk4_G8w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_05:2020-02-18,
 2020-02-18 signatures=0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ohad Ben-Cohen <ohad@wizery.com>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Suman Anna <s-anna@ti.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 1/3] remoteproc: add support for
 co-processor loaded and booted before kernel
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

Hi Mathieu, Bjorn,

On 2/17/20 7:40 PM, Mathieu Poirier wrote:
> On Fri, 14 Feb 2020 at 09:33, Arnaud POULIQUEN <arnaud.pouliquen@st.com> wrote:
>>
>> Hi Mathieu,
>>
>> On 2/13/20 9:08 PM, Mathieu Poirier wrote:
>>> Good day,
>>>
>>> On Tue, Feb 11, 2020 at 06:42:03PM +0100, Arnaud Pouliquen wrote:
>>>> From: Loic Pallardy <loic.pallardy@st.com>
>>>>
>>>> Remote processor could boot independently or be loaded/started before
>>>> Linux kernel by bootloader or any firmware.
>>>> This patch introduces a new property in rproc core, named skip_fw_load,
>>>> to be able to allocate resources and sub-devices like vdev and to
>>>> synchronize with current state without loading firmware from file system.
>>>> It is platform driver responsibility to implement the right firmware
>>>> load ops according to HW specificities.
>>>>
>>>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>>>> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>>>> ---
>>>>  drivers/remoteproc/remoteproc_core.c | 67 ++++++++++++++++++++++------
>>>>  include/linux/remoteproc.h           |  2 +
>>>>  2 files changed, 55 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>> index 097f33e4f1f3..876b5420a32b 100644
>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>> @@ -1358,8 +1358,19 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>>>>      return ret;
>>>>  }
>>>>
>>>> -/*
>>>> - * take a firmware and boot a remote processor with it.
>>>> +/**
>>>> + * rproc_fw_boot() - boot specified remote processor according to specified
>>>> + * firmware
>>>> + * @rproc: handle of a remote processor
>>>> + * @fw: pointer on firmware to handle
>>>> + *
>>>> + * Handle resources defined in resource table, load firmware and
>>>> + * start remote processor.
>>>> + *
>>>> + * If firmware pointer fw is NULL, firmware is not handled by remoteproc
>>>> + * core, but under the responsibility of platform driver.
>>>> + *
>>>> + * Returns 0 on success, and an appropriate error value otherwise.
>>>>   */
>>>>  static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>>>  {
>>>> @@ -1371,7 +1382,11 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>>>      if (ret)
>>>>              return ret;
>>>>
>>>> -    dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
>>>> +    if (fw)
>>>> +            dev_info(dev, "Booting fw image %s, size %zd\n", name,
>>>> +                     fw->size);
>>>> +    else
>>>> +            dev_info(dev, "Synchronizing with preloaded co-processor\n");
>>>>
>>>>      /*
>>>>       * if enabling an IOMMU isn't relevant for this rproc, this is
>>>> @@ -1718,16 +1733,22 @@ static void rproc_crash_handler_work(struct work_struct *work)
>>>>   * rproc_boot() - boot a remote processor
>>>>   * @rproc: handle of a remote processor
>>>>   *
>>>> - * Boot a remote processor (i.e. load its firmware, power it on, ...).
>>>> + * Boot a remote processor (i.e. load its firmware, power it on, ...) from
>>>> + * different contexts:
>>>> + * - power off
>>>> + * - preloaded firmware
>>>> + * - started before kernel execution
>>>> + * The different operations are selected thanks to properties defined by
>>>> + * platform driver.
>>>>   *
>>>> - * If the remote processor is already powered on, this function immediately
>>>> - * returns (successfully).
>>>> + * If the remote processor is already powered on at rproc level, this function
>>>> + * immediately returns (successfully).
>>>>   *
>>>>   * Returns 0 on success, and an appropriate error value otherwise.
>>>>   */
>>>>  int rproc_boot(struct rproc *rproc)
>>>>  {
>>>> -    const struct firmware *firmware_p;
>>>> +    const struct firmware *firmware_p = NULL;
>>>>      struct device *dev;
>>>>      int ret;
>>>>
>>>> @@ -1758,11 +1779,20 @@ int rproc_boot(struct rproc *rproc)
>>>>
>>>>      dev_info(dev, "powering up %s\n", rproc->name);
>>>>
>>>> -    /* load firmware */
>>>> -    ret = request_firmware(&firmware_p, rproc->firmware, dev);
>>>> -    if (ret < 0) {
>>>> -            dev_err(dev, "request_firmware failed: %d\n", ret);
>>>> -            goto downref_rproc;
>>>> +    if (!rproc->skip_fw_load) {
>>>> +            /* load firmware */
>>>> +            ret = request_firmware(&firmware_p, rproc->firmware, dev);
>>>> +            if (ret < 0) {
>>>> +                    dev_err(dev, "request_firmware failed: %d\n", ret);
>>>> +                    goto downref_rproc;
>>>> +            }
>>>> +    } else {
>>>> +            /*
>>>> +             * Set firmware name pointer to null as remoteproc core is not
>>>> +             * in charge of firmware loading
>>>> +             */
>>>> +            kfree(rproc->firmware);
>>>> +            rproc->firmware = NULL;
>>>
>>> If the MCU with pre-loaded FW crashes request_firmware() in
>>> rproc_trigger_recovery() will return an error and rproc_start()
>>> never called.
>>
>> Right, something is missing in the recovery function to prevent request_firmware call if skip_fw_load is set
>>
>> We also identify an issue if recovery fails:
>> In case of recovery issue the rproc state is RPROC_CRASHED, so that it is no more possible to load a new firmware from
>> user space.
>> This issue is not linked to this patchset. We have patches on our shelves for this.
>>
>>>>      }
>>>>
>>>>      ret = rproc_fw_boot(rproc, firmware_p);
>>>> @@ -1916,8 +1946,17 @@ int rproc_add(struct rproc *rproc)
>>>>      /* create debugfs entries */
>>>>      rproc_create_debug_dir(rproc);
>>>>
>>>> -    /* if rproc is marked always-on, request it to boot */
>>>> -    if (rproc->auto_boot) {
>>>> +    if (rproc->skip_fw_load) {
>>>> +            /*
>>>> +             * If rproc is marked already booted, no need to wait
>>>> +             * for firmware.
>>>> +             * Just handle associated resources and start sub devices
>>>> +             */
>>>> +            ret = rproc_boot(rproc);
>>>> +            if (ret < 0)
>>>> +                    return ret;
>>>> +    } else if (rproc->auto_boot) {
>>>> +            /* if rproc is marked always-on, request it to boot */
>>>
>>> I spent way too much time staring at this modification...  I can't decide if a
>>> system where the FW has been pre-loaded should be considered "auto_boot".
>>> Indeed the result is the same, i.e the MCU is started at boot time without user
>>> intervention.
>>
>> The main difference is that the firmware is loaded by the Linux remote proc in case of auto-boot.
>> In auto-boot mode the remoteproc loads a firmware, on probe, with a specified name without any request from user space.
>> One constraint of this mode is that the file system has to be accessible before the rproc probe.
> 
> Indeed, but in both cases the MCU is booted automatically.  In one
> case the FW is loaded by the framework and in the other it is not.  As
> such both scenarios are "auto_boot", they simply have different
> flavours.
Regarding your concerns i would like to propose an alternative that will answer to following use cases:

In term of use cases we can start the remote proc firmware in following modes:
- auto boot with FW loading, resource table parsing and FW start/stop
- auto boot without FW loading, with FW resource table parsing and FW start/stop
- auto boot with FW attachment and  resource table parsing
- boot on userspace request with FW loading, resource table parsing and FW start/stop
- boot on userspace request without FW loading, with FW resource table parsing and FW start/stop
- boot on userspace request with FW attachment and  resource table parsing

I considered the recovery covered by these use cases... 

I tried to concatenate all use case to determine the behavior of the core and platform driver:
- "auto-boot" used to decide if boot is from driver or user space request (independently from fw loading and live cycle management)
- "skip_fw_load" allows to determine if a firmware has to be loaded or not.
- remote Firmware live cycle (start,stop,...) are managed by the platform driver, it would have to determine the manage the remote proc depending on the mode detected.  

If i apply this for stm32mp1 driver:
normal boot( FW started on user space request):
  - auto-boot = 0
  - skip_fw_load = 0
FW loaded and started by the bootloader
  - auto-boot = 1
  - skip_firmware = 1;

=> on a stop: the "auto-boot" and "skip_firmware flag will be reset by the stm32rproc driver, to allow user space to load a new firmware or reste the system.
this is considered as a ack by Bjorn today, if you have an alternative please share.

I need to rework the patchset in consequence but i would appreciate your feedback on this proposal before, to be sure that i well interpreted your concerns...

Regards,
Arnaud

> 
>> This is not necessary the case, even if EPROBE_DEFER is used. In this case the driver has to be build as kernel module.
>>
>> Thanks,
>> Arnaud
>>>
>>> I'd welcome other people's opinion on this.
>>>
>>>>              ret = rproc_trigger_auto_boot(rproc);
>>>>              if (ret < 0)
>>>>                      return ret;
>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>> index 16ad66683ad0..4fd5bedab4fa 100644
>>>> --- a/include/linux/remoteproc.h
>>>> +++ b/include/linux/remoteproc.h
>>>> @@ -479,6 +479,7 @@ struct rproc_dump_segment {
>>>>   * @table_sz: size of @cached_table
>>>>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>>>>   * @auto_boot: flag to indicate if remote processor should be auto-started
>>>> + * @skip_fw_load: remote processor has been preloaded before start sequence
>>>>   * @dump_segments: list of segments in the firmware
>>>>   * @nb_vdev: number of vdev currently handled by rproc
>>>>   */
>>>> @@ -512,6 +513,7 @@ struct rproc {
>>>>      size_t table_sz;
>>>>      bool has_iommu;
>>>>      bool auto_boot;
>>>> +    bool skip_fw_load;
>>>>      struct list_head dump_segments;
>>>>      int nb_vdev;
>>>>  };
>>>> --
>>>> 2.17.1
>>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
