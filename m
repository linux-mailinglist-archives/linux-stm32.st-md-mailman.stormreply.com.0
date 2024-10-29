Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9719B409B
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 03:45:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C25BC78023;
	Tue, 29 Oct 2024 02:45:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22E83C78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 02:45:51 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SJTR74028698;
 Tue, 29 Oct 2024 02:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9iaOY4VG65QMG8PRCx1ATtiN3Adp53NdMTM2RfHDf2M=; b=UC5tjaALk/N+9crS
 e9B5iV/6WaYAvl55yXr9ErgB/NrGp7E0tFifml7E6s4oi9JD1kmAWt3o2hc6QDXf
 5RqN7O2cgGM4+IRhMiOwXcH7+OKbTbqksBm00G0j09Dsz0M0WhJBxgNXepojg6j0
 NI24//5am+tcDtKR6KdAWO11DP/LcArSDo/fNbia1mO2oGfS76Kk9byl4iLDR0yI
 Dutb1YHINoXtEFvz0yuE88taqY4+Q2Biljd0Y2B7ja50CXxrUvqH6NVGz7gHhrPT
 hTa2qByIu/yqzYyJuybgz6azynCQNOCtclKvxsy01snfrr/Y6vBCjgLTOiRuhjEx
 CZ+SHg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gsq8exnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 02:45:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T2jWxT026906
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 02:45:32 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 19:45:26 -0700
Message-ID: <a1400acb-e9e9-4233-8c0c-573be3e3370d@quicinc.com>
Date: Tue, 29 Oct 2024 10:45:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20241009112503.1851585-1-quic_jiegan@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241009112503.1851585-1-quic_jiegan@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cfX0vtSWIY70l6YS3EqTq8FbRAvJm3jm
X-Proofpoint-ORIG-GUID: cfX0vtSWIY70l6YS3EqTq8FbRAvJm3jm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=991 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290020
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Jinlong Mao \(QUIC\)" <quic_jinlmao@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "Sam Chai \(QUIC\)" <quic_songchai@quicinc.com>,
 "Tao Zhang \(QUIC\)" <quic_taozha@quicinc.com>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
 "Yuanfang Zhang \(QUIC\)" <quic_yuanfang@quicinc.com>,
 "Tingwei Zhang \(QUIC\)" <quic_tingweiz@quicinc.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v6 0/5] Coresight: Add Coresight TMC
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



On 10/9/2024 7:24 PM, Jie Gan wrote:
> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 
> The CTCU device works as a helper device physically connected to the TMC ETR device.
> ---------------------------------------------------------
>               |ETR0|             |ETR1|
>                . \                 / .
>                .  \               /  .
>                .   \             /   .
>                .    \           /    .
> ---------------------------------------------------
> ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
> ---------------------------------------------------
> Each ETR has four ATID registers with 128 bits long in total.
> e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.
> 
> Based on the trace id which is programed in CTCU ATID register of
> specific ETR, trace data with that trace id can get into ETR's buffer
> while other trace data gets ignored. The number of CTCU ATID registers
> depends on the number of defined TMC ETR devices. For example, two TMC
> ETR devices need eight ATID registers. ETR0 with ETR0ATID0-ETR0ATID3
> and ETR1 with ETR1ATID0-ETRATID3.
> 
> The significant challenge in enabling the data filter function is how
> to collect the trace ID of the source device. The introduction of
> trace_id callback function addresses this challenge. The callback function
> collects trace ID of the device and return it back. The trace ID will be
> stored in the structure called cs_sink_data and transmitted to helper
> and sink devices.
> 
> The cs_sink_data structure is created to address how to transmit
> parameters needs by coresight_enable_path/coresight_disbale_path
> functions.
> 
> Here is an example of the struct cs_sink_data:
> struct cs_sink_data {
>          struct perf_output_handle  *handle; //used by perf mode
>          struct coresight_device    *sink;   //used to retrieve atid_offset
>          u32                        traceid; //traceid needed by CTCU
> };
> 
> The atid_offset mentioned before is the offset to ATID register in CTCU
> device.
> 
> Enabling the source device will configure one bit in the ATID register based
> on its trace ID.
> Disabling the source devices will reset the bit in the AITD register
> based on its trace ID.
> 
[...]

Kindly remainder, Please help to review the patch series.

Thanks,
Jie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
