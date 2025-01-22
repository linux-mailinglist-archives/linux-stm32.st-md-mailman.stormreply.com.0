Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E75A18F2D
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2025 11:05:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37922C78F77;
	Wed, 22 Jan 2025 10:05:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC74BC78F76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 10:05:06 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9Qml5030077;
 Wed, 22 Jan 2025 10:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zFmj7zj/Lq0aydtI5Gp746tMc3UoW0yD2aMedlR5Jng=; b=NnMwcwutVfIdifgQ
 drCmbTCZm+mM+1nGU24aAw7TJAb6OO1fJolXxfqq9cty5jAvoyergGx/DxRCM5Ek
 acY2oBAyGlpkpBInkkvbnddd8s+DxlUEPiZZmLFnfjuCEhmaHPVMDKreyaHolD2L
 gyKLFnNqdebpDl/kMrUIV1TZmIAkmq83Jxui5HU7askqXE72Zi3Y5iXpInyvo27A
 OkMW45ydqMlkdWidY+NxHKV8r7BNO8zwWpaohWqEoCkHFEWSh3sbQTVtLmseWmup
 smWWiVwUhJ1Vlsao1rOaiTvsmrFZGQvtimrpGK9/0kqnUOBROsHxxLIVosMUkzTm
 yxrNAA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ax1yr38p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2025 10:04:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50MA4lCa010810
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2025 10:04:47 GMT
Received: from [10.253.35.93] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 02:04:40 -0800
Message-ID: <23a9f6cf-3921-48c1-9c28-aeede639cf40@quicinc.com>
Date: Wed, 22 Jan 2025 18:04:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <bf45ec15-d430-499a-ba30-825611369402@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <bf45ec15-d430-499a-ba30-825611369402@lunn.ch>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: tYKueVtLj5-_nOleRcVBv1tEtZKa-_lh
X-Proofpoint-GUID: tYKueVtLj5-_nOleRcVBv1tEtZKa-_lh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 mlxlogscore=951 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220073
Cc: Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
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



On 2025-01-22 01:10, Andrew Lunn wrote:
>> To address the ABI compatibility issue between the kernel and DTS caused by
>> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
>> code, as it is the only legacy board that mistakenly uses the 'rgmii'
>> phy-mode.
> 
> Are you saying every other board DT got this correct? How do you know
> that? Was this SoC never shipped to anybody, so the only possible
> board is the QCOM RDK which never left the lab?
> 
> I doubt this is true, so you are probably breaking out of tree
> boards. We care less about out of tree boards, but we also don't
> needlessly break them.

You're right. My conclusion was based solely on browsing all RGMII-type 
Qualcomm boards under the source tree, and I didn't take the scenario 
you mentioned into account. I will work on coming up with a new 
solution. If you have any suggestions, I will gladly take them as a 
reference.

> 
> 	Andrew

-- 
Best Regards,
Yijie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
