Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 461BB926CFB
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2024 03:15:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E837BC71282;
	Thu,  4 Jul 2024 01:15:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C95C3C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2024 01:14:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463J5REs004615;
 Thu, 4 Jul 2024 01:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uRpXLfcsvuxp+p8SsgPzPXaUhVpL09CJ831wMJ2Y/vg=; b=I0UgO50rDrjeRMJF
 BILIdUuwdLmbrSNFIfaTFtwmz/KxMj7Dr6CWyrNVYFR0TFK8Y5yzTbDVbOCv5vEy
 CR1zZtsFcUGSEiHucqt04C6VOIk7bXUZL9ciyCgE5LRCW/mmjBzqzBI+9PkFWx90
 ZyNCgKv1Hb+HsiZs5zKItolFMIsURCjHg+RhnXW6j4kIVi4Xo2MPbz5ve5e/jayg
 l8qtMhya6USe188vSIG2yyCNddQSRJxXlrblHfo8Zz3nPJRYJwI5lXEOq++PbpTe
 Da6XnoIOhmWzfwIsVmhuhwfea12Ni235a9aIxG0PY/fidynTiw7q/iIpYMXM621n
 xXSQkQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 405cg28gk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jul 2024 01:14:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4641EMjB015598
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 4 Jul 2024 01:14:22 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 18:14:01 -0700
Message-ID: <f4162b7f-d957-4dd6-90a0-f65c1cbc213a@quicinc.com>
Date: Thu, 4 Jul 2024 09:13:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Halaney <ahalaney@redhat.com>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703025850.2172008-30-quic_tengfan@quicinc.com>
 <u5ekupjqvgoehkl76pv7ljyqqzbnnyh6ci2dilfxfkcdvdy3dp@ehdujhkul7ow>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <u5ekupjqvgoehkl76pv7ljyqqzbnnyh6ci2dilfxfkcdvdy3dp@ehdujhkul7ow>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2ToY-VFWJVX4PxSXMxm7v7m6lN_KrTeg
X-Proofpoint-ORIG-GUID: 2ToY-VFWJVX4PxSXMxm7v7m6lN_KrTeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0 mlxlogscore=915
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040008
Cc: rafael@kernel.org, viresh.kumar@linaro.org, linus.walleij@linaro.org,
 quic_cang@quicinc.com, alim.akhtar@samsung.com, quic_rjendra@quicinc.com,
 linux-clk@vger.kernel.org, kishon@kernel.org, kernel@quicinc.com,
 bvanassche@acm.org, bartosz.golaszewski@linaro.org, jassisinghbrar@gmail.com,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, lpieralisi@kernel.org,
 linux@roeck-us.net, linux-pm@vger.kernel.org, avri.altman@wdc.com,
 robimarko@gmail.com, tglx@linutronix.de, quic_kbajaj@quicinc.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, djakov@kernel.org,
 lukasz.luba@arm.com, kw@linux.com, thara.gopinath@gmail.com,
 quic_msarkar@quicinc.com, edumazet@google.com, srinivas.kandagatla@linaro.org,
 manivannan.sadhasivam@linaro.org, quic_kaushalk@quicinc.com,
 quic_bjorande@quicinc.com, daniel.lezcano@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, iommu@lists.linux.dev,
 linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_nitirawa@quicinc.com, linux-gpio@vger.kernel.org, bhelgaas@google.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, quic_tsoni@quicinc.com,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, ulf.hansson@linaro.org,
 linux-pci@vger.kernel.org, mturquette@baylibre.com, amitk@kernel.org,
 linux-phy@lists.infradead.org, will@kernel.org, robh@kernel.org,
 quic_tingweiz@quicinc.com, luca@z3ntu.xyz, danila@jiaxyga.com,
 pabeni@redhat.com, bhupesh.sharma@linaro.org, athierry@redhat.com,
 quic_devipriy@quicinc.com, conor@kernel.org, konrad.dybcio@linaro.org,
 abel.vesa@linaro.org, davem@davemloft.net, mantas@8devices.com,
 otto.pflueger@abscue.de, quic_wcheng@quicinc.com, quic_rgottimu@quicinc.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org,
 quic_aiquny@quicinc.com, vkoul@kernel.org, quic_sibis@quicinc.com,
 agross@kernel.org, kuba@kernel.org, rui.zhang@intel.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, wim@linux-watchdog.org,
 quic_shashim@quicinc.com, netdev@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, quic_tdas@quicinc.com,
 dmitry.baryshkov@linaro.org, robin.murphy@arm.com, joro@8bytes.org
Subject: Re: [Linux-stm32] [PATCH 29/47] dt-bindings: net: qcom,
 ethqos: add description for qcs9100
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



On 7/3/2024 11:09 PM, Andrew Halaney wrote:
> On Wed, Jul 03, 2024 at 10:58:32AM GMT, Tengfei Fan wrote:
>> Add the compatible for the MAC controller on qcs9100 platforms. This MAC
>> works with a single interrupt so add minItems to the interrupts property.
>> The fourth clock's name is different here so change it. Enable relevant
>> PHY properties. Add the relevant compatibles to the binding document for
>> snps,dwmac as well.
> 
> This description doesn't match what was done in this patch, its what
> Bart did when he made changes to add the sa8775 changes. Please consider
> using a blurb indicating that this is the same SoC as sa8775p, just with
> different firmware strategies or something along those lines?

I will update this commit message as you suggested.

> 
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
>>   Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> index 6672327358bc..8ab11e00668c 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> @@ -20,6 +20,7 @@ properties:
>>     compatible:
>>       enum:
>>         - qcom,qcs404-ethqos
>> +      - qcom,qcs9100-ethqos
>>         - qcom,sa8775p-ethqos
>>         - qcom,sc8280xp-ethqos
>>         - qcom,sm8150-ethqos
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index 3bab4e1f3fbf..269c21779396 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -67,6 +67,7 @@ properties:
>>           - loongson,ls2k-dwmac
>>           - loongson,ls7a-dwmac
>>           - qcom,qcs404-ethqos
>> +        - qcom,qcs9100-ethqos
>>           - qcom,sa8775p-ethqos
>>           - qcom,sc8280xp-ethqos
>>           - qcom,sm8150-ethqos
>> @@ -582,6 +583,7 @@ allOf:
>>                 - ingenic,x1600-mac
>>                 - ingenic,x1830-mac
>>                 - ingenic,x2000-mac
>> +              - qcom,qcs9100-ethqos
>>                 - qcom,sa8775p-ethqos
>>                 - qcom,sc8280xp-ethqos
>>                 - snps,dwmac-3.50a
>> @@ -639,6 +641,7 @@ allOf:
>>                 - ingenic,x1830-mac
>>                 - ingenic,x2000-mac
>>                 - qcom,qcs404-ethqos
>> +              - qcom,qcs9100-ethqos
>>                 - qcom,sa8775p-ethqos
>>                 - qcom,sc8280xp-ethqos
>>                 - qcom,sm8150-ethqos
>> -- 
>> 2.25.1
>>
> 

-- 
Thx and BRs,
Tengfei Fan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
