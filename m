Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1DDAC83F6
	for <lists+linux-stm32@lfdr.de>; Fri, 30 May 2025 00:17:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB76FC32EA8;
	Thu, 29 May 2025 22:17:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5732FC32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 May 2025 22:17:23 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1OZc008024;
 Thu, 29 May 2025 22:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RJKYMfEYo39cQ3cuix/WIloDpQr/TS3nEp+iZYVSY6Y=; b=f7IeD/da0mGGcCho
 3u8f7QYMyt6vzYB9xiLpMztMJTeHHn8p82byWpVvlYQ+dlnU93FqKanlRG+0OgOF
 v/5uXlAVdtR4ZVgrNfoHfWZ2yBIzSP05hJ4ggA55X37p9Uym3syX473AlXbk/kSs
 xH1+9rgQ6oviFMXBeWgfhe2kARliN2iZane+9hk6ZFATJrT10EplY1QNA8P7m7jF
 fG0TYhkGoYNDdFusrUpP5Ebzj+oCOw4gTlTrZsHbre6bndwr04n7Eb+ybssBZ2UA
 0l5MVn/XwcG1US6eGWdJwmYl7WfHHPAUMJ98WNj6uUXgRMUmESQEdpntmbp22Mk+
 VWk0Og==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf7f91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 May 2025 22:16:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54TMGsIR005982
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 May 2025 22:16:55 GMT
Received: from [10.110.61.81] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 May
 2025 15:16:54 -0700
Message-ID: <090efb05-eb2b-4412-aa85-16df05ac9fb5@quicinc.com>
Date: Thu, 29 May 2025 15:16:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Paolo Abeni <pabeni@redhat.com>, Quentin Schulz <foss+kernel@0leil.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20250521-stmmac-mdio-bus_id-v1-1-918a3c11bf2c@cherry.de>
 <b3e3293a-3220-4540-9c8b-9aa9a2ef6427@redhat.com>
Content-Language: en-US
From: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <b3e3293a-3220-4540-9c8b-9aa9a2ef6427@redhat.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6838dcd7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=8b9GpE9nAAAA:8 a=BsutULhaAlByaH852usA:9 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: FqXj9uShaarui7_r20XQ1taVyCNbjujz
X-Proofpoint-GUID: FqXj9uShaarui7_r20XQ1taVyCNbjujz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIxNyBTYWx0ZWRfXxQnPZ4KrEtMi
 76F7Sye4rfTbUzYzlmMcrx5NFjMyGgl+4zUIl6J3ExIeoP1EdZDIfYkuBzGb/AUIfAqn6s21Zjo
 N3rQn0f+KbaEjzBV9paCw7neiRe3Y4ngAemXFP7L0AcZ0VhXxSyc6omd6Qkr8CYXI35MUmzjRwh
 VgiE3aIvoBdKQBXupHH1ybtJqigHrds/hytCA8ZTCmDpLm0dqFlTbdGzQ6BpSThnAe0cYRea1hI
 fsuiWSdO9j9uhfx+8KEHqlp9KF3E1SAWZi3LP8rP19Ing9hOYkNmaoi+v9ZMPCIWJhKP2uWZg4x
 RZBInWDOqtwReudghgt8YugHkhfQrSyuz5skcFI2TbEyCyMmsus8E8Ic4aBjkAfvpHSeyv3hCrh
 sdNfCEGkf9wNrt8wGpcKIkDCwza6Pl5L8AQnBrfFSywCeGZRy3X9l5p7Pzov4nGD50rai/aN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=969 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290217
Cc: Heiko Stuebner <heiko@sntech.de>,
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: platform: guarantee
	uniqueness of bus_id
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



On 5/26/2025 1:26 PM, Paolo Abeni wrote:
> On 5/21/25 5:21 PM, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> bus_id is currently derived from the ethernetX alias. If one is missing
>> for the device, 0 is used. If ethernet0 points to another stmmac device
>> or if there are 2+ stmmac devices without an ethernet alias, then bus_id
>> will be 0 for all of those.
>>
>> This is an issue because the bus_id is used to generate the mdio bus id
>> (new_bus->id in drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
>> stmmac_mdio_register) and this needs to be unique.
>>
>> This allows to avoid needing to define ethernet aliases for devices with
>> multiple stmmac controllers (such as the Rockchip RK3588) for multiple
>> stmmac devices to probe properly.
>>
>> Obviously, the bus_id isn't guaranteed to be stable across reboots if no
>> alias is set for the device but that is easily fixed by simply adding an
>> alias if this is desired.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> I think no need to CC stable here, but you need to provide a suitable
> fixes tag, thanks!
> 
Quentin to make your life easy. 
It fixes this patch 
https://lore.kernel.org/lkml/1372930541-19409-1-git-send-email-srinivas.kandagatla@st.com/
dt:net:stmmac: Add support to dwmac version 3.610 and 3.710
It goes back in time to 2013 when this bus_id was introduced through dts

> Paolo
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
