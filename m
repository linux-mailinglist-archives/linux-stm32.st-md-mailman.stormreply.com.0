Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF0C372FA5
	for <lists+linux-stm32@lfdr.de>; Tue,  4 May 2021 20:20:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1A2CC59784;
	Tue,  4 May 2021 18:20:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6E9EC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 18:20:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144I76re007189; Tue, 4 May 2021 20:20:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yI6Ml2clRXcMJtwies2mHdCV4zB6gRnE8QVI0zDSqis=;
 b=tisRkZr/wrgdeQPj0Eo0EGJxkyeO64LlJfodSp5ujquOubFeb263JMs4Nl89NfzQqHVE
 8el9w6Xh26K1TOjEkpgXC9N2gUljUiIiQ4AQpChCbbFUb4OmkZUTSBEzAys9wofQx/oP
 48dfcItsx5QvknAiJgIT7zbgECxYweMIcuGtQ/q3Eb3+fn54jfyam3iI3UjcWiOH62hQ
 WuVjVyBhWsLu11hPO4c5gFmnVc9SZn3jGwdLPCBCBe5Lm+RiumvTXHMruUkatLj+GWlU
 ACQeHH8mUPj0/lcDbACKL6uREgoOgvgoGp5doEMi254bBGDApZXaDSVPYiM7RCFh7G5I fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38akujyuf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 20:20:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5947F10002A;
 Tue,  4 May 2021 20:20:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43C12226568;
 Tue,  4 May 2021 20:20:27 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May
 2021 20:20:26 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210429080639.6379-1-arnaud.pouliquen@foss.st.com>
 <20210503174238.GD1699665@xps15>
 <b2f6b9ca-9dc2-920b-941d-175779bc1034@foss.st.com>
 <20210504170530.GD1734971@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <7170fdd0-00cd-1486-7b4c-41040ecfff6f@foss.st.com>
Date: Tue, 4 May 2021 20:20:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210504170530.GD1734971@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_12:2021-05-04,
 2021-05-04 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: char: Remove useless includes
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

CgpPbiA1LzQvMjEgNzowNSBQTSwgTWF0aGlldSBQb2lyaWVyIHdyb3RlOgo+IEhpIEFybmF1ZCwK
PiAKPiBbLi4uXQo+IAo+Pgo+PiBJIHN0YXJ0ZWQgYnkgdGhpcyBvbmUgYW5kIHRoZW4gSSBnb3Qg
Y2FycmllZCBhd2F5IHRlc3RlZCB0aGUgb3RoZXIgaW5jbHVkZS4uLgo+PiBZb3UgYXJlIHJpZ2h0
LCBJIGp1c3QgZG9uJ3QgZm9sbG93IGhlciB0aGUgZmlyc3QgcnVsZSBvZiB0aGUgInN1Ym1pdCBj
aGVja2xpc3QiCj4+Cj4+ICJJZiB5b3UgdXNlIGEgZmFjaWxpdHkgdGhlbiAjaW5jbHVkZSB0aGUg
ZmlsZSB0aGF0IGRlZmluZXMvZGVjbGFyZXMgdGhhdAo+PiBmYWNpbGl0eS4gRG9u4oCZdCBkZXBl
bmQgb24gb3RoZXIgaGVhZGVyIGZpbGVzIHB1bGxpbmcgaW4gb25lcyB0aGF0IHlvdSB1c2UuIgo+
Pgo+PiBUaGF0IHNhaWQgSSBqdXN0IGhhdmUgYSBkb3VidCBmb3IgdWFwaS9saW51eC9ycG1zZy5o
IHRoYXQgd2lsbCBiZSBpbmNsdWRlCj4+IGJ5IHJwbXNnLmhbMl0sIGFzIHRoZXNlIGluY2x1ZGVz
IGFyZSBwYXJ0IG9mIHRoZSBycG1zZyBmcmFtZXdvcmsgQVBJLCBzaG91bGQgd2UKPj4ga2VlcCBi
b3RoLCBjb25zaWRlcmluZyB0aGUgcnVsZSBhcyBzdHJpY3Q/Cj4gCj4gSSByZWQgdGhlIGxhc3Qg
cGFyYWdyYXBoIHNldmVyYWwgdGltZXMgSSBjYW4ndCB1bmRlcnN0YW5kIHdoYXQgeW91IGFyZQo+
IHRyeWluZyB0byBjb252ZXkuICBQbGVhc2UgcmVwaHJhc2UsIHByb3ZpZGUgbW9yZSBjb250ZXh0
IG9yIGRldGFpbCBleGFjdGx5IHdoZXJlCj4geW91IHRoaW5rIHdlIGhhdmUgYSBwcm9ibGVtLgoK
VGhlcmUgaXMgbm8gcHJvYmxlbSwganVzdCBhIHF1ZXN0aW9uIGJlZm9yZSBzZW5kaW5nIGFuIHVw
ZGF0ZS4KCkFzIHlvdSBtZW50aW9uIHRoZSAjaW5jbHVkZSAicnBtc2dfaW50ZXJuYWwuaCIgbGlu
ZSBjYW4gYmUgcmVtb3ZlZCwgSSBwbGFuIHRvCnNlbmQgYSBwYXRjaCBWMiBmb3IgdGhpcy4KClRo
YXQncyBzYWlkIGJlZm9yZSBzZW5kaW5nIGEgbmV3IHZlcnNpb24gSSB3b3VsZCBsaWtlIHRvIHBy
b3Bvc2UgdG8gYWxzbyByZW1vdmUKdGhlICNpbmNsdWRlICA8dWFwaS9saW51eC9ycG1zZy5oPiBs
aW5lLgoKVGhlIHJhdGlvbmFsIHRvIHJlbW92ZSBpdCBpcyB0aGF0IGluY2x1ZGUvcnBtc2cuaCB3
b3VsZCBhbHJlYWR5IGluY2x1ZGUKPHVhcGkvbGludXgvcnBtc2cuaD4gaW4gNS4xMyBbMl0uIEFu
ZCBsb29raW5nIGF0IHNvbWUgZnJhbWV3b3JrcyAoZS5nIEkyQywgVFRZKQp0aGUgZHJpdmVycyBz
ZWVtIHRvIGluY2x1ZGUgb25seSB0aGUgaW5jbHVkZS94eHguaCBhbmQgbm90IHRoZSB1YXBpL2xp
bnV4L3h4eC5oCmluIHN1Y2ggY2FzZS4KClNvIG15IHF1ZXN0aW9uIGlzIHNob3VsZCBJIHJlbW92
ZSAgI2luY2x1ZGUgIDx1YXBpL2xpbnV4L3JwbXNnLmg+IGxpbmU/IE9yIGRvCnlvdSBwcmVmZXIg
dGhhdCBpIGtlZXAgaXQ/CgpIb3BlIGl0IGlzIG1vcmUgY2xlYXIuLi4gZWxzZSBwbGVhc2UganVz
dCBmb3JnZXQgbXkgcHJvcG9zYWwsIEkgd291bGRuJ3Qgd2FudAp5b3UgdG8gd2FzdGUgdG9vIG11
Y2ggdGltZSBmb3IgYSBwb2ludCBvZiBkZXRhaWwuCgpUaGFua3MsCkFybmF1ZAoKPiAKPiBUaGFu
a3MsCj4gTWF0aGlldQo+IAo+IAo+Pgo+PiBbMV0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
aHRtbC9sYXRlc3QvcHJvY2Vzcy9zdWJtaXQtY2hlY2tsaXN0Lmh0bWwKPj4gWzJdCj4+IGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yZW1vdGVwcm9jL3BhdGNoLzIw
MjEwMzExMTQwNDEzLjMxNzI1LTMtYXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbS8KPj4KPj4g
VGhhbmtzLAo+PiBBcm5hdWQKPj4KPj4+Cj4+PiBUaGFua3MsCj4+PiBNYXRoaWV1Cj4+Pgo+Pj4+
ICAKPj4+PiAgI2RlZmluZSBSUE1TR19ERVZfTUFYCShNSU5PUk1BU0sgKyAxKQo+Pj4+ICAKPj4+
PiAtLSAKPj4+PiAyLjE3LjEKPj4+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
