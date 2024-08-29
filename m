Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 231C99637A2
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 03:23:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C02FAC6C855;
	Thu, 29 Aug 2024 01:23:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08C50C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 01:23:22 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJLu9w002739;
 Thu, 29 Aug 2024 01:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bLjNkGKfGj31Adt8TVVTYz5W
 HZ4ehvtEMig1+mnI9GQ=; b=Fy1jxqixKrlfZQ60pDWGHchorDTBRtw5s84dUJF1
 v7fgy7hBjOXD9mbWVWyKnfUPAmbsYqa4r9pbUJP+uVhdPJ0KnB9Nt4l/e++Rko/n
 kHixNAwtn/dUtt5URt0HLfh5BSOxFCR0jiyDC7aE27sosGF9sEwO5OFK4zgRRdv2
 NHTtOC+UvG/+ZLb/b51y3okAHjoSX6AVQmG4iI+hwVdQvi1ohD8zq1ZE+bNPOQu9
 hYcvUMicJY1Co6qv05vgxtyssNYPiUkaloKxCnQZATLBbc/WTSCOLLPsHnGaKe/8
 EjY/HSLdScfLXnr0UFsYk+vi4IQpAYm2S1VmOQTYlUPPGA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putujg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 01:23:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47T1N20D010087
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 01:23:02 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 18:22:56 -0700
Date: Thu, 29 Aug 2024 09:22:52 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <Zs/NbGOzRII0LJNU@jiegan-gv.ap.qualcomm.com>
References: <20240828012706.543605-1-quic_jiegan@quicinc.com>
 <20240828012706.543605-4-quic_jiegan@quicinc.com>
 <20240828151205.GA3830921-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240828151205.GA3830921-robh@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: D4C0V4ke46dMwbAUNV4rApxcOX-kJj4m
X-Proofpoint-GUID: D4C0V4ke46dMwbAUNV4rApxcOX-kJj4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_10,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1011 mlxscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290009
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 James Clark <james.clark@linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Song Chai <quic_songchai@quicinc.com>, Tao
 Zhang <quic_taozha@quicinc.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v4 3/5] dt-bindings: arm: Add Coresight
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

On Wed, Aug 28, 2024 at 10:12:05AM -0500, Rob Herring wrote:
> On Wed, Aug 28, 2024 at 09:27:04AM +0800, Jie Gan wrote:
> > Add binding file to specify how to define a Coresight TMC
> > Control Unit device in device tree.
> > 
> > It is responsible for controlling the data filter function
> > based on the source device's Trace ID for TMC ETR device.
> > The trace data with that Trace id can get into ETR's buffer
> > while other trace data gets ignored.
> > 
> > Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> > ---
> >  .../bindings/arm/qcom,coresight-ctcu.yaml     | 84 +++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> > new file mode 100644
> > index 000000000000..669aac646451
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> > @@ -0,0 +1,84 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: CoreSight TMC Control Unit
> > +
> > +maintainers:
> > +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> > +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> > +  - Jie Gan <quic_jiegan@quicinc.com>
> > +
> > +description:
> 
> You need '>' or '|' if you want to preserve paragraphs.

Sorry for the mistake, I did not observe it by self-checking.
I will add it in next version.

description: -> description: |

> 
> > +  The Trace Memory Controller(TMC) is used for Embedded Trace Buffer(ETB),
> > +  Embedded Trace FIFO(ETF) and Embedded Trace Router(ETR) configurations.
> > +  The configuration mode (ETB, ETF, ETR) is discovered at boot time when
> > +  the device is probed.
> > +
> > +  The Coresight TMC Control unit controls various Coresight behaviors.
> > +  It works as a helper device when connected to TMC ETR device.
> > +  It is responsible for controlling the data filter function based on
> > +  the source device's Trace ID for TMC ETR device. The trace data with
> > +  that Trace id can get into ETR's buffer while other trace data gets
> > +  ignored.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,sa8775p-ctcu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +
> > +  in-ports:
> 
> Just "ports". "in-ports" is for the case when you have "out-ports".

We had a discusstion about why use "in-ports" in v3.
https://lore.kernel.org/linux-arm-kernel/4b51d5a9-3706-4630-83c1-01b01354d9a4@arm.com/

The individual driver must "fix" before use "ports". The question is do we need to fix
the logic of the individual driver before submit this patch?

> > > -- 
> > 2.34.1
> > 

Thanks,
Jie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
