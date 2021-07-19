Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 360973DD330
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:44:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF5BFC5A4DE;
	Mon,  2 Aug 2021 09:44:23 +0000 (UTC)
Received: from smtpbg501.qq.com (smtpbg501.qq.com [203.205.250.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D28FCFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 12:59:32 +0000 (UTC)
X-QQ-mid: bizesmtp43t1626699538tkn81k5f
Received: from [10.20.53.139] (unknown [113.57.152.160])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 19 Jul 2021 20:58:57 +0800 (CST)
X-QQ-SSF: 00400000007000105000C00C0000000
X-QQ-FEAT: J14clyG+6H4JW/UNchXreS8vcwYAcUa/9O1hBwNaLXtidQ1PuqXiYFF4uCCeL
 QUG7iju2qvwLkLm+7oxjHRGZ2uftvHHbjg4k8XqMkx+zJfYVVykY6EWQtRGxafWgzYKFZJS
 ZnZMuZ4jkYUxr7U1oEBQR4+l28Lwnbxftt5yV9j7AOTv3qzX+Q+0w4AqpqbhupWvOWPdlIN
 JEUaejbNGWXDvl09uge4TY1CTXFPuFUsIeo3tZfD14KnjuxMX//+KpLscp3ROqZ/EKwlxrw
 DkIsvCRX/zgZYMHON0cWoXu/YYrHAEKxv8jOs5Yfm1eDmIFd7wX81nGO9fv5cHXNpLUNE+4
 mJ7q3vSN2PmpNESKx1H74/XG1/6f6cmju8nTthGDywf7cXFcZc=
X-QQ-GoodBg: 2
To: Joakim Zhang <qiangqing.zhang@nxp.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>
References: <20210719093207.17343-1-chenhaoa@uniontech.com>
 <VI1PR04MB680027FEA266683089205D44E6E19@VI1PR04MB6800.eurprd04.prod.outlook.com>
From: Hao Chen <chenhaoa@uniontech.com>
Message-ID: <fbd3d55a-7710-99eb-1e99-86284c42c625@uniontech.com>+78D467A30116BB90
Date: Mon, 19 Jul 2021 20:58:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB680027FEA266683089205D44E6E19@VI1PR04MB6800.eurprd04.prod.outlook.com>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:44:19 +0000
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4] net: stmmac: fix 'ethtool -P' return
	-EBUSY
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

CuWcqCAyMDIxLzcvMTkg5LiL5Y2INTo1MiwgSm9ha2ltIFpoYW5nIOWGmemBkzoKPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSGFvIENoZW4gPGNoZW5oYW9hQHVuaW9udGVj
aC5jb20+Cj4+IFNlbnQ6IDIwMjHlubQ35pyIMTnml6UgMTc6MzIKPj4gVG86IHBlcHBlLmNhdmFs
bGFyb0BzdC5jb20KPj4gQ2M6IGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb207IGpvYWJyZXVA
c3lub3BzeXMuY29tOwo+PiBkYXZlbUBkYXZlbWxvZnQubmV0OyBrdWJhQGtlcm5lbC5vcmc7IG1j
b3F1ZWxpbi5zdG0zMkBnbWFpbC5jb207Cj4+IGxpbnV4QGFybWxpbnV4Lm9yZy51azsgbmV0ZGV2
QHZnZXIua2VybmVsLm9yZzsKPj4gbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbTsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsKPj4gSGFvIENoZW4gPGNoZW5oYW9h
QHVuaW9udGVjaC5jb20+Cj4+IFN1YmplY3Q6IFtQQVRDSCB2NF0gbmV0OiBzdG1tYWM6IGZpeCAn
ZXRodG9vbCAtUCcgcmV0dXJuIC1FQlVTWQo+Pgo+PiBUaGUgcGVybWFuZW50IG1hYyBhZGRyZXNz
IHNob3VsZCBiZSBhdmFpbGFibGUgZm9yIHF1ZXJ5IHdoZW4gdGhlIGRldmljZSBpcwo+PiBub3Qg
dXAuCj4+IE5ldHdvcmtNYW5hZ2VyLCB0aGUgc3lzdGVtIG5ldHdvcmsgZGFlbW9uLCB1c2VzICdl
dGh0b29sIC1QJyB0byBvYnRhaW4gdGhlCj4+IHBlcm1hbmVudCBhZGRyZXNzIGFmdGVyIHRoZSBr
ZXJuZWwgc3RhcnQuIFdoZW4gdGhlIG5ldHdvcmsgZGV2aWNlIGlzIG5vdCB1cCwKPj4gaXQgd2ls
bCByZXR1cm4gdGhlIGRldmljZSBidXN5IGVycm9yIHdpdGggJ2V0aHRvb2wgLVAnLiBBdCB0aGF0
IHRpbWUsIGl0IGlzIHVuYWJsZSB0bwo+PiBhY2Nlc3MgdGhlIEludGVybmV0IHRocm91Z2ggdGhl
IHBlcm1hbmVudCBhZGRyZXNzIGJ5IE5ldHdvcmtNYW5hZ2VyLgo+PiBJIHRoaW5rIHRoYXQgdGhl
ICcuYmVnaW4nIGlzIG5vdCB1c2VkIHRvIGNoZWNrIGlmIHRoZSBkZXZpY2UgaXMgdXAuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEhhbyBDaGVuIDxjaGVuaGFvYUB1bmlvbnRlY2guY29tPgo+PiAtLS0K
Pj4gICAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX2V0aHRvb2wuYyAgfCAxOSAr
KysrKysrKysrKysrKystLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfZXRodG9vbC5jCj4+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvc3RtbWFjX2V0aHRvb2wuYwo+PiBpbmRleCBkMGNlNjA4YjgxYzMuLjI1
YzQ0YzFlY2JkNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX2V0aHRvb2wuYwo+PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9zdG1tYWNfZXRodG9vbC5jCj4+IEBAIC0xNSw2ICsxNSw3IEBACj4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3BoeWxpbmsuaD4KPj4gICAjaW5jbHVkZSA8bGludXgvbmV0X3RzdGFtcC5o
Pgo+PiAgICNpbmNsdWRlIDxhc20vaW8uaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1l
Lmg+Cj4gUGxlYXNlIGluIGFscGhhYmV0aWNhbCBvcmRlci4KPgo+Cj4+ICAgI2luY2x1ZGUgInN0
bW1hYy5oIgo+PiAgICNpbmNsdWRlICJkd21hY19kbWEuaCIKPj4gQEAgLTQxMCwxMyArNDExLDIy
IEBAIHN0YXRpYyB2b2lkIHN0bW1hY19ldGh0b29sX3NldG1zZ2xldmVsKHN0cnVjdAo+PiBuZXRf
ZGV2aWNlICpkZXYsIHUzMiBsZXZlbCkKPj4KPj4gICB9Cj4+Cj4+IC1zdGF0aWMgaW50IHN0bW1h
Y19jaGVja19pZl9ydW5uaW5nKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCj4+ICtzdGF0aWMgaW50
IHN0bW1hY19ldGh0b29sX2JlZ2luKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCj4+ICAgewo+PiAt
CWlmICghbmV0aWZfcnVubmluZyhkZXYpKQo+PiAtCQlyZXR1cm4gLUVCVVNZOwo+PiArCXN0cnVj
dCBzdG1tYWNfcHJpdiAqcHJpdiA9IG5ldGRldl9wcml2KGRldik7Cj4+ICsKPj4gKwlwbV9ydW50
aW1lX2dldF9zeW5jKHByaXYtPmRldmljZSk7Cj4+ICsKPj4gICAJcmV0dXJuIDA7Cj4+ICAgfQo+
IEFkZCBlcnJvciBjaGVjaywgbGlrZToKPiByZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKHByaXYt
PmRldmljZSk7Cj4gaWYgKHJldCA8IDApIHsKPiAJcG1fcnVudGltZV9wdXRfbm9pZGxlKHByaXYt
PmRldmljZSk7Cj4gCXJldHVybiByZXQ7Cj4gfQo+Cj4gQmVzdCBSZWdhcmRzLAo+IEpvYWtpbSBa
aGFuZwo+PiArc3RhdGljIHZvaWQgc3RtbWFjX2V0aHRvb2xfY29tcGxldGUoc3RydWN0IG5ldF9k
ZXZpY2UgKmRldikgewo+PiArCXN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiA9IG5ldGRldl9wcml2
KGRldik7Cj4+ICsKPj4gKwlwbV9ydW50aW1lX3B1dChwcml2LT5kZXZpY2UpOwo+PiArfQo+PiAr
Cj4+ICAgc3RhdGljIGludCBzdG1tYWNfZXRodG9vbF9nZXRfcmVnc19sZW4oc3RydWN0IG5ldF9k
ZXZpY2UgKmRldikgIHsKPj4gICAJc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0ZGV2X3By
aXYoZGV2KTsgQEAgLTEwNzMsNyArMTA4Myw4IEBACj4+IHN0YXRpYyBpbnQgc3RtbWFjX3NldF90
dW5hYmxlKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsICBzdGF0aWMgY29uc3Qgc3RydWN0Cj4+IGV0
aHRvb2xfb3BzIHN0bW1hY19ldGh0b29sX29wcyA9IHsKPj4gICAJLnN1cHBvcnRlZF9jb2FsZXNj
ZV9wYXJhbXMgPSBFVEhUT09MX0NPQUxFU0NFX1VTRUNTIHwKPj4gICAJCQkJICAgICBFVEhUT09M
X0NPQUxFU0NFX01BWF9GUkFNRVMsCj4+IC0JLmJlZ2luID0gc3RtbWFjX2NoZWNrX2lmX3J1bm5p
bmcsCj4+ICsJLmJlZ2luID0gc3RtbWFjX2V0aHRvb2xfYmVnaW4sCj4+ICsJLmNvbXBsZXRlID0g
c3RtbWFjX2V0aHRvb2xfY29tcGxldGUsCj4+ICAgCS5nZXRfZHJ2aW5mbyA9IHN0bW1hY19ldGh0
b29sX2dldGRydmluZm8sCj4+ICAgCS5nZXRfbXNnbGV2ZWwgPSBzdG1tYWNfZXRodG9vbF9nZXRt
c2dsZXZlbCwKPj4gICAJLnNldF9tc2dsZXZlbCA9IHN0bW1hY19ldGh0b29sX3NldG1zZ2xldmVs
LAo+PiAtLQo+PiAyLjIwLjEKPj4KPj4KQnkgYnJvd3NlIHRoZSBjb2RlIGFuZCB0ZXN0IGl0LMKg
IEkgZmluZCB0aGF0IHN0bW1hYyBub3Qgc3VwcG9ydCAKcnVudGltZV9zdGF0dXMsCgpwbV9ydW50
aW1lX2dldF9zeW5jIHdpbGwgcmV0dXJuIC0xMyBlcnJuby4gU28gc2hvdWxkbid0IG1vZGlmeSBp
dCBpbiB0aGlzIHdheS4KCkkgdGhpbmsgd2Ugc2hvdWxkIGp1c3QgZGVsZXRlIHRoZSBpbXBsZW1l
bnRhdGlvbiBvZiBiZWdpbiwKaXQncyBhIHByZSBob29rIGZvciBldGh0b29sLgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
