Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEE591C6E1
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 21:55:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 003E4C71282;
	Fri, 28 Jun 2024 19:55:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86265CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 19:55:22 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SGc1DM000900;
 Fri, 28 Jun 2024 19:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eRgvqU3QHpMQzWa7BXNysUM8bokPIDW5+DmiJDF3IHA=; b=pZyltw4g79cEf8Jl
 fnVkh6v6K4sYoVw32c5Gw38yXqV+CPh1dnf+hJ+kJLLhsGN/pIJpueL7dgMN7HOv
 uXg3rn+vHLiybEp4ScJmmrsOF/aFLAXRRLi20NZeuB29THaxJJYaENKvOadtb+lR
 AmoeskMXsagX46NXoELKavNw837JtPSH93xfaTA4D6GZSsFjhamS71qvxgRuTDIC
 S0PlVe9pZQ0Nl1XE5j3MzdNxfx0qJoAIMDNK24cKyfIikszWBEqCMssYd5442LdI
 iJMR7FSEcg23E+6v34fo+8fRZ6/9NduQZkeoIpUuPXgAMel1cMobwuOm5HZ0rYF4
 XLXZuQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400f90rc92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 19:55:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45SJt42L013084
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 19:55:04 GMT
Received: from [10.110.112.228] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 12:55:00 -0700
Message-ID: <e4f397c5-e266-44ff-b358-f0bd51bc52a0@quicinc.com>
Date: Fri, 28 Jun 2024 12:55:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <owkerbnbenzwtnu2kbbas5brhnak2e37azxtzezmw3hb6mficq@ffpqrqglmp4c>
 <cf6c2526-ba12-4627-b4e9-20ce5b4d175c@quicinc.com>
 <c7bcc2ae-eb27-4acc-b18c-8cb584b4d616@lunn.ch>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <c7bcc2ae-eb27-4acc-b18c-8cb584b4d616@lunn.ch>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Ij94Dj5NvOC2j9lvQX6ynyrM829I5u-W
X-Proofpoint-GUID: Ij94Dj5NvOC2j9lvQX6ynyrM829I5u-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_15,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=800 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280149
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org, Bhupesh
 Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell
 King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] net: stmmac: Add interconnect
	support
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



On 6/26/2024 5:14 PM, Andrew Lunn wrote:
> On Wed, Jun 26, 2024 at 04:38:34PM -0700, Sagar Cheluvegowda wrote:
>>
>>
>> On 6/26/2024 7:54 AM, Andrew Halaney wrote:
>>> On Tue, Jun 25, 2024 at 04:49:29PM GMT, Sagar Cheluvegowda wrote:
>>>> Add interconnect support to vote for bus bandwidth based
>>>> on the current speed of the driver.This change adds support
>>>> for two different paths - one from ethernet to DDR and the
>>>> other from Apps to ethernet.
>>>
>>> "APPS" is a qualcomm term, since you're trying to go the generic route
>>> here maybe just say CPU to ethernet?
>>>
>> I can update this in my next patch.
>>
>> Sagar
> 
> Please trim emails when replying to just the needed context.
> 
> Also, i asked what Apps meant in response to an earlier version of
> this patch. I think you ignored me....
> 
>        Andrew


Thanks Andrew, i will take a note of it when replying next time.

Regarding the Apps part, i had replied to your email on 06/21.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
