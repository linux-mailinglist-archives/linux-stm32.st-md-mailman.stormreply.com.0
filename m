Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEBA28347
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 05:14:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EB4DC78F87;
	Wed,  5 Feb 2025 04:14:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A572C78F86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 04:14:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514IVN1t000749;
 Wed, 5 Feb 2025 04:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P778zeXPqK8IHeFPldAlNHdfFiUxBHlLXBclxDabM3s=; b=KiOTAqLF33D+9+Ba
 mdVqVGZB3GWgPs2OaQ9Limarbc/Sgg3PUvKv1iIlka+jUjxRDKBnfYxdnlknVtsj
 oCf6ysaehSn+yLnayLUUy6Gg5NvMt5MGmDyEDbd0KaAN9pMWVhGkBwFKyH7MnjmR
 iOIzstScjblqdLFJzLSuMtevC/IAu/DdADBajuVlxp3KVEyy18j05ZstpmNLzvZB
 e/PoqJB8h+u4b3H2x5f0NJgN9Rhvst2dYPgdf1uUoQ8fO2bR/Sf4I8/Cb1URrYJi
 QYCRvqGNjb8Q5sh+tad9smEVgfX3zOzuMVOnO0DiaWaCSJIRpUPxo6smpsUmXEm6
 miW8yg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kr8e12cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Feb 2025 04:13:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5154DebO015975
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Feb 2025 04:13:40 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 20:13:35 -0800
Message-ID: <33302e34-2e13-4bda-ae44-4c111167dde5@quicinc.com>
Date: Wed, 5 Feb 2025 12:13:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@linaro.org>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
 <20250131163617.1730505-1-james.clark@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <20250131163617.1730505-1-james.clark@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: l58KZdGSygMb5zI0sk4Vd4pcoJhnuKF_
X-Proofpoint-ORIG-GUID: l58KZdGSygMb5zI0sk4Vd4pcoJhnuKF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_01,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 suspectscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502050029
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 quic_jinlmao@quicinc.com, alexander.shishkin@linux.intel.com,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 suzuki.poulose@arm.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 quic_tingweiz@quicinc.com, linux-arm-kernel@lists.infradead.org,
 mike.leach@linaro.org
Subject: Re: [Linux-stm32] [PATCH 0/3] coresight: Alloc trace ID after
	building the path
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



On 2/1/2025 12:36 AM, James Clark wrote:
> Proof of concept to support CTCU device. Applies to Jie's patchset in
> the parent email. I think this would be a good simplification, it
> removes some code and makes things a bit clearer, and works for both the
> old and new CTCU requirements. It will require merging into the parent
> patchset somehow as it undoes some of those changes.
Hi, James

I tested the patch series and it works well.

Can I combine these patchsets with mine with co-developed tag?
Or are you prefer to submit them independently?

I believe it would be easier to read if we combined the codes together.

Thanks,
Jie

> 
> James Clark (3):
>    coresight: Don't save handle in path
>    coresight: Export coresight_get_sink()
>    coresight: Alloc trace ID after building the path
> 
>   drivers/hwtracing/coresight/coresight-core.c  | 107 +++++++++++++-----
>   drivers/hwtracing/coresight/coresight-dummy.c |   9 +-
>   drivers/hwtracing/coresight/coresight-etb10.c |   8 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  |  20 ++--
>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>   .../coresight/coresight-etm3x-core.c          |  84 ++------------
>   .../coresight/coresight-etm3x-sysfs.c         |   3 +-
>   .../coresight/coresight-etm4x-core.c          |  83 ++------------
>   .../coresight/coresight-etm4x-sysfs.c         |   4 +-
>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>   drivers/hwtracing/coresight/coresight-priv.h  |  17 +--
>   drivers/hwtracing/coresight/coresight-stm.c   |   5 +-
>   drivers/hwtracing/coresight/coresight-sysfs.c |   6 +-
>   .../hwtracing/coresight/coresight-tmc-etf.c   |   9 +-
>   .../hwtracing/coresight/coresight-tmc-etr.c   |  13 +--
>   drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
>   drivers/hwtracing/coresight/coresight-tpda.c  |   3 +-
>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>   drivers/hwtracing/coresight/coresight-tpiu.c  |   2 +-
>   drivers/hwtracing/coresight/coresight-trbe.c  |   4 +-
>   drivers/hwtracing/coresight/ultrasoc-smb.c    |   8 +-
>   include/linux/coresight.h                     |  25 +++-
>   22 files changed, 159 insertions(+), 258 deletions(-)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
