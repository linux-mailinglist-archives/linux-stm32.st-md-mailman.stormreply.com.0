Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8897A91B3
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 08:23:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 154BBC6C829;
	Thu, 21 Sep 2023 06:23:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8C93C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Sep 2023 18:17:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38KIF1ob000901; Wed, 20 Sep 2023 18:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tiJNMK96sISeNic9l/ccZjrYr/lRLHKhPAPSf/CuSJ8=;
 b=bNa0Xoeg6PhkRuWRSVDLhJHw+zbt5CTrxkJEpn9OLIIheTjcdvIkFJCNjJtJ01AEi8Am
 96AikriGN2ok+PgCQs9V7TZ4SI+Q0F9oZK79AP4l286Cl//crRvF51X7y1jf81ZsBYmJ
 LEAtn15kJerIpbAFNi7tiOzlzf3acXussLIJ5kMuAkQ/QRsTql0FW6njHhCBLrykSfNF
 NGyZpqRglhYL2VeAyGe1WxlYTSgbh17UsNci97jgCxg42vekPfjp1tG3PGwM/suSnqG/
 V5/oaej3D35+6d3QC3JNn7mSaU1Mxy0GfbahuLPtUDm9x+nLFizfpNnFWyfx4ppEXkgs qw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t78upm1eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Sep 2023 18:16:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38KIGtdY028858
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Sep 2023 18:16:55 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 20 Sep
 2023 11:16:55 -0700
Message-ID: <b7f9728d-b17f-4869-a862-c86ada8a0c25@quicinc.com>
Date: Wed, 20 Sep 2023 11:16:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wu Yunchuan <yunchuan@nfschina.com>, <loic.poulain@linaro.org>,
 <kvalo@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
References: <20230919044925.523403-1-yunchuan@nfschina.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230919044925.523403-1-yunchuan@nfschina.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vy7f_bbCQtXatua65eoffe48_FcEQy_O
X-Proofpoint-ORIG-GUID: vy7f_bbCQtXatua65eoffe48_FcEQy_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_08,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=845 suspectscore=0
 spamscore=0 clxscore=1011 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200151
X-Mailman-Approved-At: Thu, 21 Sep 2023 06:23:20 +0000
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 wireless-next 3/9] wifi: wcn36xx:
 remove unnecessary (void*) conversions
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

On 9/18/2023 9:49 PM, Wu Yunchuan wrote:
> No need cast (void *) to other types such as (struct wcn36xx *),
> (struct wcn36xx_hal_update_scan_params_resp *), etc.
> 
> Signed-off-by: Wu Yunchuan <yunchuan@nfschina.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
