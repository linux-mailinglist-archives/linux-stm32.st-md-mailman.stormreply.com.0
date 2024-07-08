Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD49092AB2C
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2024 23:29:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66A2CC6DD96;
	Mon,  8 Jul 2024 21:29:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A07AC6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2024 21:29:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468BUfmR012081;
 Mon, 8 Jul 2024 21:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0g+a5SSirBeJBrscbEp+Kt7zeD2Yr2kttzpSH4nI7Bo=; b=VetV0gBQbwT/LGcd
 L8hrRUROuj2R8E44VjIQGj6aQAw3ZfMtvGTKzFrYmbdO9EDJMW/x4hTrST1en486
 heMOQBD54qWAd8mYsyt8OO+SKcJ+NuNuZZJ3ct6SSaip0N9zp0AmQZyUmGq3jxwO
 J6lUurd3ocG0YvMa2dLvGRYhYuIRyf5ielFINeCUwyLBhgAywVgGdUh3D5+OmEnZ
 3tSjfo1E89Dx1XbQtJr5Pb0LMSYinLyRVqEdluvLVog0p0Q3BSFEb7PXV+fKyuWE
 CwEUSnBKiJRkVSy3D31NkHQfLGj3hpnKLIMaq8wVUytZ/ih69z6GS22Wa4sYD5yR
 jklfeQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wjn4tva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2024 21:28:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 468LSsbv015439
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 8 Jul 2024 21:28:54 GMT
Received: from [10.110.111.200] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 14:28:51 -0700
Message-ID: <3c3067d3-d142-4648-b22b-8a5971d02ff8@quicinc.com>
Date: Mon, 8 Jul 2024 14:28:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20240703-icc_bw_voting_from_ethqos-v3-0-8f9148ac60a3@quicinc.com>
 <72c55623-8d62-4346-8f04-506d0eaed867@lunn.ch>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <72c55623-8d62-4346-8f04-506d0eaed867@lunn.ch>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8lFJqCbxgWtA9q0lIBWE2lOgx5RgKIc7
X-Proofpoint-GUID: 8lFJqCbxgWtA9q0lIBWE2lOgx5RgKIc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_11,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080159
Cc: Rob Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Jakub
 Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v3 0/2] Add interconnect support for
	stmmac driver.\
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



On 7/3/2024 3:21 PM, Andrew Lunn wrote:
> On Wed, Jul 03, 2024 at 03:15:20PM -0700, Sagar Cheluvegowda wrote:
>> Interconnect is a software framework to access NOC bus topology
>> of the system, this framework is designed to provide a standard
>> kernel interface to control the settings of the interconnects on
>> an SoC.
>> The interconnect support is now being added to the stmmac driver
>> so that any vendors who wants to use this feature can just
>> define corresponging dtsi properties according to their
>> NOC bus topologies. 
>>
>> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> 
> Thanks for the rework.
> 
> It is normal to have a user of a new feature. Please could you patch a
> few .dts files with these new properties.
> 
> Thanks
> 	Andrew
> ---
> pw-bot: cr

I should have referenced corresponding dtsi patch in this series,
i am going to post a Version 4 patch updating the cover letter
with a link to the dtsi patch which is enabling interconnect support on
SA8775P ethernet device.

Regards,
Sagar
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
