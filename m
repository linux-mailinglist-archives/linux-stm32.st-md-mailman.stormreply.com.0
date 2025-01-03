Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C7FA00C30
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2025 17:39:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31AD2C78F68;
	Fri,  3 Jan 2025 16:39:00 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr
 [80.12.242.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02E6CC78F66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2025 16:38:53 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id Tkh7thvQlgiluTkhAtJugY; Fri, 03 Jan 2025 17:38:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1735922332;
 bh=GImteROnqULHiFchXLQTzhpJttZLzgZN6ofwaQa8E98=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=SIjH7vjbbSJIaxUKmhBM3ov4wfqI0MWG9M5HncSgPDIZwGkA8cuMe9jaoJ9kCQJcN
 l6X1mLcu0p0afX4EQLWzCU1tk6JHQWsSoYCNxxRvqKDryVgbJoAa+NZ3FUVY5VDmBk
 fGsQSUs6nLeRW8VFjrtGtXikEuPUUg/+vmABh2SAFy4UdH+Bv7FAcUYRM5vo3gDaeT
 xnd4f8akpir9p8Gv1eJx7n0gUxch0qZdDB7LqeBcWT/+Sg8X4rvQIQa3/SxeBMjoDt
 KMaLhw3/Ym00PLFzdpfP8SK6jcCqcSXHwkHqVlBcg1raOiko71QEvISzZZgboc2Kek
 bmSEmk7QzeXQQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 03 Jan 2025 17:38:52 +0100
X-ME-IP: 90.11.132.44
Message-ID: <2736ccd3-680d-4f5d-a31a-156dec056f22@wanadoo.fr>
Date: Fri, 3 Jan 2025 17:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-4-a0987203069@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250103063241.2306312-4-a0987203069@gmail.com>
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v6 3/3] net: stmmac:
 dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
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

TGUgMDMvMDEvMjAyNSDDoCAwNzozMiwgSm9leSBMdSBhIMOpY3JpdMKgOgo+IEFkZCBzdXBwb3J0
IGZvciBHaWdhYml0IEV0aGVybmV0IG9uIE51dm90b24gTUEzNSBzZXJpZXMgdXNpbmcgZHdtYWMg
ZHJpdmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvZXkgTHUgPGEwOTg3MjAzMDY5QGdtYWlsLmNv
bT4KCi4uLgoKPiArCS8qIE51dm90b24gRFdNQUMgY29uZmlncyAqLwo+ICsJcGxhdF9kYXQtPmhh
c19nbWFjID0gMTsKPiArCXBsYXRfZGF0LT50eF9maWZvX3NpemUgPSAyMDQ4Owo+ICsJcGxhdF9k
YXQtPnJ4X2ZpZm9fc2l6ZSA9IDQwOTY7Cj4gKwlwbGF0X2RhdC0+bXVsdGljYXN0X2ZpbHRlcl9i
aW5zID0gMDsKPiArCXBsYXRfZGF0LT51bmljYXN0X2ZpbHRlcl9lbnRyaWVzID0gODsKPiArCXBs
YXRfZGF0LT5mbGFncyAmPSB+U1RNTUFDX0ZMQUdfVVNFX1BIWV9XT0w7Cj4gKwo+ICsJcHJpdl9k
YXRhID0gbnZ0X2dtYWNfc2V0dXAocGRldiwgcGxhdF9kYXQpOwo+ICsJaWYgKElTX0VSUihwcml2
X2RhdGEpKQo+ICsJCXJldHVybiBQVFJfRVJSKHByaXZfZGF0YSk7Cj4gKwo+ICsJcmV0ID0gc3Rt
bWFjX2R2cl9wcm9iZSgmcGRldi0+ZGV2LCBwbGF0X2RhdCwgJnN0bW1hY19yZXMpOwoKc3RtbWFj
X3BsdGZyX3JlbW92ZSgpIGlzIGNhbGxlZCBieSB0aGUgLnJlbW92ZSBmdW5jdGlvbi4KSXMgaXQg
Y29ycmVjdCB0byBjYWxsIHN0bW1hY19kdnJfcHJvYmUoKSBoZXJlLCBhbmQgbm90IHN0bW1hY19w
bHRmcl9wcm9iZSgpPwoKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwkvKiBU
aGUgUE1UIGZsYWcgaXMgZGV0ZXJtaW5lZCBieSB0aGUgUldLIHByb3BlcnR5Lgo+ICsJICogSG93
ZXZlciwgb3VyIGhhcmR3YXJlIGlzIGNvbmZpZ3VyZWQgdG8gc3VwcG9ydCBvbmx5IE1HSy4KPiAr
CSAqIFRoaXMgaXMgYW4gb3ZlcnJpZGUgb24gUE1UIHRvIGVuYWJsZSBXb0wgY2FwYWJpbGl0eS4K
PiArCSAqLwo+ICsJcGxhdF9kYXQtPnBtdCA9IDE7Cj4gKwlkZXZpY2Vfc2V0X3dha2V1cF9jYXBh
YmxlKCZwZGV2LT5kZXYsIDEpOwo+ICsKPiArCXJldHVybiAwOwo+ICt9CgouLi4KCj4gK3N0YXRp
YyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG52dF9kd21hY19kcml2ZXIgPSB7Cj4gKwkucHJvYmUg
ID0gbnZ0X2dtYWNfcHJvYmUsCj4gKwkucmVtb3ZlID0gc3RtbWFjX3BsdGZyX3JlbW92ZSwKPiAr
CS5kcml2ZXIgPSB7Cj4gKwkJLm5hbWUgICAgICAgICAgID0gIm51dm90b24tZHdtYWMiLAo+ICsJ
CS5wbQkJPSAmc3RtbWFjX3BsdGZyX3BtX29wcywKPiArCQkub2ZfbWF0Y2hfdGFibGUgPSBudnRf
ZHdtYWNfbWF0Y2gsCj4gKwl9LAo+ICt9OwoKLi4uCgpDSgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
