Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A55BE93F9EB
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39E35C78001;
	Mon, 29 Jul 2024 15:58:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4D8FC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jul 2024 02:01:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A0Cmi7003666;
 Wed, 10 Jul 2024 02:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 95OMNfa2bp8hyoNxG6N/Ew6YeWI3rkWHyKTmpUTTtP0=; b=BcpIw3eaURYjnBfI
 Q7TjdGnggC0xHTR7FhmfD60kSuyq2o4hzHMx0ESzDWUftHewEg8ECSxKTurI9G0l
 yUu6Qc+nZwfypEF7xNI5LjSUDNkhLj9vo27Ib2XZvCIt35EmWsOVOWvtX82kqqJJ
 zSRKS119TBFJrzRBiN3Dqap4IHShzMYAD55vaGfvQNehzBTOSQ838q/mr35+yodd
 NXZIDEFOROkCSNUDAe9M0rSX9r0Fc5rIJtmcPm5QggJPC/HTrHzu6kYx3P4vhMaf
 H5dBZZ0PxtCFxSqBOEhD5/S5T0/1xDFZV7WblTolER/9J988SubjASEa8YRqc2m8
 L0QEDQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwqynj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jul 2024 02:01:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46A21F86030913
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jul 2024 02:01:15 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 19:01:07 -0700
Message-ID: <0f571c5f-db8d-4951-9e4f-cc1246ed4167@quicinc.com>
Date: Wed, 10 Jul 2024 10:01:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Halaney <ahalaney@redhat.com>, Tengfei Fan
 <quic_tengfan@quicinc.com>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
 <20240709-add_qcs9100_ethqos_compatible-v2-2-ba22d1a970ff@quicinc.com>
 <g7htltug74hz2iyosyn3rbo6wk3zu54ojooshjfkblcivvihv2@vj5vm2nbcw7x>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <g7htltug74hz2iyosyn3rbo6wk3zu54ojooshjfkblcivvihv2@vj5vm2nbcw7x>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mg8id_SMcxa-Q12v0K26zxL_kL-xh26U
X-Proofpoint-ORIG-GUID: mg8id_SMcxa-Q12v0K26zxL_kL-xh26U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_12,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100014
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] net: stmmac: dwmac-qcom-ethqos:
 add support for emac4 on qcs9100 platforms
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



On 7/9/2024 10:40 PM, Andrew Halaney wrote:
> These patches are for netdev, so you need to follow the netdev
> rules, i.e. the subject should be have [PATCH net-next] in it, etc as
> documented over here:
> 
>     https://docs.kernel.org/process/maintainer-netdev.html#tl-dr
> 

Thx very much for the detailed information.

> On Tue, Jul 09, 2024 at 10:13:18PM GMT, Tengfei Fan wrote:
>> QCS9100 uses EMAC version 4, add the relevant defines, rename the
>> has_emac3 switch to has_emac_ge_3 (has emac greater-or-equal than 3)
>> and add the new compatible.
> 
> This blurb isn't capturing what's done in this change, please make it
> reflect the patch.

There is a similar comments on [1] on another patch. Similar comments
should be taken care of next time.
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-30-quic_tengfan@quicinc.com/
> 
> Thanks,
> Andrew
> 

-- 
Thx and BRs,
Aiqun(Maria) Yu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
