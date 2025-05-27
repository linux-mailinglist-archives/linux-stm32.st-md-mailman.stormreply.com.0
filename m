Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2712AC47BD
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 07:44:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7672FC36B15;
	Tue, 27 May 2025 05:44:06 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 661B0C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 05:44:05 +0000 (UTC)
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id Jn6TuvW38K8x9Jn6TuJ1uT; Tue, 27 May 2025 07:44:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1748324645;
 bh=XaSDramaQ4ealF19zsjhv/7XrCvZ3oUf+OpS7nGNI+E=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=RuqfKSZEr3CG4BWdedgN5eVB3GxhSwHwxSTbYH9h7RUR5j4mU7wXvS51e1Eh7spnr
 VZEt6ixH2w73IfHBCz5gbF34YZwiMMuv7x1QVLLUUCUT+p7r4eF18zjdglLAoJjfde
 DueN8tNY+/fcyYDpvtdPpXgf5+K7jCKExyhWjWb1DJe+Zn0X2ljOpOrEXOib0oNTwO
 ssnhI8HZFd+1ocoiNCg7SDPLh4//RcuYV9+AUWMlULPgxE8SC60zHwDLXa0DJMeCDe
 ZT6vkRllvZ0LUWkTBi4kM1dsd1X72xNeKq97GF7SJ1LGiThP56Rytoh3UjKmXv3Ycd
 LAW+0luDsoOxQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 27 May 2025 07:44:05 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <be687d2d-4c16-46d6-8828-b0e4866d91de@wanadoo.fr>
Date: Tue, 27 May 2025 07:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?5p2O5ZOy?= <sensor1010@163.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 jonas@kwiboo.se, rmk+kernel@armlinux.org.uk, david.wu@rock-chips.com,
 wens@csie.org, jan.petrous@oss.nxp.com
References: <20250526161621.3549-1-sensor1010@163.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250526161621.3549-1-sensor1010@163.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] net: dwmac-rk: No need to check the
 return value of the phy_power_on()
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

TGUgMjYvMDUvMjAyNSDDoCAxODoxNiwg5p2O5ZOyIGEgw6ljcml0wqA6Cj4gc2luY2UgdGhlIHJl
dHVybiB2YWx1ZSBvZiB0aGUgcGh5X3Bvd2VyX29uKCkgZnVuY3Rpb24gaXMgYWx3YXlzIDAsCj4g
Y2hlY2tpbmcgaXRzIHJldHVybiB2YWx1ZSBpcyByZWR1bmRhbnQuCgpDYW4geW91IGVsYWJvcmF0
ZSB3aHk/CgpMb29raW5nIGF0ICAoMV0sIEkgdGhpbmsgdGhhdCBpdCBpcyBvYnZpb3VzIHRoYXQg
bm9uLTAgdmFsdWVzIGNhbiBiZSAKcmV0dXJuZWQuCgoKQ0oKClsxXTogCmh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE1L3NvdXJjZS9kcml2ZXJzL3BoeS9waHktY29yZS5jI0wz
MDUKCj4gCj4gU2lnbmVkLW9mZi1ieTog5p2O5ZOyIDxzZW5zb3IxMDEwQDE2My5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jIHwgNiAr
LS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMtcmsuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMK
PiBpbmRleCA3MDA4NThmZjZmN2MuLjZlOGIxMGZkYTI0ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCj4gKysrIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYwo+IEBAIC0xODM5LDExICsxODM5
LDcgQEAgc3RhdGljIGludCBya19nbWFjX3Bvd2VydXAoc3RydWN0IHJrX3ByaXZfZGF0YSAqYnNw
X3ByaXYpCj4gICAJCWRldl9lcnIoZGV2LCAiTk8gaW50ZXJmYWNlIGRlZmluZWQhXG4iKTsKPiAg
IAl9Cj4gICAKPiAtCXJldCA9IHBoeV9wb3dlcl9vbihic3BfcHJpdiwgdHJ1ZSk7Cj4gLQlpZiAo
cmV0KSB7Cj4gLQkJZ21hY19jbGtfZW5hYmxlKGJzcF9wcml2LCBmYWxzZSk7Cj4gLQkJcmV0dXJu
IHJldDsKPiAtCX0KPiArCXBoeV9wb3dlcl9vbihic3BfcHJpdiwgdHJ1ZSk7Cj4gICAKPiAgIAlw
bV9ydW50aW1lX2dldF9zeW5jKGRldik7Cj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
