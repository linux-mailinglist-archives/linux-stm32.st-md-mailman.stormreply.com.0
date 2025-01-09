Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71974A06EFA
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 08:22:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D5D2C78F67;
	Thu,  9 Jan 2025 07:22:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2791AC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 07:22:43 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094EcB0009352;
 Thu, 9 Jan 2025 07:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7CKaL8g4eDLcWrW1038ox+Dcmg17dqt214zJ9fG5cn8=; b=WKtFiXA3wPFs658b
 h8Fb0Vj74R6PnpVRRQmkIUhZaN99MCjpovJNzVOSeFymzN/fugR6FaEZ/cljRQuO
 T71CjTbhSOTHhEFVzjdZtkYj4Q4OUBdwDglxWDiwXYU9yjZOmFoADZn1pWt7UMbF
 0yN+6+XVY0wzFSmc5UpWwBeWEzr/ChoxJyBlS3OPViWfC713GLUzIqU2B9NvVFT3
 1zqxm9Eg6z1kUA0O9FORjgvaMMMQiyXwW/w+GnTy37GRh1azzuOWIEfHvNf8c5w/
 3wwgJ6a/HE2B6NpETq8/5Pw+Uzsg7rJKSweLuMyMAKN9xhSOMw1YJUcH4VyLYhtP
 F6MCEg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44278t8cb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 07:22:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5097MQ5h010784
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Jan 2025 07:22:26 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 23:22:21 -0800
Message-ID: <98c91cc6-e2d3-4376-9c8d-475ed3f1aa3b@quicinc.com>
Date: Thu, 9 Jan 2025 15:22:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fZAcj0oJrHwbSoysuR54z5ID_WWYq79E
X-Proofpoint-ORIG-GUID: fZAcj0oJrHwbSoysuR54z5ID_WWYq79E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090059
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jinlong Mao <quic_jinlmao@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, coresight@lists.linaro.org,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 0/5] Coresight: Add Coresight TMC
	Control Unit driver
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



On 12/26/2024 9:10 AM, Jie Gan wrote:
> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 

[...]

> 
> Changes in V8:
> 1. Rebased on tag next-20241220.
> 2. Use raw_spinlock_t instead of spinlock_t.
> 3. Remove redundant codes in CTCU driver:
>     - Eliminate unnecessary parameter validations.
>     - Correct log level when an error occurs.
>     - Optimize codes.
> 4. Correct the subject prefix for DT patch.
> 5. Collected reviewed-by tag from Konrad Dybcib for DT patch.
> Link to V7 - https://lore.kernel.org/all/20241210031545.3468561-1-quic_jiegan@quicinc.com/
> 

Kindly reminder.

Can you please help to review the patch series?

Thanks,
Jie

> Jie Gan (5):
>    Coresight: Add support for new APB clock name
>    Coresight: Add trace_id function to retrieving the trace ID
>    dt-bindings: arm: Add Coresight TMC Control Unit hardware
>    Coresight: Add Coresight TMC Control Unit driver
>    arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  84 ++++++
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 153 ++++++++++
>   drivers/hwtracing/coresight/Kconfig           |   8 +
>   drivers/hwtracing/coresight/Makefile          |   1 +
>   drivers/hwtracing/coresight/coresight-core.c  |  59 +++-
>   drivers/hwtracing/coresight/coresight-ctcu.c  | 273 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu.h  |  21 ++
>   drivers/hwtracing/coresight/coresight-etb10.c |   3 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  |  37 ++-
>   .../coresight/coresight-etm3x-core.c          |  30 ++
>   .../coresight/coresight-etm4x-core.c          |  29 ++
>   drivers/hwtracing/coresight/coresight-priv.h  |  13 +-
>   drivers/hwtracing/coresight/coresight-stm.c   |  22 ++
>   drivers/hwtracing/coresight/coresight-sysfs.c |  24 +-
>   .../hwtracing/coresight/coresight-tmc-etf.c   |   3 +-
>   .../hwtracing/coresight/coresight-tmc-etr.c   |   6 +-
>   drivers/hwtracing/coresight/coresight-tpda.c  |  20 ++
>   drivers/hwtracing/coresight/coresight-trbe.c  |   4 +-
>   drivers/hwtracing/coresight/ultrasoc-smb.c    |   3 +-
>   include/linux/coresight.h                     |  16 +-
>   20 files changed, 781 insertions(+), 28 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
