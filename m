Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB26178B569
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 18:36:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53452C6A61D;
	Mon, 28 Aug 2023 16:36:01 +0000 (UTC)
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com
 [162.62.57.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2BF9C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693240541;
 bh=qMLnaoLr7Mxo2WAiGAwS0IA7JoMknwpbu2iKGRbMgtQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SMAgDov/60r8EeeEEMwjTyhJAL3Uf2yTo0dnGyD7KMlNIYHRYpFmTQR9fZ2hgqj0W
 esNcf6oHzfaMRiFttw8A2MpfD/jviHymRhLiEqFrUsWV+XB4XVWFOxmeq9x/AYotC0
 vn/cC9vPwM7CQelWsQeXAqYWvPleeINNZ+igL770=
Received: from localhost.localdomain ([122.14.229.192])
 by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
 id 8E52FE7E; Tue, 29 Aug 2023 00:35:37 +0800
X-QQ-mid: xmsmtpt1693240537td16zclax
Message-ID: <tencent_273D6814AA50AF24126F966A3DB684C0FE09@qq.com>
X-QQ-XMAILINFO: NFvJBhJV2/hXwhjejeYoN5PG4pyPtPw2M/TIYGva9QgadJmM2h091KEZjafGq2
 T5tlxcSeJkTiSOunxxJhcoDjpnMg9AdPYI1uCf4EAv62b8q3f+Q8Apw6OL5sVTduoLMCXCtq1QkI
 20yCg2nbII6R5wB0Vm3z294iEgbhrzrE+NXmL1p6iNg4XhcPGLDvJzxmsYtMTIDSBLXN8dxuABAR
 Ik9CPFOqQGBCNbBTuTVGWQRytfxVGsEd2gPx4WZAaAEbTl/Mjnr9miqOF7RHVpJK/crS/GPbH+x5
 SKhuj274CAmES5zxNFOF+R2rELNG/SkhTvD5y8AeQrwCYNf1rpRx1eATl+hbCYtOY5KqV8Fz//Qb
 ZO20aL+fxSZ5VfFKM7JiN/zp5TLJsDZ2mZdWGJTlO4cILjbO33bL2IpYSLruBHCTXqShjpCVPj9s
 BtoIYDA4VFi59JDrMO9jNBvqaS51xRjt1v/SGpBRYAIXk7Fy5HLMNN7q/s/kj8N9y13KsfPfjlrb
 3CUlE67+wYWZjvGBmCuI/Tbe3gN7ccXx2Iwghm9SuGiF+zNCXRK0jdWjsjwJlrZDrBjN8U6QB5vw
 CoJu2rp6rhzqPSXcJ9l41Pm8fnUmf8algkDZYsXWUzy1ipX2zj2RIkdw25TUGhp0LjqpoCkIFG2g
 eFa3KXiXwxt5NsFb1p6eflRQzRRReaf67f+AEPKOVRuA+M0hQW0ZjhqCOPy0RlfpHsK1OIWv8YHO
 +OVfxZhVh+QH6B/mN8cJ0U/fr0gcT24wi2SAIFgqvbAE1qR9nb9PVNH6ju7Tg6jh2XSaND2zhUWd
 UW7Dsz2Pb4Ztkaa8fT16vJ5ZwVh+XVO5Ie8F4cQRL0WaDUJHyr8QTqi4eQo8LSfA2Ua8Vq87b20l
 9Ejmbu75rpuNjbptuNwm+n1x946soLdFhFPsOg6Z9Wv075+CLLZvNr7soxlVh0eGEeWe7HIHlpze
 R/0NOMcbhAg/X31A+Vsd747DYx5RVPjEweKoM+M2fA6/EWy+JU6M/kQO6GizLy2ewRngFyM14=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Date: Tue, 29 Aug 2023 00:35:36 +0800
X-OQ-MSGID: <3266012.aeNJFYEL58@localhost.localdomain>
In-Reply-To: <20230828171605.15c51c28@jic23-huawei>
References: <tencent_994DA85912C937E3B5405BA960B31ED90A08@qq.com>
 <tencent_CF6E986A75B63EC09E3D98143650B5241809@qq.com>
 <20230828171605.15c51c28@jic23-huawei>
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Re: [PATCH] io: adc: stm32-adc: fix potential NULL
 pointer dereference in stm32_adc_probe()
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

5ZyoIDIwMjPlubQ45pyIMjnml6XmmJ/mnJ/kuowgQ1NUIOS4iuWNiDEyOjE2OjA177yMSm9uYXRo
YW4gQ2FtZXJvbiDlhpnpgZPvvJoKPiBPbiBNb24sIDI4IEF1ZyAyMDIzIDIzOjAyOjA3ICswODAw
Cj4gCj4gWmhhbmcgU2h1cm9uZyA8emhhbmdfc2h1cm9uZ0Bmb3htYWlsLmNvbT4gd3JvdGU6Cj4g
PiDlnKggMjAyM+W5tDfmnIgxN+aXpeaYn+acn+S4gCBDU1Qg5LiK5Y2IMTI6MDg6MjHvvIxKb25h
dGhhbiBDYW1lcm9uIOWGmemBk++8mgo+ID4gCj4gPiA+IE9uIFNhdCwgMTUgSnVsIDIwMjMgMjM6
NTU6NTAgKzA4MDAKPiA+ID4gCj4gPiA+IFpoYW5nIFNodXJvbmcgPHpoYW5nX3NodXJvbmdAZm94
bWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+IG9mX21hdGNoX2RldmljZSgpIG1heSBmYWlsIGFuZCBy
ZXR1cm5zIGEgTlVMTCBwb2ludGVyLgo+ID4gPiA+IAo+ID4gPiA+IEZpeCB0aGlzIGJ5IGNoZWNr
aW5nIHRoZSByZXR1cm4gdmFsdWUgb2Ygb2ZfbWF0Y2hfZGV2aWNlKCkuCj4gPiA+ID4gCj4gPiA+
ID4gRml4ZXM6IDY0YWQ3ZjY0MzhmMyAoImlpbzogYWRjOiBzdG0zMjogaW50cm9kdWNlIGNvbXBh
dGlibGUgZGF0YSBjZmciKQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFpoYW5nIFNodXJvbmcgPHpo
YW5nX3NodXJvbmdAZm94bWFpbC5jb20+Cj4gPiA+IAo+ID4gPiBIaSBaaGFuZywKPiA+ID4gCj4g
PiA+IEknbSBub3Qgc3VyZSB3ZSBjYW4gYWN0dWFsbHkgbWFrZSB0aGlzIGJ1ZyBoYXBwZW4uIERv
IHlvdSBoYXZlCj4gPiA+IGEgd2F5IG9mIHRyaWdnZXJpbmcgaXQ/ICBUaGUgZHJpdmVyIGlzIG9u
bHkgcHJvYmVkIG9uIGRldmljZXMgd2hlcmUKPiA+ID4gdGhhdCBtYXRjaCB3aWxsIHdvcmsuCj4g
PiA+IAo+ID4gPiBBbHNvLCBhc3N1bWluZyB0aGUgbWF0Y2ggdGFibGUgaXMgdGhlIHNhbWUgb25l
IGFzc29jaWF0ZWQgd2l0aCB0aGlzCj4gPiA+IHByb2JlCj4gPiA+IGZ1bmN0aW9uLCB0aGVuIHVz
IHByaXYtPmNmZyA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgpIGFuZCBjaGVjayB0aGUKPiA+
ID4gb3V0cHV0IG9mIHRoYXQgd2hpY2ggaXMgd2hhdCB3ZSByZWFsbHkgY2FyZSBhYm91dC4KPiA+
ID4gCj4gPiA+IEpvbmF0aGFuCj4gPiA+IAo+ID4gPiA+IC0tLQo+ID4gPiA+IAo+ID4gPiA+ICBk
cml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNvcmUuYyB8IDkgKysrKysrKy0tCj4gPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jCj4gPiA+
ID4gYi9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNvcmUuYyBpbmRleCA0OGYwMmRjYzgxYzEu
LjcwMDExZmRiZjVmNgo+ID4gPiA+IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvaWlvL2Fk
Yy9zdG0zMi1hZGMtY29yZS5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFk
Yy1jb3JlLmMKPiA+ID4gPiBAQCAtNzA2LDYgKzcwNiw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfYWRj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UKPiA+ID4gPiAqcGRldik+Cj4gPiA+ID4gCj4g
PiA+ID4gIAlzdHJ1Y3Qgc3RtMzJfYWRjX3ByaXYgKnByaXY7Cj4gPiA+ID4gIAlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ID4gPiA+ICAJc3RydWN0IGRldmljZV9ub2RlICpucCA9
IHBkZXYtPmRldi5vZl9ub2RlOwo+ID4gPiA+IAo+ID4gPiA+ICsJY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCAqb2ZfaWQ7Cj4gPiA+ID4gKwo+ID4gPiA+IAo+ID4gPiA+ICAJc3RydWN0IHJlc291
cmNlICpyZXM7Cj4gPiA+ID4gIAl1MzIgbWF4X3JhdGU7Cj4gPiA+ID4gIAlpbnQgcmV0Owo+ID4g
PiA+IAo+ID4gPiA+IEBAIC03MTgsOCArNzIwLDExIEBAIHN0YXRpYyBpbnQgc3RtMzJfYWRjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UKPiA+ID4gPiAqcGRldik+Cj4gPiA+ID4gCj4gPiA+
ID4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gPiA+ID4gIAkKPiA+ID4gPiAgCXBsYXRmb3JtX3NldF9k
cnZkYXRhKHBkZXYsICZwcml2LT5jb21tb24pOwo+ID4gPiA+IAo+ID4gPiA+IC0JcHJpdi0+Y2Zn
ID0gKGNvbnN0IHN0cnVjdCBzdG0zMl9hZGNfcHJpdl9jZmcgKikKPiA+ID4gPiAtCQlvZl9tYXRj
aF9kZXZpY2UoZGV2LT5kcml2ZXItPm9mX21hdGNoX3RhYmxlLCBkZXYpLT5kYXRhOwo+ID4gPiA+
ICsJb2ZfaWQgPSBvZl9tYXRjaF9kZXZpY2UoZGV2LT5kcml2ZXItPm9mX21hdGNoX3RhYmxlLCBk
ZXYpOwo+ID4gPiA+ICsJaWYgKCFvZl9pZCkKPiA+ID4gPiArCQlyZXR1cm4gLUVOT0RFVjsKPiA+
ID4gPiArCj4gPiA+ID4gKwlwcml2LT5jZmcgPSAoY29uc3Qgc3RydWN0IHN0bTMyX2FkY19wcml2
X2NmZyAqKW9mX2lkLT5kYXRhOwo+ID4gPiA+IAo+ID4gPiA+ICAJcHJpdi0+bmJfYWRjX21heCA9
IHByaXYtPmNmZy0+bnVtX2FkY3M7Cj4gPiA+ID4gIAlzcGluX2xvY2tfaW5pdCgmcHJpdi0+Y29t
bW9uLmxvY2spOwo+ID4gCj4gPiBIZWxsbyBKb25hdGhhbiwKPiA+IAo+ID4gSSB0aGluayB3ZSBj
YW4gbWFrZSBpdCBoYXBwZW4gYnkgZGVzaWduaW5nIHRoZSBwbGF0Zm9ybSBkZXZpY2UgaW4gYSB3
YXkKPiA+IHRoYXQgaXRzIG5hbWUgYWxpZ25zIHdpdGggdGhhdCBvZiB0aGUgZHJpdmVyLiBJbiBz
dWNoIGEgc2NlbmFyaW8sIHdoZW4KPiA+IHRoZSBkcml2ZXIgaXMgcHJvYmVkLCB0aGUgb2ZfbWF0
Y2hfZGV2aWNlIGZ1bmN0aW9uIHdpbGwgcmV0dXJuIG51bGwuIFlvdQo+ID4gY2FuIHZlcmlmeSB0
aGlzIGZ1bmN0aW9uYWxpdHkgYnkgcmV2aWV3aW5nIHRoZSBmb2xsb3dpbmcgZnVuY3Rpb246Cj4g
PiAKPiA+IHN0YXRpYyBpbnQgcGxhdGZvcm1fbWF0Y2goc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgZGV2aWNlX2RyaXZlciAqZHJ2KQo+IAo+IEkgZG9uJ3QgdGhpbmsgd2UgY2FyZSBhYm91dCB0
aGF0IGNhc2UuICBJZiB0aGVyZSBpcyBhIHJlYWwgZXhhbXBsZSBvZgo+IHdoeSBzb21lb25lIHdv
dWxkIGRvIHRoaXMgdGhlbiB0aGF0IHdvdWxkIGJlIGEgZGlmZmVyZW50IG1hdHRlci4KPiAKPiBK
b25hdGhhbgo+IAo+ID4gQmVzdCByZWdhcmRzLAo+ID4gU2h1cm9uZwpJIGp1c3QgdGhpbmsgaXQg
bWlnaHQgYmUgbW9yZSBhcHByb3ByaWF0ZSB0byByZXR1cm4gdGhlIGNvcnJlY3QgZXJyb3IgY29k
ZSBpbiAKdGhpcyBzaXR1YXRpb24uIEkgYWdyZWUgd2l0aCB5b3VyIGFzc2Vzc21lbnQgdGhhdCBp
dCBpcyBhbiBhYm5vcm1hbCBjYXNlLiAKVGhlcmVmb3JlLCBpdCBpcyBwZXJmZWN0bHkgZmluZSBp
ZiB5b3UgZGVjaWRlIG5vdCB0byBzZWxlY3QgdGhpcyBwYXRjaC4KClRoYW5rcyBmb3IgeW91ciBr
aW5kIHJlcGx5LgoKU2h1cm9uZwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
