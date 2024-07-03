Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B94709256A9
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 11:25:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71C7BC71280;
	Wed,  3 Jul 2024 09:25:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55BF9C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 09:25:14 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4635J5OC023311;
 Wed, 3 Jul 2024 09:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NhWuFqAPuEIZttAM2h+ngzLqj84AMotQeV7cBgLDekI=; b=Oe2cRC9oUcmZXNcW
 hM3w/0u5nLB0Cx5k+dKOSTo08Bic13lHg4TYTCcdLxKFEKRi/0rsrn94Fv9iOUEt
 QfGED7rITsH1a5n9umtbWCS2jiC/JnQQvm5LbiK0tAmrOx/oAMoX6xYDOINMy0yg
 axaSv6uQvKmFIprMlyD0JQq5RC5kaFDxGiI4W/f12i6EakqOh1K6N392FGzTuTwH
 IIdppbm37Qm6/0eUlRTEsjn8ZqW2SHKz7E6D7/IeAecYk7jfzVUcSonLFvi7IImV
 MJNvKIzVl3hvD9D674f9Be5xEGzMh1Uqp10dnBgethkZ9qm5oh7h6AygfaPmgXWE
 +9RWTg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4050cy8k8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 09:23:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4639NV8c020645
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 09:23:31 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 02:23:10 -0700
Message-ID: <bc135b67-a2e4-4b17-96c0-767bcb94d876@quicinc.com>
Date: Wed, 3 Jul 2024 17:23:08 +0800
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
 <20240703025850.2172008-3-quic_tengfan@quicinc.com>
 <8593db2e-8a69-418f-b00e-8fafe434dd30@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <8593db2e-8a69-418f-b00e-8fafe434dd30@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jA8I-qqzAQ-FOzamwuZ3_GO9PajOhc6b
X-Proofpoint-ORIG-GUID: jA8I-qqzAQ-FOzamwuZ3_GO9PajOhc6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_05,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxlogscore=901 priorityscore=1501 adultscore=0 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407030069
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
Subject: Re: [Linux-stm32] [PATCH 02/47] arm64: dts: qcom: qcs9100:
 Introduce QCS9100 SoC dtsi
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



On 7/3/2024 12:40 PM, Krzysztof Kozlowski wrote:
> On 03/07/2024 04:58, Tengfei Fan wrote:
>> Introduce QCS9100 SoC dtsi, QCS9100 is mainly used in IoT products.
>> QCS9100 is drived from SA8775p.
>> The current QCS9100 SoC dtsi is directly renamed from the SA8775p SoC
>> dtsi.
>> The QCS9100 platform is currently in the early design stage. Currently,
>> Both the QCS9100 platform and SA8775p platform use non-SCMI resources,
>> In the future, the SA8775p platform will transition to using SCMI
>> resources and it will have new sa8775p-related device tree.
>> This QCS9100 SoC dtsi remains consistent with the current SA8775p SoC
>> dtsi, except for updating the following sa8775p-related compatible names
>> to the qcs9100-related compatible name:
>>    - qcom,sa8775p-clk-virt
>>    - qcom,sa8775p-mc-virt
>>    - qcom,sa8775p-adsp-pas
>>    - qcom,sa8775p-cdsp-pas
>>    - qcom,sa8775p-cdsp1-pas
>>    - qcom,sa8775p-gpdsp0-pas
>>    - qcom,sa8775p-gpdsp1-pas
>>    - qcom,sa8775p-gcc
>>    - qcom,sa8775p-ipcc
>>    - qcom,sa8775p-config-noc
>>    - qcom,sa8775p-system-noc
>>    - qcom,sa8775p-aggre1-noc
>>    - qcom,sa8775p-aggre2-noc
>>    - qcom,sa8775p-pcie-anoc
>>    - qcom,sa8775p-gpdsp-anoc
>>    - qcom,sa8775p-mmss-noc
>>    - qcom,sa8775p-trng
>>    - qcom,sa8775p-ufshc
>>    - qcom,sa8775p-qmp-ufs-phy
>>    - qcom,sa8775p-qce
>>    - qcom,sa8775p-lpass-ag-noc
>>    - qcom,sa8775p-usb-hs-phy
>>    - qcom,sa8775p-dc-noc
>>    - qcom,sa8775p-gem-noc
>>    - qcom,sa8775p-dwc3
>>    - qcom,sa8775p-qmp-usb3-uni-phy
>>    - qcom,sa8775p-gpucc
>>    - qcom,sa8775p-smmu-500
>>    - qcom,sa8775p-dwmac-sgmii-phy
>>    - qcom,sa8775p-llcc-bwmon
>>    - qcom,sa8775p-cpu-bwmon
>>    - qcom,sa8775p-llcc
>>    - qcom,sa8775p-videocc
>>    - qcom,sa8775p-camcc
>>    - qcom,sa8775p-dispcc0
>>    - qcom,sa8775p-pdc
>>    - qcom,sa8775p-aoss-qmp
>>    - qcom,sa8775p-tlmm
>>    - qcom,sa8775p-imem
>>    - qcom,sa8775p-smmu-500
>>    - qcom,sa8775p-rpmh-clk
>>    - qcom,sa8775p-rpmhpd
>>    - qcom,sa8775p-cpufreq-epss
>>    - qcom,sa8775p-dispcc1
>>    - qcom,sa8775p-ethqos
>>    - qcom,sa8775p-nspa-noc
>>    - qcom,sa8775p-nspb-noc
>>    - qcom,sa8775p-qmp-gen4x2-pcie-phy
>>    - qcom,sa8775p-qmp-gen4x4-pcie-phy
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   .../dts/qcom/{sa8775p.dtsi => qcs9100.dtsi}   | 112 +++++++++---------
>>   1 file changed, 56 insertions(+), 56 deletions(-)
>>   rename arch/arm64/boot/dts/qcom/{sa8775p.dtsi => qcs9100.dtsi} (97%)
>>
> 
> How do any things compile at this point? Please squash the patches. Your
> patchset must be bisectable at build level (dtschema validation does not
> have to).
> 
> Best regards,
> Krzysztof
> 

The compilation issue indeed arises when applying only this single 
patch. In the new version patch series, I plan to consolidate the three 
patches that rename sa8775p.dtsi to qcs9100.dtsi, sa8775p-pmics.dtsi to 
qcs9100-pmics.dtsi, and sa87750-ride.dts to qcs9100-ride.dts into a 
single patch.

-- 
Thx and BRs,
Tengfei Fan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
