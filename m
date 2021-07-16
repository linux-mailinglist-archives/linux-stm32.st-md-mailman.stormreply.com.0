Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF383CB035
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jul 2021 02:54:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 186CBC59781;
	Fri, 16 Jul 2021 00:54:23 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 941ACC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 00:54:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="207629416"
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="207629416"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 17:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="494767129"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 15 Jul 2021 17:54:15 -0700
Received: from linux.intel.com (vwong3-iLBPG3.png.intel.com [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4586158073D;
 Thu, 15 Jul 2021 17:54:12 -0700 (PDT)
Date: Fri, 16 Jul 2021 08:54:08 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Joakim Zhang <qiangqing.zhang@nxp.com>
Message-ID: <20210716005408.GA31939@linux.intel.com>
References: <20210715074539.226600-1-zhang.yunkai@zte.com.cn>
 <DB8PR04MB679513459A42E7A7982CE91EE6129@DB8PR04MB6795.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DB8PR04MB679513459A42E7A7982CE91EE6129@DB8PR04MB6795.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Zeal Robot <zealci@zte.com.cn>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "menglong8.dong@gmail.com" <menglong8.dong@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH linux-next] net:stmmac: Fix the unsigned
 expression compared with zero
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

T24gVGh1LCBKdWwgMTUsIDIwMjEgYXQgMTA6MTI6MDRBTSArMDAwMCwgSm9ha2ltIFpoYW5nIHdy
b3RlOgo+IAo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IG1lbmdsb25n
OC5kb25nQGdtYWlsLmNvbSA8bWVuZ2xvbmc4LmRvbmdAZ21haWwuY29tPgo+ID4gU2VudDogMjAy
MeW5tDfmnIgxNeaXpSAxNTo0Ngo+ID4gVG86IGRhdmVtQGRhdmVtbG9mdC5uZXQKPiA+IENjOiBw
ZXBwZS5jYXZhbGxhcm9Ac3QuY29tOyBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tOwo+ID4g
am9hYnJldUBzeW5vcHN5cy5jb207IGt1YmFAa2VybmVsLm9yZzsgbWNvcXVlbGluLnN0bTMyQGdt
YWlsLmNvbTsKPiA+IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb207Cj4gPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFpoYW5nCj4gPiBZdW5rYWkgPHpo
YW5nLnl1bmthaUB6dGUuY29tLmNuPjsgWmVhbCBSb2JvdCA8emVhbGNpQHp0ZS5jb20uY24+Cj4g
PiBTdWJqZWN0OiBbUEFUQ0ggbGludXgtbmV4dF0gbmV0OnN0bW1hYzogRml4IHRoZSB1bnNpZ25l
ZCBleHByZXNzaW9uIGNvbXBhcmVkCj4gPiB3aXRoIHplcm8KPiA+IAo+ID4gRnJvbTogWmhhbmcg
WXVua2FpIDx6aGFuZy55dW5rYWlAenRlLmNvbS5jbj4KPiA+IAo+ID4gV0FSTklORzogIFVuc2ln
bmVkIGV4cHJlc3Npb24gInF1ZXVlIiBjb21wYXJlZCB3aXRoIHplcm8uCj4gPiBSZXBvcnRlZC1i
eTogWmVhbCBSb2JvdCA8emVhbGNpQHp0ZS5jb20uY24+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFu
ZyBZdW5rYWkgPHpoYW5nLnl1bmthaUB6dGUuY29tLmNuPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDggKystLS0tLS0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFj
X21haW4uYwo+ID4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
bWFpbi5jCj4gPiBpbmRleCA3Yjg0MDRhMjE1NDQuLmE0Y2YyYzY0MDUzMSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiA+
ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMK
PiA+IEBAIC0xNjk5LDcgKzE2OTksNyBAQCBzdGF0aWMgaW50IGluaXRfZG1hX3J4X2Rlc2Nfcmlu
Z3Moc3RydWN0IG5ldF9kZXZpY2UKPiA+ICpkZXYsIGdmcF90IGZsYWdzKQo+ID4gIAlyZXR1cm4g
MDsKPiA+IAo+ID4gIGVycl9pbml0X3J4X2J1ZmZlcnM6Cj4gPiAtCXdoaWxlIChxdWV1ZSA+PSAw
KSB7Cj4gPiArCWRvIHsKPiA+ICAJCXN0cnVjdCBzdG1tYWNfcnhfcXVldWUgKnJ4X3EgPSAmcHJp
di0+cnhfcXVldWVbcXVldWVdOwo+ID4gCj4gPiAgCQlpZiAocnhfcS0+eHNrX3Bvb2wpCj4gPiBA
QCAtMTcxMCwxMSArMTcxMCw3IEBAIHN0YXRpYyBpbnQgaW5pdF9kbWFfcnhfZGVzY19yaW5ncyhz
dHJ1Y3QKPiA+IG5ldF9kZXZpY2UgKmRldiwgZ2ZwX3QgZmxhZ3MpCj4gPiAgCQlyeF9xLT5idWZf
YWxsb2NfbnVtID0gMDsKPiA+ICAJCXJ4X3EtPnhza19wb29sID0gTlVMTDsKPiA+IAo+ID4gLQkJ
aWYgKHF1ZXVlID09IDApCj4gPiAtCQkJYnJlYWs7Cj4gPiAtCj4gPiAtCQlxdWV1ZS0tOwo+ID4g
LQl9Cj4gPiArCX0gd2hpbGUgKHF1ZXVlLS0pOwo+ID4gCj4gPiAgCXJldHVybiByZXQ7Cj4gPiAg
fQo+IAo+IAo+IFRoaXMgaXMgYSByZWFsIENvdmVyaXR5IGlzc3VlIHNpbmNlIHF1ZXVlIHZhcmlh
YmxlIGlzIGRlZmluZWQgYXMgdTMyLCBidXQgdGhlcmUgaXMgbm8gYnJlYWthZ2UgZnJvbSBsb2dp
YywgaXQgd2lsbCBicmVhayB3aGlsZSBsb29wIHdoZW4gcXVldWUgZXF1YWwgMCwgYW5kIHF1ZXVl
WzBdIGFjdHVhbGx5IG5lZWQgYmUgaGFuZGxlZC4KPiBBZnRlciB5b3VyIGNvZGUgY2hhbmdlLCBx
dWV1ZVswXSB3aWxsIG5vdCBiZSBoYW5kbGVkLCByaWdodD8gSXQgd2lsbCBicmVhayB0aGUgbG9n
aWMuIElmIHlvdSB3YW50IHRvIGZpeCB0aGUgdGhpcyBpc3N1ZSwgSSB0aGluayB0aGUgZWFzaWVz
dCB3YXkgaXMgdG8gZGVmaW5lIHF1ZXVlIHZhcmlhYmxlIHRvIGludC4KPiAKPiBCZXN0IFJlZ2Fy
ZHMsCj4gSm9ha2ltIFpoYW5nCj4gPiAtLQo+ID4gMi4yNS4xCj4KClRoZSBmdW5jdGlvbiAnX19p
bml0X2RtYV9yeF9kZXNjX3JpbmdzJyBpcyBleHBlY3RpbmcgJ3F1ZXVlJyB0byBiZSB1MzIgdHlw
ZS4KSSB3b3VsZCBzdWdnZXN0IHRoZSBmb2xsb3dpbmc6LQoKQEAgLTE2ODYsNiArMTY4Niw3IEBA
IHN0YXRpYyBpbnQgaW5pdF9kbWFfcnhfZGVzY19yaW5ncyhzdHJ1Y3QgbmV0X2RldmljZSAqZGV2
LCBnZnBfdCBmbGFncykKICAgICAgICBzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYgPSBuZXRkZXZf
cHJpdihkZXYpOwogICAgICAgIHUzMiByeF9jb3VudCA9IHByaXYtPnBsYXQtPnJ4X3F1ZXVlc190
b191c2U7CiAgICAgICAgdTMyIHF1ZXVlOworICAgICAgIHUzMiBpOwogICAgICAgIGludCByZXQ7
CgogICAgICAgIC8qIFJYIElOSVRJQUxJWkFUSU9OICovCkBAIC0xNzAxLDIxICsxNzAyLDE2IEBA
IHN0YXRpYyBpbnQgaW5pdF9kbWFfcnhfZGVzY19yaW5ncyhzdHJ1Y3QgbmV0X2RldmljZSAqZGV2
LCBnZnBfdCBmbGFncykKICAgICAgICByZXR1cm4gMDsKCiBlcnJfaW5pdF9yeF9idWZmZXJzOgot
ICAgICAgIHdoaWxlIChxdWV1ZSA+PSAwKSB7Ci0gICAgICAgICAgICAgICBzdHJ1Y3Qgc3RtbWFj
X3J4X3F1ZXVlICpyeF9xID0gJnByaXYtPnJ4X3F1ZXVlW3F1ZXVlXTsKKyAgICAgICBmb3IgKGkg
PSAwOyBpIDw9IHF1ZXVlOyBpKyspIHsKKyAgICAgICAgICAgICAgIHN0cnVjdCBzdG1tYWNfcnhf
cXVldWUgKnJ4X3EgPSAmcHJpdi0+cnhfcXVldWVbaV07CgogICAgICAgICAgICAgICAgaWYgKHJ4
X3EtPnhza19wb29sKQotICAgICAgICAgICAgICAgICAgICAgICBkbWFfZnJlZV9yeF94c2tidWZz
KHByaXYsIHF1ZXVlKTsKKyAgICAgICAgICAgICAgICAgICAgICAgZG1hX2ZyZWVfcnhfeHNrYnVm
cyhwcml2LCBpKTsKICAgICAgICAgICAgICAgIGVsc2UKLSAgICAgICAgICAgICAgICAgICAgICAg
ZG1hX2ZyZWVfcnhfc2tidWZzKHByaXYsIHF1ZXVlKTsKKyAgICAgICAgICAgICAgICAgICAgICAg
ZG1hX2ZyZWVfcnhfc2tidWZzKHByaXYsIGkpOwoKICAgICAgICAgICAgICAgIHJ4X3EtPmJ1Zl9h
bGxvY19udW0gPSAwOwogICAgICAgICAgICAgICAgcnhfcS0+eHNrX3Bvb2wgPSBOVUxMOwotCi0g
ICAgICAgICAgICAgICBpZiAocXVldWUgPT0gMCkKLSAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7Ci0KLSAgICAgICAgICAgICAgIHF1ZXVlLS07CiAgICAgICAgfQoKUmVnYXJkcywKIFZLIApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
