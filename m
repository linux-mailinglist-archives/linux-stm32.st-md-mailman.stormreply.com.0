Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 866DAA5EB92
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 07:16:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33936C78F6E;
	Thu, 13 Mar 2025 06:16:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8218FC7803D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 06:16:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CLnhYH014938;
 Thu, 13 Mar 2025 06:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SEskWSaR5lig+yqq/pODCWaOenT97ESIy6ccSJZjSP0=; b=huYIxo9j1DpEj83O
 sQkK2R6XdbQVVt9U6K7tLRdtbRTQ2+c6voJVLhvB4L4aeRWOiJzgikYcae82fRyu
 3+cYDWnOnt7vkq8Oxhe1WGJYdM0MuKgiM+TDv5a11vJLtKoCqOnfyUAI85DVezX7
 6BLbfZAhQrVa4Vb6qRTS3uwbwR35taeirGhKaB3WgVByOKAo7+AAKakfkw3Kelu4
 yA+Zr6h7c9tHL/eMb8H0bqp/Vctaesqk8ecXQlLpJ0hqPVsnNy4RwLa20SHIl+y4
 iOwAaijKloYlzM2Ia4EO8D7aRC1wGJBP78Kyk5rmE2faXi1kYf3r2bknkIcQoW9q
 4+2fAQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p4tvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Mar 2025 06:15:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D6FowS007338
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Mar 2025 06:15:51 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 23:15:45 -0700
Message-ID: <8a18c699-3d36-4143-9a1b-6074fea52263@quicinc.com>
Date: Thu, 13 Mar 2025 14:15:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mike Leach <mike.leach@linaro.org>
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
 <CAJ9a7Vj=Ni_o94u1B+oouv0GD5DVmST=N31-hsN=SPSbaoqO_Q@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <CAJ9a7Vj=Ni_o94u1B+oouv0GD5DVmST=N31-hsN=SPSbaoqO_Q@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=ePkTjGp1 c=1 sm=1 tr=0 ts=67d27817 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=myPZrXr1dOEo5VCIbN8A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vYXc0755I2aVbikhbBka3N03L-nFuhbo
X-Proofpoint-GUID: vYXc0755I2aVbikhbBka3N03L-nFuhbo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130047
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 0/4] coresight: ctcu: Enable byte-cntr
 function for TMC ETR
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



On 3/12/2025 9:22 PM, Mike Leach wrote:
> Hi,
> 
> On Mon, 10 Mar 2025 at 09:05, Jie Gan <quic_jiegan@quicinc.com> wrote:
>>
>> From: Jie Gan <jie.gan@oss.qualcomm.com>
>>
>> The byte-cntr function provided by the CTCU device is used to transfer data
>> from the ETR buffer to the userspace. An interrupt is tiggered if the data
>> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
>> handler counts the number of triggered interruptions and the read function
>> will read the data from the ETR buffer if the IRQ count is greater than 0.
>> Each successful read process will decrement the IRQ count by 1.
>>
>> The byte cntr function will start when the device node is opened for reading,
>> and the IRQ count will reset when the byte cntr function has stopped. When
>> the file node is opened, the w_offset of the ETR buffer will be read and
>> stored in byte_cntr_data, serving as the original r_offset (indicating
>> where reading starts) for the byte counter function.
>>
>> The work queue for the read operation will wake up once when ETR is stopped,
>> ensuring that the remaining data in the ETR buffer has been flushed based on
>> the w_offset read at the time of stopping.
>>
>> The following shell commands write threshold to BYTECNTRVAL registers.
>>
>> Only enable byte-cntr for ETR0:
>> echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>>
>> Enable byte-cntr for both ETR0 and ETR1(support both hex and decimal values):
>> echo 0x10000 4096 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>>
>> Setting the BYTECNTRVAL registers to 0 disables the byte-cntr function.
>> Disable byte-cntr for ETR0:
>> echo 0 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>>
>> Disable byte-cntr for both ETR0 and ETR1:
>> echo 0 0 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>>
>> There is a minimum threshold to prevent generating too many interrupts.
>> The minimum threshold is 4096 bytes. The write process will fail if user try
>> to set the BYTECNTRVAL registers to a value less than 4096 bytes(except
>> for 0).
>>
>> Finally, the user can read data from the ETR buffer through the byte-cntr file
>> nodes located under /dev, for example reads data from the ETR0 buffer:
>> cat /dev/byte-cntr0
>>
>> Way to enable and start byte-cntr for ETR0:
>> echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
>> cat /dev/byte-cntr0
>>
> 
> There is a significant issue with attempting to drain an ETR buffer
> while it is live in the way you appear to be doing.
> 
> You have no way of knowing if the TMC hardware write pointer wraps and
> overtakes the point where you are currently reading. This could cause
> data corruption as TMC writes as you are reading, or contention for
> the buffer that affects the TMC write.
> 
> Even if those two events do not occur, then the trace capture sequence
> is corrupted.
> 
> Take a simple example - suppose we split the buffer into 4 blocks of
> trace, which are filled by the ETR
> 
> buffer = 1, 2, 3, 4
> 
> Now you suppose you have read 1 & 2 into your userspace buffer / file.
> 
> file = 1, 2
> 
> If there is now some system event that prevents your userspace code
> from running for a while, then it is possible that the ETR continues,
> wraps and the buffer is now
> 
> buffer = 5, 6, 7, 4
> 
> Your next two reads will be 7, 4
> 
> file = 1, 2, 7, 4
> 
> This trace is now corrupt and will cause decode errors. There is no
> way for the decoder to determine that the interface between blocks 2 &
> 7 is not correct. If you are fortunate then this issue will cause an
> actual explicit decode error, if you are less fortunate then decode
> will continue but in fact be inaccurate, with no obvious way to detect
> the inaccuracy.
> 
> We encountered this problem early in the development of the perf data
> collection. Even though perf was stopping the trace to copy the
> hardware buffer, it would concatenate unrelated trace blocks into the
> perf userspace buffer, which initially caused decoding errors. This is
> now mitigated in perf by marking boundaries and recording indexes of
> the boundaries, so the tool can reset the decoder at the start of non
> contiguous blocks.
> 
> If you do not stop the TMC when draining the ETR buffer, you have no
> way of determining if this has occurred.
> 
> Clearly using large buffers, split into smaller blocks can mitigate
> the possibility of a wrap in this way - but never eliminate it,
> especially given the extreme rate that trace data can be generated.
> 

Hi Mike,

Thanks for detailed explanation. It's clear and makes sense to me.

I will look for another reasonable solution.

Thanks,
Jie

> Regards
> 
> Mike
> 
> 
>> Jie Gan (4):
>>    coresight: tmc: Introduce new APIs to get the RWP offset of ETR buffer
>>    dt-bindings: arm: Add an interrupt property for Coresight CTCU
>>    coresight: ctcu: Enable byte-cntr for TMC ETR devices
>>    arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 +
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>>   drivers/hwtracing/coresight/Makefile          |   2 +-
>>   .../coresight/coresight-ctcu-byte-cntr.c      | 339 ++++++++++++++++++
>>   .../hwtracing/coresight/coresight-ctcu-core.c |  96 ++++-
>>   drivers/hwtracing/coresight/coresight-ctcu.h  |  59 ++-
>>   .../hwtracing/coresight/coresight-tmc-etr.c   |  45 ++-
>>   drivers/hwtracing/coresight/coresight-tmc.h   |   3 +
>>   8 files changed, 556 insertions(+), 10 deletions(-)
>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>>
>> --
>> 2.34.1
>>
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
