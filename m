Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B06056AE085
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Mar 2023 14:29:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6363FC65E5A;
	Tue,  7 Mar 2023 13:29:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48A54C6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Mar 2023 13:29:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327BklQt020723; Tue, 7 Mar 2023 13:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZDZ/jH5eBcghpL85l0fMXalPgbSG2EzY8vXOU3ZyTrQ=;
 b=TaizpaEpeZlXRkPz1KwnNktAciZnUT95HA0vhHKjzP5U7wUsoNnJSid2db15ZhjAMlUa
 4lh4mLe+V8UhtSL27W1bw5b+XCHT/HuF1AcGlNzCZEzLGcXwvXdTb3CW9QaeilZcXYc6
 q2nXZdYCm66nBAHq2FLmCLTZyV7X1L2vlHXtC4uDje6QUSLnLaD0uzcqVSu2VTfMLVHP
 3QgfaYz8Xz6n/l71QsiqqUEFVJB4ODe43977nd1QWeyqoshQ4ItnVfjlt/s1lQtCKOzy
 IMqSy7gXdfpHamyZVKDnBUQ6wa1iNTPy4rI5Zfzz6F+djKP8S3xD8voNqp9fzhX0MkpR CA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p5usx1kcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 13:28:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 327DSr6X012116
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Mar 2023 13:28:53 GMT
Received: from [10.239.133.9] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 7 Mar 2023
 05:28:50 -0800
Message-ID: <d04262c0-af6c-0f56-eb50-4a1cf5c2146b@quicinc.com>
Date: Tue, 7 Mar 2023 21:28:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230208124053.18533-1-quic_jinlmao@quicinc.com>
 <87lekfni5b.fsf@ubik.fi.intel.com>
 <37ec6af5-f71b-7a92-9c59-1c89595382bc@quicinc.com>
In-Reply-To: <37ec6af5-f71b-7a92-9c59-1c89595382bc@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BmHFUHbPoOz6F9EgQiP3-KGZkoqTfqeP
X-Proofpoint-GUID: BmHFUHbPoOz6F9EgQiP3-KGZkoqTfqeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_07,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 mlxlogscore=981 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070121
Cc: linux-arm-msm@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-kernel@vger.kernel.org, Tao
 Zhang <quic_taozha@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Hao Zhang <quic_hazha@quicinc.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stm: class: Add MIPI OST protocol support
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

T24gMy83LzIwMjMgOToyNiBQTSwgSmlubG9uZyBNYW8gd3JvdGU6Cgo+IEhpIEFsZXhhbmRlciwK
U29ycnksIGNvcnJlY3QgdGhlIHR5cG8uCj4KPiBPbiAzLzMvMjAyMyAyOjA1IEFNLCBBbGV4YW5k
ZXIgU2hpc2hraW4gd3JvdGU6Cj4+IE1hbyBKaW5sb25nIDxxdWljX2ppbmxtYW9AcXVpY2luYy5j
b20+IHdyaXRlczoKPj4KPj4+IEFkZCBNSVBJIE9TVCBwcm90b2NvbCBzdXBwb3J0IGZvciBzdG0g
dG8gZm9ybWF0IHRoZSB0cmFjZXMuCj4+IE1pc3NpbmcgYW4gZXhwbGFuYXRpb24gb2Ygd2hhdCBP
U1QgaXMsIHdoYXQgaXQncyB1c2VkIGZvciwgaG93IGl0IGlzCj4+IGRpZmZlcmVudCBmcm9tIHRo
ZSBTeVMtVCBhbmQgb3RoZXJzLgo+IEkgd2lsbCB1cGRhZSB0aGUgZXhwbGFuYXRpb24gaW4gbmV4
dCB2ZXJzaW9uLgo+Pgo+Pj4gRnJhbWV3b3JrIGNvcGllZCBmcm9tIGRyaXZlcnMvaHd0cmFjaW5n
L3N0bS5wLXN5cy10LmMgYXMgb2YKPj4gWW91IG1lYW4gc3RtL3Bfc3lzLXQuYy4gQWxzbywgaXQn
cyBub3QgYSBmcmFtZXdvcmssIGl0J3MgYSBkcml2ZXIuCj4KPiBUaGUgZHJpdmVyIHJlZmVycyB0
byBjb2RlIHN0cnVjdHVyZSBvZiBwX3N5cy10IGRyaXZlci4gU28sIGFkZCB0aGlzIAo+IGNvbW1l
bnRzIGFmdGVyCj4gaW50ZXJuYWwgcmV2aWV3Lgo+Cj4+Cj4+PiBjb21taXQgZDY5ZDVlODMxMTBm
ICgic3RtIGNsYXNzOiBBZGQgTUlQSSBTeVMtVCBwcm90b2NvbAo+Pj4gc3VwcG9ydCIpLgo+PiBX
aHkgaXMgdGhpcyBzaWduaWZpY2FudD8KPj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJh
Y2luZy9zdG0vcF9vc3QuYyAKPj4+IGIvZHJpdmVycy9od3RyYWNpbmcvc3RtL3Bfb3N0LmMKPj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjJjYTFhM2ZkYTU3
Zgo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvZHJpdmVycy9od3RyYWNpbmcvc3RtL3Bfb3N0
LmMKPj4+IEBAIC0wLDAgKzEsOTUgQEAKPj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5Cj4+PiArLyoKPj4+ICsgKiBDb3BpZWQgZnJvbSBkcml2ZXJzL2h3dHJhY2lu
Zy9zdG0ucC1zeXMtdC5jIGFzIG9mIGNvbW1pdCAKPj4+IGQ2OWQ1ZTgzMTEwZgo+Pj4gKyAqICgi
c3RtIGNsYXNzOiBBZGQgTUlQSSBTeVMtVCBwcm90b2NvbCBzdXBwb3J0IikuCj4+IFNhbWUgYXMg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+Pgo+PiBbLi4uXQo+Pgo+Pj4gKyNkZWZpbmUgT1NUX1RP
S0VOX1NUQVJUU0lNUExFICgweDEwKQo+Pj4gKyNkZWZpbmUgT1NUX1ZFUlNJT05fTUlQSTHCoMKg
wqDCoMKgwqDCoCAoMHgxMCA8PCA4KQo+Pj4gKyNkZWZpbmUgT1NUX0VOVElUWV9GVFJBQ0XCoMKg
wqDCoMKgwqDCoCAoMHgwMSA8PCAxNikKPj4+ICsjZGVmaW5lIE9TVF9DT05UUk9MX1BST1RPQ09M
wqDCoMKgwqDCoMKgwqAgKDB4MCA8PCAyNCkKPj4gVGhlc2UgY291bGQgdXNlIGFuIGV4cGxhbmF0
aW9uLgo+IEkgd2lsbCBhZGQgdGhlIGV4cGxhbmF0aW9uLgo+Pj4gKyNkZWZpbmUgREFUQV9IRUFE
RVIgKE9TVF9UT0tFTl9TVEFSVFNJTVBMRSB8IE9TVF9WRVJTSU9OX01JUEkxIHwgXAo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgT1NUX0VOVElUWV9GVFJBQ0UgfCBPU1RfQ09OVFJPTF9QUk9U
T0NPTCkKPj4gRG9lcyB0aGlzIG1lYW4gdGhhdCBldmVyeXRoaW5nIGlzIGZ0cmFjZT8gQmVjYXVz
ZSBpdCdzIG5vdC4KPiBPbmx5IGZ0cmFjZSBpcyBzdXBwb3J0ZWQgaW4gcF9vc3Qgbm93LiBPdGhl
ciBoZWFkZXIgdHlwZSB3aWxsIGJlIGFkZGVkIAo+IGxhdGVyLgo+Pgo+Pj4gKwo+Pj4gKyNkZWZp
bmUgU1RNX01BS0VfVkVSU0lPTihtYSwgbWkpwqDCoMKgICgobWEgPDwgOCkgfCBtaSkKPj4+ICsj
ZGVmaW5lIFNUTV9IRUFERVJfTUFHSUPCoMKgwqDCoMKgwqDCoCAoMHg1OTUzKQo+Pj4gKwo+Pj4g
K3N0YXRpYyBzc2l6ZV90IG5vdHJhY2Ugb3N0X3dyaXRlKHN0cnVjdCBzdG1fZGF0YSAqZGF0YSwK
Pj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc3RtX291dHB1dCAqb3V0cHV0LCB1bnNpZ25lZCBp
bnQgY2hhbiwKPj4+ICvCoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFyICpidWYsIHNpemVfdCBjb3Vu
dCkKPj4+ICt7Cj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBjID0gb3V0cHV0LT5jaGFubmVsICsg
Y2hhbjsKPj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IG0gPSBvdXRwdXQtPm1hc3RlcjsKPj4+ICvC
oMKgwqAgY29uc3QgdW5zaWduZWQgY2hhciBuaWwgPSAwOwo+Pj4gK8KgwqDCoCB1MzIgaGVhZGVy
ID0gREFUQV9IRUFERVI7Cj4+PiArwqDCoMKgIHU4IHRyY19oZHJbMjRdOwo+Pj4gK8KgwqDCoCBz
c2l6ZV90IHN6Owo+Pj4gKwo+Pj4gK8KgwqDCoCAvKgo+Pj4gK8KgwqDCoMKgICogU1RQIGZyYW1p
bmcgcnVsZXMgZm9yIE9TVCBmcmFtZXM6Cj4+PiArwqDCoMKgwqAgKsKgwqAgKiB0aGUgZmlyc3Qg
cGFja2V0IG9mIHRoZSBPU1QgZnJhbWUgaXMgbWFya2VkOwo+Pj4gK8KgwqDCoMKgICrCoMKgICog
dGhlIGxhc3QgcGFja2V0IGlzIGEgRkxBRy4KPj4gV2hpY2ggaW4geW91ciBjYXNlIGlzIGFsc28g
dGltZXN0YW1wZWQuCj4gSSB3aWxsIGFkZCB0aGUgY29tbWVudHMuCj4+Cj4+PiArwqDCoMKgwqAg
Ki8KPj4+ICvCoMKgwqAgLyogTWVzc2FnZSBsYXlvdXQ6IEhFQURFUiAvIERBVEEgLyBUQUlMICov
Cj4+PiArwqDCoMKgIC8qIEhFQURFUiAqLwo+Pj4gKwo+Pj4gK8KgwqDCoCBzeiA9IGRhdGEtPnBh
Y2tldChkYXRhLCBtLCBjLCBTVFBfUEFDS0VUX0RBVEEsIFNUUF9QQUNLRVRfTUFSS0VELAo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDQsICh1OCAqKSZoZWFkZXIpOwo+PiBUaGUgLyog
SEVBREVSICovIGNvbW1lbnQgYXBwbGllcyB0byB0aGUgYWJvdmUgbGluZSwgc28gaXQgc2hvdWxk
Cj4+IHByb2JhYmx5IGJlIGRpcmVjdGx5IGJlZm9yZSBpdC4KPiBHb3QgaXQuCj4+Cj4+PiArwqDC
oMKgIGlmIChzeiA8PSAwKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBzejsKPj4+ICvCoMKg
wqAgKih1aW50MTZfdCAqKSh0cmNfaGRyKSA9IFNUTV9NQUtFX1ZFUlNJT04oMCwgMyk7Cj4+PiAr
wqDCoMKgICoodWludDE2X3QgKikodHJjX2hkciArIDIpID0gU1RNX0hFQURFUl9NQUdJQzsKPj4+
ICvCoMKgwqAgKih1aW50MzJfdCAqKSh0cmNfaGRyICsgNCkgPSByYXdfc21wX3Byb2Nlc3Nvcl9p
ZCgpOwo+Pj4gK8KgwqDCoCAqKHVpbnQ2NF90ICopKHRyY19oZHIgKyA4KSA9IHNjaGVkX2Nsb2Nr
KCk7Cj4+IFdoeSBzY2hlZF9jbG9jaygpPyBJdCBzaG91bGQsIGFtb25nIG90aGVyIHRoaW5ncywg
YmUgY2FsbGVkIHdpdGgKPj4gaW50ZXJydXB0cyBkaXNhYmxlZCwgd2hpY2ggaXMgbm90IHRoZSBj
YXNlIGhlcmUuCj4gSSB3aWxsIGNoZWNrLiBJZiBpdCBpcyBub3QgbmVjZXNzYXJ5IGhlcmUsIEkg
d2lsbCByZW1vdmUgaXQuCj4+Cj4+PiArwqDCoMKgICoodWludDY0X3QgKikodHJjX2hkciArIDE2
KSA9IHRhc2tfdGdpZF9ucihnZXRfY3VycmVudCgpKTsKPj4gSXMgdGhlcmUgYSByZWFzb24gd2h5
IHRyY19oZHIgaXMgbm90IGEgc3RydWN0Pwo+IE5vIHBhcnRpY3VsYXIgcmVhc29uIGhlcmUuCj4+
Cj4+IFRoYW5rcywKPj4gLS0gCj4+IEFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
