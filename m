Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B37A192568E
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 11:22:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3797CC71280;
	Wed,  3 Jul 2024 09:22:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F43DC6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 09:22:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4638D1LB027444;
 Wed, 3 Jul 2024 09:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zFayjh+1qzFNX/L8mf2pY/rdIsRlH8uG2GflD4xHDhY=; b=GP9s9iCjwlhtGabK
 ji04H6MUw3QZ2THnZ8MnZmsgkMmwwt1SFfnCMHhSJWVMSNLsHGqj1sbicP/Y0wy+
 Tlvx86VUUKy+J+eHegc+RNHmJGPmisqYFhLqQigoyoHHTk57KJo2whllN1BY7LJh
 CvCvkmrHqU+7lrISb+5hEqoYIqIdyWVy+dFXq5SgFzT2fQh5Vg2HiiKkBvdTDuMH
 uKDXIK+4+MRDGK1o20TcWBR1bhgJUWxcml1xHGD0q/F+wRpstDBvTfyzHvL7aisU
 bFVa9apUSGJ5qm1MRVyAXMxadQT4eHVx3BF8wOG5lo/gmeWRxFXsh8ATVQZJHcG4
 yqnVZw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027mnrp2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 09:21:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4639LXCm013350
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 09:21:33 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 02:21:11 -0700
Message-ID: <fbeb5969-0b3a-455e-88eb-b83734bf2c50@quicinc.com>
Date: Wed, 3 Jul 2024 17:21:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
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
 <20240703025850.2172008-2-quic_tengfan@quicinc.com>
 <665f6c8c-4f43-4d20-90e9-9e037a942066@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <665f6c8c-4f43-4d20-90e9-9e037a942066@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 5Ybf8r0PXG_XS31lxeN4m5yOCkbBXD5_
X-Proofpoint-GUID: 5Ybf8r0PXG_XS31lxeN4m5yOCkbBXD5_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_05,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030069
Cc: joabreu@synopsys.com, ulf.hansson@linaro.org, quic_kaushalk@quicinc.com,
 kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org,
 alim.akhtar@samsung.com, quic_rjendra@quicinc.com, otto.pflueger@abscue.de,
 linux-riscv@lists.infradead.org, quic_tsoni@quicinc.com,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org, kishon@kernel.org,
 quic_sibis@quicinc.com, kernel@quicinc.com, quic_bjorande@quicinc.com,
 bvanassche@acm.org, linux-scsi@vger.kernel.org, bartosz.golaszewski@linaro.org,
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
 krzysztof.kozlowski@linaro.org, quic_tdas@quicinc.com, mantas@8devices.com,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmitry.baryshkov@linaro.org, abel.vesa@linaro.org, robin.murphy@arm.com,
 quic_aiquny@quicinc.com, lukasz.luba@arm.com
Subject: Re: [Linux-stm32] [PATCH 01/47] dt-bindings: arm: qcom: Document
 QCS9100 SoC and RIDE board
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



On 7/3/2024 12:38 PM, Krzysztof Kozlowski wrote:
> On 03/07/2024 04:58, Tengfei Fan wrote:
>> Document the QCS9100 SoC and RIDE board.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ec1c10a12470..f06543f96026 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -45,6 +45,7 @@ description: |
>>           qcs8550
>>           qcm2290
>>           qcm6490
>> +        qcs9100
>>           qdu1000
>>           qrb2210
>>           qrb4210
>> @@ -894,7 +895,9 @@ properties:
>>   
>>         - items:
>>             - enum:
>> +              - qcom,qcs9100-ride
>>                 - qcom,sa8775p-ride
>> +          - const: qcom,qcs9100
> 
> This changes existing compatible for sa8775p without any explanation in
> commit msg.
> 
> Best regards,
> Krzysztof
> 

In the next verion patch series, I will provide relevant explanatory 
information in this patch commit message.

-- 
Thx and BRs,
Tengfei Fan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
