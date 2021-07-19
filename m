Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0E03DD32E
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:44:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D77CDC5A4D8;
	Mon,  2 Aug 2021 09:44:23 +0000 (UTC)
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABDA2C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 09:30:43 +0000 (UTC)
X-QQ-mid: bizesmtp31t1626687027t7kaq5ku
Received: from [10.20.53.139] (unknown [113.57.152.160])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 19 Jul 2021 17:30:26 +0800 (CST)
X-QQ-SSF: 00400000007000105000C00C0000000
X-QQ-FEAT: Br92wPWbhacdlZ57UjnQCb5rJo+349/ofbw6BbfDsiN9kJ1ca2bOfnKndGyp1
 D/S68KV6KdH5oFbEAgv9PDeDZmFg4/1CqjvX/4UXK8E+tifAW8S2R+8sAvMvf6V+Lt9eZlE
 iQAd3qjqNTNvFrOIS9LMSKo+MvmnB04kVBsGqbd2N+rs6jiSl8+30Who6YM3dd1PjJup8K7
 jzMCcblXw6Ub3mmnBXWo8t94TulWl3Doz/nuDM5cE3C2Oq6P8N6sSkSpF/jRozzoefcO/Ge
 krLhWUFlnSFU+eq3rlSJ0CrBfY42ZwSk8tpZUt8CcTu0+vnOv9lXOlgH/nRmz3tAp93LfWb
 frUnSXEa4eoO8LI43xws4XReiEJ+OM/2aI0/AOU
X-QQ-GoodBg: 2
To: Joakim Zhang <qiangqing.zhang@nxp.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>
References: <20210719074410.6787-1-chenhaoa@uniontech.com>
 <VI1PR04MB68007DC1F11B5A0991BE02E7E6E19@VI1PR04MB6800.eurprd04.prod.outlook.com>
From: Hao Chen <chenhaoa@uniontech.com>
Message-ID: <e2ec8dfe-8795-8581-ffc6-aee54641bbce@uniontech.com>+A62B52A4D92F306F
Date: Mon, 19 Jul 2021 17:29:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB68007DC1F11B5A0991BE02E7E6E19@VI1PR04MB6800.eurprd04.prod.outlook.com>
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
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix 'ethtool -P' return
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CtTaIDIwMjEvNy8xOSDPws7nNDo1MiwgSm9ha2ltIFpoYW5nINC0tcA6Cj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEhhbyBDaGVuIDxjaGVuaGFvYUB1bmlvbnRlY2guY29t
Pgo+PiBTZW50OiAyMDIxxOo31MIxOcjVIDE1OjQ0Cj4+IFRvOiBwZXBwZS5jYXZhbGxhcm9Ac3Qu
Y29tCj4+IENjOiBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tOyBqb2FicmV1QHN5bm9wc3lz
LmNvbTsKPj4gZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsga3ViYUBrZXJuZWwub3JnOyBtY29xdWVsaW4u
c3RtMzJAZ21haWwuY29tOwo+PiBsaW51eEBhcm1saW51eC5vcmcudWs7IG5ldGRldkB2Z2VyLmtl
cm5lbC5vcmc7Cj4+IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb207IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7Cj4+IEhhbyBDaGVuIDxjaGVuaGFvYUB1bmlvbnRl
Y2guY29tPgo+PiBTdWJqZWN0OiBbUEFUQ0ggdjJdIG5ldDogc3RtbWFjOiBmaXggJ2V0aHRvb2wg
LVAnIHJldHVybiAtRUJVU1kKPj4KPj4gVGhlIHBlcm1hbmVudCBtYWMgYWRkcmVzcyBzaG91bGQg
YmUgYXZhaWxhYmxlIGZvciBxdWVyeSB3aGVuIHRoZSBkZXZpY2UgaXMKPj4gbm90IHVwLgo+PiBO
ZXR3b3JrTWFuYWdlciwgdGhlIHN5c3RlbSBuZXR3b3JrIGRhZW1vbiwgdXNlcyAnZXRodG9vbCAt
UCcgdG8gb2J0YWluIHRoZQo+PiBwZXJtYW5lbnQgYWRkcmVzcyBhZnRlciB0aGUga2VybmVsIHN0
YXJ0LiBXaGVuIHRoZSBuZXR3b3JrIGRldmljZSBpcyBub3QgdXAsCj4+IGl0IHdpbGwgcmV0dXJu
IHRoZSBkZXZpY2UgYnVzeSBlcnJvciB3aXRoICdldGh0b29sIC1QJy4gQXQgdGhhdCB0aW1lLCBp
dCBpcyB1bmFibGUgdG8KPj4gYWNjZXNzIHRoZSBJbnRlcm5ldCB0aHJvdWdoIHRoZSBwZXJtYW5l
bnQgYWRkcmVzcyBieSBOZXR3b3JrTWFuYWdlci4KPj4gSSB0aGluayB0aGF0IHRoZSAnLmJlZ2lu
JyBpcyBub3QgdXNlZCB0byBjaGVjayBpZiB0aGUgZGV2aWNlIGlzIHVwLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBIYW8gQ2hlbiA8Y2hlbmhhb2FAdW5pb250ZWNoLmNvbT4KPj4gLS0tCj4+ICAgZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX2V0aHRvb2wuYyB8IDYgKysr
Ky0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0
bW1hY19ldGh0b29sLmMKPj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9z
dG1tYWNfZXRodG9vbC5jCj4+IGluZGV4IGQwY2U2MDhiODFjMy4uN2NjYjBkNzM4YTFjIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfZXRo
dG9vbC5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19ldGh0b29sLmMKPj4gQEAgLTQxMiw4ICs0MTIsMTAgQEAgc3RhdGljIHZvaWQgc3RtbWFjX2V0
aHRvb2xfc2V0bXNnbGV2ZWwoc3RydWN0Cj4+IG5ldF9kZXZpY2UgKmRldiwgdTMyIGxldmVsKQo+
Pgo+PiAgIHN0YXRpYyBpbnQgc3RtbWFjX2NoZWNrX2lmX3J1bm5pbmcoc3RydWN0IG5ldF9kZXZp
Y2UgKmRldikgIHsKPj4gLQlpZiAoIW5ldGlmX3J1bm5pbmcoZGV2KSkKPj4gLQkJcmV0dXJuIC1F
QlVTWTsKPj4gKwlzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYgPSBuZXRkZXZfcHJpdihkZXYpOwo+
PiArCj4+ICsJcG1fcnVudGltZV9nZXRfc3luYyhwcml2LT5kZXZpY2UpOwo+PiArCj4+ICAgCXJl
dHVybiAwOwo+PiAgIH0KPiBBZnRlciB0aGlzIGNvZGUgY2hhbmdlLCBjbG9ja3MgYWx3YXlzIGVu
YWJsZWQgZXZlbiB0aGUgTklDIGlzIG5vdCB1cCwgaXQncyBub3QgZ29vZC4KPiBTaG91bGQgaW1w
bGVtZW50IC5jb21wbGV0ZSgpIHRvIGRpc2FibGUgY2xvY2tzIGFmdGVyIHRoZSBpbmZvIHlvdSBn
b3Q/Cj4KPiBCZXN0IFJlZ2FyZHMsCj4gSm9ha2ltIFpoYW5nCj4+IC0tCj4+IDIuMjAuMQo+Pgo+
Pgo+IE9LLCBJIHdpbGwgaW1wbGVtZW50IC5jb21wbGV0ZSgpIGluIG5leHQgdmVyc2lvbiBwYXRj
aC5UaGFua3MuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
