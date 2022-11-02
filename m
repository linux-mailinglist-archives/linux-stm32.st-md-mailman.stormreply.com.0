Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C408615FDF
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Nov 2022 10:34:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 359A8C6411C;
	Wed,  2 Nov 2022 09:34:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B196FC6410F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Nov 2022 09:34:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A29XOvg023051; Wed, 2 Nov 2022 09:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xvhHTRLinGK22kcrKek3TiAroXbx/H/5wcK4HwrMd74=;
 b=nK+iJOCNjqHpUyHUUv2wlbaLGlvkvDkvY2vQxfC/HbqsnLcCenFbmf+SWGoWUYHjl7tK
 4bOQtVcDIXvShqCui/68nEewW8V8vBpTzOgyGX9dlGXguwdwSpu6FMsBKtJd+c5AjX0W
 jEsokuvE9gEmQ3LB/drUBZcQdfnoPeaSAiGALQNuRARCxqfwm27K2g1N/MCzilrHt0Ga
 DZXdCDvxMYtpRqRy/6GmAXZj51pp+RXLoJA7zmKZU8FwFj2JCagY+L0gk9MWOkfNcc80
 VqMArJwCwvEjszk/mAqThlC6/WHfoBJ7Iwv0kEs60NaziqOnEWgaNVhK3qC4ZzU6x44d Qw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kk7nfhtj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 09:34:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A29YLdn028484
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 2 Nov 2022 09:34:21 GMT
Received: from [10.253.74.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 2 Nov 2022
 02:34:18 -0700
Message-ID: <03d7c51d-4c86-ecab-d775-0e677ac73770@quicinc.com>
Date: Wed, 2 Nov 2022 17:34:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220418114658.6491-1-quic_jinlmao@quicinc.com>
 <61028345-234b-6e5e-6bd5-e10165dbdf52@quicinc.com>
In-Reply-To: <61028345-234b-6e5e-6bd5-e10165dbdf52@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: vaaZ_6CauvEKzhEQiyw9yBhjGm9U6LNP
X-Proofpoint-GUID: vaaZ_6CauvEKzhEQiyw9yBhjGm9U6LNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_06,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020056
Cc: linux-arm-msm@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-kernel@vger.kernel.org, Tao Zhang <quic_taozha@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, Hao Zhang <quic_hazha@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stm class: Fix double add issue when
	store source_link
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

SGkgYWxsLAoKUGxlYXNlIGhlbHAgdG8gcmV2aWV3IHRoaXMgcGF0Y2guCgpUaGFua3MKCkppbmxv
bmcgTWFvCgpPbiA1LzE2LzIwMjIgMzoxNCBQTSwgSmlubG9uZyBNYW8gd3JvdGU6Cj4gSGkgUmV2
aWV3ZXJzLAo+Cj4gQ291bGQgeW91IHBsZWFzZSBoZWxwIHRvIHJldmlldyB0aGlzIHBhdGNoID8K
Pgo+IFRoYW5rcwo+Cj4gSmlubG9uZyBNYW8KPgo+IE9uIDQvMTgvMjAyMiA3OjQ2IFBNLCBNYW8g
SmlubG9uZyB3cm90ZToKPj4gSWYgdHdvIHRocmVhZHMgc3RvcmUgdGhlIHNhbWUgc3RtIGRldmlj
ZSB0byBzdG1fc291cmNlX2xpbmsKPj4gYXQgdGhlIHNhbWUgdGltZSB3aGVuIHN0bS0+bGlua19s
aXN0IGlzIGVtcHR5LCBpdCBpcyBwb3NzaWJsZQo+PiB0aGF0IHN0bV9zb3VyY2VfbGlua19hZGQg
d2lsbCBiZSBjYWxsZWQgZm9yIGJvdGggb2YgdGhlc2UgdHdvCj4+IHRocmVhZHMuIFRoZW4gZG91
YmxlIGFkZCBpc3N1ZSBiZWxvdyB3aWxsIGhhcHBlbi4gQWRkIG11dGV4Cj4+IGxvY2sgZm9yIHN0
bV9zb3VyY2VfbGluayBkcm9wIGFuZCBzdG1fc291cmNlX2xpbmsgYWRkIHRvIGF2b2lkCj4+IHRo
aXMgcmFjZSBjb25kaXRpb24uCj4+Cj4+IFsgMTIuMzg2NTc5XVsgVDEwMjRdIGxpc3RfYWRkIGRv
dWJsZSBhZGQ6IG5ldz1mZmZmZmY4N2I3M2ViZDkwLAo+PiBwcmV2PWZmZmZmZjg3YjczZWJkOTAs
IG5leHQ9ZmZmZmZmYzAxMjczNzcwMC4KPj4gWyAxMi4zODY2NTddWyBUMTAyNF0gLS0tLS0tLS0t
LS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLQo+PiBbIDEyLjM4NjY3MV1bIFQxMDI0XSBrZXJuZWwg
QlVHIGF0IGxpYi9saXN0X2RlYnVnLmM6MzEhCj4+IFsgMTIuMzg4ODQ1XVsgVDEwMjRdIENQVTog
MiBQSUQ6IDEwMjQgQ29tbTogc2gKPj4gWyAxMi4zODkxNjJdWyBUMTAyNF0gQ2FsbCB0cmFjZToK
Pj4gWyAxMi4zODkxNzRdWyBUMTAyNF0gX19saXN0X2FkZF92YWxpZCsweDY4LzB4OTgKPj4gWyAx
Mi4zODkxOTldWyBUMTAyNF0gc3RtX3NvdXJjZV9saW5rX3N0b3JlKzB4Y2MvMHgzMTQgW3N0bV9j
b3JlXQo+PiBbIDEyLjM4OTIxM11bIFQxMDI0XSBkZXZfYXR0cl9zdG9yZSsweDM4LzB4OGMKPj4g
WyAxMi4zODkyMjhdWyBUMTAyNF0gc3lzZnNfa2Zfd3JpdGUrMHhhMC8weDEwMAo+PiBbIDEyLjM4
OTIzOV1bIFQxMDI0XSBrZXJuZnNfZm9wX3dyaXRlX2l0ZXIrMHgxYjAvMHgyZjgKPj4gWyAxMi4z
ODkyNTNdWyBUMTAyNF0gdmZzX3dyaXRlKzB4MzAwLzB4MzdjCj4+IFsgMTIuMzg5MjY0XVsgVDEw
MjRdIGtzeXNfd3JpdGUrMHg4NC8weDEyYwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZdWFuZmFuZyBa
aGFuZyA8cXVpY195dWFuZmFuZ0BxdWljaW5jLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTWFvIEpp
bmxvbmcgPHF1aWNfamlubG1hb0BxdWljaW5jLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvaHd0
cmFjaW5nL3N0bS9jb3JlLmMgfCA3ICsrKysrKy0KPj4gwqAgZHJpdmVycy9od3RyYWNpbmcvc3Rt
L3N0bS5owqAgfCAxICsKPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHd0cmFjaW5nL3N0bS9jb3Jl
LmMgYi9kcml2ZXJzL2h3dHJhY2luZy9zdG0vY29yZS5jCj4+IGluZGV4IDI3MTJlNjk5YmEwOC4u
ZTczYWM5NjFhY2IyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2h3dHJhY2luZy9zdG0vY29yZS5j
Cj4+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL3N0bS9jb3JlLmMKPj4gQEAgLTExNzEsMTEgKzEx
NzEsMTQgQEAgc3RhdGljIHNzaXplX3Qgc3RtX3NvdXJjZV9saW5rX3N0b3JlKHN0cnVjdCAKPj4g
ZGV2aWNlICpkZXYsCj4+IMKgwqDCoMKgwqAgc3RydWN0IHN0bV9kZXZpY2UgKmxpbms7Cj4+IMKg
wqDCoMKgwqAgaW50IGVycjsKPj4gwqAgK8KgwqDCoCBtdXRleF9sb2NrKCZzcmMtPmxpbmtfbXV0
ZXgpOwo+PiDCoMKgwqDCoMKgIHN0bV9zb3VyY2VfbGlua19kcm9wKHNyYyk7Cj4+IMKgIMKgwqDC
oMKgwqAgbGluayA9IHN0bV9maW5kX2RldmljZShidWYpOwo+PiAtwqDCoMKgIGlmICghbGluaykK
Pj4gK8KgwqDCoCBpZiAoIWxpbmspIHsKPj4gK8KgwqDCoMKgwqDCoMKgIG11dGV4X2xvY2soJnNy
Yy0+bGlua19tdXRleCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4g
K8KgwqDCoCB9Cj4+IMKgIMKgwqDCoMKgwqAgcG1fcnVudGltZV9nZXQoJmxpbmstPmRldik7Cj4+
IMKgIEBAIC0xMTg1LDYgKzExODgsNyBAQCBzdGF0aWMgc3NpemVfdCBzdG1fc291cmNlX2xpbmtf
c3RvcmUoc3RydWN0IAo+PiBkZXZpY2UgKmRldiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIC8qIG1h
dGNoZXMgdGhlIHN0bV9maW5kX2RldmljZSgpIGFib3ZlICovCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBzdG1fcHV0X2RldmljZShsaW5rKTsKPj4gwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgbXV0ZXhf
dW5sb2NrKCZzcmMtPmxpbmtfbXV0ZXgpOwo+PiDCoCDCoMKgwqDCoMKgIHJldHVybiBlcnIgPyA6
IGNvdW50Owo+PiDCoCB9Cj4+IEBAIC0xMjUxLDYgKzEyNTUsNyBAQCBpbnQgc3RtX3NvdXJjZV9y
ZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRldmljZSAKPj4gKnBhcmVudCwKPj4gwqAgwqDCoMKgwqDC
oCBzdG1fb3V0cHV0X2luaXQoJnNyYy0+b3V0cHV0KTsKPj4gwqDCoMKgwqDCoCBzcGluX2xvY2tf
aW5pdCgmc3JjLT5saW5rX2xvY2spOwo+PiArwqDCoMKgIG11dGV4X2luaXQoJnNyYy0+bGlua19t
dXRleCk7Cj4+IMKgwqDCoMKgwqAgSU5JVF9MSVNUX0hFQUQoJnNyYy0+bGlua19lbnRyeSk7Cj4+
IMKgwqDCoMKgwqAgc3JjLT5kYXRhID0gZGF0YTsKPj4gwqDCoMKgwqDCoCBkYXRhLT5zcmMgPSBz
cmM7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9zdG0vc3RtLmggYi9kcml2ZXJz
L2h3dHJhY2luZy9zdG0vc3RtLmgKPj4gaW5kZXggYTliZTQ5ZmM3YTZiLi42MGI4MTRjYzAwZTAg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaHd0cmFjaW5nL3N0bS9zdG0uaAo+PiArKysgYi9kcml2
ZXJzL2h3dHJhY2luZy9zdG0vc3RtLmgKPj4gQEAgLTc5LDYgKzc5LDcgQEAgdm9pZCBzdG1fcHV0
X2RldmljZShzdHJ1Y3Qgc3RtX2RldmljZSAqc3RtKTsKPj4gwqAgc3RydWN0IHN0bV9zb3VyY2Vf
ZGV2aWNlIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlwqDCoMKgwqDCoMKgwqAgZGV2Owo+
PiDCoMKgwqDCoMKgIHN0cnVjdCBzdG1fc291cmNlX2RhdGHCoMKgwqAgKmRhdGE7Cj4+ICvCoMKg
wqAgc3RydWN0IG11dGV4wqDCoMKgwqDCoMKgwqAgbGlua19tdXRleDsKPj4gwqDCoMKgwqDCoCBz
cGlubG9ja190wqDCoMKgwqDCoMKgwqAgbGlua19sb2NrOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBz
dG1fZGV2aWNlIF9fcmN1wqDCoMKgICpsaW5rOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBsaXN0X2hl
YWTCoMKgwqAgbGlua19lbnRyeTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
