Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BE4440095
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Oct 2021 18:48:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9E26C5E2C2;
	Fri, 29 Oct 2021 16:48:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF0E8C23E53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Oct 2021 16:48:45 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 28B7C82952;
 Fri, 29 Oct 2021 18:48:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1635526125;
 bh=6zdVEZVllSYH2Pu2kQDESwjXTwsDnaWusbLxdvceA80=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Qm2LC35DVg0x4tRrz3XRlrKkmMk8WgAGYcTHDq6/7sMIka9JAy/hBAu+OpkwqD8B9
 L0nM++Z+eWa3pgNf/ecCpkmYgU4FZqeyLZQYOS7+33nCZuIAoMu10RaKDbWBlt6Kem
 KH8cPSoiFHst4BMuQ/x6zvmVw9bOWGcXmCB0Eu4jlx1gVEa+SzLFAxiYTKe+c+GncX
 buALthx3xKmG3TINMPfhBBZZ59wqTkjFQqkFMICmYpM/VBbAx1hzW3YhRey3cqYszs
 4uxXTYK+gZYHLpMFxCcdJOAOi4/sV6N2CUFN3Q6KsiSXAwAd5rfw4l8WoLErO+QNp5
 VJCLO/wL+V0DA==
To: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
References: <20211029135454.4383-1-nicolas.toromanoff@foss.st.com>
 <20211029135454.4383-5-nicolas.toromanoff@foss.st.com>
 <1ec60d9c-1ab4-8a92-1c6d-8093232ca039@denx.de>
 <alpine.DEB.2.21.2110291708040.20378@gnbcxd0088.gnb.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <f8de0493-29f3-550c-611e-97b7ee36e628@denx.de>
Date: Fri, 29 Oct 2021 18:48:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110291708040.20378@gnbcxd0088.gnb.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/8] crypto: stm32/cryp - fix race
	condition
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

T24gMTAvMjkvMjEgNToyMSBQTSwgTmljb2xhcyBUb3JvbWFub2ZmIHdyb3RlOgo+IE9uIEZyaSwg
MjkgT2N0IDIwMjEsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IAo+PiBPbiAxMC8yOS8yMSAzOjU0IFBN
LCBOaWNvbGFzIFRvcm9tYW5vZmYgd3JvdGU6Cj4+PiBFcmFzZSBrZXkgYmVmb3JlIGZpbmFsaXpp
bmcgcmVxdWVzdC4KPj4+IEZpeGVzOiA5ZTA1NGVjMjFlZjggKCJjcnlwdG86IHN0bTMyIC0gU3Vw
cG9ydCBmb3IgU1RNMzIgQ1JZUCBjcnlwdG8gCj4+PiBtb2R1bGUiKQo+Pgo+PiBDYW4geW91IGJl
IGEgYml0IG1vcmUgc3BlY2lmaWMgaW4geW91ciBjb21taXQgbWVzc2FnZXMgPyBUaGF0IGFwcGxp
ZXMgCj4+IHRvIHRoZSBlbnRpcmUgcGF0Y2hzZXQuIEl0IGlzIGFic29sdXRlbHkgaW1wb3NzaWJs
ZSB0byB0ZWxsIHdoYXQgcmFjZSAKPj4gaXMgZml4ZWQgaGVyZSBvciB3aHkgaXQgaXMgZml4ZWQg
YnkgZXhhY3RseSB0aGlzIGNoYW5nZS4gVGhpcyBhcHBsaWVzIAo+PiB0byB0aGUgZW50aXJlIHNl
cmllcy4KPiAKPiBJJ2xsIHNlbmQgYSB2MiB3aXRoIGJldHRlciBjb21taXQgbWVzc2FnZXMuCj4g
Cj4gZm9yIHRoaXMgc3BlY2lmaWMgcGF0Y2g6Cj4gV2UgcmVzZXQgdGhlIHNhdmVkIGtleSBiZWZv
cmUgdGhlIGNyeXB0b19maW5hbGl6ZV8qKCkgY2FsbC4gT3RoZXJ3aXNlIGEgCj4gc3RpbGwgcGVu
ZGluZyBjcnlwdG8gYWN0aW9uIGNvdWxkIGJlIHJhbiB3aXRoIGEgd3Jvbmcga2V5ID0gezB9Owo+
IAo+PiBBbmQgd2hpbGUgSSBhbSBhdCBpdCwgZG9lcyB0aGUgQ1JZUCBmaW5hbGx5IHBhc3MgYXQg
bGVhc3QgdGhlIG1vc3QgCj4+IGJhc2ljIGtlcm5lbCBib290IHRpbWUgY3J5cHRvIHRlc3RzIG9y
IGRvZXMgcnVubmluZyB0aG9zZSBzdGlsbCAKPj4gb3ZlcndyaXRlIGtlcm5lbCBtZW1vcnkgYW5k
L29yIGNvbXBsZXRlbHkgY3Jhc2ggb3IgbG9jayB1cCB0aGUgbWFjaGluZSA/Cj4gCj4gQWxsIGV4
dHJhIHRlc3RzIChmaW5hbGx5KSBwYXNzLgo+IAo+IFdpdGggYSBrZXJuZWwgY29uZmlnIDoKPiAg
wqAgIyBDT05GSUdfQ1JZUFRPX01BTkFHRVJfRElTQUJMRV9URVNUUyBpcyBub3Qgc2V0Cj4gIMKg
IENPTkZJR19DUllQVE9fTUFOQUdFUl9FWFRSQV9URVNUUz15Cj4gIMKgIENPTkZJR19DUllQVE9f
REVWX1NUTTMyX0NSWVA9bQoKQ2FuIHlvdSBhbHNvIGRvIGEgYm9vdCB0ZXN0IHdpdGggQ1JZUCBj
b21waWxlZCBpbnRvIHRoZSBrZXJuZWwgPwpJIHJlY2FsbCB0aGF0IGlzIGhvdyB0aGUgb3JpZ2lu
YWwgYnVnIHdhcyByZXBvcnRlZCAtLSB0aGUgbWFjaGluZSAKY3Jhc2hlZCBjb21wbGV0ZWx5IG9u
IGJvb3QgZXZlbiBiZWZvcmUgcmVhY2hpbmcgdXNlcnNwYWNlLCBvciB0aGUga2VybmVsIApjcmFz
aGVkIG9uIG1lbW9yeSBjb3JydXB0aW9uIGJlZm9yZSByZWFjaGluZyB1c2Vyc3BhY2UuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
