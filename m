Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A294FACBE4B
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Jun 2025 03:45:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 518DAC3F957;
	Tue,  3 Jun 2025 01:45:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7EA2C3F956
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 01:45:12 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJjxV011318;
 Tue, 3 Jun 2025 01:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6Xqu9lkHIewpjCH3cELwXUORKAaRLDtCLOS7g0pYfDw=; b=jL4bSMOp4nFPaJYZ
 CuX728rqZRIeCMqedOpND+3orO3A8NjrdJi00b4aE3c8M75QThb3hUN2TsjJN1yd
 KLu66I9MzMMY+j++9zJ7K2tKGdd28JuXRFz/FIky0cVvSH7rLXeyTRDzeEdMLPBg
 DvRqDT3lSHj/RrJ9DA96hHSIQPjd49a8Vizwt2zdL/vENKTBfnKxqreCUF2fJMHU
 pdWwUjHMuTxgrgMuUWNi37NqlbOnqeIM0CLb/KmMe+D0ZkP3gFC5LqPnEpFzYxKx
 ycaF05ChcHMGJJQsbbYCwFCUMeYAHu3xGkemvLKJF1QVQ8+VdF3qMhok7Jey15z3
 B3KHZQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q0yx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jun 2025 01:44:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5531isoo002660
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Jun 2025 01:44:54 GMT
Received: from [10.133.33.114] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Jun 2025
 18:44:48 -0700
Message-ID: <d06214d3-1044-4455-b5c2-f28e26fec696@quicinc.com>
Date: Tue, 3 Jun 2025 09:44:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
 <CAJ9a7VjzxnOGNbAM974ybRAD4eXxWhr8d+UC1rEG=yMtug2XRQ@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <CAJ9a7VjzxnOGNbAM974ybRAD4eXxWhr8d+UC1rEG=yMtug2XRQ@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: r8bnQuCnz8E9frW1Z08LDttD0ybLpSNX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAxMyBTYWx0ZWRfX8od2k+s+uRmU
 lBsZHQiTkjnKyrV0yv3hGg+YKiD4eMfZm75Wnz2IKAJf5lBKCtsYcrdaWs7AgaNQM/ulpg8pVgl
 GQggUW9XMMX5NuN/JymJnpCYqUneieTCq33uXap0vd97IFFSeQnoqB+Ije+5l+RJoq5r16R+lUE
 lNwPiHc+CA/WcYjf9QvYYD6DfBEiMoD+FdzDHluPg55dN5fOFEYfSqhzfAzO+EgoRTX+av0ZySa
 YtXF9RgMAltmmqw5IM1Wi1sXhth//gCuBoxLilaJpVENTNztwjFTiWkeNtIlRS4plIhkfy7b5BQ
 PtATs1HUvYNIYDYz7eBvI759lzAquNUT8CSF6rHdoWHkEseK1GVK6IzJKbwE+9ilNxsFGIt1PYx
 UTwIeVzvv4Ba1BsovOLz3xYamcWkBO3eMswdupaPHm/5+IaOaj29EqHcRzUs61lWseSSXKPd
X-Proofpoint-ORIG-GUID: r8bnQuCnz8E9frW1Z08LDttD0ybLpSNX
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=683e5397 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QPpktXn3PxhHdOavbSIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030013
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
Subject: Re: [Linux-stm32] [PATCH v2 0/5] coresight: ctcu: Enable byte-cntr
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



On 4/11/2025 6:16 PM, Mike Leach wrote:
> Hi,
> 
> I can see that this patchset has fixed some of the issues raised from
> v1 - using the existing file handle for read, and stopping the ETR to
> read the RWP.
> 
> However the fundamental problem that it is still attempting to read
> memory without stopping the ETR has not been addressed.
> 
> As mentioned in mine and Suzuki's comments for v1, this means:-
> 
> 1) you cannot guarantee that the buffer has not wrapped when reading
> data back, which will corrupt the trace decode process.
> 2) The DMA buffers are not being synchronized, so the PE could be
> reading stale data rather than the new data written by the ETR.
> 

Sorry for the late reply. I am trying to gather more detailed 
information about the byte-cntr register from our hardware team.

I have confirmed the behavior of the byte-cntr function:
The byte counter counts the number of bytes that are getting written 
into the ETR fifo & generates the interrupt once this matches the 
programmed value.

You are right, the byte-cntr cannot ensure safe reads from etr buffer 
while the ETR is running, so my previous solution will be deprecated.

I will consider another safe solution for byte-cntr.

Thanks,
Jie

> 
> Regards
> 
> Mike
> 
> On Thu, 10 Apr 2025 at 02:33, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> The byte-cntr function provided by the CTCU device is used to transfer data
>> from the ETR buffer to the userspace. An interrupt is tiggered if the data
>> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
>> handler counts the number of triggered interruptions and the read function
>> will read the data from the ETR buffer if the IRQ count is greater than 0.
>> The read work will be conducted ASAP after the byte-cntr is started.
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
>> The byte-cntr read work has integrated with the file node tmc_etr, e.g.
>> /dev/tmc_etr0
>> /dev/tmc_etr1
>>
>> There are two scenarios for the ETR file nodes with byte-cntr function:
>> 1. BYTECNTRVAL register has configured -> byte-cntr read
>> 2. BYTECNTRVAL register is disabled -> original behavior, flush the etr_buf
>>
>> We still can flush the etr buffer once after the byte-cntr function has
>> triggered.
>> 1. Enable byte-cntr
>> 2. Byte-cntr read
>> 3. Disable byte-cntr
>> 4. Flush etr buffer
>>
>> Since the ETR operates in circular buffer mode, we cannot fully guarantee
>> that no overwrites occur when the byte-cntr read function reads the data.
>> The read function will read the data ASAP when the interrupt is
>> triggered and we should not configure a threshold greater than the
>> buffer size of the ETR buffer.
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
>> Way to enable and start byte-cntr for ETR0:
>> echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
>> cat /dev/tmc_etr0
>>
>> Testing case has conducted for the byte-cntr read work:
>> 1. Setting the buffer_size of the ETR as large as possile, here is for ETR0
>>     echo 0x1000000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size
>> 2. Setting the threshold for the ETR0 to 0x10000
>>     echo 0x10000 > /sys/bus/coresight/devices/ctcu0/byte_cntr_val
>> 3. Enable ETR0
>>     echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>> 4. Enable ETM0 as source and enable byte-cntr to read data
>>     echo 1 > /sys/bus/coresight/devices/etm0/enable_source;
>>     cat /dev/tmc_etr0 > /tmp/file_byte_cntr.bin &
>> 5. Disable ETM0
>>     echo 0 > /sys/bus/coresight/devices/etm0/enable_source
>> 6. Disable byte-cntr and flush the etr buffer
>>     echo 0 > /sys/bus/coresight/devices/ctcu0/byte_cntr_val;
>>     cat /dev/tmc_etr0 > /tmp/file_etr0.bin
>>     ls -l /tmp
>>
>> -rw-r--r--    1 root     root      12628960 Apr 28 17:44 file_byte_cntr.bin
>> -rw-r--r--    1 root     root      12669296 Apr 28 17:45 file_etr0.bin
>>
>> 7. Deal with the file_etr0.bin with following command:
>>     dd if=/tmp/file_etr0.bin of=/tmp/file_etr0_aligned.bin bs=1
>> count=12628960 skip=40336
>>     ls -l /tmp
>>
>> -rw-r--r--    1 root     root      12628960 Apr 28 17:44 file_byte_cntr.bin
>> -rw-r--r--    1 root     root      12669296 Apr 28 17:45 file_etr0.bin
>> -rw-r--r--    1 root     root      12628960 Apr 28 17:49 file_etr0_aligned.bin
>>
>> 8. Compared file_byte_cntr.bin with file_etr0_aligned.bin and identified
>> they are competely same.
>>     diff file_byte_cntr.bin file_etr0_aligned.bin
>>
>> =======================
>> Changes in V2:
>> 1. Removed the independent file node /dev/byte_cntr.
>> 2. Integrated the byte-cntr's file operations with current ETR file
>>     node.
>> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
>> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
>> 5. Optimized the way to read the rwp_offset according to Mike's
>>     suggestion.
>> 6. Removed the dependency of the dts patch.
>> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
>>
>> Jie Gan (5):
>>    coresight: tmc: Introduce new APIs to get the RWP offset of ETR buffer
>>    dt-bindings: arm: Add an interrupt property for Coresight CTCU
>>    coresight: ctcu: Enable byte-cntr for TMC ETR devices
>>    coresight: tmc: add functions for byte-cntr operation
>>    arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 ++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>>   drivers/hwtracing/coresight/Makefile          |   2 +-
>>   .../coresight/coresight-ctcu-byte-cntr.c      | 119 ++++++++++++
>>   .../hwtracing/coresight/coresight-ctcu-core.c |  88 ++++++++-
>>   drivers/hwtracing/coresight/coresight-ctcu.h  |  49 ++++-
>>   .../hwtracing/coresight/coresight-tmc-core.c  |  29 ++-
>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 175 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc.h   |  10 +-
>>   9 files changed, 483 insertions(+), 11 deletions(-)
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
