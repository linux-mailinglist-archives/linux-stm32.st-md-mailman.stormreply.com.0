Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E3F9A6DB3
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 17:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34AEAC78034;
	Mon, 21 Oct 2024 15:10:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19484C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 15:10:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L9v1Cw027533;
 Mon, 21 Oct 2024 15:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RnGid0+oHf+nzyErAkR4GoXKCWblfnUFKaeagu594Y4=; b=bxVeQI8kPeBu62eX
 YqHDvrTfLINI1sRnSR0uEcV2q92vgQxtcbdY2WZUKbgCTziif7guGTXAw3Cs7bgw
 aVDcpqsHqy5fb73X2clY+9rri32DB6aHwGmiv6swMAoHsrmIKahq0Xj5zaqWa3Xk
 A2SoQijJZXTSvSF9EcBasjpRhkP1Ew/WjrUYrRepbMfGlLD0jTMfggUFQ1c0J/gF
 fQq97FKB9/4V008VZsZl1erp1b2waXg0qsAN9b56B/ZVf8Ck6vAvXHGtgz8UC2Lr
 /+hPv4AjPEXcoeVM/+cqudg1GnVgBRSp7j9md6TQv5LLTzLB9u+O2miYNlZPFo8Z
 BSWTBw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vxw7k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 15:10:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LFA3Qr005165
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 15:10:03 GMT
Received: from [10.110.122.237] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 08:09:59 -0700
Message-ID: <89f188d2-2d4e-43bf-98f3-aae7e9d68cab@quicinc.com>
Date: Mon, 21 Oct 2024 08:09:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Serge Semin <fancer.lancer@gmail.com>
References: <20241018222407.1139697-1-quic_abchauha@quicinc.com>
 <60119fa1-e7b1-4074-94ee-7e6100390444@lunn.ch>
 <ZxYc2I9vgVL8i4Dz@shell.armlinux.org.uk>
 <ZxYfmtPYd0yL51C5@shell.armlinux.org.uk>
Content-Language: en-US
From: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <ZxYfmtPYd0yL51C5@shell.armlinux.org.uk>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Vmv6XxUVYZXB7EqspC_EZu4cGnW4ZVwO
X-Proofpoint-GUID: Vmv6XxUVYZXB7EqspC_EZu4cGnW4ZVwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=491 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210108
Cc: Jon Hunter <jonathanh@nvidia.com>, kernel@quicinc.com,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric
 Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: Disable PCS Link and
 AN interrupt when PCS AN is disabled
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



On 10/21/2024 2:32 AM, Russell King (Oracle) wrote:
> On Mon, Oct 21, 2024 at 10:20:24AM +0100, Russell King (Oracle) wrote:
>> On Sat, Oct 19, 2024 at 04:45:16AM +0200, Andrew Lunn wrote:
>>> On Fri, Oct 18, 2024 at 03:24:07PM -0700, Abhishek Chauhan wrote:
>>>> Currently we disable PCS ANE when the link speed is 2.5Gbps.
>>>> mac_link_up callback internally calls the fix_mac_speed which internally
>>>> calls stmmac_pcs_ctrl_ane to disable the ANE for 2.5Gbps.
>>>>
>>>> We observed that the CPU utilization is pretty high. That is because
>>>> we saw that the PCS interrupt status line for Link and AN always remain
>>>> asserted. Since we are disabling the PCS ANE for 2.5Gbps it makes sense
>>>> to also disable the PCS link status and AN complete in the interrupt
>>>> enable register.
>>>>
>>>> Interrupt storm Issue:-
>>>> [   25.465754][    C2] stmmac_pcs: Link Down
>>>> [   25.469888][    C2] stmmac_pcs: Link Down
>>>> [   25.474030][    C2] stmmac_pcs: Link Down
>>>> [   25.478164][    C2] stmmac_pcs: Link Down
>>>> [   25.482305][    C2] stmmac_pcs: Link Down
>>>
>>> I don't know this code, so i cannot really comment if not enabling the
>>> interrupt is the correct fix or not. But generally an interrupt storm
>>> like this is cause because you are not acknowledging the interrupt
>>> correctly to clear its status. So rather than not enabling it, maybe
>>> you should check what is the correct way to clear the interrupt once
>>> it happens?
>>
>> stmmac PCS support is total crap and shouldn't be used, or stmmac
>> should not be using phylink. It's one or the other. Blame Serge for
>> this mess.
> 
> Seriously, we could've had this fixed had the patch set I was working
> on that fixed stmmac's _bad_ _conversion_ to phylink progressed to the
> point of being merged.
> 
> The whole stmmac PCS support is broken, bypassing phylink.
> 
> This series also contained bug fixes for stuff like this interrupt
> storm after Serge tested it. However, Serge wanted to turn my series
> into his maze of indirect function pointers approach that I disagreed
> with, and he wouldn't change his mind on that, so I deleted the series.
> 
> As I keep saying - either stmmac uses phylink *properly* and gets its
> PCS hacks sorted out, or it does not use phylink *at* *all*. It's one
> or the other.
> 
> I am not going to patch stmmac for any future phylink changes, and if
> it breaks, then I'll just say "oh that's a shame, not my problem."
> Blame Serge for that. I've had it with the pile of crap that is
> stmmac.
> 
Thanks Andrew and Russell for you review comments. 

Adding Serge here. 

Lets take a step back and see how i can help here to make sure 
we can get things merged and the discussion proceeds. 

Serge please help if can here. Thanks! 




_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
