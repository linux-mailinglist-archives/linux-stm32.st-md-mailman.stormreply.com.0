Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C79289572EF
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 20:19:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57A6AC6DD72;
	Mon, 19 Aug 2024 18:19:51 +0000 (UTC)
Received: from msa.smtpout.orange.fr (msa-209.smtpout.orange.fr
 [193.252.23.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7A28C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 18:19:44 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id g6yfszJBlQRySg6yfszKrO; Mon, 19 Aug 2024 20:19:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1724091584;
 bh=i2piStncb9aJgwDrvhVqFSwNM+FZr5qttsR8sW3kpiA=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=mERexwoyPzlfOebBUEnIZsOtSDCyALgn06bAE0XuHJCOZf7MgURweOtCYf6D5ucvJ
 hMxqf1tym0+N1Yh1Kbtxnt/uiEN5D/QjnWk+qeYU1kf9fnNGIcOfFfUV8ildjug1Wj
 +AeJZMCJpizoL16BT/5H1yRsJWk4bK4mOJMcJ5w1C1DdkuK+LTxHCusEYR4OwF84Ku
 +LejUCxpLFrzVaYKQL35SlVlnRKXCLRCjGATL+8fj/YDf1K9GFn7lWZ/Qy8KDoyJRY
 4PIjpQAMLXkiwAulAoaPdD5hVIViRIDkDDoFS+N0BjfpoxS/HV8fdzvU2do0815ek2
 I0eIZaE9SrODA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 19 Aug 2024 20:19:44 +0200
X-ME-IP: 90.11.132.44
Message-ID: <74e9109a-ac59-49e2-9b1d-d825c9c9f891@wanadoo.fr>
Date: Mon, 19 Aug 2024 20:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Stanner <pstanner@redhat.com>, onathan Corbet <corbet@lwn.net>,
 Jens Axboe <axboe@kernel.dk>, Wu Hao <hao.wu@intel.com>,
 Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Xu Yilun <yilun.xu@intel.com>, Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-10-pstanner@redhat.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240819165148.58201-10-pstanner@redhat.com>
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 8/9] vdap: solidrun: Replace deprecated
	PCI functions
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

TGUgMTkvMDgvMjAyNCDDoCAxODo1MSwgUGhpbGlwcCBTdGFubmVyIGEgw6ljcml0wqA6Cj4gc29s
aWRydW4gdXRpbGl6ZXMgcGNpbV9pb21hcF9yZWdpb25zKCksIHdoaWNoIGhhcyBiZWVuIGRlcHJl
Y2F0ZWQgYnkgdGhlCj4gUENJIHN1YnN5c3RlbSBpbiBjb21taXQgZTM1NGJiODRhNGMxICgiUENJ
OiBEZXByZWNhdGUKPiBwY2ltX2lvbWFwX3RhYmxlKCksIHBjaW1faW9tYXBfcmVnaW9uc19yZXF1
ZXN0X2FsbCgpIiksIGFtb25nIG90aGVyCj4gdGhpbmdzIGJlY2F1c2UgaXQgZm9yY2VzIHVzYWdl
IG9mIHF1aXRlIGEgY29tcGxpY2F0ZWQgYml0bWFzayBtZWNoYW5pc20uCj4gVGhlIGJpdG1hc2sg
aGFuZGxpbmcgY29kZSBjYW4gZW50aXJlbHkgYmUgcmVtb3ZlZCBieSByZXBsYWNpbmcKPiBwY2lt
X2lvbWFwX3JlZ2lvbnMoKSBhbmQgcGNpbV9pb21hcF90YWJsZSgpLgo+IAo+IFJlcGxhY2UgcGNp
bV9pb21hcF9yZWdpb25zKCkgYW5kIHBjaW1faW9tYXBfdGFibGUoKSB3aXRoCj4gcGNpX2lvbWFw
X3JlZ2lvbigpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHAgU3Rhbm5lciA8cHN0YW5uZXJA
cmVkaGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmRwYS9zb2xpZHJ1bi9zbmV0X21haW4uYyB8
IDQ3ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92ZHBhL3NvbGlkcnVuL3NuZXRfbWFpbi5jIGIvZHJpdmVycy92ZHBhL3NvbGlkcnVuL3NuZXRf
bWFpbi5jCj4gaW5kZXggOTk0MjhhMDQwNjhkLi5hYmYwMjdjYTM1ZTEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy92ZHBhL3NvbGlkcnVuL3NuZXRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy92ZHBhL3Nv
bGlkcnVuL3NuZXRfbWFpbi5jCj4gQEAgLTU1NiwzMyArNTU2LDI0IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgdmRwYV9jb25maWdfb3BzIHNuZXRfY29uZmlnX29wcyA9IHsKPiAgIHN0YXRpYyBpbnQg
cHNuZXRfb3Blbl9wZl9iYXIoc3RydWN0IHBjaV9kZXYgKnBkZXYsIHN0cnVjdCBwc25ldCAqcHNu
ZXQpCj4gICB7Cj4gICAJY2hhciBuYW1lWzUwXTsKPiAtCWludCByZXQsIGksIG1hc2sgPSAwOwo+
ICsJaW50IGk7Cj4gKwo+ICsJc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAicHNuZXRbJXNd
LWJhcnMiLCBwY2lfbmFtZShwZGV2KSk7Cj4gKwo+ICAgCS8qIFdlIGRvbid0IGtub3cgd2hpY2gg
QkFSIHdpbGwgYmUgdXNlZCB0byBjb21tdW5pY2F0ZS4uCj4gICAJICogV2Ugd2lsbCBtYXAgZXZl
cnkgYmFyIHdpdGggbGVuID4gMC4KPiAgIAkgKgo+ICAgCSAqIExhdGVyLCB3ZSB3aWxsIGRpc2Nv
dmVyIHRoZSBCQVIgYW5kIHVubWFwIGFsbCBvdGhlciBCQVJzLgo+ICAgCSAqLwo+ICAgCWZvciAo
aSA9IDA7IGkgPCBQQ0lfU1REX05VTV9CQVJTOyBpKyspIHsKPiAtCQlpZiAocGNpX3Jlc291cmNl
X2xlbihwZGV2LCBpKSkKPiAtCQkJbWFzayB8PSAoMSA8PCBpKTsKPiAtCX0KPiAtCj4gLQkvKiBO
byBCQVIgY2FuIGJlIHVzZWQuLiAqLwo+IC0JaWYgKCFtYXNrKSB7Cj4gLQkJU05FVF9FUlIocGRl
diwgIkZhaWxlZCB0byBmaW5kIGEgUENJIEJBUlxuIik7Cj4gLQkJcmV0dXJuIC1FTk9ERVY7Cj4g
LQl9Cj4gLQo+IC0Jc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAicHNuZXRbJXNdLWJhcnMi
LCBwY2lfbmFtZShwZGV2KSk7Cj4gLQlyZXQgPSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRldiwgbWFz
aywgbmFtZSk7Cj4gLQlpZiAocmV0KSB7Cj4gLQkJU05FVF9FUlIocGRldiwgIkZhaWxlZCB0byBy
ZXF1ZXN0IGFuZCBtYXAgUENJIEJBUnNcbiIpOwo+IC0JCXJldHVybiByZXQ7Cj4gLQl9Cj4gKwkJ
aWYgKHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgaSkpIHsKPiArCQkJcHNuZXQtPmJhcnNbaV0gPSBw
Y2ltX2lvbWFwX3JlZ2lvbihwZGV2LCBpLCBuYW1lKTsKCkhpLAoKVW5yZWxhdGVkIHRvIHRoZSBw
YXRjaCwgYnV0IGlzIGlzIHNhZmUgdG8gaGF2ZSAnbmFtZScgYmUgb24gdGhlIHN0YWNrPwoKcGNp
bV9pb21hcF9yZWdpb24oKQotLT4gX19wY2ltX3JlcXVlc3RfcmVnaW9uKCkKLS0+IF9fcGNpbV9y
ZXF1ZXN0X3JlZ2lvbl9yYW5nZSgpCi0tPiByZXF1ZXN0X3JlZ2lvbigpIG9yIF9fcmVxdWVzdF9t
ZW1fcmVnaW9uKCkKLS0+IF9fcmVxdWVzdF9yZWdpb24oKQotLT4gX19yZXF1ZXN0X3JlZ2lvbl9s
b2NrZWQoKQotLT4gcmVzLT5uYW1lID0gbmFtZTsKClNvIGFuIGFkZHJlc3Mgb24gdGhlIHN0YWNr
IGVuZHMgaW4gdGhlICduYW1lJyBmaWVsZCBvZiBhICJzdHJ1Y3QgcmVzb3VyY2UiLgoKQWNjb3Jk
aW5nIHRvIGEgZmV3IGdyZXAsIGl0IGxvb2tzIHJlYWxseSB1bnVzdWFsLgoKSSBkb24ndCBrbm93
IGlmIGl0IGlzIHVzZWQsIGJ1dCBpdCBsb29rcyBzdHJhbmdlIHRvIG1lLgoKCklmIGl0IGlzIGFu
IGlzc3VlLCBpdCB3YXMgYXBwYXJlbnRseSBhbHJlYWR5IHRoZXJlIGJlZm9yZSB0aGlzIHBhdGNo
LgoKPiArCQkJaWYgKElTX0VSUihwc25ldC0+YmFyc1tpXSkpIHsKPiArCQkJCVNORVRfRVJSKHBk
ZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBhbmQgbWFwIFBDSSBCQVJzXG4iKTsKPiArCQkJCXJldHVy
biBQVFJfRVJSKHBzbmV0LT5iYXJzW2ldKTsKPiArCQkJfQo+ICsJCX0KPiAgIAo+IC0JZm9yIChp
ID0gMDsgaSA8IFBDSV9TVERfTlVNX0JBUlM7IGkrKykgewo+IC0JCWlmIChtYXNrICYgKDEgPDwg
aSkpCj4gLQkJCXBzbmV0LT5iYXJzW2ldID0gcGNpbV9pb21hcF90YWJsZShwZGV2KVtpXTsKPiAg
IAl9Cj4gICAKPiAgIAlyZXR1cm4gMDsKPiBAQCAtNTkxLDE4ICs1ODIsMTUgQEAgc3RhdGljIGlu
dCBwc25ldF9vcGVuX3BmX2JhcihzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0IHBzbmV0ICpw
c25ldCkKPiAgIHN0YXRpYyBpbnQgc25ldF9vcGVuX3ZmX2JhcihzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgc3RydWN0IHNuZXQgKnNuZXQpCj4gICB7Cj4gICAJY2hhciBuYW1lWzUwXTsKPiAtCWludCBy
ZXQ7Cj4gICAKPiAgIAlzbnByaW50ZihuYW1lLCBzaXplb2YobmFtZSksICJzbmV0WyVzXS1iYXIi
LCBwY2lfbmFtZShwZGV2KSk7Cj4gICAJLyogUmVxdWVzdCBhbmQgbWFwIEJBUiAqLwo+IC0JcmV0
ID0gcGNpbV9pb21hcF9yZWdpb25zKHBkZXYsIEJJVChzbmV0LT5wc25ldC0+Y2ZnLnZmX2Jhciks
IG5hbWUpOwo+IC0JaWYgKHJldCkgewo+ICsJc25ldC0+YmFyID0gcGNpbV9pb21hcF9yZWdpb24o
cGRldiwgc25ldC0+cHNuZXQtPmNmZy52Zl9iYXIsIG5hbWUpOwoKU2FtZQoKSnVzdCBteSAyYy4K
CkNKCgo+ICsJaWYgKElTX0VSUihzbmV0LT5iYXIpKSB7Cj4gICAJCVNORVRfRVJSKHBkZXYsICJG
YWlsZWQgdG8gcmVxdWVzdCBhbmQgbWFwIFBDSSBCQVIgZm9yIGEgVkZcbiIpOwo+IC0JCXJldHVy
biByZXQ7Cj4gKwkJcmV0dXJuIFBUUl9FUlIoc25ldC0+YmFyKTsKPiAgIAl9Cj4gICAKPiAtCXNu
ZXQtPmJhciA9IHBjaW1faW9tYXBfdGFibGUocGRldilbc25ldC0+cHNuZXQtPmNmZy52Zl9iYXJd
Owo+IC0KPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+IEBAIC02NTAsMTUgKzYzOCwxMiBAQCBz
dGF0aWMgaW50IHBzbmV0X2RldGVjdF9iYXIoc3RydWN0IHBzbmV0ICpwc25ldCwgdTMyIG9mZikK
PiAgIAo+ICAgc3RhdGljIHZvaWQgcHNuZXRfdW5tYXBfdW51c2VkX2JhcnMoc3RydWN0IHBjaV9k
ZXYgKnBkZXYsIHN0cnVjdCBwc25ldCAqcHNuZXQpCj4gICB7Cj4gLQlpbnQgaSwgbWFzayA9IDA7
Cj4gKwlpbnQgaTsKPiAgIAo+ICAgCWZvciAoaSA9IDA7IGkgPCBQQ0lfU1REX05VTV9CQVJTOyBp
KyspIHsKPiAgIAkJaWYgKHBzbmV0LT5iYXJzW2ldICYmIGkgIT0gcHNuZXQtPmJhcm5vKQo+IC0J
CQltYXNrIHw9ICgxIDw8IGkpOwo+ICsJCQlwY2ltX2lvdW5tYXBfcmVnaW9uKHBkZXYsIGkpOwo+
ICAgCX0KPiAtCj4gLQlpZiAobWFzaykKPiAtCQlwY2ltX2lvdW5tYXBfcmVnaW9ucyhwZGV2LCBt
YXNrKTsKPiAgIH0KPiAgIAo+ICAgLyogUmVhZCBTTkVUIGNvbmZpZyBmcm9tIFBDSSBCQVIgKi8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
