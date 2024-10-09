Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF690996699
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2024 12:10:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9727C6C841;
	Wed,  9 Oct 2024 10:10:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24F44CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 10:10:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4999p7bO006880;
 Wed, 9 Oct 2024 10:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eRCqpdgyku5vfU+giMUh7zvuCPuY8rnO6KeBTnScM0M=; b=a1Mp+NNM8p544DZp
 Elsnvb5owye02M36jQnRAx8bkFD2CUDeTWyM7ieLaqlvVZ0d0o6WDUjvwAXgQwbl
 HWWL7+FM8LJpqQqo6wceykQzenFWb62SDz8VU+1coJUDA7oOx6brEOBv7T29XdY1
 2JAi03UwrJdWhYw6B+UnvgidxZfBaKBpvE7kvo32lTKsZPUXR5pnkCra6y6oMDn+
 QUatioQ2OBlHpRnV/BBfB/7hOdqLxAQlBFsWj/Q2MBqWuWvCEyw3ZmCoiaW5iZdz
 vN4HuPLt7/Z436FKDm1XBeonlPmqVT7QTz0CDshY3w1A43tHgur9iSFE0FcNwlMu
 GycIUQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424cy7ewma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2024 10:10:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499AA3gv006978
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 9 Oct 2024 10:10:03 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 03:09:56 -0700
Message-ID: <e9b2bd7d-1e4f-4f0e-8be5-18033a8ec964@quicinc.com>
Date: Wed, 9 Oct 2024 18:09:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20241009095556.1754876-1-quic_jiegan@quicinc.com>
 <dc93578d-0ef6-4446-ae40-ad9f4ba6af15@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <dc93578d-0ef6-4446-ae40-ad9f4ba6af15@arm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mtbhRxcC0UxtiCWLGHcW7yXGFS_zwCWU
X-Proofpoint-GUID: mtbhRxcC0UxtiCWLGHcW7yXGFS_zwCWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 mlxlogscore=932 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090066
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jinlong Mao <quic_jinlmao@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Song Chai <quic_songchai@quicinc.com>, Tao Zhang <quic_taozha@quicinc.com>,
 coresight@lists.linaro.org, Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 RESEND 0/5] Coresight: Add Coresight
 TMC Control Unit driver
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



On 10/9/2024 6:00 PM, Suzuki K Poulose wrote:
> On 09/10/2024 10:55, Jie Gan wrote:
>> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous 
>> configuration
>> registers to control various features related to TMC ETR device.
>>
> 
> Please rebase this on the v6.12-rc1, which has the sink specific trace
> id allocation changes and drop the "Depends-on" tags on the patches
> which don't make any sense at all.
Sure, I will drop all depends-on tags and those patches already rebased 
on tag next-20241008.

Shall I resend those patches with V5 RESEND or V6 after fixed the issues?

> 
> 
> Suzuki
> 
> 

Thanks,
Jie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
