Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC5DA18DE7
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2025 09:57:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5D20C78F75;
	Wed, 22 Jan 2025 08:57:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 519B1C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 08:57:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M1hAiw018045;
 Wed, 22 Jan 2025 08:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mmZuSHMdrepy4/YndlIJfpy2ZoZmjaeihcJX2mJ7HM4=; b=DDZNb+X20t0XiECr
 CE0mGwulmB1T8X2jZuDXbtIcpe5h8pvuy8dPISEOo6Gv55GHGMJCduE2YJSPWrzE
 IH/Iu71hA87YUu65kNxR9NIyhbhF0lHTdLOoWeVKSoRNCK0UgNUGJedib8VR2O4c
 WBilhWie2mqv2FOcjQVhvC7Ft8QH8ilfQ8uX2RM/zTgesttIwosWSaoNfbewIW8E
 yvAMakIlFA5g+7bx93xiN+FLxxacUlLQLdyoHbpfx8XWSG/fWc3Z4yrs4bkwI7Fb
 oEvo9cizskj8MHX7/qa/XoiU5198aCtzHRgL9bdqQvx3Li97cuRRm2PjWWgzrqEz
 YPAD7Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44aq8grwht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2025 08:56:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M8ufDi002822
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2025 08:56:41 GMT
Received: from [10.253.35.93] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 00:56:25 -0800
Message-ID: <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
Date: Wed, 22 Jan 2025 16:56:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Richard
 Cochran <richardcochran@gmail.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0BYb4wTjg5Clrf8iEUS_7OaSW_qmyZo6
X-Proofpoint-ORIG-GUID: 0BYb4wTjg5Clrf8iEUS_7OaSW_qmyZo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220064
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos:
 Mask PHY mode if configured with rgmii-id
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



On 2025-01-21 20:47, Krzysztof Kozlowski wrote:
> On 21/01/2025 08:54, Yijie Yang wrote:
>> The Qualcomm board always chooses the MAC to provide the delay instead of
>> the PHY, which is completely opposite to the suggestion of the Linux
>> kernel.
> 
> 
> How does the Linux kernel suggest it?
> 
>> The usage of phy-mode in legacy DTS was also incorrect. Change the
>> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
>> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
>> the definition.
>> To address the ABI compatibility issue between the kernel and DTS caused by
>> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
>> code, as it is the only legacy board that mistakenly uses the 'rgmii'
>> phy-mode.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>>   static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>>   {
>>   	struct device *dev = &ethqos->pdev->dev;
>> -	int phase_shift;
>> +	int phase_shift = 0;
>>   	int loopback;
>>   
>>   	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>> -		phase_shift = 0;
>> -	else
>> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>   		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
>>   
>>   	/* Disable loopback mode */
>> @@ -810,6 +807,17 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>   	ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>> +
>> +	root = of_find_node_by_path("/");
>> +	if (root && of_device_is_compatible(root, "qcom,qcs404-evb-4000"))
> 
> 
> First, just check if machine is compatible, don't open code it.
> 
> Second, drivers should really, really not rely on the machine. I don't
> think how this resolves ABI break for other users at all.

As detailed in the commit description, some boards mistakenly use the 
'rgmii' phy-mode, and the MAC driver has also incorrectly parsed and 
added the delay for it. This code aims to prevent breaking these boards 
while correcting the erroneous parsing. This issue is similar to the one 
discussed in another thread:
https://lore.kernel.org/all/20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com/

> 
> You need to check what the ABI is here and do not break it.

If board compatible string matching is not recommended, can I address 
this historical issue by adding the rx-internal-delay-ps and 
tx-internal-delay-ps properties, as Andrew suggested in the thread 
mentioned above? Boards without this property are considered legacy 
boards and will follow the legacy routine, while others will apply the 
new routine. Similar examples include ksz_parse_rgmii_delay and 
sja1105_parse_rgmii_delays.

> 
> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
