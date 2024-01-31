Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE8E8438FC
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 09:27:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D533AC6C841;
	Wed, 31 Jan 2024 08:27:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39D0EC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 08:27:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40V76sWG029058; Wed, 31 Jan 2024 08:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=tYl3s9p
 5OEXscwNJG7uavE127SKilayG8iPqXxCe7J8=; b=bSz6ItBvDwSjImIX4XsrWzR
 R8KShudwp38LAKxVNx1rHyudHgMKzVBQFsVFuYC/ELgdcCelfYh+JAxcgLLHYUXk
 f787NNero5aIzZwUXCCljJimxiLZfEeq7O87wAeYkcGKjSPGWXqNKpIFHCtzgjKy
 trxNtTqA/aj3/g/H32I/U0CaC9OLuujK6MopMdh5xYjqj0PIis1pFkDsXZuRMcdY
 dx0E1b6ggjvkm5hFhLTynrRG15pan0nD10xohbXDjaX4lRjyoX6sUepCiRndYx9q
 1PINXuPRlWDOhUW5d0AufID5aLq8GhirX5UuXsZsS2yRo9/c8sHCPdKD6zUHSOA=
 =
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vy9b8saew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Jan 2024 08:26:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40V8QeQM025364
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Jan 2024 08:26:40 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 31 Jan 2024 00:26:39 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Leo Yan
 <leo.yan@linaro.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>
Date: Wed, 31 Jan 2024 00:26:24 -0800
Message-ID: <20240131082628.6288-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7IEwbEnrFHWUphbr28oJoRi62uk0ZeO9
X-Proofpoint-ORIG-GUID: 7IEwbEnrFHWUphbr28oJoRi62uk0ZeO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_03,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1011 spamscore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310063
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mao Jinlong <quic_jinlmao@quicinc.com>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>, linux-kernel@vger.kernel.org,
 Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/2] coresight: core: Add device name
	support
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

With current design, the name of the non-cpu bounded coresight
component is the device type with the number. And with 'ls' command
we can get the register address of the component. But from these
information, we can't know what the HW or system the component belongs
to. Add device-name in DT to support it.

cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
tpdm0 -> ../../../devices/platform/soc@0/10b0d000.tpdm/tpdm0
tpdm1 -> ../../../devices/platform/soc@0/10c28000.tpdm/tpdm1
tpdm2 -> ../../../devices/platform/soc@0/10c29000.tpdm/tpdm2

Change since V2:
1. Fix the error in coresight core.
drivers/hwtracing/coresight/coresight-core.c:1775:7: error: assigning to 'char *' from 'const char *' discards qualifiers

2. Fix the warning when run dtbinding check.
Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml: device-name: missing type definition

Change since V1:
1. Change coresight-name to device name.
2. Add the device-name in coresight dt bindings.


Mao Jinlong (2):
  coresight: core: Add device name support
  dt-bindings: arm: Add device-name in the coresight components

 .../bindings/arm/arm,coresight-catu.yaml      |  6 +++
 .../bindings/arm/arm,coresight-cpu-debug.yaml |  6 +++
 .../bindings/arm/arm,coresight-cti.yaml       |  6 +++
 .../arm/arm,coresight-dummy-sink.yaml         |  6 +++
 .../arm/arm,coresight-dummy-source.yaml       |  6 +++
 .../arm/arm,coresight-dynamic-funnel.yaml     |  6 +++
 .../arm/arm,coresight-dynamic-replicator.yaml |  6 +++
 .../bindings/arm/arm,coresight-etb10.yaml     |  6 +++
 .../bindings/arm/arm,coresight-etm.yaml       |  6 +++
 .../arm/arm,coresight-static-funnel.yaml      |  6 +++
 .../arm/arm,coresight-static-replicator.yaml  |  6 +++
 .../bindings/arm/arm,coresight-stm.yaml       |  6 +++
 .../bindings/arm/arm,coresight-tmc.yaml       |  6 +++
 .../bindings/arm/arm,coresight-tpiu.yaml      |  6 +++
 .../bindings/arm/qcom,coresight-tpda.yaml     |  6 +++
 .../bindings/arm/qcom,coresight-tpdm.yaml     |  6 +++
 drivers/hwtracing/coresight/coresight-core.c  | 37 ++++++++++---------
 .../hwtracing/coresight/coresight-platform.c  | 31 ++++++++++++++++
 include/linux/coresight.h                     |  3 +-
 19 files changed, 149 insertions(+), 18 deletions(-)

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
