Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 318097054A2
	for <lists+linux-stm32@lfdr.de>; Tue, 16 May 2023 19:02:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3AC7C6A61F;
	Tue, 16 May 2023 17:02:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CD15C6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 17:02:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34GE7fMQ015581; Tue, 16 May 2023 19:01:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=EEGjMvBwmChywxvRvi7rS3GCQucVoQGQ96IwahsoA5Q=;
 b=rnPxbOSHwO2TIpEiV36gayBM2qIkRyZ7Lm9yeNMl3nyf/YO56dDvdN9nmRH+ARYZncXJ
 chxQzRNF0+GwPltv3+zJoSpa+eeyIG6fj8/NhsZa55VQ7TPzIyMluubHpfpLF95aAfAX
 LQTodchwDIsyreKvVi1zCT2q4xwkJyRqhzePsV3IfjllNyx1apre7nNKbmycAfL3zJ5P
 5DN1vr9wnx2mDHvC8MKYgZ7jq3AZnwEYAthHXyJdz+MlqrsW+Z+O2RkUA6DhCqzjmqrW
 YinV9MP8sDAMg6dQpUpdp/rzQByw4K4FRgQ7yEbpxqSV5O2ysl+04aeeR/ZHw1YvFM8N uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qm7tfagke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 19:01:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 336B410002A;
 Tue, 16 May 2023 19:01:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A10423BDF3;
 Tue, 16 May 2023 19:01:57 +0200 (CEST)
Received: from [10.201.21.213] (10.201.21.213) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 16 May
 2023 19:01:53 +0200
Message-ID: <33acd8d5-20bf-e39d-85c8-4379f5e7e6ad@foss.st.com>
Date: Tue, 16 May 2023 19:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20230512093926.661509-1-arnaud.pouliquen@foss.st.com>
 <20230512093926.661509-5-arnaud.pouliquen@foss.st.com>
 <20c010da-7245-7acf-db2f-991ee2975ea2@foss.st.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20c010da-7245-7acf-db2f-991ee2975ea2@foss.st.com>
X-Originating-IP: [10.201.21.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_09,2023-05-16_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 4/4] ARM: dts: stm32: fix m4_rproc
 references to use SCMI
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

SGkgQWxleCwKCk9uIDUvMTYvMjMgMTc6MzUsIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4gSGkg
QXJuYXVkCj4gCj4gT24gNS8xMi8yMyAxMTozOSwgQXJuYXVkIFBvdWxpcXVlbiB3cm90ZToKPj4g
Rml4ZXMgc3RtMzJtcDE1Ki1zY21pIERUUyBmaWxlcyBpbnRyb2R1Y2VkIGluIFsxXToKPj4gVGhp
cyBwYXRjaCBmaXhlcyB0aGUgbm9kZSB3aGljaCB1c2VzIHRoZSBNQ1UgcmVzZXQgYW5kIGFkZHMg
dGhlCj4+IG1pc3NpbmcgSE9MRF9CT09UIHdoaWNoIGlzIGFsc28gaGFuZGxlZCBieSB0aGUgU0NN
SSByZXNldCBzZXJ2aWNlLgo+Pgo+PiBUaGlzIGNoYW5nZSBjYW5ub3QgYmUgYXBwbGllZCBhcyBh
IGZpeCBvbiBjb21taXQgWzFdLCB0aGUgbWFuYWdlbWVudAo+PiBvZiB0aGUgaG9sZCBib290IGlt
cGFjdHMgYWxzbyB0aGUgc3RtMzJfcnByb2MgZHJpdmVyLgo+Pgo+PiBbMV0gJ2NvbW1pdCA1Yjdl
NTgzMTNhNzcgKCJBUk06IGR0czogc3RtMzI6IEFkZCBTQ01JIHZlcnNpb24gb2YgU1RNMzIgYm9h
cmRzCj4+IChESzEvREsyL0VEMS9FVjEpIiknCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFybmF1ZCBQ
b3VsaXF1ZW4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+Cj4+IC0tLQo+IAo+IEkganVz
dCByYW4gWUFNTCB2YWxpZGF0aW9uIG9uIHlvdXIgRFQgcGF0Y2hlcyBhbmQgaXQgZmFpbHMuIEkg
YWRkZWQgeW91ciBEVAo+IHBhdGNoZXMgKyBkdC1iaW5kaW5nIG9uZSAoanVzdCBmb3IgdGhlIHRl
c3QpLiBJIGdvdCB0aGUgZm9sbG93aW5nIGlzc3VlOgo+IAo+IC9hcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTU3Yy1lZDEtc2NtaS5kdGI6IG00QDEwMDAwMDAwOiBzdCxzeXNjZmctaG9sZGJvb3Q6
Cj4gRmFsc2Ugc2NoZW1hIGRvZXMgbm90IGFsbG93IFtbNywgMjY4LCAxXV0KPiDCoMKgwqDCoEZy
b20gc2NoZW1hOgo+IC9sb2NhbC9ob21lL2ZycTA4Njc4L1NUTElOVVgva2VybmVsL215LWtlcm5l
bC9zdG0zMi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9zdCxz
dG0zMi1ycHJvYy55YW1sCj4gCj4gRG8gSSBtaXNzIGFub3RoZXIgZHQtYmluZGluZyB1cGRhdGUg
bm90IHByZXNlbnQgaW4gdGhpcyBzZXJpZXMgPwoKSSByZXByb2R1Y2VkIHRoZSBpc3N1ZS4KCkkg
bmVlZCB0byBhZGQgIi9kZWxldGUtcHJvcGVydHkvIHN0LHN5c2NmZy1ob2xkYm9vdDsiIGluIHN0
bTMybXAxNTcqLXNjbWkuZHRzCmZpbGVzLgoKQXMgTWF0aGlldSBhbHJlYWR5IGludGVncmF0ZXMg
dGhlIHBhdGNoIDEvNCBhbmQgMi80LCBJIHdpbGwgc2VuZCBhIFY0IGNvbnRhaW5pbmcKb25seSB0
aGUgcGF0Y2hlcyAzIGFuZCA0LgoKVGhhbmtzLApBcm5hdWQKCj4gCj4gYWxleAo+IAo+PiDCoCBh
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kazEtc2NtaS5kdHMgfCA2ICsrKystLQo+PiDC
oCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazItc2NtaS5kdHMgfCA2ICsrKystLQo+
PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1lZDEtc2NtaS5kdHMgfCA2ICsrKyst
LQo+PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEtc2NtaS5kdHMgfCA2ICsr
KystLQo+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kazEt
c2NtaS5kdHMKPj4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kazEtc2NtaS5kdHMK
Pj4gaW5kZXggZTUzOWNjODBiZWY4Li4xMzQ3ODhlNjQyNjUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWRrMS1zY21pLmR0cwo+PiArKysgYi9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTU3YS1kazEtc2NtaS5kdHMKPj4gQEAgLTU1LDggKzU1LDEwIEBAICZt
ZG1hMSB7Cj4+IMKgwqDCoMKgwqAgcmVzZXRzID0gPCZzY21pX3Jlc2V0IFJTVF9TQ01JX01ETUE+
Owo+PiDCoCB9Owo+PiDCoCAtJm1sYWhiIHsKPj4gLcKgwqDCoCByZXNldHMgPSA8JnNjbWlfcmVz
ZXQgUlNUX1NDTUlfTUNVPjsKPj4gKyZtNF9ycHJvYyB7Cj4+ICvCoMKgwqAgcmVzZXRzID0gPCZz
Y21pX3Jlc2V0IFJTVF9TQ01JX01DVT4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgIDwmc2NtaV9yZXNl
dCBSU1RfU0NNSV9NQ1VfSE9MRF9CT09UPjsKPj4gK8KgwqDCoCByZXNldC1uYW1lcyA9wqAgIm1j
dV9yc3QiLCAiaG9sZF9ib290IjsKPj4gwqAgfTsKPj4gwqAgwqAgJnJjYyB7Cj4+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazItc2NtaS5kdHMKPj4gYi9hcmNo
L2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazItc2NtaS5kdHMKPj4gaW5kZXggOTdlNGY5NGIw
YTI0Li5jNDJlNjU4ZGViZmIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNTdjLWRrMi1zY21pLmR0cwo+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3
Yy1kazItc2NtaS5kdHMKPj4gQEAgLTYxLDggKzYxLDEwIEBAICZtZG1hMSB7Cj4+IMKgwqDCoMKg
wqAgcmVzZXRzID0gPCZzY21pX3Jlc2V0IFJTVF9TQ01JX01ETUE+Owo+PiDCoCB9Owo+PiDCoCAt
Jm1sYWhiIHsKPj4gLcKgwqDCoCByZXNldHMgPSA8JnNjbWlfcmVzZXQgUlNUX1NDTUlfTUNVPjsK
Pj4gKyZtNF9ycHJvYyB7Cj4+ICvCoMKgwqAgcmVzZXRzID0gPCZzY21pX3Jlc2V0IFJTVF9TQ01J
X01DVT4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgIDwmc2NtaV9yZXNldCBSU1RfU0NNSV9NQ1VfSE9M
RF9CT09UPjsKPj4gK8KgwqDCoCByZXNldC1uYW1lcyA9wqAgIm1jdV9yc3QiLCAiaG9sZF9ib290
IjsKPj4gwqAgfTsKPj4gwqAgwqAgJnJjYyB7Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3Yy1lZDEtc2NtaS5kdHMKPj4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0z
Mm1wMTU3Yy1lZDEtc2NtaS5kdHMKPj4gaW5kZXggOWNmMGE0NGQyZjQ3Li43YTU2ZmYyZDQxODUg
MTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWVkMS1zY21pLmR0
cwo+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1lZDEtc2NtaS5kdHMKPj4g
QEAgLTYwLDggKzYwLDEwIEBAICZtZG1hMSB7Cj4+IMKgwqDCoMKgwqAgcmVzZXRzID0gPCZzY21p
X3Jlc2V0IFJTVF9TQ01JX01ETUE+Owo+PiDCoCB9Owo+PiDCoCAtJm1sYWhiIHsKPj4gLcKgwqDC
oCByZXNldHMgPSA8JnNjbWlfcmVzZXQgUlNUX1NDTUlfTUNVPjsKPj4gKyZtNF9ycHJvYyB7Cj4+
ICvCoMKgwqAgcmVzZXRzID0gPCZzY21pX3Jlc2V0IFJTVF9TQ01JX01DVT4sCj4+ICvCoMKgwqDC
oMKgwqDCoMKgIDwmc2NtaV9yZXNldCBSU1RfU0NNSV9NQ1VfSE9MRF9CT09UPjsKPj4gK8KgwqDC
oCByZXNldC1uYW1lcyA9wqAgIm1jdV9yc3QiLCAiaG9sZF9ib290IjsKPj4gwqAgfTsKPj4gwqAg
wqAgJnJjYyB7Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1l
djEtc2NtaS5kdHMKPj4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEtc2NtaS5k
dHMKPj4gaW5kZXggM2I5ZGQ2ZjRjY2M5Li4xMTk4NzRkZDkxZTQgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWV2MS1zY21pLmR0cwo+PiArKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEtc2NtaS5kdHMKPj4gQEAgLTY2LDggKzY2LDEwIEBA
ICZtZG1hMSB7Cj4+IMKgwqDCoMKgwqAgcmVzZXRzID0gPCZzY21pX3Jlc2V0IFJTVF9TQ01JX01E
TUE+Owo+PiDCoCB9Owo+PiDCoCAtJm1sYWhiIHsKPj4gLcKgwqDCoCByZXNldHMgPSA8JnNjbWlf
cmVzZXQgUlNUX1NDTUlfTUNVPjsKPj4gKyZtNF9ycHJvYyB7Cj4+ICvCoMKgwqAgcmVzZXRzID0g
PCZzY21pX3Jlc2V0IFJTVF9TQ01JX01DVT4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgIDwmc2NtaV9y
ZXNldCBSU1RfU0NNSV9NQ1VfSE9MRF9CT09UPjsKPj4gK8KgwqDCoCByZXNldC1uYW1lcyA9wqAg
Im1jdV9yc3QiLCAiaG9sZF9ib290IjsKPj4gwqAgfTsKPj4gwqAgwqAgJnJjYyB7Cj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
