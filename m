Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C362B474697
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Dec 2021 16:38:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A91AC5E2C5;
	Tue, 14 Dec 2021 15:38:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF148CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 15:38:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BEE7ZFO021142;
 Tue, 14 Dec 2021 16:38:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=55TRlyPa1csvltjFSGJc7MC8zSTcqi9KhSJ8TqVGvPo=;
 b=n4+2qguQFrO2LYPE3fxelbRizl65JB5BEn63gFRrVQmTMRUTJDZ66gtp4iEFhwdVz7X7
 fbajk/6aI96BMvzNELKmpPIJsB/of0mFT88fv5jJus/KUlRFl9a3ydTEsQlI9XAdz4Gb
 mHuUm+7sk3df/dZ1fARuuxutN8fI0F7nusZKlc2kyd/LoatRFmwBrtHyxBFyVQC3iVH7
 j4aI1G4Na2zhfKFP+w1JAe8IDFA/zVS3ShfCa8w131v2mTZIdwI0IZJlnxrwxDgygerf
 oJI8FqZW8myIDqstxY4mGQ2bFaXnMAIZUmoWVzjGcURYbUX7P05yZWigPjE0rAd96fx5 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cxr8rabpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 16:38:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B8A910002A;
 Tue, 14 Dec 2021 16:38:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E662231DEF;
 Tue, 14 Dec 2021 16:38:08 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 14 Dec
 2021 16:38:07 +0100
To: Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
References: <20211213195346.12894-1-arnaud.pouliquen@foss.st.com>
 <8bbd1a77-5f88-bb97-db88-6842df2e3e3c@kernel.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <2008dd33-5d23-961c-ca61-53ff3e34479a@foss.st.com>
Date: Tue, 14 Dec 2021 16:38:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8bbd1a77-5f88-bb97-db88-6842df2e3e3c@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_07,2021-12-14_01,2021-12-02_01
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] tty: rpmsg: Fix race condition releasing
	tty port
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

SGVsbG8gSmlyaSwKCk9uIDEyLzE0LzIxIDc6NDMgQU0sIEppcmkgU2xhYnkgd3JvdGU6Cj4gSGks
Cj4gCj4gT24gMTMuIDEyLiAyMSwgMjA6NTMsIEFybmF1ZCBQb3VsaXF1ZW4gd3JvdGU6Cj4+IElu
IGN1cnJlbnQgaW1wbGVtZW50YXRpb24gdGhlIHR0eV9wb3J0IHN0cnVjdCBpcyBwYXJ0IG9mIHRo
ZQo+PiBycG1zZ190dHlfcG9ydCBzdHJ1Y3R1cmUuVGhlIGlzc3VlIGlzIHRoYXQgdGhlIHJwbXNn
X3R0eV9wb3J0IHN0cnVjdHVyZSBpcwo+PiBmcmVlZCBvbiBycG1zZ190dHlfcmVtb3ZlIGJ1dCBh
bHNvIHJlZmVyZW5jZWQgaW4gdGhlIHR0eV9zdHJ1Y3QuCj4+IEl0cyByZWxlYXNlIGlzIG5vdCBw
cmVkaWN0YWJsZSBkdWUgdG8gd29ya3F1ZXVlcy4KPj4KPj4gRm9yIGluc3RhbmNlIGZvbGxvd2lu
ZyBmdHJhY2Ugc2hvd3MgdGhhdCBycG1zZ190dHlfY2xvc2UgaXMgY2FsbGVkIGFmdGVyCj4+IHJw
bXNnX3R0eV9yZWxlYXNlX2Nwb3J0Ogo+Pgo+PiDCoMKgwqDCoMKgIG5yX3Rlc3Quc2gtMzg5wqDC
oMKgwqAgWzAwMF0gLi4uLi7CoMKgIDIxMi4wOTM3NTI6IHJwbXNnX3R0eV9yZW1vdmUgPC1ycG1z
Z19kZXZfCj4+IHJlbW92ZQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXQtMTE5McKg
wqDCoCBbMDAxXSAuLi4uLsKgwqAgMjEyLjA5NTY5NzogdHR5X3JlbGVhc2UgPC1fX2ZwdXQKPj4g
wqDCoMKgwqDCoMKgIG5yX3Rlc3Quc2gtMzg5wqDCoMKgwqAgWzAwMF0gLi4uLi7CoMKgIDIxMi4w
OTkxNjY6IHJwbXNnX3R0eV9yZWxlYXNlX2Nwb3J0IDwtcnBtCj4+IHNnX3R0eV9yZW1vdmUKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2F0LTExOTHCoMKgwqAgWzAwMV0gLi4uLi7CoMKg
IDIxMi4xMTUzNTI6IHJwbXNnX3R0eV9jbG9zZSA8LXR0eV9yZWxlYXNlCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNhdC0xMTkxwqDCoMKgIFswMDFdIC4uLi4uwqDCoCAyMTIuMTE1Mzcx
OiByZWxlYXNlX3R0eSA8LXR0eV9yZWxlYXNlX3N0cgo+Pgo+PiBBcyBjb25zZXF1ZW5jZSwgdGhl
IHBvcnQgbXVzdCBiZSBmcmVlIG9ubHkgd2hlbiB1c2VyIGhhcyByZWxlYXNlZCB0aGUgVFRZCj4+
IGludGVyZmFjZS4KPj4KPj4gVGhpcyBwYXRoIChpbnNwaXJlZCBmcm9tIHZjYy5jKToKPj4gLSBt
b3ZlcyB0aGUgbWFuYWdlbWVudCBvZiB0aGUgcG9ydCBpbiB0aGUgaW5zdGFsbCBhbmQgY2xlYW4t
dXAgdHR5IG9wcywKPj4gLSBhbGxvY2F0ZXMgdGhlIHR0eV9wb3J0IHN0cnVjdCBpbmRlcGVuZGVu
dGx5IG9mIHRoZSBycG1zZ190dHlfcG9ydCBzdHJ1Y3R1cmUsCj4gCj4gVGhpcyBsb29rcyByYXRo
ZXIgd3JvbmcuIFdoeSBub3QgdG8gdXNlIHR0eV9wb3J0IHJlZmNvdW50aW5nPwoKUGxlYXNlIGNv
dWxkIHlvdSBkZXRhaWwgd2hhdCBzZWVtcyByYXRoZXIgd3JvbmcgZm9yIHlvdT8gRXZlcnl0aGlu
ZyBvciBkbyB0aGUKdHR5X3BvcnQgcG9ydCBzdHJ1Y3QgaW5kZXBlbmRlbnRseSBvZiB0aGUgcnBt
c2dfdHR5X3BvcnQgc3RydWN0dXJlPwoKQ29uY2VybmluZyB0aGUgdHR5X3BvcnQgcmVmY291bnRp
bmc6ClllcyBpdCBhbHNvIGFuIG9wdGlvbiB0aGF0IEkgaGF2ZSBhbHJlYWR5IHRyaWVkIHdpdGhv
dXQgc3VjY2VzcywgYmVmb3JlCmltcGxlbWVudGluZyB0aGlzIHBhdGNoLgpUaGF0IHNhaWQsIGFz
IHlvdSBwb2ludGVkIGl0IG91dCwgSSByZWltcGxlbWVudGVkIGl0IHRvZGF5IGluIGFub3RoZXIg
d2F5LCBhbmQKdGhpcyB0aW1lIGl0IHNlZW1zIHRoYXQgaXQgd29ya3Mgd2l0aG91dCBhbnkgcnVu
dGltZSB3YXJuaW5nIG9yIGVycm9yLgpJIG5lZWQgdG8gcGVyZm9ybSBtb3JlIHRlc3QgdG8gY29u
ZmlybSwgdGhlbiBJIHdpbGwgcHJvcG9zZSBhIFYyIGJhc2VkIG9uCnR0eV9wb3J0IHJlZmNvdW50
aW5ndCBhbmQgdGhlIC5kZXN0cnVjdCB0dHlfcG9ydF9vcGVyYXRpb25zLgoKPiAKPj4gLSB1c2Vz
IHR0eV92aGFuZ3VwIGFuZCB0dHlfcG9ydF9oYW5ndXAuCj4gCj4gT0ssIGJ1dCBkb24ndCBzdG9y
ZSBhIHR0eSBwb2ludGVyIGFzIGl0IGxvb2tzIHJhY3kuIFlvdSBzaG91bGQgdXNlCj4gdHR5X3Bv
cnRfdHR5X2dldCBpbnN0ZWFkLgo+IAo+IEhtLCB3ZSBsb29rIHdlIG5lZWQgdHR5X3BvcnRfdHR5
X3ZoYW5ndXAgKGFzaWRlIGZyb20gdHR5X3BvcnRfdHR5X2hhbmd1cCkuIFRoZXJlCj4gYXJlIHBs
ZW50eSBvZiBkcml2ZXJzIGRvaW5nOgo+IMKgwqDCoCB0dHkgPSB0dHlfcG9ydF90dHlfZ2V0KHBv
cnQpOwo+IMKgwqDCoCBpZiAodHR5KSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0dHlfdmhh
bmd1cChwb3J0LT50dHkpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHR5X2tyZWZfcHV0KHR0
eSk7CgpJIHdvdWxkIGxpa2UgdG8gZmlyc3QgZml4IHRoZSBpc3N1ZSBpbiBycG1zZ190dHkuYyBp
biBzZXBhcmF0ZSB0aHJlYWQuCkJ1dCB5ZXMgdGhpcyBzaG91bGQgbm90IHRha2UgbWUgdG9vIG11
Y2ggdGltZSB0byBwcm9wb3NlIHRoaXMgaGVscGVyIG5leHQuCgpUaGFua3MsCkFybmF1ZAoKPiAK
PiAKPj4gRml4ZXM6IDdjMDQwOGQ4MDU3OSAoInR0eTogYWRkIHJwbXNnIGRyaXZlciIpCj4+IFNp
Z25lZC1vZmYtYnk6IEFybmF1ZCBQb3VsaXF1ZW4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5j
b20+Cj4gCj4gdGhhbmtzLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
