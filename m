Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA3992478C
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jul 2024 20:51:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7443C71282;
	Tue,  2 Jul 2024 18:51:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFDC9C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2024 18:50:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462Gs2hM000402;
 Tue, 2 Jul 2024 18:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AlYcI/o49WIolw4v/nPXCS8dUNWb7ZRGwwrKnFWXixM=; b=gkHwVJSRdUiQb4MA
 s0cNx3e7NC3x8aiZUf2WCFSGgW0AtPb6Oi0Qf6j9dj9Qe1+6+i11R4IaFvsMIQFS
 n7oyTxX/9mpIyhAmt7wV9BQjm4sPKrlRQ7zEBZwHvCjf+kyvKNjFNYIVjrReW2Xp
 vz69m6hkyKh4yZtzvQN/Ik+jm3Xlv/YvEY2UrCqsi9dOTqQn9TPD+CLAJlmASa05
 pzZaaTuqT1RURmXidQY9DBZ7JyYWU+pkURlevN5uTDudi4a6zf+Q1aIftpbFL6yZ
 ZKUDRF9kiboaMwDHqln0B4jUSaduwuGj31wSJZsmxICxsRZkfSTt0LotOtqbOFa3
 6eTRgQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402bj899wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jul 2024 18:50:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 462IoVKD014773
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 Jul 2024 18:50:31 GMT
Received: from [10.110.54.196] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 11:50:28 -0700
Message-ID: <4934d0cc-3a9d-4e31-a8f2-32b3cbf73915@quicinc.com>
Date: Tue, 2 Jul 2024 11:50:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Halaney <ahalaney@redhat.com>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-1-eaa7cf9060f0@quicinc.com>
 <q2ou73goc2pgrmx7xul4z7zrqo4zylh3nd2ldxw5vnz2z4fnkf@axbse4awc6lf>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <q2ou73goc2pgrmx7xul4z7zrqo4zylh3nd2ldxw5vnz2z4fnkf@axbse4awc6lf>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: eISxxj9D8Oitlj92rMYg7_qkn--LieGe
X-Proofpoint-GUID: eISxxj9D8Oitlj92rMYg7_qkn--LieGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_14,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407020137
Cc: Rob Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub
 Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: net: qcom: ethernet:
 Add interconnect properties
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



On 6/26/2024 7:53 AM, Andrew Halaney wrote:
> On Tue, Jun 25, 2024 at 04:49:28PM GMT, Sagar Cheluvegowda wrote:
>> Add documentation for the interconnect and interconnect-names
>> properties required when voting for AHB and AXI buses.
>>
>> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
>> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> index 6672327358bc..b7e2644bfb18 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> @@ -63,6 +63,14 @@ properties:
>>  
> 
> Does it make sense to make these changes in snps,dwmac.yaml since you're
> trying to do this generically for stmmac? I don't poke bindings super
> often so might be a silly question, the inheritance of snps,dwmac.yaml
> into the various platform specific bindings (qcom,ethqos.yaml) would
> then let you define it once in the snps,dwmac.yaml right?
> 
>>    dma-coherent: true
>>  
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: axi
>> +      - const: ahb
> 
> Sorry to bikeshed, and with Krzysztof's review on this already its
> probably unnecessary, but would names like cpu-mac and mac-mem be
> more generic / appropriate? I see that sort of convention a lot in the
> other bindings, and to me those read really well and are understandable.

I agree with changing the names to "cpu-mac" and "mac-mem" in that
way the properties are more understandable.
@Krzysztof Kozlowski let me know your opinion on the same.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
