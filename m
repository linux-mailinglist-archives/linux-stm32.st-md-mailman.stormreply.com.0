Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6655195677D
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 11:50:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 167E2C6DD9D;
	Mon, 19 Aug 2024 09:50:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32C1AC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 09:50:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47IMoN9B014094;
 Mon, 19 Aug 2024 09:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Q+aVDdwN+dlBquGxxcNivPwQ
 hl8XLtepuoo/AhFgmF4=; b=jUc3t0yzqDq2a/Hyq0WkAaUjgL20kZYihloGgglg
 Hv552kjK1jGD/pmTCNqS8By7stoFNAMwIM3LoPKc5GMPnIIUwqV54NKagvO4S8TQ
 CtMJtxB59obIlURm54EAzUxHAvieGfYvClkIK1NWOxJvUc8khlYQQ8aMypWysutL
 rlR30r0CFO2UAEV280W3xzn1OpWFODXexuoy0If1UhmufNSPSiKupadgSPy3It2i
 E6y4O7MslifoCZcOwVvAX6LfprWL5wNUZc/SxJMTFjfyH/HDG2KPr+BB2TmGeZgt
 5rxqr/uyz0/o5wfogAy3Cc0I1DZiz+DqSxyqYHuEzLNumQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412n1jujdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2024 09:50:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J9oYFS032344
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2024 09:50:34 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 02:50:28 -0700
Date: Mon, 19 Aug 2024 17:50:24 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <ZsMVYBR3hx3moZnV@jiegan-gv.ap.qualcomm.com>
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
 <20240812024141.2867655-4-quic_jiegan@quicinc.com>
 <e087b788-4002-4d12-bd8f-a40fc814856a@kernel.org>
 <ZsMLIRoDMmbH7vM0@jiegan-gv.ap.qualcomm.com>
 <6b5ae88d-ddcc-4927-8bc7-132c0b23a3e7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b5ae88d-ddcc-4927-8bc7-132c0b23a3e7@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: W0gQFbB9gDLCQDkcWpiuu-ytqVP7h6lt
X-Proofpoint-GUID: W0gQFbB9gDLCQDkcWpiuu-ytqVP7h6lt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_08,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=728 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190066
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Song Chai <quic_songchai@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-kernel@lists.infradead.org,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-msm@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Tao Zhang <quic_taozha@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>
Subject: Re: [Linux-stm32] [PATCH v3 3/5] dt-bindings: arm: Add Coresight
 TMC Control Unit hardware
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

On Mon, Aug 19, 2024 at 11:41:59AM +0200, Krzysztof Kozlowski wrote:
> On 19/08/2024 11:06, JieGan wrote:
> > On Mon, Aug 19, 2024 at 08:26:19AM +0200, Krzysztof Kozlowski wrote:
> >> On 12/08/2024 04:41, Jie Gan wrote:
> >>> +
> >>> +maintainers:
> >>> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> >>> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> >>> +  - Jie Gan <quic_jiegan@quicinc.com>
> >>> +
> >>> +description:
> >>> +  The Coresight TMC Control unit controls various Coresight behaviors.
> >>> +  It works as a helper device when connected to TMC ETR device.
> >>> +  It is responsible for controlling the data filter function based on
> >>> +  the source device's Trace ID for TMC ETR device. The trace data with
> >>> +  that Trace id can get into ETR's buffer while other trace data gets
> >>> +  ignored.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - qcom,sa8775p-ctcu
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: apb
> >>> +
> >>> +  in-ports:
> >>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>> +
> >>> +    patternProperties:
> >>> +      '^port(@[0-7])?$':
> >>
> >> I see only two ports in the example. How many are there in reality?
> > Existing projects can have a maximum of two ports. I used the range 0-7 as I consider
> > it unlikely to have more than 8 ports. Maybe it's intended as a large buffer for
> > futher design needs.
> 
> Please do not create buffers in the bindings. This must be specific, so [01]

Got it. I will update it to '^port(@[0-1])?$' in next version.

> 
> 

Thanks,
Jie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
