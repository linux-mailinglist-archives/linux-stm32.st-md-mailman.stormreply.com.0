Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B49D5491
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2024 22:16:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA486C7A835;
	Thu, 21 Nov 2024 21:16:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B0D6C7A833
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2024 21:16:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALAwsT9004461;
 Thu, 21 Nov 2024 21:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /1wFz0sib+rkY8LjdrazAJpAHhGV/iWll7dQQGBkm00=; b=BmM90W7qqh+Tw6q7
 uO7rHyWujFl/lPkTDWA6dHThxmEu7icE+NjyTkKNJs5xGy5Z9GLkgK92+1gErUbI
 o7obROwga7JfFvon12/V3PvDQklfyyV/zClgmdCimA4Aiak8O1kJVz7cFSI6M7kC
 ljVI4dv7l7nhj5keVsiiWx9dfFLK5npGG2C5lAtH46BVTiDXBtTLhMYqshB2Chgp
 RJhWvtymQni8fV7P4TNO1EfFf+fVk+ZQ1FJQwC3TaSEYdk3+1KZoPAcHhfYKNjoG
 sm81Gp+g+sAoq105nr/Ur3hPJBxflMk4CGHsvqs1/uoK8J444IfnXw7n6HflNPND
 WxWgpg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea74xgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2024 21:16:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALLGXTX027010
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2024 21:16:33 GMT
Received: from [10.111.176.168] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 13:16:33 -0800
Message-ID: <d72582f0-8262-439f-abe6-14b6352156ca@quicinc.com>
Date: Thu, 21 Nov 2024 13:16:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: guanjing <guanjing@cmss.chinamobile.com>, Gatien CHEVALLIER
 <gatien.chevallier@foss.st.com>, Alexandre TORGUE
 <alexandre.torgue@foss.st.com>, <mcoquelin.stm32@gmail.com>
References: <20241109055049.269163-1-guanjing@cmss.chinamobile.com>
 <cfb1caed-9402-4148-831d-57c50bdf6a27@foss.st.com>
 <1179b3a6-e430-4d9a-8f86-470e8cbe5738@foss.st.com>
 <bee10978-ce12-4813-957d-2d1288f49815@cmss.chinamobile.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <bee10978-ce12-4813-957d-2d1288f49815@cmss.chinamobile.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OUoS1DW_6jEoAX_ryS0u1XDZrp7DfqUH
X-Proofpoint-ORIG-GUID: OUoS1DW_6jEoAX_ryS0u1XDZrp7DfqUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=828
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210159
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] firewall: remove misplaced semicolon
 fromstm32_firewall_get_firewall
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

On 11/21/2024 1:19 AM, guanjing wrote:
> Thanks for your advice. I apologize for the omission. :)

Please avoid top-posting

https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
