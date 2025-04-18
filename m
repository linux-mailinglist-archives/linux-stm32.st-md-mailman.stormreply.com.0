Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B63A95F56
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 09:27:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B57EDC78F9D;
	Tue, 22 Apr 2025 07:27:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94733CFAC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 13:17:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2PFO0008123;
 Fri, 18 Apr 2025 13:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 m9D8vUJMZiZvxPh0ECvIefj34JxtipJ5vMqGMNe+u5M=; b=hxGQwJ/OzAb6bLah
 B2I3KmvKr0VZJ7UgkgSUUZSUl8pZGHV3CYMSg4607KJwoPZrJJhcqrvYyQpb7yLs
 T16DbgUzpZWfhXcs04YnnqUV3dTaHE/Kkx9h8ajLQKdI8tMpjm0oQST0tU9lvPgS
 jDjE7CzAtMwTYx/hC2GU+vVxGqOxd0H36v//9I+hDvNKplgVgrMzmCRucPF3t/sQ
 UQb8/QIjC+psph5HqaPBCaRfG8LidOQMyozolw9HSJKBkmz+s3akA1HdrX6W0ERP
 dBOCmVad6kp1eX9FTuExNBtETAuXUneMML3xljJUB0ppY6gTDKV7D0c+8ECXD8eq
 OQXDAQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk9vfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Apr 2025 13:17:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53IDH4xO010429
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Apr 2025 13:17:04 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 06:17:01 -0700
Message-ID: <71dd2d77-9d20-4c8f-9735-a9256635a271@quicinc.com>
Date: Fri, 18 Apr 2025 18:46:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
 <72f49447-5c99-4028-90cf-3f5cc11e8b53@quicinc.com>
 <e148faa8-6ee0-45bd-8cd8-37ea42a1de2a@wanadoo.fr>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <e148faa8-6ee0-45bd-8cd8-37ea42a1de2a@wanadoo.fr>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=680250d1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8
 a=8IxrUdWRUM5EU-Lu3hgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 7uc3GSTUJv9cVxAOP8QcAl1G97B--19L
X-Proofpoint-ORIG-GUID: 7uc3GSTUJv9cVxAOP8QcAl1G97B--19L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180098
X-Mailman-Approved-At: Tue, 22 Apr 2025 07:27:00 +0000
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-spi@vger.kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-ospi: Fix an error handling
 path in stm32_ospi_probe()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA0LzE4LzIwMjUgNTo1MCBQTSwgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgo+IExlIDE4
LzA0LzIwMjUgw6AgMTQ6MDksIE11a2VzaCBLdW1hciBTYXZhbGl5YSBhIMOpY3JpdMKgOgo+Pgo+
Pgo+PiBPbiA0LzE4LzIwMjUgNDo1NyBQTSwgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgo+PiBb
Li4uXQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi1vc3BpLmMgYi9kcml2
ZXJzL3NwaS9zcGktc3RtMzItb3NwaS5jCj4+PiBpbmRleCA2NjgwMjIwOThiMWUuLjllYzk4MjM0
MDljYyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi1vc3BpLmMKPj4+ICsr
KyBiL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi1vc3BpLmMKPj4+IEBAIC05NjAsNiArOTYwLDEwIEBA
IHN0YXRpYyBpbnQgc3RtMzJfb3NwaV9wcm9iZShzdHJ1Y3QgCj4+PiBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4+PiDCoCBlcnJfcG1fZW5hYmxlOgo+Pj4gwqDCoMKgwqDCoCBwbV9ydW50aW1lX2Zv
cmNlX3N1c3BlbmQob3NwaS0+ZGV2KTsKPj4+IMKgwqDCoMKgwqAgbXV0ZXhfZGVzdHJveSgmb3Nw
aS0+bG9jayk7Cj4+PiArwqDCoMKgIGlmIChvc3BpLT5kbWFfY2h0eCkKPj4+ICvCoMKgwqDCoMKg
wqDCoCBkbWFfcmVsZWFzZV9jaGFubmVsKG9zcGktPmRtYV9jaHR4KTsKPj4gd2h5IGNhbid0IHlv
dSBtb3ZlIHRvIGRldm1fZG1hX3JlcXVlc3RfY2hhbiA/IE5vIG5lZWQgdG8gY2xlYW51cC4KPiAK
PiBVbmxlc3MgSSBtaXNzIHNvbWV0aGluZyBvYnZpb3VzLCB0aGlzIGZ1bmN0aW9uIGRvZXMgbm90
IGV4aXN0Lgo+IAo+IENKCj4gClllcywgWW91IGFyZSByaWdodC4gU2VlbXMgdGhlIHBhdGNoIGlz
IHlldCBub3QgbWVyZ2VkLgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMTE1MTYw
MjQ0LjExMDI4ODEtMS1jc29rYXMuYmVuY2VAcHJvbGFuLmh1L1QvIAoKZG1hOiBBZGQgZGV2bV9k
bWFfcmVxdWVzdF9jaGFuKCkKCkNhbiBpZ25vcmUgaXQgZm9yIG5vdy4KPj4+ICvCoMKgwqAgaWYg
KG9zcGktPmRtYV9jaHJ4KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGRtYV9yZWxlYXNlX2NoYW5uZWwo
b3NwaS0+ZG1hX2NocngpOwo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gwqAgfQo+Pgo+
Pgo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
