Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E21884CFC0
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 18:26:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22463C6B476;
	Wed,  7 Feb 2024 17:26:35 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7F42C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 17:26:33 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 417GLQ13005974; Wed, 7 Feb 2024 17:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=IeY4ENqyM6DquNVGtOMdp371wYPINtiRe/4HRffDQ3c=; b=E8
 m1HfsYNKB2wq3CjI6Xms8FjgW0KXlqJOdYl4rgYruitZFj3M6oiogwYWUPvjDVkg
 zlUqEeI0XoZx5bf0KWFsI8g68K8tBvZMD3Lc29st+AjqB97OZuCMe2QGoyFNMD8r
 zD0Xiam9xysQpJ6rqbLo35Ufpzae1xcdhmvm/U4CKCp4vYUoOotz+94RH2E8tWZE
 rIR7DEi7k69ehWuqfm6QJ5A+d/aapIObr6X0JR4CAFYb4Mg6ZCugviZv4dySBdKO
 KbbLNp03L2IVtlrQqkh3mRwIuHEatsDkryXQF2+VWqnu75hI3WR6rEgWMt1s47CW
 CqFnw9mmsHwy7eDaOGug==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4021ssgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:26:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 417HQ90x030684
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 7 Feb 2024 17:26:10 GMT
Received: from [10.110.62.200] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 09:26:06 -0800
Message-ID: <578b6a6e-83df-4113-9c1f-cdd7aa65f65e@quicinc.com>
Date: Wed, 7 Feb 2024 09:26:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Abhishek Chauhan <quic_abchauha@quicinc.com>, Vinod Koul
 <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 Prasad Sodagudi <psodagud@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>
References: <20240207001036.1333450-1-quic_abchauha@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240207001036.1333450-1-quic_abchauha@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Ujof3VBVxrMBwZfiN1GFhhbJXa7VDHpK
X-Proofpoint-GUID: Ujof3VBVxrMBwZfiN1GFhhbJXa7VDHpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_09,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 malwarescore=0 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=1 clxscore=1011 adultscore=0
 mlxlogscore=212 mlxscore=1 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402070129
Cc: kernel@quicinc.com
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: dwmac-qcom-ethqos: Enable
 TBS on all queues but 0
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

On 2/6/2024 4:10 PM, Abhishek Chauhan wrote:
> TSO and TBS cannot co-exist. TBS requires special descriptor to be
> allocated at bootup. Initialising Tx queues at probe to support
> TSO and TBS can help in allocating those resources at bootup.
> 
> TX queues with TBS can support etf qdisc hw offload.
> 
> This is similar to the patch raised by NXP <3b12ec8f618e>
> <"net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings">

note that there is a standard way to refer to a prior patch, in your case:
3b12ec8f618e ("net: stmmac: dwmac-imx: set TSO/TBS TX queues default
settings")

(note this format is defined in the context of the Fixes tag at
<https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes>)

/jeff
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
