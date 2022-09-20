Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9086D5BE771
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Sep 2022 15:44:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38962C640F2;
	Tue, 20 Sep 2022 13:44:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F7FFC62D6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 13:44:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KBbDPJ032460;
 Tue, 20 Sep 2022 15:44:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=tKe93jKTJuGPYc8RLIZ+qGFMxQwQpY6C7yIqnX+fRxc=;
 b=3Z8juWDfqMB6uBZiRAmuQEJVJVqtZQwkwDpAKixcN9ZBy3PaiYllzdotzthgYeSuiaIf
 jwJ6Z+5tWS4ksM+tmbRXKhglAuW5oJ4qMhenR/t5/EArZAUV3xchypYt9OuxPvceAu3I
 Py+oO79NY5xeFwjbxXHPLm3BBXt30h0HXr3QZvmYQ7eDQ9Bj055HoJFPh92zVPl1I1rT
 uTyslkzuIPalm8HM9KujmDhqCflYHaUQmboZOh7AoO1WEGGPnDV6VIJ29kaNul25CaR4
 rwUk1xLW0eUmUd5fl46SrmPji53X/OmXPZiM/6K6pTDfg+H07oWShx47fCzPlokkHSXT 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6a0u8mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 15:44:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D605210002A;
 Tue, 20 Sep 2022 15:44:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54D5123300B;
 Tue, 20 Sep 2022 15:44:31 +0200 (CEST)
Received: from [10.201.22.245] (10.75.127.44) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 20 Sep
 2022 15:44:30 +0200
Message-ID: <66e27df5-7697-446d-df7c-eb50e6d06f46@foss.st.com>
Date: Tue, 20 Sep 2022 15:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20220826115232.2163130-1-arnaud.pouliquen@foss.st.com>
 <20220919223027.GG759648@p14s>
Content-Language: en-US
In-Reply-To: <20220919223027.GG759648@p14s>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_05,2022-09-20_02,2022-06-22_01
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v8 0/4] remoteproc: restructure the
 remoteproc VirtIO device
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

Hi Mathieu,

On 9/20/22 00:30, Mathieu Poirier wrote:
> Hi,
> 
> On Fri, Aug 26, 2022 at 01:52:28PM +0200, Arnaud Pouliquen wrote:
>> 1) Update from V7 [1]:
>>
>> - rebase on rproc-next branch [2], commit 729c16326b7f ("remoteproc: imx_dsp_rproc: fix argument 2 of rproc_mem_entry_init")
>>   The updates take into account the integration of the
>>   commit 1404acbb7f68 ("remoteproc: Fix dma_mem leak after rproc_shutdown")
>> - add Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org> according to reviews on V7
>>
>>
>> [1] https://lkml.org/lkml/2022/7/13/663
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/log/?h=for-next
>>
>> 2) Patchset description:
>>
>> This series is a part of the work initiated a long time ago in 
>> the series "remoteproc: Decorelate virtio from core"[3]
>>
>> Objective of the work:
>> - Update the remoteproc VirtIO device creation (use platform device)
>> - Allow to declare remoteproc VirtIO device in DT
>>     - declare resources associated to a remote proc VirtIO
>>     - declare a list of VirtIO supported by the platform.
>> - Prepare the enhancement to more VirtIO devices (e.g I2C, audio, video, ...).
>>   For instance be able to declare a I2C device in a virtio-i2C node.
>> - Keep the legacy working!
>> - Try to improve the picture about concerns reported by Christoph Hellwing [4][5]
>>
>> [3] https://lkml.org/lkml/2020/4/16/1817
>> [4] https://lkml.org/lkml/2021/6/23/607
>> [5] https://patchwork.kernel.org/project/linux-remoteproc/patch/AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch/
>>
>> In term of device tree this would result in such hierarchy (stm32mp1 example with 2 virtio RPMSG):
>>
>> 	m4_rproc: m4@10000000 {
>> 		compatible = "st,stm32mp1-m4";
>> 		reg = <0x10000000 0x40000>,
>> 		      <0x30000000 0x40000>,
>> 		      <0x38000000 0x10000>;
>>         memory-region = <&retram>, <&mcuram>,<&mcuram2>;
>>         mboxes = <&ipcc 2>, <&ipcc 3>;
>>         mbox-names = "shutdown", "detach";
>>         status = "okay";
>>
>>         #address-cells = <1>;
>>         #size-cells = <0>;
>>         
>>         vdev@0 {
>> 		compatible = "rproc-virtio";
>> 		reg = <0>;
>> 		virtio,id = <7>;  /* RPMSG */
>> 		memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
>> 		mboxes = <&ipcc 0>, <&ipcc 1>;
>> 		mbox-names = "vq0", "vq1";
>> 		status = "okay";
>>         };
>>
>>         vdev@1 {
>> 		compatible = "rproc-virtio";
>> 		reg = <1>;
>> 		virtio,id = <7>;  /*RPMSG */
>> 		memory-region = <&vdev1vring0>, <&vdev1vring1>, <&vdev1buffer>;
>> 		mboxes = <&ipcc 4>, <&ipcc 5>;
>> 		mbox-names = "vq0", "vq1";
>> 		status = "okay";
>>         };
>> };
> 
> I was in the process of applying this set when the last patch gave me a
> checkpatch warning about "virtio,rproc" not being documented.
> 
> I suggest to introduce a new "virtio-rproc.yaml" based on this work[1], with the
> above in the example sections.

Yes I saw the warning, but for this first series it is not possible to declare
the associated "rproc-virtio" device  in device tree.
So at this step it seems not make senses to create the devicetree bindings file.
More than that I don't know how I could justify the properties in bindings if
there is not driver code associated.

So i would be in favor of not adding the bindings in this series but to define
bindings in the first patch of my "step 2" series; as done on my github:
https://github.com/arnopo/linux/commit/9616d89a4f478cf78865a244efcde108d900f69f

Please let me know your preference.

Regards,
Arnaud


> 
> Thanks,
> Mathieu
> 
> [1]. https://elixir.bootlin.com/linux/v6.0-rc6/source/Documentation/devicetree/bindings/virtio/virtio-device.yaml
> 
> 
>>
>> I have divided the work in 4 steps to simplify the review, This series implements only
>> the step 1:
>> step 1: Redefine the remoteproc VirtIO device as a platform device
>>   - migrate rvdev management in remoteproc virtio.c,
>>   - create a remotproc virtio config ( can be disabled for platform that not use VirtIO IPC.
>> step 2: Add possibility to declare and probe a VirtIO sub node
>>   - VirtIO bindings declaration,
>>   - multi DT VirtIO devices support,
>>   - introduction of a remote proc virtio bind device mechanism ,
>> => https://github.com/arnopo/linux/commits/step2-virtio-in-DT
>> step 3: Add memory declaration in VirtIO subnode
>> => https://github.com/arnopo/linux/commits/step3-virtio-memories
>> step 4: Add mailbox declaration in VirtIO subnode
>> => https://github.com/arnopo/linux/commits/step4-virtio-mailboxes
>>
>> Arnaud Pouliquen (4):
>>   remoteproc: core: Introduce rproc_rvdev_add_device function
>>   remoteproc: core: Introduce rproc_add_rvdev function
>>   remoteproc: Move rproc_vdev management to remoteproc_virtio.c
>>   remoteproc: virtio: Create platform device for the remoteproc_virtio
>>
>>  drivers/remoteproc/remoteproc_core.c     | 154 +++---------------
>>  drivers/remoteproc/remoteproc_internal.h |  23 ++-
>>  drivers/remoteproc/remoteproc_virtio.c   | 189 ++++++++++++++++++++---
>>  include/linux/remoteproc.h               |   6 +-
>>  4 files changed, 210 insertions(+), 162 deletions(-)
>>
>> -- 
>> 2.24.3
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
