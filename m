Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 718199257C1
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 12:05:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CA5EC71280;
	Wed,  3 Jul 2024 10:05:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40ACBC6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 10:05:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4632V6vL028807;
 Wed, 3 Jul 2024 10:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MTYyEqDPQFUg534+DSkldx2EQ4hiUNnVI33QmvBczZk=; b=LO3g+rXTgZGcl6je
 Rl00DBC52bV/FNAWASeog2Cru0JsaypLW3GIlbDU7M6yXixixBpgsVS2g2s6hP2o
 gOg3MVIiGXxM6foWGxKOVE1pNpCDabVLLy7ME1un5mROUZvVVAUGSvRzFcJpYuV7
 pjwKBkQRG3eBpSiiMK1gx+osblIsz7gUs0nknVyMDFSjRtQBFO17oJABopAwn4KR
 6MqqXHYgtie84G7tLEvErF4Hcb/C+bXioNXyzOE51JB/+SvPv8DkEyF37FC5fBac
 mxeUAbIeHw5CyFdS7RkAl0DOQkQVXfm5ynLxaZlU05YfyJ41Z0MTSCICSG3KUucn
 FjDZgQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404kctjq2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 10:04:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 463A4a3Q012329
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 10:04:36 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 03:04:14 -0700
Message-ID: <312b699d-1ca4-4a58-877b-af9d91132724@quicinc.com>
Date: Wed, 3 Jul 2024 18:04:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <quic_tdas@quicinc.com>, <andersson@kernel.org>,
 <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <djakov@kernel.org>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <jassisinghbrar@gmail.com>,
 <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
 <manivannan.sadhasivam@linaro.org>, <will@kernel.org>,
 <joro@8bytes.org>, <conor@kernel.org>, <tglx@linutronix.de>,
 <amitk@kernel.org>, <thara.gopinath@gmail.com>,
 <linus.walleij@linaro.org>, <wim@linux-watchdog.org>,
 <linux@roeck-us.net>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
 <vkoul@kernel.org>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703035154.2182083-1-quic_tengfan@quicinc.com>
 <20240703035154.2182083-12-quic_tengfan@quicinc.com>
 <e08b4798-b1fe-4e8a-80a4-716696dfdcd6@quicinc.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <e08b4798-b1fe-4e8a-80a4-716696dfdcd6@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: tMRDhs9g2i136rzis9EqfAfQCqfDYtjd
X-Proofpoint-ORIG-GUID: tMRDhs9g2i136rzis9EqfAfQCqfDYtjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_06,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=771 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030074
Cc: joabreu@synopsys.com, ulf.hansson@linaro.org, quic_kaushalk@quicinc.com,
 kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org,
 alim.akhtar@samsung.com, quic_rjendra@quicinc.com, otto.pflueger@abscue.de,
 quic_tsoni@quicinc.com, linux-clk@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kishon@kernel.org, quic_sibis@quicinc.com,
 kernel@quicinc.com, quic_bjorande@quicinc.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, bartosz.golaszewski@linaro.org,
 quic_tingweiz@quicinc.com, daniel.lezcano@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, luca@z3ntu.xyz,
 iommu@lists.linux.dev, agross@kernel.org, danila@jiaxyga.com,
 u.kleine-koenig@pengutronix.de, rui.zhang@intel.com, ahalaney@redhat.com,
 quic_rgottimu@quicinc.com, bhupesh.sharma@linaro.org,
 quic_devipriy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_nitirawa@quicinc.com, athierry@redhat.com, avri.altman@wdc.com,
 robimarko@gmail.com, bhelgaas@google.com, peppe.cavallaro@st.com,
 quic_cang@quicinc.com, quic_shashim@quicinc.com,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 quic_kbajaj@quicinc.com, linux-gpio@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_msarkar@quicinc.com, quic_wcheng@quicinc.com,
 krzysztof.kozlowski@linaro.org, mantas@8devices.com,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmitry.baryshkov@linaro.org, abel.vesa@linaro.org, robin.murphy@arm.com,
 quic_aiquny@quicinc.com, lukasz.luba@arm.com
Subject: Re: [Linux-stm32] [PATCH 41/47] clk: qcom: rpmh: Add support for
 QCS9100 rpmh clocks
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



On 7/3/2024 1:33 PM, Taniya Das wrote:
> 
> 
> On 7/3/2024 9:21 AM, Tengfei Fan wrote:
>> { .compatible = "qcom,qcs9100-rpmh-clk", .data = &clk_rpmh_sa8775p},
> 
> This is not required, we already have sa8775p bindings.

This patch is necessary, and the cover letter provides detailed 
explanations for why we are making this change.

In this patch series, we are renaming sa8775p.dtsi to qcs9100.dtsi. 
Additionally, in the coming weeks, the auto team will submit a new 
sa8775p-related dtsi to upstream.

Within qcs9100.dtsi, we are updating all compatible names from sa8775p-* 
to qcs9100-*(only have qcs9100-*, remove all sa8775p-*). Consequently, 
we need to add support for qcs9100-* in the driver as well.


-- 
Thx and BRs,
Tengfei Fan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
