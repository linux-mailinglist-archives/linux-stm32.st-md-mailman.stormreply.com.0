Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF186AC79
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Feb 2024 12:03:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 601B6C6C841;
	Wed, 28 Feb 2024 11:03:12 +0000 (UTC)
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 179F4C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Feb 2024 11:03:11 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id A416A1BCF11;
 Wed, 28 Feb 2024 12:03:09 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none)
 header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
 t=1709118190; bh=5w3iwvVBIESxi22ZZJiQmoVQjo/FSOSxxrB8vPximt8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OLNEWjdHYJMeowGWV/51UimBdm/m2akUf1btKvRF2NaEFPKURBgX8ac1VYfTbZ9RU
 +xj9obZijQlIyybTq7FsrzEjvxwadZc/h9dXCM9Gc2+aI8qBE9GyPyP7EmAoBRXw0u
 SCYb28c7TN4IhPXxI2+5QjuoBKCT0CSGNl/YwQoT9d3XXQiVE+FEcogySyA0bL4QfD
 2GFWPfZrTUopxHLSXfM12An5+cJSgL2QdaxrDHsXPYVmmFudzUbALqpT7IZRoM0n/s
 nzTcV/0RX9m/2I4OEgJr28dLSPAp17apEB125LsiasVpG1L8uOM7fzQRqknRYIJZtz
 PF/umqxoAYmVQ==
Date: Wed, 28 Feb 2024 12:03:08 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Message-ID: <20240228120308.48d6a9c2@meshulam.tesarici.cz>
In-Reply-To: <a3749d3f-ced1-4c48-adaf-348c8dee7610@leemhuis.info>
References: <20240203190927.19669-1-petr@tesarici.cz>
 <ea1567d9-ce66-45e6-8168-ac40a47d1821@roeck-us.net>
 <Zct5qJcZw0YKx54r@xhacker>
 <CANn89i+4tVWezqr=BYZ5AF=9EgV2EPqhdHun=u=ga32CEJ4BXQ@mail.gmail.com>
 <20d94512-c4f2-49f7-ac97-846dc24a6730@roeck-us.net>
 <CANn89iL1piwsbsBx4Z=kySUfmPa9LbZn-SNthgA+W6NEnojgSQ@mail.gmail.com>
 <a3749d3f-ced1-4c48-adaf-348c8dee7610@leemhuis.info>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Marc Haber <mh+netdev@zugschlus.de>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 Guenter Roeck <linux@roeck-us.net>, alexis.lothore@bootlin.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: protect updates of
 64-bit statistics counters
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

T24gV2VkLCAyOCBGZWIgMjAyNCAwNzoxOTo1NiArMDEwMAoiTGludXggcmVncmVzc2lvbiB0cmFj
a2luZyAoVGhvcnN0ZW4gTGVlbWh1aXMpIiA8cmVncmVzc2lvbnNAbGVlbWh1aXMuaW5mbz4gd3Jv
dGU6Cgo+IE5ldCBtYWludGFpbmVycywgY2hpbWluZyBpbiBoZXJlLCBhcyBpdCBzZWVtcyBoYW5k
bGluZyB0aGlzIHJlZ3Jlc3Npb24KPiBzdGFsbGVkLgoKSW5kZWVkLCBJIHdhcyB0b28gYnVzeSB3
aXRoIHNhbmRib3ggbW9kZS4uLgoKPiBPbiAxMy4wMi4yNCAxNjo1MiwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+ID4gT24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgNDoyNuKAr1BNIEd1ZW50ZXIgUm9lY2sg
PGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6ICAKPiA+PiBPbiBUdWUsIEZlYiAxMywgMjAyNCBh
dCAwMzo1MTozNVBNICswMTAwLCBFcmljIER1bWF6ZXQgd3JvdGU6ICAKPiA+Pj4gT24gVHVlLCBG
ZWIgMTMsIDIwMjQgYXQgMzoyOeKAr1BNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9y
Zz4gd3JvdGU6ICAKPiA+Pj4+IE9uIFN1biwgRmViIDExLCAyMDI0IGF0IDA4OjMwOjIxUE0gLTA4
MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6ICAKPiA+Pj4+PiBPbiBTYXQsIEZlYiAwMywgMjAyNCBh
dCAwODowOToyN1BNICswMTAwLCBQZXRyIFRlc2FyaWsgd3JvdGU6ICAKPiA+Pj4+Pj4gQXMgZXhw
bGFpbmVkIGJ5IGEgY29tbWVudCBpbiA8bGludXgvdTY0X3N0YXRzX3N5bmMuaD4sIHdyaXRlIHNp
ZGUgb2Ygc3RydWN0Cj4gPj4+Pj4+IHU2NF9zdGF0c19zeW5jIG11c3QgZW5zdXJlIG11dHVhbCBl
eGNsdXNpb24sIG9yIG9uZSBzZXFjb3VudCB1cGRhdGUgY291bGQKPiA+Pj4+Pj4gYmUgbG9zdCBv
biAzMi1iaXQgcGxhdGZvcm1zLCB0aHVzIGJsb2NraW5nIHJlYWRlcnMgZm9yZXZlci4gU3VjaCBs
b2NrdXBzCj4gPj4+Pj4+IGhhdmUgYmVlbiBvYnNlcnZlZCBpbiByZWFsIHdvcmxkIGFmdGVyIHN0
bW1hY194bWl0KCkgb24gb25lIENQVSByYWNlZCB3aXRoCj4gPj4+Pj4+IHN0bW1hY19uYXBpX3Bv
bGxfdHgoKSBvbiBhbm90aGVyIENQVS4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gVG8gZml4IHRoZSBpc3N1
ZSB3aXRob3V0IGludHJvZHVjaW5nIGEgbmV3IGxvY2ssIHNwbGl0IHRoZSBzdGF0aWNzIGludG8K
PiA+Pj4+Pj4gdGhyZWUgcGFydHM6Cj4gPj4+Pj4+Cj4gPj4+Pj4+IDEuIGZpZWxkcyB1cGRhdGVk
IG9ubHkgdW5kZXIgdGhlIHR4IHF1ZXVlIGxvY2ssCj4gPj4+Pj4+IDIuIGZpZWxkcyB1cGRhdGVk
IG9ubHkgZHVyaW5nIE5BUEkgcG9sbCwKPiA+Pj4+Pj4gMy4gZmllbGRzIHVwZGF0ZWQgb25seSBm
cm9tIGludGVycnVwdCBjb250ZXh0LAo+ID4+Pj4+Pgo+ID4+Pj4+PiBVcGRhdGVzIHRvIGZpZWxk
cyBpbiB0aGUgZmlyc3QgdHdvIGdyb3VwcyBhcmUgYWxyZWFkeSBzZXJpYWxpemVkIHRocm91Z2gK
PiA+Pj4+Pj4gb3RoZXIgbG9ja3MuIEl0IGlzIHN1ZmZpY2llbnQgdG8gc3BsaXQgdGhlIGV4aXN0
aW5nIHN0cnVjdCB1NjRfc3RhdHNfc3luYwo+ID4+Pj4+PiBzbyB0aGF0IGVhY2ggZ3JvdXAgaGFz
IGl0cyBvd24uCj4gPj4+Pj4+Cj4gPj4+Pj4+IE5vdGUgdGhhdCB0eF9zZXRfaWNfYml0IGlzIHVw
ZGF0ZWQgZnJvbSBib3RoIGNvbnRleHRzLiBTcGxpdCB0aGlzIGNvdW50ZXIKPiA+Pj4+Pj4gc28g
dGhhdCBlYWNoIGNvbnRleHQgZ2V0cyBpdHMgb3duLCBhbmQgY2FsY3VsYXRlIHRoZWlyIHN1bSB0
byBnZXQgdGhlIHRvdGFsCj4gPj4+Pj4+IHZhbHVlIGluIHN0bW1hY19nZXRfZXRodG9vbF9zdGF0
cygpLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBGb3IgdGhlIHRoaXJkIGdyb3VwLCBtdWx0aXBsZSBpbnRl
cnJ1cHRzIG1heSBiZSBwcm9jZXNzZWQgYnkgZGlmZmVyZW50IENQVXMKPiA+Pj4+Pj4gYXQgdGhl
IHNhbWUgdGltZSwgYnV0IGludGVycnVwdHMgb24gdGhlIHNhbWUgQ1BVIHdpbGwgbm90IG5lc3Qu
IE1vdmUgZmllbGRzCj4gPj4+Pj4+IGZyb20gdGhpcyBncm91cCB0byBhIG5ld2x5IGNyZWF0ZWQg
cGVyLWNwdSBzdHJ1Y3Qgc3RtbWFjX3BjcHVfc3RhdHMuCj4gPj4+Pj4+Cj4gPj4+Pj4+IEZpeGVz
OiAxMzM0NjZjM2JiZTEgKCJuZXQ6IHN0bW1hYzogdXNlIHBlci1xdWV1ZSA2NCBiaXQgc3RhdGlz
dGljcyB3aGVyZSBuZWNlc3NhcnkiKQo+ID4+Pj4+PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9uZXRkZXYvWmExNzNQaHZpWWctMXFJbkB0b3JyZXMuenVnc2NobHVzLmRlL3QvCj4gPj4+
Pj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBl
dHIgVGVzYXJpayA8cGV0ckB0ZXNhcmljaS5jej4gIAo+ID4+Pj4+Cj4gPj4+Pj4gVGhpcyBwYXRj
aCByZXN1bHRzIGluIGEgbG9ja2RlcCBzcGxhdC4gQmFja3RyYWNlIGFuZCBiaXNlY3QgcmVzdWx0
cyBhdHRhY2hlZC4KPiA+Pj4+Pgo+ID4+Pj4+IC0tLQo+ID4+Pj4+IFsgICAzMy43MzY3MjhdID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPj4+Pj4gWyAgIDMzLjczNjgwNV0gV0FS
TklORzogaW5jb25zaXN0ZW50IGxvY2sgc3RhdGUKPiA+Pj4+PiBbICAgMzMuNzM2OTUzXSA2Ljgu
MC1yYzQgIzEgVGFpbnRlZDogRyAgICAgICAgICAgICAgICAgTgo+ID4+Pj4+IFsgICAzMy43Mzcw
ODBdIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPj4+Pj4gWyAgIDMzLjczNzE1
NV0gaW5jb25zaXN0ZW50IHtIQVJESVJRLU9OLVd9IC0+IHtJTi1IQVJESVJRLVd9IHVzYWdlLgo+
ID4+Pj4+IFsgICAzMy43MzczMDldIGt3b3JrZXIvMDoyLzM5IFtIQzFbMV06U0MwWzJdOkhFMDpT
RTBdIHRha2VzOgo+ID4+Pj4+IFsgICAzMy43Mzc0NTldIGVmNzkyMDc0ICgmc3luY3AtPnNlcSMy
KXs/Li4ufS17MDowfSwgYXQ6IHN1bjhpX2R3bWFjX2RtYV9pbnRlcnJ1cHQrMHg5Yy8weDI4Ywo+
ID4+Pj4+IFsgICAzMy43MzgyMDZdIHtIQVJESVJRLU9OLVd9IHN0YXRlIHdhcyByZWdpc3RlcmVk
IGF0Ogo+ID4+Pj4+IFsgICAzMy43MzgzMThdICAgbG9ja19hY3F1aXJlKzB4MTFjLzB4MzY4Cj4g
Pj4+Pj4gWyAgIDMzLjczODQzMV0gICBfX3U2NF9zdGF0c191cGRhdGVfYmVnaW4rMHgxMDQvMHgx
YWMKPiA+Pj4+PiBbICAgMzMuNzM4NTI1XSAgIHN0bW1hY194bWl0KzB4NGQwLzB4YzU4ICAKPiA+
Pj4+Cj4gPj4+PiBpbnRlcmVzdGluZyBsb2NrZGVwIHNwbGF0Li4uCj4gPj4+PiBzdG1tYWNfeG1p
dCgpIG9wZXJhdGVzIG9uIHR4cV9zdGF0cy0+cV9zeW5jcCwgd2hpbGUgdGhlCj4gPj4+PiBzdW44
aV9kd21hY19kbWFfaW50ZXJydXB0KCkgb3BlcmF0ZXMgb24gcGNwdSdzIHByaXYtPnhzdGF0cy5w
Y3B1X3N0YXRzCj4gPj4+PiB0aGV5IGFyZSBkaWZmZXJlbnQgc3luY3AuIHNvIGhvdyBkb2VzIGxv
Y2tkZXAgc3BsYXQgaGFwcGVuLiAgCj4gPj4+Cj4gPj4+IFJpZ2h0LCBJIGRvIG5vdCBzZWUgYW55
dGhpbmcgb2J2aW91cyB5ZXQuICAKPiA+Pgo+ID4+IFdpbGQgZ3Vlc3M6IEkgdGhpbmsgaXQgbWF5
YmUgc2F5aW5nIHRoYXQgZHVlIHRvCj4gPj4KPiA+PiAgICAgICAgIGluY29uc2lzdGVudCB7SEFS
RElSUS1PTi1XfSAtPiB7SU4tSEFSRElSUS1XfSB1c2FnZS4KPiA+Pgo+ID4+IHRoZSBjcml0aWNh
bCBjb2RlIG1heSBzb21laG93IGJlIGludGVycnVwdGVkIGFuZCwgd2hpbGUgaGFuZGxpbmcgdGhl
Cj4gPj4gaW50ZXJydXB0LCB0cnkgdG8gYWNxdWlyZSB0aGUgc2FtZSBsb2NrIGFnYWluLiAgCj4g
PiAKPiA+IFRoaXMgc2hvdWxkIG5vdCBoYXBwZW4sIHRoZSAnc3luY3AnIGFyZSBkaWZmZXJlbnQu
IFRoZXkgaGF2ZSBkaWZmZXJlbnQKPiA+IGxvY2tkZXAgY2xhc3Nlcy4KPiA+IAo+ID4gT25lIGlz
IGV4Y2x1c2l2ZWx5IHVzZWQgZnJvbSBoYXJkIGlycSBjb250ZXh0Lgo+ID4gCj4gPiBUaGUgc2Vj
b25kIG9uZSBvbmx5IHVzZWQgZnJvbSBCSCBjb250ZXh0LiAgCj4gCj4gQWxleGlzIExvdGhvcsOp
IGhpdCB0aGlzIG5vdyBhcyB3ZWxsLCBzZWUgeWVzdGVyZGF5IHJlcG9ydCBpbiB0aGlzCj4gdGhy
ZWFkOyBhcGFydCBmcm9tIHRoYXQgbm90aGluZyBzZWVtIHRvIGhhdmUgaGFwcGVuZWQgZm9yIHR3
byB3ZWVrcyBub3cuCj4gVGhlIGNoYW5nZSByZWNlbnRseSBtYWRlIGl0IHRvIHNvbWUgc3RhYmxl
L2xvbmd0ZXJtIGtlcm5lbHMsIHRvby4gTWFrZXMKPiBtZSB3b25kZXI6Cj4gCj4gV2hhdCdzIHRo
ZSBwbGFuIGZvcndhcmQgaGVyZT8gSXMgdGhpcyBjb25zaWRlcmVkIHRvIGJlIGEgZmFsc2UgcG9z
aXRpdmU/CgpBbHRob3VnaCBteSBzeXN0ZW0gaGFzIHJ1biBzdGFibGUgZm9yIGEgY291cGxlIG9m
IG1vbnRocywgSSBhbSBoZXNpdGFudAp0byBjYWxsIGl0IGEgZmFsc2UgcG9zaXRpdmUuCgo+IE9y
IGEgcmVhbCBwcm9ibGVtPwoKVGhhdCdzIHdoYXQgSSB0aGluay4gQnV0IEkgd291bGQgaGF2ZSB0
byBsZWFybiBhIGxvdCBhYm91dCB0aGUgbmV0d29yawpzdGFjayB0byB1bmRlcnN0YW5kIHdoYXQg
ZXhhY3RseSBoYXBwZW5zIGhlcmUuCgpJdCBtYXkgZ28gZmFzdGVyIGlmIHNvbWVib2R5IGVsc2Ug
b24gdGhlIENjIGNhbiBnaXZlIG1lIGEgaGludCB3aGVyZSB0bwpzdGFydCBsb29raW5nIGJhc2Vk
IG9uIHRoZSBsb2NrZGVwIHdhcm5pbmcuCgpQZXRyIFQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
