Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD6B8D80B5
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 13:16:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD22BC6B47E;
	Mon,  3 Jun 2024 11:16:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44B09C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 11:16:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 452NubkQ017720;
 Mon, 3 Jun 2024 11:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4dBJ7CRFnEtRJnVMM/5nRbR4DBCRRfHzth9KUplaXFw=; b=OR15NPJ85m8dw4nX
 CxLgZZ1jmE2iD13o2dHk+AV40nv2xuct3SPRFyoJoJhLqjKsbPKG6kJT1CFh4NFO
 2gH+bqJ7foyqb7+TURaiK1oKt5sw1SP5Vhn4/TcrJ4Wg1R+JwvFg3fnJwHb7bndy
 Rr0p5HwYZAaMisq9pyQZ3wJOKROdd0cFFMfq24HZD99d0g9+PiVHcMlpNZ7I1k59
 PTLDC1blK8AHieZJmYmmZAVvf5C7PXpxMyrfh5Z6QJ59luFi1hINo9JAHwPzGyQD
 UuhvBQ7eZKqu33zH+kNzYGeSYXPdUPfCkg7pJQqdZGpRkAp0DVSPUM+LG5yRjylQ
 +IRBjA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw59kjx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2024 11:15:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453BFfv5000885
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Jun 2024 11:15:41 GMT
Received: from [10.217.90.34] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 04:15:33 -0700
Message-ID: <0f0df372-29b5-4daf-8e54-4157e8ab1a98@quicinc.com>
Date: Mon, 3 Jun 2024 16:45:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
 <4zbf5fmijxnajk7kygcjrcusf6tdnuzsqqboh23nr6f3rb3c4g@qkfofhq7jmv6>
 <8b80ab09-8444-4c3d-83b0-c7dbf5e58658@quicinc.com>
 <wvzhz4fmtheculsiag4t2pn2kaggyle2mzhvawbs4m5isvqjto@lmaonvq3c3e7>
 <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
 <ZlNi11AsdDpKM6AM@shell.armlinux.org.uk>
 <d246bd64-18b3-4002-bc71-eccd67bbd61f@quicinc.com>
 <67553944-5d3f-4641-a719-da84554c0a9f@lunn.ch>
 <ZleMdFsmQzXGp1GM@shell.armlinux.org.uk>
Content-Language: en-US
From: Sneh Shah <quic_snehshah@quicinc.com>
In-Reply-To: <ZleMdFsmQzXGp1GM@shell.armlinux.org.uk>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eljy9ZgYrskT4Ir30jUQ98wP83GwYNmB
X-Proofpoint-ORIG-GUID: eljy9ZgYrskT4Ir30jUQ98wP83GwYNmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_07,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1011 mlxlogscore=978 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030094
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-qcom-ethqos:
 Add support for 2.5G SGMII
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



On 5/30/2024 1:43 AM, Russell King (Oracle) wrote:
> On Wed, May 29, 2024 at 04:28:16PM +0200, Andrew Lunn wrote:
>>> Qualcomm ethernet HW supports 2.5G speed in overclocked SGMII mode.
>>> we internally term it as OCSGMII.
>>
>> So it still does SGMII inband signalling? Not 2500BaseX signalling? It
>> is not actually compatible with 2500BaseX?
>>
>>> End goal of these patches is to enable SGMII with 2.5G speed support.
>>> The patch in these series enabled up SGMII with 2.5 for cases where we
>>> don't have external phy. ( mac-to-mac connectivity)
>>
>> So the other end needs to be an over clocked SGMII MAC, not 2500BaseX?
>>
>>> The new patch posted extends this for the case when the MAC has an
>>> external phy connected. ( hence we are advertising fr 2.5G speed by adding
>>> 2500BASEX as supported interface in phylink)
>>
>> And i assume it does not actually work against a true 2500BaseX
>> device, because it is doing SGMII inband signalling?
> 
> I really hope the hardware isn't using any SGMII inband signalling
> at 2.5G speeds. Other devices explicitly state that SGMII inband
> signalling while operating the elevated 2.5G speed is *not* supported!

Do we mean SGMII autoneg by SGMII inband signalling? Our hardware doesn't
support autoneg for 2.5G mode in SGMII.
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
