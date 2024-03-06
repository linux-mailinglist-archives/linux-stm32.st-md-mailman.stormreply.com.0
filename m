Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6133873097
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Mar 2024 09:24:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E1DBC6DD72;
	Wed,  6 Mar 2024 08:24:09 +0000 (UTC)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A84C8C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 08:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=dP4C4A5WCdxvCJCpj0oUh+9+DdThZPg4vHyHIY5V3mA=;
 t=1709713448; x=1710145448; b=pyyh6zbn889WrdqLZmL1mXmdF7RQQkzDiov5MOKQ4KnHQbk
 6uq61Tkcn5HNpV/gW+NtofEEzKN6MM4O8uXZbKqYHFHg8/Jxrf0fxbBTDaUwdBdK1kFQZboQbW4hu
 JLu6PDyL9+kOPMXjQiYyFU4ZjwQZOyGx1+0me9GKoXx62ANxMnfdlC0OF8CiI4I3DYO5ysJnTacdO
 bDMO+un2iUR1OaJUVYW1FRtTgDwAwDSWABuODwsZo8S9IVoN5dJlcOpEJ8qwE/86rXTXdVveRk1Bc
 uP7uJeKxlR18LfgT0qs3jR6fkO0i6+u9OxUdhaaaveKLKKJK9Xu0YMwjsrS/iwag==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rhmZ8-0000fd-P1; Wed, 06 Mar 2024 09:23:54 +0100
Message-ID: <e3181555-c08d-463f-a9a9-b08c69875c84@leemhuis.info>
Date: Wed, 6 Mar 2024 09:23:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>
References: <20240203190927.19669-1-petr@tesarici.cz>
 <ea1567d9-ce66-45e6-8168-ac40a47d1821@roeck-us.net>
 <Zct5qJcZw0YKx54r@xhacker>
 <CANn89i+4tVWezqr=BYZ5AF=9EgV2EPqhdHun=u=ga32CEJ4BXQ@mail.gmail.com>
 <20d94512-c4f2-49f7-ac97-846dc24a6730@roeck-us.net>
 <CANn89iL1piwsbsBx4Z=kySUfmPa9LbZn-SNthgA+W6NEnojgSQ@mail.gmail.com>
 <a3749d3f-ced1-4c48-adaf-348c8dee7610@leemhuis.info>
 <20240228120308.48d6a9c2@meshulam.tesarici.cz>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20240228120308.48d6a9c2@meshulam.tesarici.cz>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1709713448;
 ac953157; 
X-HE-SMSGID: 1rhmZ8-0000fd-P1
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Marc Haber <mh+netdev@zugschlus.de>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMjguMDIuMjQgMTI6MDMsIFBldHIgVGVzYcWZw61rIHdyb3RlOgo+IE9uIFdlZCwgMjggRmVi
IDIwMjQgMDc6MTk6NTYgKzAxMDAKPiAiTGludXggcmVncmVzc2lvbiB0cmFja2luZyAoVGhvcnN0
ZW4gTGVlbWh1aXMpIiA8cmVncmVzc2lvbnNAbGVlbWh1aXMuaW5mbz4gd3JvdGU6Cj4gCj4+IE5l
dCBtYWludGFpbmVycywgY2hpbWluZyBpbiBoZXJlLCBhcyBpdCBzZWVtcyBoYW5kbGluZyB0aGlz
IHJlZ3Jlc3Npb24KPj4gc3RhbGxlZC4KPiBJbmRlZWQsIEkgd2FzIHRvbyBidXN5IHdpdGggc2Fu
ZGJveCBtb2RlLi4uCgpIbW0sIG5vIHJlcGx5IGluIHRoZSBwYXN0IHdlZWsgdG8gUGV0cidzIHJl
cXVlc3QgZm9yIGhlbHAgZnJvbSBzb21lb25lCndpdGggbW9yZSBrbm93bGVkZ2UgYWJvdXQgdGhl
IGZpZWxkLiA6LS8KClNvIEkgZ3Vlc3MgdGhpcyBtZWFucyB0aGF0IHRoaXMgd29uJ3QgYmUgZml4
ZWQgZm9yIDYuOD8gVW5mb3J0dW5hdGUsIGJ1dAp3ZWxsLCB0aGF0J3MgaG93IGl0IGl0IHNvbWV0
aW1lcy4KCkNpYW8sIFRob3JzdGVuICh3ZWFyaW5nIGhpcyAndGhlIExpbnV4IGtlcm5lbCdzIHJl
Z3Jlc3Npb24gdHJhY2tlcicgaGF0KQotLQpFdmVyeXRoaW5nIHlvdSB3YW5uYSBrbm93IGFib3V0
IExpbnV4IGtlcm5lbCByZWdyZXNzaW9uIHRyYWNraW5nOgpodHRwczovL2xpbnV4LXJlZ3RyYWNr
aW5nLmxlZW1odWlzLmluZm8vYWJvdXQvI3RsZHIKSWYgSSBkaWQgc29tZXRoaW5nIHN0dXBpZCwg
cGxlYXNlIHRlbGwgbWUsIGFzIGV4cGxhaW5lZCBvbiB0aGF0IHBhZ2UuCgojcmVnemJvdCBwb2tl
Cgo+PiBPbiAxMy4wMi4yNCAxNjo1MiwgRXJpYyBEdW1hemV0IHdyb3RlOgo+Pj4gT24gVHVlLCBG
ZWIgMTMsIDIwMjQgYXQgNDoyNuKAr1BNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5l
dD4gd3JvdGU6ICAKPj4+PiBPbiBUdWUsIEZlYiAxMywgMjAyNCBhdCAwMzo1MTozNVBNICswMTAw
LCBFcmljIER1bWF6ZXQgd3JvdGU6ICAKPj4+Pj4gT24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgMzoy
OeKAr1BNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4gd3JvdGU6ICAKPj4+Pj4+
IE9uIFN1biwgRmViIDExLCAyMDI0IGF0IDA4OjMwOjIxUE0gLTA4MDAsIEd1ZW50ZXIgUm9lY2sg
d3JvdGU6ICAKPj4+Pj4+PiBPbiBTYXQsIEZlYiAwMywgMjAyNCBhdCAwODowOToyN1BNICswMTAw
LCBQZXRyIFRlc2FyaWsgd3JvdGU6ICAKPj4+Pj4+Pj4gQXMgZXhwbGFpbmVkIGJ5IGEgY29tbWVu
dCBpbiA8bGludXgvdTY0X3N0YXRzX3N5bmMuaD4sIHdyaXRlIHNpZGUgb2Ygc3RydWN0Cj4+Pj4+
Pj4+IHU2NF9zdGF0c19zeW5jIG11c3QgZW5zdXJlIG11dHVhbCBleGNsdXNpb24sIG9yIG9uZSBz
ZXFjb3VudCB1cGRhdGUgY291bGQKPj4+Pj4+Pj4gYmUgbG9zdCBvbiAzMi1iaXQgcGxhdGZvcm1z
LCB0aHVzIGJsb2NraW5nIHJlYWRlcnMgZm9yZXZlci4gU3VjaCBsb2NrdXBzCj4+Pj4+Pj4+IGhh
dmUgYmVlbiBvYnNlcnZlZCBpbiByZWFsIHdvcmxkIGFmdGVyIHN0bW1hY194bWl0KCkgb24gb25l
IENQVSByYWNlZCB3aXRoCj4+Pj4+Pj4+IHN0bW1hY19uYXBpX3BvbGxfdHgoKSBvbiBhbm90aGVy
IENQVS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gVG8gZml4IHRoZSBpc3N1ZSB3aXRob3V0IGludHJvZHVj
aW5nIGEgbmV3IGxvY2ssIHNwbGl0IHRoZSBzdGF0aWNzIGludG8KPj4+Pj4+Pj4gdGhyZWUgcGFy
dHM6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IDEuIGZpZWxkcyB1cGRhdGVkIG9ubHkgdW5kZXIgdGhlIHR4
IHF1ZXVlIGxvY2ssCj4+Pj4+Pj4+IDIuIGZpZWxkcyB1cGRhdGVkIG9ubHkgZHVyaW5nIE5BUEkg
cG9sbCwKPj4+Pj4+Pj4gMy4gZmllbGRzIHVwZGF0ZWQgb25seSBmcm9tIGludGVycnVwdCBjb250
ZXh0LAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBVcGRhdGVzIHRvIGZpZWxkcyBpbiB0aGUgZmlyc3QgdHdv
IGdyb3VwcyBhcmUgYWxyZWFkeSBzZXJpYWxpemVkIHRocm91Z2gKPj4+Pj4+Pj4gb3RoZXIgbG9j
a3MuIEl0IGlzIHN1ZmZpY2llbnQgdG8gc3BsaXQgdGhlIGV4aXN0aW5nIHN0cnVjdCB1NjRfc3Rh
dHNfc3luYwo+Pj4+Pj4+PiBzbyB0aGF0IGVhY2ggZ3JvdXAgaGFzIGl0cyBvd24uCj4+Pj4+Pj4+
Cj4+Pj4+Pj4+IE5vdGUgdGhhdCB0eF9zZXRfaWNfYml0IGlzIHVwZGF0ZWQgZnJvbSBib3RoIGNv
bnRleHRzLiBTcGxpdCB0aGlzIGNvdW50ZXIKPj4+Pj4+Pj4gc28gdGhhdCBlYWNoIGNvbnRleHQg
Z2V0cyBpdHMgb3duLCBhbmQgY2FsY3VsYXRlIHRoZWlyIHN1bSB0byBnZXQgdGhlIHRvdGFsCj4+
Pj4+Pj4+IHZhbHVlIGluIHN0bW1hY19nZXRfZXRodG9vbF9zdGF0cygpLgo+Pj4+Pj4+Pgo+Pj4+
Pj4+PiBGb3IgdGhlIHRoaXJkIGdyb3VwLCBtdWx0aXBsZSBpbnRlcnJ1cHRzIG1heSBiZSBwcm9j
ZXNzZWQgYnkgZGlmZmVyZW50IENQVXMKPj4+Pj4+Pj4gYXQgdGhlIHNhbWUgdGltZSwgYnV0IGlu
dGVycnVwdHMgb24gdGhlIHNhbWUgQ1BVIHdpbGwgbm90IG5lc3QuIE1vdmUgZmllbGRzCj4+Pj4+
Pj4+IGZyb20gdGhpcyBncm91cCB0byBhIG5ld2x5IGNyZWF0ZWQgcGVyLWNwdSBzdHJ1Y3Qgc3Rt
bWFjX3BjcHVfc3RhdHMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEZpeGVzOiAxMzM0NjZjM2JiZTEgKCJu
ZXQ6IHN0bW1hYzogdXNlIHBlci1xdWV1ZSA2NCBiaXQgc3RhdGlzdGljcyB3aGVyZSBuZWNlc3Nh
cnkiKQo+Pj4+Pj4+PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvWmExNzNQ
aHZpWWctMXFJbkB0b3JyZXMuenVnc2NobHVzLmRlL3QvCj4+Pj4+Pj4+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnCj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBldHIgVGVzYXJpayA8cGV0ckB0
ZXNhcmljaS5jej4gIAo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyBwYXRjaCByZXN1bHRzIGluIGEgbG9j
a2RlcCBzcGxhdC4gQmFja3RyYWNlIGFuZCBiaXNlY3QgcmVzdWx0cyBhdHRhY2hlZC4KPj4+Pj4+
Pgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+IFsgICAzMy43MzY3MjhdID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4+Pj4+Pj4gWyAgIDMzLjczNjgwNV0gV0FSTklORzogaW5jb25zaXN0ZW50
IGxvY2sgc3RhdGUKPj4+Pj4+PiBbICAgMzMuNzM2OTUzXSA2LjguMC1yYzQgIzEgVGFpbnRlZDog
RyAgICAgICAgICAgICAgICAgTgo+Pj4+Pj4+IFsgICAzMy43MzcwODBdIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4+Pj4gWyAgIDMzLjczNzE1NV0gaW5jb25zaXN0ZW50IHtI
QVJESVJRLU9OLVd9IC0+IHtJTi1IQVJESVJRLVd9IHVzYWdlLgo+Pj4+Pj4+IFsgICAzMy43Mzcz
MDldIGt3b3JrZXIvMDoyLzM5IFtIQzFbMV06U0MwWzJdOkhFMDpTRTBdIHRha2VzOgo+Pj4+Pj4+
IFsgICAzMy43Mzc0NTldIGVmNzkyMDc0ICgmc3luY3AtPnNlcSMyKXs/Li4ufS17MDowfSwgYXQ6
IHN1bjhpX2R3bWFjX2RtYV9pbnRlcnJ1cHQrMHg5Yy8weDI4Ywo+Pj4+Pj4+IFsgICAzMy43Mzgy
MDZdIHtIQVJESVJRLU9OLVd9IHN0YXRlIHdhcyByZWdpc3RlcmVkIGF0Ogo+Pj4+Pj4+IFsgICAz
My43MzgzMThdICAgbG9ja19hY3F1aXJlKzB4MTFjLzB4MzY4Cj4+Pj4+Pj4gWyAgIDMzLjczODQz
MV0gICBfX3U2NF9zdGF0c191cGRhdGVfYmVnaW4rMHgxMDQvMHgxYWMKPj4+Pj4+PiBbICAgMzMu
NzM4NTI1XSAgIHN0bW1hY194bWl0KzB4NGQwLzB4YzU4ICAKPj4+Pj4+Cj4+Pj4+PiBpbnRlcmVz
dGluZyBsb2NrZGVwIHNwbGF0Li4uCj4+Pj4+PiBzdG1tYWNfeG1pdCgpIG9wZXJhdGVzIG9uIHR4
cV9zdGF0cy0+cV9zeW5jcCwgd2hpbGUgdGhlCj4+Pj4+PiBzdW44aV9kd21hY19kbWFfaW50ZXJy
dXB0KCkgb3BlcmF0ZXMgb24gcGNwdSdzIHByaXYtPnhzdGF0cy5wY3B1X3N0YXRzCj4+Pj4+PiB0
aGV5IGFyZSBkaWZmZXJlbnQgc3luY3AuIHNvIGhvdyBkb2VzIGxvY2tkZXAgc3BsYXQgaGFwcGVu
LiAgCj4+Pj4+Cj4+Pj4+IFJpZ2h0LCBJIGRvIG5vdCBzZWUgYW55dGhpbmcgb2J2aW91cyB5ZXQu
ICAKPj4+Pgo+Pj4+IFdpbGQgZ3Vlc3M6IEkgdGhpbmsgaXQgbWF5YmUgc2F5aW5nIHRoYXQgZHVl
IHRvCj4+Pj4KPj4+PiAgICAgICAgIGluY29uc2lzdGVudCB7SEFSRElSUS1PTi1XfSAtPiB7SU4t
SEFSRElSUS1XfSB1c2FnZS4KPj4+Pgo+Pj4+IHRoZSBjcml0aWNhbCBjb2RlIG1heSBzb21laG93
IGJlIGludGVycnVwdGVkIGFuZCwgd2hpbGUgaGFuZGxpbmcgdGhlCj4+Pj4gaW50ZXJydXB0LCB0
cnkgdG8gYWNxdWlyZSB0aGUgc2FtZSBsb2NrIGFnYWluLiAgCj4+Pgo+Pj4gVGhpcyBzaG91bGQg
bm90IGhhcHBlbiwgdGhlICdzeW5jcCcgYXJlIGRpZmZlcmVudC4gVGhleSBoYXZlIGRpZmZlcmVu
dAo+Pj4gbG9ja2RlcCBjbGFzc2VzLgo+Pj4KPj4+IE9uZSBpcyBleGNsdXNpdmVseSB1c2VkIGZy
b20gaGFyZCBpcnEgY29udGV4dC4KPj4+Cj4+PiBUaGUgc2Vjb25kIG9uZSBvbmx5IHVzZWQgZnJv
bSBCSCBjb250ZXh0LiAgCj4+Cj4+IEFsZXhpcyBMb3Rob3LDqSBoaXQgdGhpcyBub3cgYXMgd2Vs
bCwgc2VlIHllc3RlcmRheSByZXBvcnQgaW4gdGhpcwo+PiB0aHJlYWQ7IGFwYXJ0IGZyb20gdGhh
dCBub3RoaW5nIHNlZW0gdG8gaGF2ZSBoYXBwZW5lZCBmb3IgdHdvIHdlZWtzIG5vdy4KPj4gVGhl
IGNoYW5nZSByZWNlbnRseSBtYWRlIGl0IHRvIHNvbWUgc3RhYmxlL2xvbmd0ZXJtIGtlcm5lbHMs
IHRvby4gTWFrZXMKPj4gbWUgd29uZGVyOgo+Pgo+PiBXaGF0J3MgdGhlIHBsYW4gZm9yd2FyZCBo
ZXJlPyBJcyB0aGlzIGNvbnNpZGVyZWQgdG8gYmUgYSBmYWxzZSBwb3NpdGl2ZT8KPiAKPiBBbHRo
b3VnaCBteSBzeXN0ZW0gaGFzIHJ1biBzdGFibGUgZm9yIGEgY291cGxlIG9mIG1vbnRocywgSSBh
bSBoZXNpdGFudAo+IHRvIGNhbGwgaXQgYSBmYWxzZSBwb3NpdGl2ZS4KPiAKPj4gT3IgYSByZWFs
IHByb2JsZW0/Cj4gCj4gVGhhdCdzIHdoYXQgSSB0aGluay4gQnV0IEkgd291bGQgaGF2ZSB0byBs
ZWFybiBhIGxvdCBhYm91dCB0aGUgbmV0d29yawo+IHN0YWNrIHRvIHVuZGVyc3RhbmQgd2hhdCBl
eGFjdGx5IGhhcHBlbnMgaGVyZS4KPiAKPiBJdCBtYXkgZ28gZmFzdGVyIGlmIHNvbWVib2R5IGVs
c2Ugb24gdGhlIENjIGNhbiBnaXZlIG1lIGEgaGludCB3aGVyZSB0bwo+IHN0YXJ0IGxvb2tpbmcg
YmFzZWQgb24gdGhlIGxvY2tkZXAgd2FybmluZy4KPiAKPiBQZXRyIFQKPiAKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
