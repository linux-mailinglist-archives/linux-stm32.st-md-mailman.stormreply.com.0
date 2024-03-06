Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5418731BD
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Mar 2024 10:01:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA86FC6DD72;
	Wed,  6 Mar 2024 09:01:56 +0000 (UTC)
Received: from bee.tesarici.cz (unknown [77.93.223.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 105E2C6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 09:01:55 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 7B6871CA38F;
 Wed,  6 Mar 2024 10:01:54 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none)
 header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
 t=1709715714; bh=YzH+vqMnEg2qYPMQb47PYCat1WD2FNYibWcd0rUjZiY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kpBLh5rESQNyznO+SYYM00jpTxdGjER/C8xQnqISGk8f0f0ZNTfT/wigUZmhMQnJ2
 lOxnSFnQV276r/0/82WhJDGm7FuNZXWk5cYXxuI64wbdf+opcec/OfNzeagtaH+93y
 0FdlRPPUnUdTVWLxO/mwJTyeVqpAdwnVcJ9yxLw6Xqq8i8nINb7oboUnf9g98TZKxe
 +BcSmKTaeZSSPzDJNNM1g9gethLgL5aYOun3EKdUvVp2yW/MKxpBCjDWzvrHMqWzgl
 psC2i4iZCrhSlkzrcCwazXxAQmLnORH7LaXGXDF2FuzX8aK9xPcG2eUxN8H3NAWoOL
 ZwMpmdC/IZiFw==
Date: Wed, 6 Mar 2024 10:01:53 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Message-ID: <20240306100153.32d305f7@meshulam.tesarici.cz>
In-Reply-To: <e3181555-c08d-463f-a9a9-b08c69875c84@leemhuis.info>
References: <20240203190927.19669-1-petr@tesarici.cz>
 <ea1567d9-ce66-45e6-8168-ac40a47d1821@roeck-us.net>
 <Zct5qJcZw0YKx54r@xhacker>
 <CANn89i+4tVWezqr=BYZ5AF=9EgV2EPqhdHun=u=ga32CEJ4BXQ@mail.gmail.com>
 <20d94512-c4f2-49f7-ac97-846dc24a6730@roeck-us.net>
 <CANn89iL1piwsbsBx4Z=kySUfmPa9LbZn-SNthgA+W6NEnojgSQ@mail.gmail.com>
 <a3749d3f-ced1-4c48-adaf-348c8dee7610@leemhuis.info>
 <20240228120308.48d6a9c2@meshulam.tesarici.cz>
 <e3181555-c08d-463f-a9a9-b08c69875c84@leemhuis.info>
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

T24gV2VkLCA2IE1hciAyMDI0IDA5OjIzOjUzICswMTAwCiJMaW51eCByZWdyZXNzaW9uIHRyYWNr
aW5nIChUaG9yc3RlbiBMZWVtaHVpcykiIDxyZWdyZXNzaW9uc0BsZWVtaHVpcy5pbmZvPiB3cm90
ZToKCj4gT24gMjguMDIuMjQgMTI6MDMsIFBldHIgVGVzYcWZw61rIHdyb3RlOgo+ID4gT24gV2Vk
LCAyOCBGZWIgMjAyNCAwNzoxOTo1NiArMDEwMAo+ID4gIkxpbnV4IHJlZ3Jlc3Npb24gdHJhY2tp
bmcgKFRob3JzdGVuIExlZW1odWlzKSIgPHJlZ3Jlc3Npb25zQGxlZW1odWlzLmluZm8+IHdyb3Rl
Ogo+ID4gICAKPiA+PiBOZXQgbWFpbnRhaW5lcnMsIGNoaW1pbmcgaW4gaGVyZSwgYXMgaXQgc2Vl
bXMgaGFuZGxpbmcgdGhpcyByZWdyZXNzaW9uCj4gPj4gc3RhbGxlZC4gIAo+ID4gSW5kZWVkLCBJ
IHdhcyB0b28gYnVzeSB3aXRoIHNhbmRib3ggbW9kZS4uLiAgCj4gCj4gSG1tLCBubyByZXBseSBp
biB0aGUgcGFzdCB3ZWVrIHRvIFBldHIncyByZXF1ZXN0IGZvciBoZWxwIGZyb20gc29tZW9uZQo+
IHdpdGggbW9yZSBrbm93bGVkZ2UgYWJvdXQgdGhlIGZpZWxkLiA6LS8KPiAKPiBTbyBJIGd1ZXNz
IHRoaXMgbWVhbnMgdGhhdCB0aGlzIHdvbid0IGJlIGZpeGVkIGZvciA2Ljg/IFVuZm9ydHVuYXRl
LCBidXQKPiB3ZWxsLCB0aGF0J3MgaG93IGl0IGl0IHNvbWV0aW1lcy4KCkZvciB0aGUgcmVjb3Jk
LCBJIF9jYW5fIHJlcHJvZHVjZSBsb2NrZGVwIHNwbGF0cyBvbiBteSBkZXZpY2UsIGJ1dCB0aGV5
CmRvbid0IG1ha2UgYW55IHNlbnNlIHRvIG1lLiBUaGV5IHNlZW0gdG8gY29uZmlybSBKaXNoZW5n
IFpoYW5nJ3MKY29uY2x1c2lvbiB0aGF0IGxvY2tkZXAgY29uZmxhdGVzIHR3byBsb2NrcyB3aGlj
aCBzaG91bGQgaGF2ZSBkaWZmZXJlbnQKbG9jay1jbGFzc2VzLgoKU28gZmFyIEkgaGF2ZSBub3Rp
Y2VkIG9ubHkgb25lIGlzc3VlOiB0aGUgcGVyLWNwdSBzeW5jcCdzIGFyZSBub3QKaW5pdGlhbGl6
ZWQuIEknbGwgcmVjb21waWxlIGFuZCBzZWUgaWYgdGhhdCdzIHdoYXQgY29uZnVzZXMgbG9ja2Rl
cC4KClBldHIgVAoKPiBDaWFvLCBUaG9yc3RlbiAod2VhcmluZyBoaXMgJ3RoZSBMaW51eCBrZXJu
ZWwncyByZWdyZXNzaW9uIHRyYWNrZXInIGhhdCkKPiAtLQo+IEV2ZXJ5dGhpbmcgeW91IHdhbm5h
IGtub3cgYWJvdXQgTGludXgga2VybmVsIHJlZ3Jlc3Npb24gdHJhY2tpbmc6Cj4gaHR0cHM6Ly9s
aW51eC1yZWd0cmFja2luZy5sZWVtaHVpcy5pbmZvL2Fib3V0LyN0bGRyCj4gSWYgSSBkaWQgc29t
ZXRoaW5nIHN0dXBpZCwgcGxlYXNlIHRlbGwgbWUsIGFzIGV4cGxhaW5lZCBvbiB0aGF0IHBhZ2Uu
Cj4gCj4gI3JlZ3pib3QgcG9rZQo+IAo+ID4+IE9uIDEzLjAyLjI0IDE2OjUyLCBFcmljIER1bWF6
ZXQgd3JvdGU6ICAKPiA+Pj4gT24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgNDoyNuKAr1BNIEd1ZW50
ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6ICAgIAo+ID4+Pj4gT24gVHVlLCBG
ZWIgMTMsIDIwMjQgYXQgMDM6NTE6MzVQTSArMDEwMCwgRXJpYyBEdW1hemV0IHdyb3RlOiAgICAK
PiA+Pj4+PiBPbiBUdWUsIEZlYiAxMywgMjAyNCBhdCAzOjI54oCvUE0gSmlzaGVuZyBaaGFuZyA8
anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZTogICAgCj4gPj4+Pj4+IE9uIFN1biwgRmViIDExLCAy
MDI0IGF0IDA4OjMwOjIxUE0gLTA4MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6ICAgIAo+ID4+Pj4+
Pj4gT24gU2F0LCBGZWIgMDMsIDIwMjQgYXQgMDg6MDk6MjdQTSArMDEwMCwgUGV0ciBUZXNhcmlr
IHdyb3RlOiAgICAKPiA+Pj4+Pj4+PiBBcyBleHBsYWluZWQgYnkgYSBjb21tZW50IGluIDxsaW51
eC91NjRfc3RhdHNfc3luYy5oPiwgd3JpdGUgc2lkZSBvZiBzdHJ1Y3QKPiA+Pj4+Pj4+PiB1NjRf
c3RhdHNfc3luYyBtdXN0IGVuc3VyZSBtdXR1YWwgZXhjbHVzaW9uLCBvciBvbmUgc2VxY291bnQg
dXBkYXRlIGNvdWxkCj4gPj4+Pj4+Pj4gYmUgbG9zdCBvbiAzMi1iaXQgcGxhdGZvcm1zLCB0aHVz
IGJsb2NraW5nIHJlYWRlcnMgZm9yZXZlci4gU3VjaCBsb2NrdXBzCj4gPj4+Pj4+Pj4gaGF2ZSBi
ZWVuIG9ic2VydmVkIGluIHJlYWwgd29ybGQgYWZ0ZXIgc3RtbWFjX3htaXQoKSBvbiBvbmUgQ1BV
IHJhY2VkIHdpdGgKPiA+Pj4+Pj4+PiBzdG1tYWNfbmFwaV9wb2xsX3R4KCkgb24gYW5vdGhlciBD
UFUuCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBUbyBmaXggdGhlIGlzc3VlIHdpdGhvdXQgaW50cm9k
dWNpbmcgYSBuZXcgbG9jaywgc3BsaXQgdGhlIHN0YXRpY3MgaW50bwo+ID4+Pj4+Pj4+IHRocmVl
IHBhcnRzOgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gMS4gZmllbGRzIHVwZGF0ZWQgb25seSB1bmRl
ciB0aGUgdHggcXVldWUgbG9jaywKPiA+Pj4+Pj4+PiAyLiBmaWVsZHMgdXBkYXRlZCBvbmx5IGR1
cmluZyBOQVBJIHBvbGwsCj4gPj4+Pj4+Pj4gMy4gZmllbGRzIHVwZGF0ZWQgb25seSBmcm9tIGlu
dGVycnVwdCBjb250ZXh0LAo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gVXBkYXRlcyB0byBmaWVsZHMg
aW4gdGhlIGZpcnN0IHR3byBncm91cHMgYXJlIGFscmVhZHkgc2VyaWFsaXplZCB0aHJvdWdoCj4g
Pj4+Pj4+Pj4gb3RoZXIgbG9ja3MuIEl0IGlzIHN1ZmZpY2llbnQgdG8gc3BsaXQgdGhlIGV4aXN0
aW5nIHN0cnVjdCB1NjRfc3RhdHNfc3luYwo+ID4+Pj4+Pj4+IHNvIHRoYXQgZWFjaCBncm91cCBo
YXMgaXRzIG93bi4KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IE5vdGUgdGhhdCB0eF9zZXRfaWNfYml0
IGlzIHVwZGF0ZWQgZnJvbSBib3RoIGNvbnRleHRzLiBTcGxpdCB0aGlzIGNvdW50ZXIKPiA+Pj4+
Pj4+PiBzbyB0aGF0IGVhY2ggY29udGV4dCBnZXRzIGl0cyBvd24sIGFuZCBjYWxjdWxhdGUgdGhl
aXIgc3VtIHRvIGdldCB0aGUgdG90YWwKPiA+Pj4+Pj4+PiB2YWx1ZSBpbiBzdG1tYWNfZ2V0X2V0
aHRvb2xfc3RhdHMoKS4KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IEZvciB0aGUgdGhpcmQgZ3JvdXAs
IG11bHRpcGxlIGludGVycnVwdHMgbWF5IGJlIHByb2Nlc3NlZCBieSBkaWZmZXJlbnQgQ1BVcwo+
ID4+Pj4+Pj4+IGF0IHRoZSBzYW1lIHRpbWUsIGJ1dCBpbnRlcnJ1cHRzIG9uIHRoZSBzYW1lIENQ
VSB3aWxsIG5vdCBuZXN0LiBNb3ZlIGZpZWxkcwo+ID4+Pj4+Pj4+IGZyb20gdGhpcyBncm91cCB0
byBhIG5ld2x5IGNyZWF0ZWQgcGVyLWNwdSBzdHJ1Y3Qgc3RtbWFjX3BjcHVfc3RhdHMuCj4gPj4+
Pj4+Pj4KPiA+Pj4+Pj4+PiBGaXhlczogMTMzNDY2YzNiYmUxICgibmV0OiBzdG1tYWM6IHVzZSBw
ZXItcXVldWUgNjQgYml0IHN0YXRpc3RpY3Mgd2hlcmUgbmVjZXNzYXJ5IikKPiA+Pj4+Pj4+PiBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvWmExNzNQaHZpWWctMXFJbkB0b3Jy
ZXMuenVnc2NobHVzLmRlL3QvCj4gPj4+Pj4+Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
PiA+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQZXRyIFRlc2FyaWsgPHBldHJAdGVzYXJpY2kuY3o+
ICAgIAo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IFRoaXMgcGF0Y2ggcmVzdWx0cyBpbiBhIGxvY2tkZXAg
c3BsYXQuIEJhY2t0cmFjZSBhbmQgYmlzZWN0IHJlc3VsdHMgYXR0YWNoZWQuCj4gPj4+Pj4+Pgo+
ID4+Pj4+Pj4gLS0tCj4gPj4+Pj4+PiBbICAgMzMuNzM2NzI4XSA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQo+ID4+Pj4+Pj4gWyAgIDMzLjczNjgwNV0gV0FSTklORzogaW5jb25zaXN0
ZW50IGxvY2sgc3RhdGUKPiA+Pj4+Pj4+IFsgICAzMy43MzY5NTNdIDYuOC4wLXJjNCAjMSBUYWlu
dGVkOiBHICAgICAgICAgICAgICAgICBOCj4gPj4+Pj4+PiBbICAgMzMuNzM3MDgwXSAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+Pj4+Pj4gWyAgIDMzLjczNzE1NV0gaW5jb25z
aXN0ZW50IHtIQVJESVJRLU9OLVd9IC0+IHtJTi1IQVJESVJRLVd9IHVzYWdlLgo+ID4+Pj4+Pj4g
WyAgIDMzLjczNzMwOV0ga3dvcmtlci8wOjIvMzkgW0hDMVsxXTpTQzBbMl06SEUwOlNFMF0gdGFr
ZXM6Cj4gPj4+Pj4+PiBbICAgMzMuNzM3NDU5XSBlZjc5MjA3NCAoJnN5bmNwLT5zZXEjMil7Py4u
Ln0tezA6MH0sIGF0OiBzdW44aV9kd21hY19kbWFfaW50ZXJydXB0KzB4OWMvMHgyOGMKPiA+Pj4+
Pj4+IFsgICAzMy43MzgyMDZdIHtIQVJESVJRLU9OLVd9IHN0YXRlIHdhcyByZWdpc3RlcmVkIGF0
Ogo+ID4+Pj4+Pj4gWyAgIDMzLjczODMxOF0gICBsb2NrX2FjcXVpcmUrMHgxMWMvMHgzNjgKPiA+
Pj4+Pj4+IFsgICAzMy43Mzg0MzFdICAgX191NjRfc3RhdHNfdXBkYXRlX2JlZ2luKzB4MTA0LzB4
MWFjCj4gPj4+Pj4+PiBbICAgMzMuNzM4NTI1XSAgIHN0bW1hY194bWl0KzB4NGQwLzB4YzU4ICAg
IAo+ID4+Pj4+Pgo+ID4+Pj4+PiBpbnRlcmVzdGluZyBsb2NrZGVwIHNwbGF0Li4uCj4gPj4+Pj4+
IHN0bW1hY194bWl0KCkgb3BlcmF0ZXMgb24gdHhxX3N0YXRzLT5xX3N5bmNwLCB3aGlsZSB0aGUK
PiA+Pj4+Pj4gc3VuOGlfZHdtYWNfZG1hX2ludGVycnVwdCgpIG9wZXJhdGVzIG9uIHBjcHUncyBw
cml2LT54c3RhdHMucGNwdV9zdGF0cwo+ID4+Pj4+PiB0aGV5IGFyZSBkaWZmZXJlbnQgc3luY3Au
IHNvIGhvdyBkb2VzIGxvY2tkZXAgc3BsYXQgaGFwcGVuLiAgICAKPiA+Pj4+Pgo+ID4+Pj4+IFJp
Z2h0LCBJIGRvIG5vdCBzZWUgYW55dGhpbmcgb2J2aW91cyB5ZXQuICAgIAo+ID4+Pj4KPiA+Pj4+
IFdpbGQgZ3Vlc3M6IEkgdGhpbmsgaXQgbWF5YmUgc2F5aW5nIHRoYXQgZHVlIHRvCj4gPj4+Pgo+
ID4+Pj4gICAgICAgICBpbmNvbnNpc3RlbnQge0hBUkRJUlEtT04tV30gLT4ge0lOLUhBUkRJUlEt
V30gdXNhZ2UuCj4gPj4+Pgo+ID4+Pj4gdGhlIGNyaXRpY2FsIGNvZGUgbWF5IHNvbWVob3cgYmUg
aW50ZXJydXB0ZWQgYW5kLCB3aGlsZSBoYW5kbGluZyB0aGUKPiA+Pj4+IGludGVycnVwdCwgdHJ5
IHRvIGFjcXVpcmUgdGhlIHNhbWUgbG9jayBhZ2Fpbi4gICAgCj4gPj4+Cj4gPj4+IFRoaXMgc2hv
dWxkIG5vdCBoYXBwZW4sIHRoZSAnc3luY3AnIGFyZSBkaWZmZXJlbnQuIFRoZXkgaGF2ZSBkaWZm
ZXJlbnQKPiA+Pj4gbG9ja2RlcCBjbGFzc2VzLgo+ID4+Pgo+ID4+PiBPbmUgaXMgZXhjbHVzaXZl
bHkgdXNlZCBmcm9tIGhhcmQgaXJxIGNvbnRleHQuCj4gPj4+Cj4gPj4+IFRoZSBzZWNvbmQgb25l
IG9ubHkgdXNlZCBmcm9tIEJIIGNvbnRleHQuICAgIAo+ID4+Cj4gPj4gQWxleGlzIExvdGhvcsOp
IGhpdCB0aGlzIG5vdyBhcyB3ZWxsLCBzZWUgeWVzdGVyZGF5IHJlcG9ydCBpbiB0aGlzCj4gPj4g
dGhyZWFkOyBhcGFydCBmcm9tIHRoYXQgbm90aGluZyBzZWVtIHRvIGhhdmUgaGFwcGVuZWQgZm9y
IHR3byB3ZWVrcyBub3cuCj4gPj4gVGhlIGNoYW5nZSByZWNlbnRseSBtYWRlIGl0IHRvIHNvbWUg
c3RhYmxlL2xvbmd0ZXJtIGtlcm5lbHMsIHRvby4gTWFrZXMKPiA+PiBtZSB3b25kZXI6Cj4gPj4K
PiA+PiBXaGF0J3MgdGhlIHBsYW4gZm9yd2FyZCBoZXJlPyBJcyB0aGlzIGNvbnNpZGVyZWQgdG8g
YmUgYSBmYWxzZSBwb3NpdGl2ZT8gIAo+ID4gCj4gPiBBbHRob3VnaCBteSBzeXN0ZW0gaGFzIHJ1
biBzdGFibGUgZm9yIGEgY291cGxlIG9mIG1vbnRocywgSSBhbSBoZXNpdGFudAo+ID4gdG8gY2Fs
bCBpdCBhIGZhbHNlIHBvc2l0aXZlLgo+ID4gICAKPiA+PiBPciBhIHJlYWwgcHJvYmxlbT8gIAo+
ID4gCj4gPiBUaGF0J3Mgd2hhdCBJIHRoaW5rLiBCdXQgSSB3b3VsZCBoYXZlIHRvIGxlYXJuIGEg
bG90IGFib3V0IHRoZSBuZXR3b3JrCj4gPiBzdGFjayB0byB1bmRlcnN0YW5kIHdoYXQgZXhhY3Rs
eSBoYXBwZW5zIGhlcmUuCj4gPiAKPiA+IEl0IG1heSBnbyBmYXN0ZXIgaWYgc29tZWJvZHkgZWxz
ZSBvbiB0aGUgQ2MgY2FuIGdpdmUgbWUgYSBoaW50IHdoZXJlIHRvCj4gPiBzdGFydCBsb29raW5n
IGJhc2VkIG9uIHRoZSBsb2NrZGVwIHdhcm5pbmcuCj4gPiAKPiA+IFBldHIgVAo+ID4gCj4gPiAg
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
