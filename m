Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA8892C2F3
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 19:58:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC290C6DD66;
	Tue,  9 Jul 2024 17:58:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEF0AC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 17:58:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469Bjt4J003930;
 Tue, 9 Jul 2024 17:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QHG3uj2yY1fbHBogo1cT7wmX9KZj3tfAJwgP2W4XEEE=; b=BoJSTQxz0VFIQDjM
 NBuRNlYT6Q5ul1wqHVwBJNq5rphYwpIjxzNNIsw9ozkvV+bAVIcGwCdCahk4Hd4E
 AWA+KwzV1S85hBl6PAu9XPX1s+3ztOH5dtWwXf2voJMPo2AYvY9htHtC+317u+YW
 QiCv6Skb6zTjMD4cvDsQZOQtsAsq1+CpcD/o4nNBK0KHQ5/UrShMRCqtnu7VjQBB
 2X7+J1gDiaVY4CSlLf9EyuCE3P7l5SQfB7C+VdMchzKMYl9ZgAnkq2mRJvLBFKYx
 4hKc1TqQMp7J/MSCEhyuWujjRGLoaaEvMO7ha4mvd35IO8hZOgG9pf32Fr7lK6H7
 DATVgg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 408w0ra3y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jul 2024 17:58:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 469HwP5g015452
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 Jul 2024 17:58:25 GMT
Received: from [10.110.47.59] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 10:58:21 -0700
Message-ID: <317136b6-40a9-4210-b745-029640844bcd@quicinc.com>
Date: Tue, 9 Jul 2024 10:58:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Russell
 King" <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Bhupesh Sharma" <bhupesh.sharma@linaro.org>
References: <20240708-icc_bw_voting_from_ethqos-v4-0-c6bc3db86071@quicinc.com>
 <becdf6b3-6eaf-497d-a7c3-d4783b7683b4@kernel.org>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <becdf6b3-6eaf-497d-a7c3-d4783b7683b4@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: WDKBCd0InyStxTqQh7RZhPrk3xvkjH6z
X-Proofpoint-GUID: WDKBCd0InyStxTqQh7RZhPrk3xvkjH6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_07,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=816
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090120
Cc: Andrew Lunn <andrew@lunn.ch>, kernel@quicinc.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v4 0/2] Add interconnect support for
	stmmac driver.
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



On 7/9/2024 1:58 AM, Krzysztof Kozlowski wrote:
> On 08/07/2024 23:29, Sagar Cheluvegowda wrote:
>> Interconnect is a software framework to access NOC bus topology
>> of the system, this framework is designed to provide a standard
>> kernel interface to control the settings of the interconnects on
>> an SoC.
>> The interconnect support is now being added to the stmmac driver
>> so that any vendors who wants to use this feature can just
>> define corresponging dtsi properties according to their
>> NOC bus topologies.
>>
>> here is a patch series which is enabling interconnect support
>> for ethernet node of SA8775P
>> https://lore.kernel.org/all/20240708-icc_bw_voting_emac_dtsi-v1-1-4b091b3150c0@quicinc.com/ 
>>
>> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
>> ---
>> Changes in v4:
>> - Add reference to the series which is enabling interconnect-properties defined in this series
>> - Link to v3: https://lore.kernel.org/r/20240703-icc_bw_voting_from_ethqos-v3-0-8f9148ac60a3@quicinc.com
> 
> You got two or three times review, but you keep ignoring it. You are
> expecting the community to keep doing the same work, which is waste of
> our time and resources.
> 
> Best regards,
> Krzysztof
> 
I will make sure to add the required Reviewed by or any other tags on the patches in future.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
