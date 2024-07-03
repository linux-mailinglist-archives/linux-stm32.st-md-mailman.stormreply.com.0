Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AAD9256B4
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 11:25:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87C36C71280;
	Wed,  3 Jul 2024 09:25:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1F14C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 09:25:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4637OU4R003862;
 Wed, 3 Jul 2024 09:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ejzttzK64DsVwhu9fW5iFUwBdmhQXcGVqYJFfm7aIMQ=; b=lbbWWjueKNvpEWjA
 RAA5DftQD3q0+U6ZgGao7lzjhJRSMcYSaEOsweno5jTAQvs4hpHbzUb7ctdrxz5X
 Dd3GhhNQ3C0WLrFdsZmVo2ga1Tc5BMOi585odphd3MSApS2fx0DqwGFEiktRzoQX
 mc65K3bS8okVJ0QdKNSaRBDFOMXsQ1NCttFYR1Lw53jP+BfLWBoUMxmKw8Q5faee
 CREPgsKN4yEK6QBPotgtPcUH4TUQjPl6mGpwugG4wDKTJ6FJhtJGvZHR1bbT/Tcx
 5YGBPKV5k7NavnZA48gOL0Bgsxg+VfA8Ul/GgA8hPt4OrM2lwborKxVQXN3VgN8U
 mmC8Sg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027yfbbtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 09:25:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4639P0HE027548
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 09:25:00 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 02:24:38 -0700
Message-ID: <d81740ba-0b15-4f9f-be75-9958ed9f032c@quicinc.com>
Date: Wed, 3 Jul 2024 17:24:36 +0800
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
 <20240703025850.2172008-5-quic_tengfan@quicinc.com>
 <9b739f4a-c9e1-4d2a-9bec-83106dcf8868@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <9b739f4a-c9e1-4d2a-9bec-83106dcf8868@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fpiIBsiH_E6Bhr5OJ8BTnX5KfJw6CL5q
X-Proofpoint-ORIG-GUID: fpiIBsiH_E6Bhr5OJ8BTnX5KfJw6CL5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_05,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
Subject: Re: [Linux-stm32] [PATCH 04/47] arm64: dts: qcom: qcs9100: Add
 QCS9100 RIDE board dts
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



On 7/3/2024 12:39 PM, Krzysztof Kozlowski wrote:
> On 03/07/2024 04:58, Tengfei Fan wrote:
>> Add support for the QCS9100 RIDE board dts. The current QCS9100 RIDE
>> board dts is directly renamed from the SA8775p RIDE board dts.
>> The difference between the current QCS9100 RIDE board and the SA8775p
>> RIDE board lies solely in the replacement of the SA8775p SoC with the
>> QCS9100 SoC, all other board resources remain the same.
>> The following items have been updated:
>>    - use QCS9100-related compatible names for this board dts.
>>    - replace the inclusion of sa8775p.dtsi with qcs9100.dtsi.
>>    - replace the inclusion of sa8775p-pmics.dtsi with qcs9100-pmics.dtsi
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                         | 2 +-
>>   .../boot/dts/qcom/{sa8775p-ride.dts => qcs9100-ride.dts}  | 8 ++++----
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>   rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dts => qcs9100-ride.dts} (99%)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 5576c7d6ea06..a7a3792b0691 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -103,6 +103,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
>> @@ -112,7 +113,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
>> -dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
>> similarity index 99%
>> rename from arch/arm64/boot/dts/qcom/sa8775p-ride.dts
>> rename to arch/arm64/boot/dts/qcom/qcs9100-ride.dts
>> index 26ad05bd3b3f..2415d34b8aa5 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
>> @@ -8,12 +8,12 @@
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>   
>> -#include "sa8775p.dtsi"
>> -#include "sa8775p-pmics.dtsi"
>> +#include "qcs9100.dtsi"
>> +#include "qcs9100-pmics.dtsi"
>>   
>>   / {
>> -	model = "Qualcomm SA8775P Ride";
>> -	compatible = "qcom,sa8775p-ride", "qcom,sa8775p";
>> +	model = "Qualcomm QCS9100 Ride";
>> +	compatible = "qcom,qcs9100-ride", "qcom,qcs9100";
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> 
> Your own internal guideline tells you to perform above tests, doesn't it?
> 
> Best regards,
> Krzysztof
> 

I have performed relevant check, and it's possible that there are some 
issues about the parameters used. I will follow your advice and refer to 
the relevant documentation to perform DTBS check again, ensuring that 
similar issues do not arise in the future.

-- 
Thx and BRs,
Tengfei Fan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
