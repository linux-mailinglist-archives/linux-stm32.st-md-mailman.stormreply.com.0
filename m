Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C2185F242
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 08:58:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42488C6C855;
	Thu, 22 Feb 2024 07:58:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B88FC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 05:44:10 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41M3uHrm025369; Thu, 22 Feb 2024 05:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=oCC3QGnbRxCLzx4KRoEqeteCKzjPTUEElYcaAwDBXsA=; b=Ep
 dSbFdcHg36DzMP+JDwlh8qUWQsDI5VNBZ77uN0CcNosWOQiqoPVRIwaRo04yegZa
 s6SXEz3LzZSmD1m4zEucXUXc1VmPodUKofzy9JNs4r2+iBJF1VH2i7lIeox9ndHm
 B4mphwC+1WHT8KzJ12+JBi25nXePzQ7szJ61v9/2nd2+r4IFs+opa3wY1L6S+CkZ
 f9MpsVg/s0srg209fAAEbSsZBayBSG+jRztc4EwDydf78ThCRadzqqAU3cc4jQaS
 P6D2CS6bc4kv2G9dZLR+73nuwlm4EL0Q6nPx2vh9DBLaIx+OktUVECG4k6pa/W7D
 1R5te5KbHh9CyynxSvPw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdpjn95rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 05:43:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41M5hqFj004786
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 05:43:52 GMT
Received: from [10.214.82.119] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 21:43:48 -0800
Message-ID: <fe4ec29f-7521-4369-a382-bae50dbf0ee5@quicinc.com>
Date: Thu, 22 Feb 2024 11:13:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Jens
 Wiklander <jens.wiklander@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
References: <20240214172127.1022199-1-arnaud.pouliquen@foss.st.com>
From: Naman Jain <quic_namajain@quicinc.com>
In-Reply-To: <20240214172127.1022199-1-arnaud.pouliquen@foss.st.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: -lkiXDkqUkLoLXNDx0na_5iwoAA8Refh
X-Proofpoint-GUID: -lkiXDkqUkLoLXNDx0na_5iwoAA8Refh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_03,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220042
X-Mailman-Approved-At: Thu, 22 Feb 2024 07:58:36 +0000
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/7] Introduction of a remoteproc tee
 to load signed firmware
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

On 2/14/2024 10:51 PM, Arnaud Pouliquen wrote:
> Updates from the previous version [1]:
> 
> This version proposes another approach based on an alternate load and boot
> of the coprocessor. Therefore, the constraint introduced by tee_remoteproc
> is that the firmware has to be authenticated and loaded before the resource
> table can be obtained.
> 
> The existing boot sequence is: >
>    1) Get the resource table and store it in a cache,
>       calling rproc->ops->parse_fw().
>    2) Parse the resource table and handle resources,
>       calling rproc_handle_resources.
>    3) Load the firmware, calling rproc->ops->load().
>    4) Start the firmware, calling rproc->ops->start().
>   
> => Steps 1 and 2 are executed in rproc_fw_boot(), while steps 3 and 4 are
>     executed in rproc_start().
> => the use of rproc->ops->load() ops is mandatory
> 
> The boot sequence needed for TEE boot is:
> 
>    1) Load the firmware.
>    2) Get the loaded resource, no cache.
>    3) Parse the resource table and handle resources.
>    4) Start the firmware.

Hi,
What problem are we really addressing here by reordering load, parse of
FW resources?
Basically, what are the limitations of the current design you are 
referring to?
I understood that TEE is designed that way.

> 
> Then the crash recovery also has to be managed.For recovery, the cache is
> used to temporarily save the resource table and then reapply it on
> restart:
>    1) Stop the remote processor, calling rproc->ops->stop().
>    2) Load the firmware, calling rproc->ops->load().
>    3) Copy cached resource table.
>    4) Start the remote processor, calling rproc->ops->start().
> 
> => This sequence is also needed when TEE manages the boot of the remote
>     processor.
> => The rproc->ops->load() is also used in recovery sequence.
> 
> Based on the sequences described above, the proposal is to:
> 
> - Rework tee_rproc API to better match the rproc_ops structure.
>    This allows to simply map the function to implement the load ops, which
>    is not optional. The tee_rproc_load_fw() is updated in consequence.
> - Remove the call of rproc_load_segments from rproc_start() to dissociate
>    the load and the start. This is necessary to implement the boot sequence
>    requested for the TEE remote proc support.
> - Introduce an rproc_alt_fw_boot() function that is an alternative boot
>    sequence, which implements the sequence requested for the TEE remoteproc
>    support.
> 
> 
> [1] https://lore.kernel.org/lkml/20240118100433.3984196-1-arnaud.pouliquen@foss.st.com/T/
> 
> 
> Description of the feature:
> 
> This series proposes the implementation of a remoteproc tee driver to
> communicate with a TEE trusted application responsible for authenticating and
> loading the remoteproc firmware image in an Arm secure context.
> 
> 1) Principle:
> 
> The remoteproc tee driver provides services to communicate with the OP-TEE
> trusted application running on the Trusted Execution Context (TEE).

s/Context/Environment?

> The trusted application in TEE manages the remote processor lifecycle:
> 
> - authenticating and loading firmware images,
> - isolating and securing the remote processor memories,
> - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
> - managing the start and stop of the firmware by the TEE.
> 

Regards,
Naman Jain

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
