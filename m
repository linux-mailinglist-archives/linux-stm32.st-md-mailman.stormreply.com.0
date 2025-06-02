Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EE4ACBA89
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Jun 2025 19:56:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42407C3F954;
	Mon,  2 Jun 2025 17:56:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 282CAC3F952
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Jun 2025 17:56:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HK3k9027805;
 Mon, 2 Jun 2025 17:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mupxq0U3EVRdJRWbfpoQotfoVNzlo0a4u+5W9m3U28U=; b=IuUPjcFpoxsnaOhG
 P0xhvOdf0Yn//0tTB8LIH63fwz7tsj2ArTDjOtVnlkbpW1gFmBkRGZUQG2oiBf4K
 zhKfZxogfuotU+Ok7CgyO2/+FrjPP5l9A/HWEY4gN6WtzZUki5FdUoGnPCcNuzxp
 P2NAyMcxpMTo2KYRSstEK+6NcRzTgz/ZbhSXRHcZMsAVZRdtG+uTFw/+Ev6G5Szo
 JMFv/CI1BSBhCYSj9L3ApmCR6wbnO5LoRzxM7FiyLwmW+3/UaY7pvOYOzdPVVscN
 SFlk0NysdlFyU51AwVPIEqekrAd9tcTE+vcpNF/vUy9vjxuV1xkNYP6C/6+5QFR/
 YfShCA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rr2rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Jun 2025 17:56:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 552HuKdQ031255
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Jun 2025 17:56:20 GMT
Received: from [10.46.19.239] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Jun 2025
 10:56:19 -0700
Message-ID: <36a5fe83-0bb3-4df0-9fb7-bfdc849ce715@quicinc.com>
Date: Mon, 2 Jun 2025 10:56:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <quentin.schulz@cherry.de>, Paolo Abeni <pabeni@redhat.com>,
 Quentin Schulz <foss+kernel@0leil.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20250521-stmmac-mdio-bus_id-v1-1-918a3c11bf2c@cherry.de>
 <b3e3293a-3220-4540-9c8b-9aa9a2ef6427@redhat.com>
 <090efb05-eb2b-4412-aa85-16df05ac9fb5@quicinc.com>
 <e912504e-651b-4992-953e-1a239cbf2550@cherry.de>
Content-Language: en-US
From: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <e912504e-651b-4992-953e-1a239cbf2550@cherry.de>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: I_vs5geuxhnTHlI7VXU2CU2IaWXxZ_6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE0NiBTYWx0ZWRfX++k8PWbBU6nB
 eROz6wIloMcUHj76Hp7Spnu9V1yebWVQ88sAgnyb3JBr6MCOuSsv9RhvFlRRGVW6BxDbm8iHLkQ
 ddReyQ2dFUHCZOAjFBi63h9n6R7q6dbus0S/2eNCesUxxQeIB4bLi9omsPCPIR8sS7hqDY3nV4K
 caTxkJ6y//Oh/qvCoHlUACH1jav/OOFVE2zu50VHl7nkPMRCFBehTsudS2KfoImX1eU5Sz3r7C1
 kNzgM4OCLvTlky61V5oXHmOokNxT/cWnJ9Kx+jKMPoQsnuiugSDqMcENhkba0RSQJkzxp+8NFgR
 FumDGydYw7Is2AJv2TijezBmtbVI14OcJRdlzgd0pcZTglzpcmnGINAf25e6o6mFUZwmAxqK1jW
 eAe2PWNOL+ZLnvzHHp4zsqMrpks7OcwwXVn4CYXIXsGn5DAJ0pL8KUnMRWIXew02b4QAHmXw
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=683de5c5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=_EeEMxcBAAAA:8
 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=COk6AnOGAAAA:8 a=yzbITpj1KNc8IpvBZF8A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: I_vs5geuxhnTHlI7VXU2CU2IaWXxZ_6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506020146
Cc: Heiko Stuebner <heiko@sntech.de>,
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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



On 6/2/2025 2:38 AM, Quentin Schulz wrote:
> Hi Abhishek,
> 
> On 5/30/25 12:16 AM, Abhishek Chauhan (ABC) wrote:
>> [Some people who received this message don't often get email from quic_abchauha@quicinc.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On 5/26/2025 1:26 PM, Paolo Abeni wrote:
>>> On 5/21/25 5:21 PM, Quentin Schulz wrote:
>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>
>>>> bus_id is currently derived from the ethernetX alias. If one is missing
>>>> for the device, 0 is used. If ethernet0 points to another stmmac device
>>>> or if there are 2+ stmmac devices without an ethernet alias, then bus_id
>>>> will be 0 for all of those.
>>>>
>>>> This is an issue because the bus_id is used to generate the mdio bus id
>>>> (new_bus->id in drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
>>>> stmmac_mdio_register) and this needs to be unique.
>>>>
>>>> This allows to avoid needing to define ethernet aliases for devices with
>>>> multiple stmmac controllers (such as the Rockchip RK3588) for multiple
>>>> stmmac devices to probe properly.
>>>>
>>>> Obviously, the bus_id isn't guaranteed to be stable across reboots if no
>>>> alias is set for the device but that is easily fixed by simply adding an
>>>> alias if this is desired.
>>>>
>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>
>>> I think no need to CC stable here, but you need to provide a suitable
>>> fixes tag, thanks!
>>>
>> Quentin to make your life easy.
>> It fixes this patch
>> https://lore.kernel.org/lkml/1372930541-19409-1-git-send-email-srinivas.kandagatla@st.com/
>> dt:net:stmmac: Add support to dwmac version 3.610 and 3.710
>> It goes back in time to 2013 when this bus_id was introduced through dts
>>
> 
> Fortunately, we ended up finding the same "culprit" (see v2 of my patch that got merged[1] :) )
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=eb7fd7aa35bfcc1e1fda4ecc42ccfcb526cdc780
> Nice!. Anyway i really like this fix because mdio creates a directory and if there are 2+ macs the directory creation will fail because 
two emac will have the same mdio directory names provided if someone forgets to mention alias in the dtsi. 
> Thanks!
> Quentin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
