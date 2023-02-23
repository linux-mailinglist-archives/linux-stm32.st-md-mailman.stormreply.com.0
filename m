Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA756A0AC9
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Feb 2023 14:41:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F0EEC65E73;
	Thu, 23 Feb 2023 13:41:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56B83C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 13:41:15 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NB49VQ007672; Thu, 23 Feb 2023 13:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=82Cm2OJLUa5tC82jiSU/FDmSZajSkQCBQdZUKPF+xWU=;
 b=P7NwWtQVmvqSSJIKY2pJ1tVtmae8fhNAgamEQp5glYJ/dsnym6KE9JEc3EtHtYyPICro
 QgFEnSW2kZDaMMqJvn626rGdRQAJWprTRNm/Rk9EccflXzUYUrSGh+qbBm/nAaHPENYT
 /Q4Gxv6xEh0VrUglyFHwLcudQBolslihyq1V6BTL9z66RU+eCkFjSvm8di5rH8Xlz8nS
 Xd6VchXLKxJfCkRJrO6CwEhaY3PkgBTTt391DZxf14DrZZbmIxw/OatS19MNKSywrUMH
 VreOXuJnJMwtXEhopNVlwgQcxZUZJPcS1C7F+skWK63esQouqxYe4ip+K7tKHWjV9lsY yA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwygpsfae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 13:41:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31NDf3j0014186
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 13:41:03 GMT
Received: from [10.239.133.9] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 23 Feb
 2023 05:41:01 -0800
Message-ID: <465477c5-98f2-ded7-cd1c-a946f7b3d260@quicinc.com>
Date: Thu, 23 Feb 2023 21:40:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mike Leach
 <mike.leach@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
References: <1dab6648-c177-17a7-0b36-821e21328753@quicinc.com>
 <bf14c6e2-71c4-2987-28c7-e8b51636a46f@arm.com>
 <CAJ9a7Vjyc-T+LjHtBBYO2MS15z1sVUYxQro_5YpZ9oGMiB0GZA@mail.gmail.com>
 <dad2f816-34b5-80d9-ad78-14d759ac45eb@quicinc.com>
 <87r0ugo61p.fsf@ubik.fi.intel.com>
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <87r0ugo61p.fsf@ubik.fi.intel.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: NKSZ9-lfV2YZMXeML_y6RdDDLGc_rIr3
X-Proofpoint-GUID: NKSZ9-lfV2YZMXeML_y6RdDDLGc_rIr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_08,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=928 mlxscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302230112
Cc: Coresight ML <coresight@lists.linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC] Add trig_ts function in STM to generate
 TRIG_TS packet periodically
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


On 2/23/2023 9:38 PM, Alexander Shishkin wrote:
> Jinlong Mao <quic_jinlmao@quicinc.com> writes:
>
>> On PC tool, it can show the logs from ETR in real time.
>>
>> When one small packet send from STM to ETR, it can be stuck between STM
>> and ETR.
>> When the packet stuck happens, it will be flushed to ETR only when some
>> other packets
>> generated from STM source or CTI flush commands are sent. If the time is
>> too long to wait
>> for next packets coming, user will consider that issue happens with
>> previous small packet.
>> And user's requirement is that packet from STM can be flushed to ETR
>> automatically instead
>> of sending commands manually.
>>
>> Is it appropriate to add a sysfs node for STM to generate the trigger
>> packet periodically for such case ?
> There's stm_heartbeat that will send a string via STM on a timer. It
> will come on its own channel, so your PC tool should be able to ignore
> it. Would that help?

Hi Alex,

It helps with my case.
How to implement it ?

Thanks
Jinlong Mao

>
> Regards,
> --
> Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
