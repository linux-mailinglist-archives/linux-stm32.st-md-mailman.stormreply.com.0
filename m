Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D648D919B2C
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 01:36:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80F80C6DD9F;
	Wed, 26 Jun 2024 23:36:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4EBEC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 23:36:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfRoo023296;
 Wed, 26 Jun 2024 23:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DaIdwceZu4nuXnSsMGfpwT+4Ee0Fw8Smr8d9oxrxyU8=; b=Rkgxf0sqR3YuA6mM
 UDGPCp47whsjqbycreP04dMX36OD1IGD7pTe6f+jMu/c1kILp9M2tgoAnVkpKFnC
 +GyKonBL/X128PJ1pLKp1J/Yb0VUJHx+J0ZR4Iqt7ojD9PswvFtb7nxgt4FflfDG
 xitQMnOOWiKbn52wQ2hLgipP01wQft83vyyY4nK0WKB7VHIfi04fxJWm3Qx2wxoH
 sEbfvUSOtRNErI0TRoVJkpjSHpfTSJMx2/bY7pY3SF6uljsZgTPVDLasav4l8CZa
 FJWGD2vOXhfPukhogJ9XR1hiT/yaOgyAcD27eU5YNJM+toRUPVlac9vBcNxaXNA4
 FJ2urg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywpu1acss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 23:36:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45QNaAPk025349
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 23:36:10 GMT
Received: from [10.110.22.187] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 16:36:07 -0700
Message-ID: <81e97c36-e244-4e94-b752-b06334a06db0@quicinc.com>
Date: Wed, 26 Jun 2024 16:36:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <4123b96c-ae1e-4fdd-aab2-70478031c59a@lunn.ch>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <4123b96c-ae1e-4fdd-aab2-70478031c59a@lunn.ch>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1FgnjLdabwM53gD29XBkYuQ--CMtzPEZ
X-Proofpoint-ORIG-GUID: 1FgnjLdabwM53gD29XBkYuQ--CMtzPEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_15,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=755 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260174
Cc: Rob Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Jakub
 Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA2LzI2LzIwMjQgNjowNyBBTSwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+ICsJcGxhdC0+YXhp
X2ljY19wYXRoID0gZGV2bV9vZl9pY2NfZ2V0KCZwZGV2LT5kZXYsICJheGkiKTsKPj4gKwlpZiAo
SVNfRVJSKHBsYXQtPmF4aV9pY2NfcGF0aCkpIHsKPj4gKwkJcmV0ID0gKHZvaWQgKilwbGF0LT5h
eGlfaWNjX3BhdGg7Cj4gCj4gQ2FzdGluZwl0byBhIHZvaWQgKiBzZWVtcyBvZGQuIEVSUl9QVFIo
KT8KPiAKPiAJQW5kcmV3CgpUaGUgb3V0cHV0IG9mIGRldm1fb2ZfaWNjX2dldCBpcyBhIHBvaW50
ZXIgb2YgdHlwZSBpY2NfcGF0aCwKaSBhbSBnZXR0aW5nIGJlbG93IHdhcm5pbmcgd2hlbiBpIHRy
eSB0byBFUlJfUFRSIGluc3RlYWQgb2YgVm9pZCoKYXMgRVJSX1BUUiB3aWxsIHRyeSB0byBjb252
ZXJ0IGEgbG9uZyBpbnRlZ2VyIHRvIGEgVm9pZCouCgoid2FybmluZzogcGFzc2luZyBhcmd1bWVu
dCAxIG9mIOKAmEVSUl9QVFLigJkgbWFrZXMgaW50ZWdlciBmcm9tIHBvaW50ZXIgd2l0aG91dCBh
IGNhc3QiCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
