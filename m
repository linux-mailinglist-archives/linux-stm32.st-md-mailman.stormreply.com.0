Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1974D862F
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 14:46:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3108AC60467;
	Mon, 14 Mar 2022 13:46:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B243C5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 13:46:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22EDccH8021150;
 Mon, 14 Mar 2022 14:45:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ruqKKT2NdWphDUcRNwnUJkz/nzgzUFrDkEA5GEduIyI=;
 b=H2mYSC5b8FayDBeMLRbmBaIYYNWLqCNnl+tSNE90iDr4r52/3SS+XVLQ5M7jwMqb5YDy
 nu45mdy2phhCw5fvJsmNI1oKs8G7V+YErBb5PaDgyyfdUHTZXJOa8qv0UeAU0D+3hOpg
 Yw1y5HER43DYsrcauOppisAPenfAOy6JXV4eBOGPYsslwW21lkN66T3NuUHk/bzIAMmF
 IIpEIJrCphWaFGndgmEzABrZxYH1fcYIxRWBNTAQlUG6VOK51StKxy5XalUbEZ331KoH
 DmQX3QteHr2o7PWNFOko+4nDh9qfcpfUSYZtOVuYKsWlNKj4888WGB3OQwHPdP/jeQoh UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et6eh072y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 14:45:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78054100034;
 Mon, 14 Mar 2022 14:45:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F374222CB0;
 Mon, 14 Mar 2022 14:45:30 +0100 (CET)
Received: from [10.201.21.172] (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 14 Mar
 2022 14:45:29 +0100
Message-ID: <29f2fe3a-9814-75ba-806f-b0e7dbb41e8f@foss.st.com>
Date: Mon, 14 Mar 2022 14:45:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson
 <ulf.hansson@linaro.org>
References: <20220314095225.53563-1-yann.gautier@foss.st.com>
 <20220314125554.190574-1-yann.gautier@foss.st.com>
 <1e620fa18fa34ca1f65558e3a52f79f81ff20634.camel@pengutronix.de>
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <1e620fa18fa34ca1f65558e3a52f79f81ff20634.camel@pengutronix.de>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_04,2022-03-14_01,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, Marek Vasut <marex@denx.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] mmc: mmci: manage MMC_PM_KEEP_POWER
	per variant config
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

T24gMy8xNC8yMiAxNDowNSwgUGhpbGlwcCBaYWJlbCB3cm90ZToKPiBIaSBZYW5uLAo+IAo+IE9u
IE1vLCAyMDIyLTAzLTE0IGF0IDEzOjU1ICswMTAwLCBZYW5uIEdhdXRpZXIgd3JvdGU6Cj4+IEFk
ZCBhIGRpc2FibGVfa2VlcF9wb3dlciBmaWVsZCBpbiB2YXJpYW50X2RhdGEgc3RydWN0LiBUaGUK
Pj4gTU1DX1BNX0tFRVBfUE9XRVIgZmxhZyB3aWxsIGJlIGVuYWJsZWQgaWYgZGlzYWJsZV9rZWVw
X3Bvd2VyIGlzIG5vdAo+PiBzZXQuCj4+IEl0IGlzIG9ubHkgc2V0IHRvIHRydWUgZm9yIHN0bTMy
X3NkbW1jIHZhcmlhbnRzLgo+Pgo+PiBUaGUgaXNzdWUgd2FzIHNlZW4gb24gU1RNMzJNUDE1N0Mt
REsyIGJvYXJkLCB3aGljaCBlbWJlZHMgYSB3aWZpCj4+IGNoaXAuCj4+IEl0IGRvZXNuJ3QgY29y
cmVjdGx5IHN1cHBvcnQgbG93IHBvd2VyIG9uIHRoaXMgYm9hcmQuIFRoZSBXaWZpIGNoaXAKPj4g
YXdhaXRzIGFuIGFsd2F5cy1vbiByZWd1bGF0b3IsIGJ1dCBpdCB3YXMgY29ubmVjdGVkIHRvIHYz
djMgd2hpY2ggaXMKPj4gb2ZmCj4+IGluIGxvdy1wb3dlciBzZXF1ZW5jZS4gTU1DX1BNX0tFRVBf
UE9XRVIgc2hvdWxkIHRoZW4gYmUgZGlzYWJsZWQuCj4+Cj4+IFRoZSBmbGFnIGNhbiBzdGlsbCBi
ZSBlbmFibGVkIHRocm91Z2ggRFQgcHJvcGVydHk6Cj4+IGtlZXAtcG93ZXItaW4tc3VzcGVuZC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogWWFubiBHYXV0aWVyIDx5YW5uLmdhdXRpZXJAZm9zcy5zdC5j
b20+Cj4+IC0tLQo+PiBVcGRhdGUgaW4gdjI6Cj4+IFJld29yZCBjb21taXQgbWVzc2FnZSB0byBi
ZXR0ZXIgZXhwbGFpbiB0aGUgaXNzdWUuCj4+Cj4+IFJlc2VuZCB0aGUgcGF0Y2ggYWxvbmUuIEl0
IHdhcyBwcmV2aW91bHN5IGluIGEgc2VyaWVzIFsxXSBmb3Igd2hpY2gKPj4gdGhlCj4+IG90aGVy
IHBhdGNoZXMgd2lsbCBiZSByZXdvcmtlZC4KPj4KPj4gWzFdCj4+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAyMjAzMDQxMzUxMzQuNDc4MjctMS15YW5uLmdhdXRpZXJAZm9zcy5zdC5j
b20vCj4+Cj4+ICDCoGRyaXZlcnMvbW1jL2hvc3QvbW1jaS5jIHwgNSArKysrLQo+PiAgwqBkcml2
ZXJzL21tYy9ob3N0L21tY2kuaCB8IDEgKwo+PiAgwqAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9z
dC9tbWNpLmMgYi9kcml2ZXJzL21tYy9ob3N0L21tY2kuYwo+PiBpbmRleCA0NWI4NjA4YzkzNWMu
LjBlMmYyZjVkNmE1MiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMKPj4g
KysrIGIvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMKPj4gQEAgLTI3NCw2ICsyNzQsNyBAQCBzdGF0
aWMgc3RydWN0IHZhcmlhbnRfZGF0YSB2YXJpYW50X3N0bTMyX3NkbW1jID0KPj4gewo+PiAgwqDC
oMKgwqDCoMKgwqDCoC5idXN5X2RldGVjdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoD0gdHJ1ZSwK
Pj4gIMKgwqDCoMKgwqDCoMKgwqAuYnVzeV9kZXRlY3RfZmxhZ8KgwqDCoMKgwqDCoMKgPSBNQ0lf
U1RNMzJfQlVTWUQwLAo+PiAgwqDCoMKgwqDCoMKgwqDCoC5idXN5X2RldGVjdF9tYXNrwqDCoMKg
wqDCoMKgwqA9IE1DSV9TVE0zMl9CVVNZRDBFTkRNQVNLLAo+PiArwqDCoMKgwqDCoMKgwqAuZGlz
YWJsZV9rZWVwX3Bvd2VywqDCoMKgwqDCoD0gdHJ1ZSwKPj4gIMKgwqDCoMKgwqDCoMKgwqAuaW5p
dMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPSBzZG1tY192YXJpYW50X2lu
aXQsCj4+ICDCoH07Cj4+ICAgCj4+IEBAIC0zMDEsNiArMzAyLDcgQEAgc3RhdGljIHN0cnVjdCB2
YXJpYW50X2RhdGEgdmFyaWFudF9zdG0zMl9zZG1tY3YyCj4+ID0gewo+PiAgwqDCoMKgwqDCoMKg
wqDCoC5idXN5X2RldGVjdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoD0gdHJ1ZSwKPj4gIMKgwqDC
oMKgwqDCoMKgwqAuYnVzeV9kZXRlY3RfZmxhZ8KgwqDCoMKgwqDCoMKgPSBNQ0lfU1RNMzJfQlVT
WUQwLAo+PiAgwqDCoMKgwqDCoMKgwqDCoC5idXN5X2RldGVjdF9tYXNrwqDCoMKgwqDCoMKgwqA9
IE1DSV9TVE0zMl9CVVNZRDBFTkRNQVNLLAo+PiArwqDCoMKgwqDCoMKgwqAuZGlzYWJsZV9rZWVw
X3Bvd2VywqDCoMKgwqDCoD0gdHJ1ZSwKPj4gIMKgwqDCoMKgwqDCoMKgwqAuaW5pdMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPSBzZG1tY192YXJpYW50X2luaXQsCj4+ICDC
oH07Cj4+ICAgCj4+IEBAIC0yMTcyLDcgKzIxNzQsOCBAQCBzdGF0aWMgaW50IG1tY2lfcHJvYmUo
c3RydWN0IGFtYmFfZGV2aWNlICpkZXYsCj4+ICDCoMKgwqDCoMKgwqDCoMKgaG9zdC0+c3RvcF9h
Ym9ydC5mbGFncyA9IE1NQ19SU1BfUjFCIHwgTU1DX0NNRF9BQzsKPj4gICAKPj4gIMKgwqDCoMKg
wqDCoMKgwqAvKiBXZSBzdXBwb3J0IHRoZXNlIFBNIGNhcGFiaWxpdGllcy4gKi8KPj4gLcKgwqDC
oMKgwqDCoMKgbW1jLT5wbV9jYXBzIHw9IE1NQ19QTV9LRUVQX1BPV0VSOwo+PiArwqDCoMKgwqDC
oMKgwqBpZiAoIXZhcmlhbnQtPmRpc2FibGVfa2VlcF9wb3dlcikKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoG1tYy0+cG1fY2FwcyB8PSBNTUNfUE1fS0VFUF9QT1dFUjsKPj4gICAK
Pj4gIMKgwqDCoMKgwqDCoMKgwqAvKgo+PiAgwqDCoMKgwqDCoMKgwqDCoCAqIFdlIGNhbiBkbyBT
R0lPCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L21tY2kuaCBiL2RyaXZlcnMvbW1j
L2hvc3QvbW1jaS5oCj4+IGluZGV4IGUxYTliOTZhMzM5Ni4uMmNhZDFlZjk3NjZhIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L21tY2kuaAo+PiArKysgYi9kcml2ZXJzL21tYy9ob3N0
L21tY2kuaAo+PiBAQCAtMzYxLDYgKzM2MSw3IEBAIHN0cnVjdCB2YXJpYW50X2RhdGEgewo+PiAg
wqDCoMKgwqDCoMKgwqDCoHUzMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoG9wZW5kcmFpbjsKPj4gIMKgwqDCoMKgwqDCoMKgwqB1OMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZG1hX2xsaToxOwo+PiAgwqDCoMKgwqDCoMKgwqDCoHUz
MsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0bTMyX2lkbWFic2l6
ZV9tYXNrOwo+PiArwqDCoMKgwqDCoMKgwqB1OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZGlzYWJsZV9rZWVwX3Bvd2VyOjE7Cj4gCj4gVGhlcmUgYXJlIGFscmVh
ZHkgZm91ciBzZXBhcmF0ZSBiaXRmaWVsZHMgaW4gc3RydWN0IHZhcmlhbnRfZGF0YSwgd2h5Cj4g
bm90IG1vdmUgdGhpcyB1cCBpbnRvIG9uZSBvZiB0aGVtPwo+IAo+IHJlZ2FyZHMKPiBQaGlsaXBw
CgpIaSBQaGlsaXBwLAoKWW91J3JlIHJpZ2h0LCBJJ2xsIHB1dCBpdCB3aXRoIHRoZSBwcmV2aW91
cyBiaXRmaWxlZCBpbiB2My4KCkJlc3QgcmVnYXJkcywKWWFubgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
