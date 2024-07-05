Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46A9283EA
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 10:42:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50083C71282;
	Fri,  5 Jul 2024 08:42:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 024A3C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 08:42:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9ED0D8839D;
 Fri,  5 Jul 2024 10:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720168956;
 bh=w/iWxCTX5yKL5u5YEhcsM6oZacG0/msdiWVC06pA5D4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QtrI7/rXcrsxW0Leiz2Dh6JS1uRReU1bhWD0tHDngktvzm+/pabCk1REDUUvLbe4r
 F3ty+OY4P1TT5lWjoeN8pgHSCOpNttM9hNHp/q2zGmd/zLYqV1xOv6FgcFD6o/IHpC
 bOK7vniQmy1rBFQZ5zHpSLrg5qpBr1gVTC4Svc7qpL2pnhJI6S53Rkijs170rz1JLJ
 kRzPrhzLMkaIlzBa66Uwr5C3uzgwf/i6TjQXzFB+x/BKwvLcy3sAEc/YbY+2R1PKKA
 HLLcO4GmuZGz04sXIyKfV618TbvkknJaZrwLFXhD/gbKHDLL5Qc0i032t+Z5Jka2vI
 i+BNG8nQs/CCw==
Message-ID: <5b5a196f-58ca-4168-969b-f9efdf8ef57a@denx.de>
Date: Fri, 5 Jul 2024 10:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
References: <20240629171100.20285-1-marex@denx.de>
 <171985715690.313627.4404278514791505125.robh@kernel.org>
 <cc492f1a-c2f5-438e-a28a-7900cde6f073@denx.de>
 <9af42035-5cce-4c49-8814-87e517ec24c5@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <9af42035-5cce-4c49-8814-87e517ec24c5@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add ethernet MAC nvmem
 cells to DH STM32MP13xx DHCOR DHSBC board
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

T24gNy81LzI0IDk6MzAgQU0sIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6CgpIaSwKCj4+PiBhcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kaGNvci1kaHNiYy5kdGI6IGV0aGVybmV0QDU4
MDBhMDAwOiAKPj4+IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgnaW50
ZXJydXB0LW5hbWVzJywgCj4+PiAnaW50ZXJydXB0cy1leHRlbmRlZCcsICdtZGlvJywgJ252bWVt
LWNlbGwtbmFtZXMnLCAnbnZtZW0tY2VsbHMnLCAKPj4+ICdwaHktaGFuZGxlJywgJ3BoeS1tb2Rl
JywgJ3NucHMsYXhpLWNvbmZpZycsICdzbnBzLG1peGVkLWJ1cnN0JywgCj4+PiAnc25wcyxwYmwn
LCAnc25wcyx0c28nLCAnc3RtbWFjLWF4aS1jb25maWcnIHdlcmUgdW5leHBlY3RlZCkKPj4+IMKg
wqDCoMKgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9uZXQv
c3RtMzItZHdtYWMueWFtbCMKPj4+IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRo
Y29yLWRoc2JjLmR0YjogZXRoZXJuZXRANTgwMGUwMDA6IAo+Pj4gVW5ldmFsdWF0ZWQgcHJvcGVy
dGllcyBhcmUgbm90IGFsbG93ZWQgKCdpbnRlcnJ1cHQtbmFtZXMnLCAKPj4+ICdpbnRlcnJ1cHRz
LWV4dGVuZGVkJywgJ21kaW8nLCAnbnZtZW0tY2VsbC1uYW1lcycsICdudm1lbS1jZWxscycsIAo+
Pj4gJ3BoeS1oYW5kbGUnLCAncGh5LW1vZGUnLCAnc25wcyxheGktY29uZmlnJywgJ3NucHMsbWl4
ZWQtYnVyc3QnLCAKPj4+ICdzbnBzLHBibCcsICdzbnBzLHRzbycsICdzdG1tYWMtYXhpLWNvbmZp
Zycgd2VyZSB1bmV4cGVjdGVkKQo+Pj4gwqDCoMKgwqBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL25ldC9zdG0zMi1kd21hYy55YW1sIwo+Pgo+PiBJIGNhbid0
IHNlZW0gdG8gYmUgYWJsZSB0byByZXByb2R1Y2UgaXQgbG9jYWxseSAsIGV2ZW4gd2l0aCAKPj4g
ZHRzY2hlbWEvbWFzdGVyIHVwZGF0ZWQgcmlnaHQgbm93IC4KPj4KPj4gTG9va2luZyBhdCB0aGUg
YmluZGluZ3MsIG5ldC9zdG0zMi1kd21hYy55YW1sIGRvZXMgaGF2ZSBhbGxvZi1yZWYgdG8gCj4+
IHNucHMsZHdtYWMueWFtbCB3aGljaCBoYXMgYWxsb2YtcmVmIHRvIGV0aGVybmV0LWNvbnRyb2xs
ZXIueWFtbCAsIAo+PiB3aGljaCBkb2VzIGxpc3QgdGhlIG52bWVtLWNlbGxzL252bWVtLWNlbGwt
bmFtZXMgcHJvcGVydGllcyAuCj4+Cj4+IFdoYXQgYW0gSSBtaXNzaW5nIGhlcmUgPwo+IAo+IEkn
bSBhbHNvIG5vdCBhYmxlIHRvIHJlcHJvZHVjZSB0aGlzIGlzc3VlIGV2ZW4gYWZ0ZXIgdXBkYXRl
ZCB0aGUgc2NoZW1hcy4KPiBSb2IsIGNhbiB5b3UgcGxlYXNlIGRvdWJsZSBjaGVjayBvbiB5b3Vy
IHNpZGUgPwo+IE1hcmVrLCBJIHRoaW5rIEknbGwgdGFrZSB0aGlzIHBhdGNoIGxhdGVyIGZvciB2
Ni4xMiBjeWNsZS4KClRoYXQncyBqdXN0IGZpbmUsIG5vIHdvcnJpZXMuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
