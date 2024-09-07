Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A372970031
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Sep 2024 07:34:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA77BC78013;
	Sat,  7 Sep 2024 05:34:57 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr
 [80.12.242.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EFA7C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Sep 2024 05:34:50 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id mo5jsZENhQYYumo5jsI8EG; Sat, 07 Sep 2024 07:34:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1725687289;
 bh=zhb/fr3/ahbe9u0OOQ3I4zVqjQ6OdAdflP4aJvLzC4g=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=Ov4MO2/EsHbrXOn9mC5X45wUoZIu5LI6TUyK0ggF1aC8TviLvfB2vCpHsKNXLYgO5
 vBaAVBW+bZ0l5ZTWIpIqG1k5s5ogB6GbmyJep53eZUBPf7UrWql6sNXCVJAV7qwJ/1
 IKAMTL4XPED5b32aaNhI45/3uOfPJ3CGw0qz15LWBCyr9YqZ3KUAXf9faq3OFP5C8r
 RcDhXSGvkEV2+CZzDd2oTGxqPwspFww7txYJdfKzDwGcoeUud15+vIoJ0S0x/fCqRZ
 1y+Kq0GAzZTDRh8RQOXn6s6TFr9lLo8cXOffoCQL4+J2ZW41amN0iv7I2iv+YmsbqH
 V9/TpYOhfBxiA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 07 Sep 2024 07:34:49 +0200
X-ME-IP: 90.11.132.44
Message-ID: <daf856a8-32ad-47ac-91b2-0aa2253636f8@wanadoo.fr>
Date: Sat, 7 Sep 2024 07:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Li Zetao <lizetao1@huawei.com>, mchehab@kernel.org,
 florian.fainelli@broadcom.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, heiko@sntech.de, yisen.zhuang@huawei.com,
 salil.mehta@huawei.com, hauke@hauke-m.de, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, wellslutw@gmail.com,
 radhey.shyam.pandey@amd.com, michal.simek@amd.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, ruanjinjie@huawei.com,
 hverkuil-cisco@xs4all.nl, u.kleine-koenig@pengutronix.de,
 jacky_chou@aspeedtech.com, jacob.e.keller@intel.com
References: <20240907031926.3591353-1-lizetao1@huawei.com>
 <20240907031926.3591353-3-lizetao1@huawei.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240907031926.3591353-3-lizetao1@huawei.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 02/10] net: ethernet: Convert
 using devm_clk_get_enabled() in emac_probe()
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

TGUgMDcvMDkvMjAyNCDDoCAwNToxOSwgTGkgWmV0YW8gYSDDqWNyaXTCoDoKPiBVc2UgZGV2bV9j
bGtfZ2V0X2VuYWJsZWQoKSBpbnN0ZWFkIG9mIGRldm1fY2xrX2dldCgpICsKPiBjbGtfcHJlcGFy
ZV9lbmFibGUoKSwgd2hpY2ggY2FuIG1ha2UgdGhlIGNsayBjb25zaXN0ZW50IHdpdGggdGhlIGRl
dmljZQo+IGxpZmUgY3ljbGUgYW5kIHJlZHVjZSB0aGUgcmlzayBvZiB1bnJlbGVhc2VkIGNsayBy
ZXNvdXJjZXMuIFNpbmNlIHRoZQo+IGRldmljZSBmcmFtZXdvcmsgaGFzIGF1dG9tYXRpY2FsbHkg
cmVsZWFzZWQgdGhlIGNsayByZXNvdXJjZSwgdGhlcmUgaXMKPiBubyBuZWVkIHRvIGV4ZWN1dGUg
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKGNsaykgb24gdGhlIGVycm9yIHBhdGgsIGRyb3AKPiB0aGUg
b3V0X2Nsa19kaXNhYmxlX3VucHJlcGFyZSBsYWJlbCwgYW5kIHRoZSBvcmlnaW5hbCBlcnJvciBw
cm9jZXNzIGNhbgo+IGNoYW5nZWQgdG8gdGhlIG91dF9kaXNwb3NlX21hcHBpbmcgZXJyb3IgcGF0
aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMaSBaZXRhbyA8bGl6ZXRhbzFAaHVhd2VpLmNvbT4KCkhp
LAoKSSB0aGluayB0aGF0IHRoZSBzdWJqZWN0IHNob3VsZCBiZSAibmV0OiBldGhlcm5ldDogYWxs
d2lubmVyOiIsIG9yIG1heWJlIApldmVuICJuZXQ6IGFsbHdpbm5lcjoiCgoKY2xrIGNhbiBub3cg
YmUgcmVtb3ZlZCBmcm9tIHN0cnVjdCBlbWFjX2JvYXJkX2luZm8gSSB0aGluay4KWW91IHNob3Vs
ZCBjaGVjayBmb3IgYWxsIHBhdGNoZXMsIGFzIGFza2VkIGluIFsxXS4KCkkndmUgbm90IGxvb2tl
ZCBhbGwgcGF0Y2hlcywgYnV0IGxhbnRpcV94cngyMDAoKSBsb29rcyBhbHNvIGEgZ29vZCAKY2Fu
ZGlkYXRlIGZvciByZW1vdmluZyBjbGsgZnJvbSBhIHN0cnVjdHVyZS4KCkNKCgpbMV06IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDkwMzE1MTY0OS4xYjQ2NjE0NUBrZXJuZWwub3Jn
LwoKQ0oKCj4gLS0tCj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9hbGx3aW5uZXIvc3VuNGktZW1h
Yy5jIHwgMTMgKystLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L2FsbHdpbm5lci9zdW40aS1lbWFjLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9hbGx3aW5uZXIv
c3VuNGktZW1hYy5jCj4gaW5kZXggZDc2MWMwOGZlNWMxLi44ZjQyNTAxNzI5YjcgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvYWxsd2lubmVyL3N1bjRpLWVtYWMuYwo+ICsrKyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L2FsbHdpbm5lci9zdW40aS1lbWFjLmMKPiBAQCAtMTAwNSwy
MiArMTAwNSwxNiBAQCBzdGF0aWMgaW50IGVtYWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiAgIAlpZiAoZW1hY19jb25maWd1cmVfZG1hKGRiKSkKPiAgIAkJbmV0ZGV2X2lu
Zm8obmRldiwgImNvbmZpZ3VyZSBkbWEgZmFpbGVkLiBkaXNhYmxlIGRtYS5cbiIpOwo+ICAgCj4g
LQlkYi0+Y2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsIE5VTEwpOwo+ICsJZGItPmNsayA9
IGRldm1fY2xrX2dldF9lbmFibGVkKCZwZGV2LT5kZXYsIE5VTEwpOwo+ICAgCWlmIChJU19FUlIo
ZGItPmNsaykpIHsKPiAgIAkJcmV0ID0gUFRSX0VSUihkYi0+Y2xrKTsKPiAgIAkJZ290byBvdXRf
ZGlzcG9zZV9tYXBwaW5nOwo+ICAgCX0KPiAgIAo+IC0JcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxl
KGRiLT5jbGspOwo+IC0JaWYgKHJldCkgewo+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwgIkVycm9y
IGNvdWxkbid0IGVuYWJsZSBjbG9jayAoJWQpXG4iLCByZXQpOwo+IC0JCWdvdG8gb3V0X2Rpc3Bv
c2VfbWFwcGluZzsKPiAtCX0KPiAtCj4gICAJcmV0ID0gc3VueGlfc3JhbV9jbGFpbSgmcGRldi0+
ZGV2KTsKPiAgIAlpZiAocmV0KSB7Cj4gICAJCWRldl9lcnIoJnBkZXYtPmRldiwgIkVycm9yIGNv
dWxkbid0IG1hcCBTUkFNIHRvIGRldmljZVxuIik7Cj4gLQkJZ290byBvdXRfY2xrX2Rpc2FibGVf
dW5wcmVwYXJlOwo+ICsJCWdvdG8gb3V0X2Rpc3Bvc2VfbWFwcGluZzsKPiAgIAl9Cj4gICAKPiAg
IAlkYi0+cGh5X25vZGUgPSBvZl9wYXJzZV9waGFuZGxlKG5wLCAicGh5LWhhbmRsZSIsIDApOwo+
IEBAIC0xMDY4LDggKzEwNjIsNiBAQCBzdGF0aWMgaW50IGVtYWNfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgIAo+ICAgb3V0X3JlbGVhc2Vfc3JhbToKPiAgIAlzdW54aV9z
cmFtX3JlbGVhc2UoJnBkZXYtPmRldik7Cj4gLW91dF9jbGtfZGlzYWJsZV91bnByZXBhcmU6Cj4g
LQljbGtfZGlzYWJsZV91bnByZXBhcmUoZGItPmNsayk7Cj4gICBvdXRfZGlzcG9zZV9tYXBwaW5n
Ogo+ICAgCWlycV9kaXNwb3NlX21hcHBpbmcobmRldi0+aXJxKTsKPiAgIAlkbWFfcmVsZWFzZV9j
aGFubmVsKGRiLT5yeF9jaGFuKTsKPiBAQCAtMTA5NSw3ICsxMDg3LDYgQEAgc3RhdGljIHZvaWQg
ZW1hY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAo+ICAgCXVucmVn
aXN0ZXJfbmV0ZGV2KG5kZXYpOwo+ICAgCXN1bnhpX3NyYW1fcmVsZWFzZSgmcGRldi0+ZGV2KTsK
PiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShkYi0+Y2xrKTsKPiAgIAlpcnFfZGlzcG9zZV9tYXBw
aW5nKG5kZXYtPmlycSk7Cj4gICAJaW91bm1hcChkYi0+bWVtYmFzZSk7Cj4gICAJZnJlZV9uZXRk
ZXYobmRldik7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
