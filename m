Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D9331068B
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 09:22:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83B73C57B52;
	Fri,  5 Feb 2021 08:22:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C19FC5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 08:22:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1158KmuI002731; Fri, 5 Feb 2021 09:22:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Po9OQlbyk7P2cLykDVpRf1AUVuQjNntuCh8fm7rd8hQ=;
 b=TcoB1OpfTeOrAFSU0FD3txxDBVLuaKctwy8Zbn+4li9sKgF6M6iGz8tmF+Cx5bU4LeMK
 RxXTRpPVVeTFaF7UsL3FQKPqg8pAN5VtL9b46a5rzsZDrEWM66jUdzARC+l/r0KGyPmT
 sss24FzgezF2m4s7Zdiki5hAj+PS2TTKgJgbZrWrDsXtNmjx7KighA/L7rws7Wpvj9vj
 abmVLYCA6xd8iElAuJxbWu/Q4xb06FC/c0fOwX4uhgFf7sEhfv5x0i1Istgdd1/hmXM3
 UKCxIgX4z1k8adk40iBLkv6caPCSW3+jvtaT3bMfnE0IfO0l4QDFlKd16vUVp/0gDCHp fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ey7hen8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 09:22:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3D3D100038;
 Fri,  5 Feb 2021 09:22:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7200321E696;
 Fri,  5 Feb 2021 09:22:23 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb
 2021 09:21:32 +0100
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210204084534.10516-7-arnaud.pouliquen@foss.st.com>
 <202102042006.UBNrTXCE-lkp@intel.com>
 <c853e1f6-d5f9-4270-5a78-2e9730e5089e@foss.st.com>
 <CANLsYky5r2BjBxjXaB4xNFNcb+zyVJshWZzgMUqf6C5Q9op9BA@mail.gmail.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <6bf6bb7b-d5c4-69d7-baad-831bc2ca4eae@foss.st.com>
Date: Fri, 5 Feb 2021 09:21:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANLsYky5r2BjBxjXaB4xNFNcb+zyVJshWZzgMUqf6C5Q9op9BA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_04:2021-02-05,
 2021-02-05 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 06/15] rpmsg: update
 rpmsg_chrdev_register_device function
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



On 2/4/21 5:53 PM, Mathieu Poirier wrote:
> On Thu, 4 Feb 2021 at 08:11, Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
>>
>>
>>
>> On 2/4/21 1:44 PM, kernel test robot wrote:
>>> Hi Arnaud,
>>>
>>> I love your patch! Yet something to improve:
>>>
>>> [auto build test ERROR on linus/master]
>>> [also build test ERROR on v5.11-rc6 next-20210125]
>>> [cannot apply to rpmsg/for-next agross-msm/qcom/for-next]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch]
>>>
>>> url:    https://github.com/0day-ci/linux/commits/Arnaud-Pouliquen/introduce-a-generic-IOCTL-interface-for-RPMsg-channels-management/20210204-165337
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 61556703b610a104de324e4f061dc6cf7b218b46
>>> config: openrisc-randconfig-r001-20210204 (attached as .config)
>>> compiler: or1k-linux-gcc (GCC) 9.3.0
>>> reproduce (this is a W=1 build):
>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>         chmod +x ~/bin/make.cross
>>>         # https://github.com/0day-ci/linux/commit/23c166e0b157f0695fa7daefb8c5e30f383c3efd
>>>         git remote add linux-review https://github.com/0day-ci/linux
>>>         git fetch --no-tags linux-review Arnaud-Pouliquen/introduce-a-generic-IOCTL-interface-for-RPMsg-channels-management/20210204-165337
>>>         git checkout 23c166e0b157f0695fa7daefb8c5e30f383c3efd
>>>         # save the attached .config to linux build tree
>>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=openrisc
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>>
>>> All errors (new ones prefixed by >>):
>>>
>>>    or1k-linux-ld: drivers/rpmsg/qcom_glink_native.o: in function `qcom_glink_native_probe':
>>>>> qcom_glink_native.c:(.text+0x2e88): undefined reference to `rpmsg_ctrl_register_device'
>>>    qcom_glink_native.c:(.text+0x2e88): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `rpmsg_ctrl_register_device'
>>
>> Thanks for highlighting it!
>>
>> I await further review comments first, but I will address this in my next
>> revision, if it still relevant.
> 
> I will be surprised if I get to look at your patchset before February
> 22nd so it may be better to address the above.

Thanks for the information.
I will therefore target a new review in week 7 even if no further comments are
posted.

> 
>>
>>>
>>> ---
>>> 0-DAY CI Kernel Test Service, Intel Corporation
>>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
