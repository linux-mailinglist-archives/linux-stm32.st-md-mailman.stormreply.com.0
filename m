Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8497A1D4CB
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2025 11:49:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 461B2C78032;
	Mon, 27 Jan 2025 10:49:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2A8CC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2025 10:49:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R1QqCl012108
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 27 Jan 2025 10:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 adphgYyuraDm+8q9lCcomTmDXgUPSbCBsDgLoCmq7bo=; b=VGMMxiyMJDS7AYWD
 AlCnYoJbFAIFUk65rKWCAY+7bByO4bXUeaqOnoZL2bzpFvKg8vmk10CU3mC9oc3T
 ti2DZr0p2bEtLkwPTeSTdw0WFVew+jrWNZZtRL70+l2UsB5Fmpj58YOCJXsJuCuK
 bflkB/K8472Ffn8Dowr/9yAQ89BeyczFtGUYmbYZDPCE0YmqFv2m85gVCCyh2YLb
 m9MNIuKqcO/jRlymGXiaLp8E7OXR8DdfxZMUduhfzouxQEXwfni7FpXTWR2i5AuU
 nwMwxxAMVl7Nwb7cXR037lq/+ihqKo7ZJGKrHuRqbFSD8H+kLOl/RL6H53jV4B5A
 2Ui51w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dhu9huf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2025 10:49:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4679d6f9587so6558561cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2025 02:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737974978; x=1738579778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=adphgYyuraDm+8q9lCcomTmDXgUPSbCBsDgLoCmq7bo=;
 b=T68/+E6ZxkmA3ky0fEE76t6QM5LTRE9QvBE1zHRNTdQeOGTxzWydkt0jxeGTc6dzpv
 5ToMF6E7IhrBpRsj1mn9uOXET+TV9+rj0dqP3vC7aqYTlYJp6qUG/3CX1zdeXML+gvu3
 J9zfF4vrK0ZQHZrliexDHSLBdbyHv4cvhOrMMif2P2gxgkiTlisN5XEE9DJoCWwpsaNN
 0/yUQ+y1L4RsVmVI82QeQmjloyIkssSAWdtYrZgxC0LGRA8zShi6QPOSN74kbk7uHG/N
 SkUEJrEMfMR9izKoV1faNfaUa9NTd0rx7NGKPmsB8oBvs2qtSTxriWbdt8L6Y5DZdFkK
 WVLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiAjw2hY6bUN+nunc9IQTCP0zner4G06EafNg5CbJgrvdzwSyTXhZsv/zSPkgiF0wq8E62VfDev+pK2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz1CCM+EiRIf/1zWNw323KP/PLJC0gDFnyPP59wbINqvWf6r0YW
 v+HpPmkDjugjnldq5WBvM4xS9Toi3Vxvs1beyMhzLKe/kIQF8oDNqYfBHlIbaxpCM0SGblJ/JGu
 p39RVXegaYfWtdGcvEgVC79I/9k1uxMy8lUy1E4xo8WVpAxZyx2XVR1Ql9Cu1QIg0UhWtiuFagH
 Q84gg=
X-Gm-Gg: ASbGncu5dQlY0SxSRkXlgVo46rXMGMDYYoOTeeDBOVhq2PlavSpuY5LowAusT5tc/3+
 lJo2n2gp1iWY1Vh5Ef/JUr9lWIFydw0Gd9lz5frLP0yCJ5H1B0WtWhNcimxyY0XqSJEiqH+No3e
 MYnSSZ5BMBBFCKmc1+eITpzcsdbKImbTtgrZZ1WOWAuGpvBGxFEvoPNG7SQqur27ssddbJDG4gB
 5VRPXVcrM08iBUxWUjn3BoTKGKluuHNpVXgIUEsY4KetyNqI5rybXuFAXbSpf7IWu/ZNCVUi5o4
 XpDIEDr0sQpZmgweDWVR5xhgOJi9q3V/WAbCF3sPdaZKG/x8DsITC6eAV9k=
X-Received: by 2002:a05:622a:610:b0:467:6eee:1138 with SMTP id
 d75a77b69052e-46e4e726f1dmr121602681cf.6.1737974978601; 
 Mon, 27 Jan 2025 02:49:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdnH4J6HaLZ6tC9UeTjZWaxwVuzqp/4HLK9P8eKFWexw6YCwzdP8ffhfgKmAo0wFiSbNS1AA==
X-Received: by 2002:a05:622a:610:b0:467:6eee:1138 with SMTP id
 d75a77b69052e-46e4e726f1dmr121602601cf.6.1737974978120; 
 Mon, 27 Jan 2025 02:49:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760b6f4bsm569985266b.90.2025.01.27.02.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 02:49:37 -0800 (PST)
Message-ID: <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 11:49:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Yijie Yang <quic_yijiyang@quicinc.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
 <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
X-Proofpoint-GUID: 4PEsVPl8kGUSl0Ryg9sc3lmUhiv1trrC
X-Proofpoint-ORIG-GUID: 4PEsVPl8kGUSl0Ryg9sc3lmUhiv1trrC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270087
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 22.01.2025 10:48 AM, Krzysztof Kozlowski wrote:
> On 22/01/2025 09:56, Yijie Yang wrote:
>>
>>
>> On 2025-01-21 20:47, Krzysztof Kozlowski wrote:
>>> On 21/01/2025 08:54, Yijie Yang wrote:
>>>> The Qualcomm board always chooses the MAC to provide the delay instead of
>>>> the PHY, which is completely opposite to the suggestion of the Linux
>>>> kernel.
>>>
>>>
>>> How does the Linux kernel suggest it?
>>>
>>>> The usage of phy-mode in legacy DTS was also incorrect. Change the
>>>> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
>>>> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
>>>> the definition.
>>>> To address the ABI compatibility issue between the kernel and DTS caused by
>>>> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
>>>> code, as it is the only legacy board that mistakenly uses the 'rgmii'
>>>> phy-mode.
>>>>
>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>> ---
>>>>   .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>>>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
>>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>>>>   static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>>>>   {
>>>>   	struct device *dev = &ethqos->pdev->dev;
>>>> -	int phase_shift;
>>>> +	int phase_shift = 0;
>>>>   	int loopback;
>>>>   
>>>>   	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>>>> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>>>> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>>>> -		phase_shift = 0;
>>>> -	else
>>>> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>>>   		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
>>>>   
>>>>   	/* Disable loopback mode */
>>>> @@ -810,6 +807,17 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>   	ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>>>   	if (ret)
>>>>   		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>>>> +
>>>> +	root = of_find_node_by_path("/");
>>>> +	if (root && of_device_is_compatible(root, "qcom,qcs404-evb-4000"))
>>>
>>>
>>> First, just check if machine is compatible, don't open code it.
>>>
>>> Second, drivers should really, really not rely on the machine. I don't
>>> think how this resolves ABI break for other users at all.
>>
>> As detailed in the commit description, some boards mistakenly use the 
>> 'rgmii' phy-mode, and the MAC driver has also incorrectly parsed and 
> 
> That's a kind of an ABI now, assuming it worked fine.

I'm inclined to think it's better to drop compatibility given we're talking
about rather obscure boards here.

$ rg 'mode.*=.*"rgmii"' arch/arm64/boot/dts/qcom -l

arch/arm64/boot/dts/qcom/sa8155p-adp.dts
arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts

QCS404 seems to have zero interest from anyone (and has been considered
for removal upstream..).

The ADP doesn't see much traction either, last time around someone found
a boot breaking issue months after it was committed.

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
