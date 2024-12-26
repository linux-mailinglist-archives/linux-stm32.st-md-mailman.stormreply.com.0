Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 355AA9FC760
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Dec 2024 02:24:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D897FC78F66;
	Thu, 26 Dec 2024 01:24:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58B8AC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Dec 2024 01:24:20 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ032d5010616;
 Thu, 26 Dec 2024 01:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aZCworpZc1r9xzngnHefQQcjLWVhZMJcDMelwMm0iKg=; b=FW0grUOP/+EuzZXS
 A2oo0rokklCMrUk7MZqFluIbiDZubwNe0PHroRpXyNNp6O8yRk5dmbIRpj/BSpok
 XPnRFq7i7YOcKkMBU0SejjjfpkOGyeoF2wPBCMeCD6Jvz0AXhI8DUgLFOymLEVwj
 sGe4JcOWSiW5R0TbCrE62uuiv39Djk+IdfxC0gNQYKMX2HYqsUjZJv9jqJ7SjULj
 JOHQhXfHtQgTU+NQe5Tq1jxoAQD9/etQDx9sOKTlK08FSVSJA4LOdq3qeZm2Y+P8
 l9igfWhjkTBsP6PfeF67va8flQYikiMblVPXc0NXB4/ScyvFBVDg9SrqNoMWlK/4
 dRJWwQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rv8qr7pw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Dec 2024 01:24:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ1O3e7012056
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Dec 2024 01:24:03 GMT
Received: from [10.253.74.39] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 17:23:57 -0800
Message-ID: <5bdfcf46-6512-43f2-bf23-cd8e9a6e93f3@quicinc.com>
Date: Thu, 26 Dec 2024 09:23:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-3-4b52ef48b488@quicinc.com>
 <88bd11c6-e5f6-4c12-a009-5ec07fd1b873@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <88bd11c6-e5f6-4c12-a009-5ec07fd1b873@lunn.ch>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6vu0-ulN7rekBbajdA858XOi0N5wHngj
X-Proofpoint-ORIG-GUID: 6vu0-ulN7rekBbajdA858XOi0N5wHngj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=866 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260009
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/3] arm64: dts: qcom: qcs615-ride: Enable
 RX programmable swap on qcs615-ride
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



On 2024-12-26 01:38, Andrew Lunn wrote:
> On Wed, Dec 25, 2024 at 06:04:47PM +0800, Yijie Yang wrote:
>> The timing of sampling at the RX side for qcs615-ride needs adjustment.
>> It varies from board to board.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index bfb5de4a0d440efece993dbf7a0001e001d5469b..f22a4a0b247a09bd1057b66203a34b666cd119a8 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -206,6 +206,7 @@ &ethernet {
>>   	phy-handle = <&rgmii_phy>;
>>   	phy-mode = "rgmii";
>>   	max-speed = <1000>;
>> +	qcom,rx-prog-swap;
> 
> I notice this board still has messed up rgmii delays, using phy-mode =
> "rgmii", not "rgmii-id". How does com,rx-prog-swap interact with rgmii
> delays? Is the sample point logic before or after the rgmii delay
> logic in the MAC clock pipeline?

This patch set relies on an earlier version that has RGMII issues. The 
latter is still undergoing coding and verification. I will update this 
patch set once the RGMII issues are resolved and uploaded.

> 
> I think i also questioned max-speed = <1000>. Has this
> arch/arm64/boot/dts/qcom/qcs615-ride.dts been merged?

This will also be updated in the next version.

> 
> 	Andrew

-- 
Best Regards,
Yijie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
