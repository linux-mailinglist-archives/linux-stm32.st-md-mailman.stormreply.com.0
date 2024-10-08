Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29341994834
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2024 14:07:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6C81C7128F;
	Tue,  8 Oct 2024 12:07:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F49BC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2024 12:07:32 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4988IBAf001669;
 Tue, 8 Oct 2024 12:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8pZorrKXub6AQq6yToKSpksBjU3BFYCO9H+0Yb6Ceys=; b=cWcst3/J89CzOzqx
 wAvlvxOmN1WSrxmOkTIlDr/pkHgcA0nqARVRloTWS/1JaU15CXYDZXVJYrNk548N
 T8SqWY1w/n63N8ZtGJthbmd8NgyfSnSfHQeDVaGWxq31eFoJoe1NChwkF9jAc65e
 hubNVNNC61LOzN3PCYT6JNctQ0NRy+u3tCSHFLbTmcNxiIkehufh76qsH52YB7NJ
 l3JCKq2UP8B8nwEEd4YiYzqGjNWRDgTxIjGBymBuzqogUn9mZaRlDO9xgMTKwPUr
 Gsqz2Wxm4u3Y+MzCy9H6YgN5fRFJqDeHKyUibZTMNgvkPdVtGeKIKFV0lQeOAw/h
 hVDtmQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42513u0nwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2024 12:07:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498C79eH015515
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Oct 2024 12:07:10 GMT
Received: from [10.50.59.162] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 05:07:01 -0700
Message-ID: <999ff0a1-1f8c-4220-a9d9-6dc1e0bddda6@quicinc.com>
Date: Tue, 8 Oct 2024 17:36:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>, Suraj Jaiswal <quic_jsuraj@quicinc.com>
References: <20240910124841.2205629-1-quic_jsuraj@quicinc.com>
 <20240910124841.2205629-2-quic_jsuraj@quicinc.com>
 <20240911165140.566d9fdb@kernel.org>
Content-Language: en-US
From: Sarosh Hasan <quic_sarohasa@quicinc.com>
In-Reply-To: <20240911165140.566d9fdb@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cr1C_KImqt6DsK2c9SePOldVk5UplyB_
X-Proofpoint-GUID: cr1C_KImqt6DsK2c9SePOldVk5UplyB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=657 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080076
Cc: Rob Herring <robh@kernel.org>, kernel@quicinc.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Prasad Sodagudi <psodagud@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: allocate separate page
	for buffer
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



On 9/12/2024 5:21 AM, Jakub Kicinski wrote:
> On Tue, 10 Sep 2024 18:18:41 +0530 Suraj Jaiswal wrote:
>> Currently for TSO page is mapped with dma_map_single()
>> and then resulting dma address is referenced (and offset)
>> by multiple descriptors until the whole region is
>> programmed into the descriptors.
>> This makes it possible for stmmac_tx_clean() to dma_unmap()
>> the first of the already processed descriptors, while the
>> rest are still being processed by the DMA engine. This leads
>> to an iommu fault due to the DMA engine using unmapped memory
>> as seen below:
>>
>> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
>> iova=0xfc401000, fsynr=0x60003, cbfrsynra=0x121, cb=38
>>
>> Descriptor content:
>>      TDES0       TDES1   TDES2   TDES3
>> 317: 0xfc400800  0x0     0x36    0xa02c0b68
>> 318: 0xfc400836  0x0     0xb68   0x90000000
>>
>> As we can see above descriptor 317 holding a page address
>> and 318 holding the buffer address by adding offset to page
>> addess. Now if 317 descritor is cleaned as part of tx_clean()
>> then we will get SMMU fault if 318 descriptor is getting accessed.
> 
> The device is completing earlier chunks of the payload before the entire
> payload is sent? That's very unusual, is there a manual you can quote
> on this?
Here if as part of tx clean if first descriptor is cleaned before tx complete of next
descriptor is done then we are running into this issue.
for non tso case if we see xmit code has logic to alloc different page for each fragments and same logic
we are trying for TSO case.

>> To fix this, let's map each descriptor's memory reference individually.
>> This way there's no risk of unmapping a region that's still being
>> referenced by the DMA engine in a later descriptor.
> 
> This adds overhead. Why not wait with unmapping until the full skb is
> done? Presumably you can't free half an skb, anyway.
> 
> Please added Fixes tag and use "PATCH net" as the subject tag/prefix.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
