Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F0F9CD4DD
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2024 02:08:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F085C7A833;
	Fri, 15 Nov 2024 01:08:47 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A739FC7A832
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2024 01:08:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEHIXlD028167;
 Fri, 15 Nov 2024 01:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zs+u/WBcKqFMpAZC4G1CWeKDGTHkGvE+KuzQ9IOGNa4=; b=AO8n7byDtsJ8Q4sT
 GxqOuotihj59zU/q/x6YXQZvlV18829dnnUkMDFfNr3AnErl8KT9WEPhg1jo413Q
 WJIwWaP6E70EUDSuBs5wAo13u+GsYsC2awJnya+rU4GpRh1UwR0ukt+3ZVEgXBVn
 SS4vqwM9PDDJth/0KBVGt5xtG7BuaCpAi/EEYMafDJ5FSO7S6uLrnxCeL5cnqaQR
 IitYhZoRG2okq2tSGKsv2GEDxzgHaLXURw8II1ctT/ehMFASq0hfrs0MsCBwtxQF
 m3/gx4PHJ8TfQXvb8FqENtfjYwyp/7k0kFgbZqRx1QevGYnuQo7KG4nSPP8nlS33
 TLC9SA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w66gvhp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2024 01:08:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AF18P0p015188
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2024 01:08:25 GMT
Received: from [10.111.171.131] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 14 Nov
 2024 17:08:20 -0800
Message-ID: <2ac308d7-35be-463e-9838-3bbedc2a4d68@quicinc.com>
Date: Thu, 14 Nov 2024 17:08:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241112-fix_qcom_ethqos_to_support_xgmac-v1-1-f0c93b27f9b2@quicinc.com>
 <55914c2a-95d8-4c40-a3ea-dfa6b2aeb1dd@lunn.ch>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <55914c2a-95d8-4c40-a3ea-dfa6b2aeb1dd@lunn.ch>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VpAiDIwJg0qQK9JKi3waIpj8WD7-13GN
X-Proofpoint-ORIG-GUID: VpAiDIwJg0qQK9JKi3waIpj8WD7-13GN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150009
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org, Eric
 Dumazet <edumazet@google.com>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew
 Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable
	support for XGMAC
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



On 11/13/2024 6:51 PM, Andrew Lunn wrote:
> On Tue, Nov 12, 2024 at 06:08:10PM -0800, Sagar Cheluvegowda wrote:
>> All Qualcomm platforms have only supported EMAC version 4 until
>> now whereas in future we will also be supporting XGMAC version
>> which has higher capabilities than its peer. As both has_gmac4
>> and has_xgmac fields cannot co-exist, make sure to disable the
>> former flag when has_xgmac  is enabled.
> 
> If you say they are mutually exclusive, how can it happen that both
> are enabled?
> 
> To me, this feels like you are papering over a bug somewhere else.
> 
> 	Andrew


We can set either has_gmac4 or has_xgmac flags by using below
dtsi properties as well. But since Qualcomm only supported
GMAC4 version in all of its chipsets until now, we had enabled
has_gmac4 flag by default within dwmac_qcom_ethqos.c instead
of adding any of the below entries in the dtsi. But this will
create problem for us as we start supporting Xgmac version
in the future, so we are trying to add this change so that
our driver can support Xgmac version when "snps,dwxgmac" is 
defined in the dtsi and we are keeping the default supported
configuration as gmac4.


	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
		plat->has_gmac4 = 1;
		plat->has_gmac = 0;
		plat->pmt = 1;
		if (of_property_read_bool(np, "snps,tso"))
			plat->flags |= STMMAC_FLAG_TSO_EN;
	}


	if (of_device_is_compatible(np, "snps,dwxgmac")) {
		plat->has_xgmac = 1;
		plat->pmt = 1;
		if (of_property_read_bool(np, "snps,tso"))
			plat->flags |= STMMAC_FLAG_TSO_EN;
	}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
