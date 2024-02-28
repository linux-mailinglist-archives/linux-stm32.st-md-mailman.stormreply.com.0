Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE0486AB9E
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Feb 2024 10:50:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1664DC6C841;
	Wed, 28 Feb 2024 09:50:28 +0000 (UTC)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B34F7C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Feb 2024 06:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=Tis/Y5P1c6986WEgqGUJ7LAnUXHIukbiwL2Ll2OtVE0=;
 t=1709101220; x=1709533220; b=RrCbg84JE//jBoRCqihUkfHhOt0SJfY0kYskksdZeaUxz/2
 oJPyQf1twKX+MB/bbTdPgrIBNDQcS//WKXkVS4F5GCljJVvruopekkgwQ4GceIFC5jB6nFM2TZPeG
 SjKJkUHXzikLOKpN6zRDzdE4cv03VE0wxmq0zxEeoneRiD4K90Ci856fUAJcgqXH522nvpgTcxKkh
 TNcGnFC54ncmwroJ0yW0Sj7ks6EBoR3dsEcVkvpcLVhMDcsPqd5bbALuXncVySSLROYEbktEno/8R
 zzK7fkPEeHoa5095qLBsh86it6sRa2ou67FDkr5sWpERa1SsVLkDgqhtgBt2amyw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rfDIN-0008F8-3u; Wed, 28 Feb 2024 07:19:59 +0100
Message-ID: <a3749d3f-ced1-4c48-adaf-348c8dee7610@leemhuis.info>
Date: Wed, 28 Feb 2024 07:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>
References: <20240203190927.19669-1-petr@tesarici.cz>
 <ea1567d9-ce66-45e6-8168-ac40a47d1821@roeck-us.net>
 <Zct5qJcZw0YKx54r@xhacker>
 <CANn89i+4tVWezqr=BYZ5AF=9EgV2EPqhdHun=u=ga32CEJ4BXQ@mail.gmail.com>
 <20d94512-c4f2-49f7-ac97-846dc24a6730@roeck-us.net>
 <CANn89iL1piwsbsBx4Z=kySUfmPa9LbZn-SNthgA+W6NEnojgSQ@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CANn89iL1piwsbsBx4Z=kySUfmPa9LbZn-SNthgA+W6NEnojgSQ@mail.gmail.com>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1709101220;
 14265496; 
X-HE-SMSGID: 1rfDIN-0008F8-3u
X-Mailman-Approved-At: Wed, 28 Feb 2024 09:50:27 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, alexis.lothore@bootlin.com,
 Samuel Holland <samuel@sholland.org>, Petr Tesarik <petr@tesarici.cz>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Marc Haber <mh+netdev@zugschlus.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
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

TmV0IG1haW50YWluZXJzLCBjaGltaW5nIGluIGhlcmUsIGFzIGl0IHNlZW1zIGhhbmRsaW5nIHRo
aXMgcmVncmVzc2lvbgpzdGFsbGVkLgoKT24gMTMuMDIuMjQgMTY6NTIsIEVyaWMgRHVtYXpldCB3
cm90ZToKPiBPbiBUdWUsIEZlYiAxMywgMjAyNCBhdCA0OjI24oCvUE0gR3VlbnRlciBSb2VjayA8
bGludXhAcm9lY2stdXMubmV0PiB3cm90ZToKPj4gT24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgMDM6
NTE6MzVQTSArMDEwMCwgRXJpYyBEdW1hemV0IHdyb3RlOgo+Pj4gT24gVHVlLCBGZWIgMTMsIDIw
MjQgYXQgMzoyOeKAr1BNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4gd3JvdGU6
Cj4+Pj4gT24gU3VuLCBGZWIgMTEsIDIwMjQgYXQgMDg6MzA6MjFQTSAtMDgwMCwgR3VlbnRlciBS
b2VjayB3cm90ZToKPj4+Pj4gT24gU2F0LCBGZWIgMDMsIDIwMjQgYXQgMDg6MDk6MjdQTSArMDEw
MCwgUGV0ciBUZXNhcmlrIHdyb3RlOgo+Pj4+Pj4gQXMgZXhwbGFpbmVkIGJ5IGEgY29tbWVudCBp
biA8bGludXgvdTY0X3N0YXRzX3N5bmMuaD4sIHdyaXRlIHNpZGUgb2Ygc3RydWN0Cj4+Pj4+PiB1
NjRfc3RhdHNfc3luYyBtdXN0IGVuc3VyZSBtdXR1YWwgZXhjbHVzaW9uLCBvciBvbmUgc2VxY291
bnQgdXBkYXRlIGNvdWxkCj4+Pj4+PiBiZSBsb3N0IG9uIDMyLWJpdCBwbGF0Zm9ybXMsIHRodXMg
YmxvY2tpbmcgcmVhZGVycyBmb3JldmVyLiBTdWNoIGxvY2t1cHMKPj4+Pj4+IGhhdmUgYmVlbiBv
YnNlcnZlZCBpbiByZWFsIHdvcmxkIGFmdGVyIHN0bW1hY194bWl0KCkgb24gb25lIENQVSByYWNl
ZCB3aXRoCj4+Pj4+PiBzdG1tYWNfbmFwaV9wb2xsX3R4KCkgb24gYW5vdGhlciBDUFUuCj4+Pj4+
Pgo+Pj4+Pj4gVG8gZml4IHRoZSBpc3N1ZSB3aXRob3V0IGludHJvZHVjaW5nIGEgbmV3IGxvY2ss
IHNwbGl0IHRoZSBzdGF0aWNzIGludG8KPj4+Pj4+IHRocmVlIHBhcnRzOgo+Pj4+Pj4KPj4+Pj4+
IDEuIGZpZWxkcyB1cGRhdGVkIG9ubHkgdW5kZXIgdGhlIHR4IHF1ZXVlIGxvY2ssCj4+Pj4+PiAy
LiBmaWVsZHMgdXBkYXRlZCBvbmx5IGR1cmluZyBOQVBJIHBvbGwsCj4+Pj4+PiAzLiBmaWVsZHMg
dXBkYXRlZCBvbmx5IGZyb20gaW50ZXJydXB0IGNvbnRleHQsCj4+Pj4+Pgo+Pj4+Pj4gVXBkYXRl
cyB0byBmaWVsZHMgaW4gdGhlIGZpcnN0IHR3byBncm91cHMgYXJlIGFscmVhZHkgc2VyaWFsaXpl
ZCB0aHJvdWdoCj4+Pj4+PiBvdGhlciBsb2Nrcy4gSXQgaXMgc3VmZmljaWVudCB0byBzcGxpdCB0
aGUgZXhpc3Rpbmcgc3RydWN0IHU2NF9zdGF0c19zeW5jCj4+Pj4+PiBzbyB0aGF0IGVhY2ggZ3Jv
dXAgaGFzIGl0cyBvd24uCj4+Pj4+Pgo+Pj4+Pj4gTm90ZSB0aGF0IHR4X3NldF9pY19iaXQgaXMg
dXBkYXRlZCBmcm9tIGJvdGggY29udGV4dHMuIFNwbGl0IHRoaXMgY291bnRlcgo+Pj4+Pj4gc28g
dGhhdCBlYWNoIGNvbnRleHQgZ2V0cyBpdHMgb3duLCBhbmQgY2FsY3VsYXRlIHRoZWlyIHN1bSB0
byBnZXQgdGhlIHRvdGFsCj4+Pj4+PiB2YWx1ZSBpbiBzdG1tYWNfZ2V0X2V0aHRvb2xfc3RhdHMo
KS4KPj4+Pj4+Cj4+Pj4+PiBGb3IgdGhlIHRoaXJkIGdyb3VwLCBtdWx0aXBsZSBpbnRlcnJ1cHRz
IG1heSBiZSBwcm9jZXNzZWQgYnkgZGlmZmVyZW50IENQVXMKPj4+Pj4+IGF0IHRoZSBzYW1lIHRp
bWUsIGJ1dCBpbnRlcnJ1cHRzIG9uIHRoZSBzYW1lIENQVSB3aWxsIG5vdCBuZXN0LiBNb3ZlIGZp
ZWxkcwo+Pj4+Pj4gZnJvbSB0aGlzIGdyb3VwIHRvIGEgbmV3bHkgY3JlYXRlZCBwZXItY3B1IHN0
cnVjdCBzdG1tYWNfcGNwdV9zdGF0cy4KPj4+Pj4+Cj4+Pj4+PiBGaXhlczogMTMzNDY2YzNiYmUx
ICgibmV0OiBzdG1tYWM6IHVzZSBwZXItcXVldWUgNjQgYml0IHN0YXRpc3RpY3Mgd2hlcmUgbmVj
ZXNzYXJ5IikKPj4+Pj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi9aYTE3
M1BodmlZZy0xcUluQHRvcnJlcy56dWdzY2hsdXMuZGUvdC8KPj4+Pj4+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQZXRyIFRlc2FyaWsgPHBldHJAdGVz
YXJpY2kuY3o+Cj4+Pj4+Cj4+Pj4+IFRoaXMgcGF0Y2ggcmVzdWx0cyBpbiBhIGxvY2tkZXAgc3Bs
YXQuIEJhY2t0cmFjZSBhbmQgYmlzZWN0IHJlc3VsdHMgYXR0YWNoZWQuCj4+Pj4+Cj4+Pj4+IC0t
LQo+Pj4+PiBbICAgMzMuNzM2NzI4XSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+
Pj4+PiBbICAgMzMuNzM2ODA1XSBXQVJOSU5HOiBpbmNvbnNpc3RlbnQgbG9jayBzdGF0ZQo+Pj4+
PiBbICAgMzMuNzM2OTUzXSA2LjguMC1yYzQgIzEgVGFpbnRlZDogRyAgICAgICAgICAgICAgICAg
Tgo+Pj4+PiBbICAgMzMuNzM3MDgwXSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
Pj4+PiBbICAgMzMuNzM3MTU1XSBpbmNvbnNpc3RlbnQge0hBUkRJUlEtT04tV30gLT4ge0lOLUhB
UkRJUlEtV30gdXNhZ2UuCj4+Pj4+IFsgICAzMy43MzczMDldIGt3b3JrZXIvMDoyLzM5IFtIQzFb
MV06U0MwWzJdOkhFMDpTRTBdIHRha2VzOgo+Pj4+PiBbICAgMzMuNzM3NDU5XSBlZjc5MjA3NCAo
JnN5bmNwLT5zZXEjMil7Py4uLn0tezA6MH0sIGF0OiBzdW44aV9kd21hY19kbWFfaW50ZXJydXB0
KzB4OWMvMHgyOGMKPj4+Pj4gWyAgIDMzLjczODIwNl0ge0hBUkRJUlEtT04tV30gc3RhdGUgd2Fz
IHJlZ2lzdGVyZWQgYXQ6Cj4+Pj4+IFsgICAzMy43MzgzMThdICAgbG9ja19hY3F1aXJlKzB4MTFj
LzB4MzY4Cj4+Pj4+IFsgICAzMy43Mzg0MzFdICAgX191NjRfc3RhdHNfdXBkYXRlX2JlZ2luKzB4
MTA0LzB4MWFjCj4+Pj4+IFsgICAzMy43Mzg1MjVdICAgc3RtbWFjX3htaXQrMHg0ZDAvMHhjNTgK
Pj4+Pgo+Pj4+IGludGVyZXN0aW5nIGxvY2tkZXAgc3BsYXQuLi4KPj4+PiBzdG1tYWNfeG1pdCgp
IG9wZXJhdGVzIG9uIHR4cV9zdGF0cy0+cV9zeW5jcCwgd2hpbGUgdGhlCj4+Pj4gc3VuOGlfZHdt
YWNfZG1hX2ludGVycnVwdCgpIG9wZXJhdGVzIG9uIHBjcHUncyBwcml2LT54c3RhdHMucGNwdV9z
dGF0cwo+Pj4+IHRoZXkgYXJlIGRpZmZlcmVudCBzeW5jcC4gc28gaG93IGRvZXMgbG9ja2RlcCBz
cGxhdCBoYXBwZW4uCj4+Pgo+Pj4gUmlnaHQsIEkgZG8gbm90IHNlZSBhbnl0aGluZyBvYnZpb3Vz
IHlldC4KPj4KPj4gV2lsZCBndWVzczogSSB0aGluayBpdCBtYXliZSBzYXlpbmcgdGhhdCBkdWUg
dG8KPj4KPj4gICAgICAgICBpbmNvbnNpc3RlbnQge0hBUkRJUlEtT04tV30gLT4ge0lOLUhBUkRJ
UlEtV30gdXNhZ2UuCj4+Cj4+IHRoZSBjcml0aWNhbCBjb2RlIG1heSBzb21laG93IGJlIGludGVy
cnVwdGVkIGFuZCwgd2hpbGUgaGFuZGxpbmcgdGhlCj4+IGludGVycnVwdCwgdHJ5IHRvIGFjcXVp
cmUgdGhlIHNhbWUgbG9jayBhZ2Fpbi4KPiAKPiBUaGlzIHNob3VsZCBub3QgaGFwcGVuLCB0aGUg
J3N5bmNwJyBhcmUgZGlmZmVyZW50LiBUaGV5IGhhdmUgZGlmZmVyZW50Cj4gbG9ja2RlcCBjbGFz
c2VzLgo+IAo+IE9uZSBpcyBleGNsdXNpdmVseSB1c2VkIGZyb20gaGFyZCBpcnEgY29udGV4dC4K
PiAKPiBUaGUgc2Vjb25kIG9uZSBvbmx5IHVzZWQgZnJvbSBCSCBjb250ZXh0LgoKQWxleGlzIExv
dGhvcsOpIGhpdCB0aGlzIG5vdyBhcyB3ZWxsLCBzZWUgeWVzdGVyZGF5IHJlcG9ydCBpbiB0aGlz
CnRocmVhZDsgYXBhcnQgZnJvbSB0aGF0IG5vdGhpbmcgc2VlbSB0byBoYXZlIGhhcHBlbmVkIGZv
ciB0d28gd2Vla3Mgbm93LgpUaGUgY2hhbmdlIHJlY2VudGx5IG1hZGUgaXQgdG8gc29tZSBzdGFi
bGUvbG9uZ3Rlcm0ga2VybmVscywgdG9vLiBNYWtlcwptZSB3b25kZXI6CgpXaGF0J3MgdGhlIHBs
YW4gZm9yd2FyZCBoZXJlPyBJcyB0aGlzIGNvbnNpZGVyZWQgdG8gYmUgYSBmYWxzZSBwb3NpdGl2
ZT8KT3IgYSByZWFsIHByb2JsZW0/IE9yIGEga2luZCBvZiBzaXR1YXRpb24gYWxvbmcgdGhlIGxp
bmVzIG9mICJ0aGF0CmNvbW1pdCBzaG91bGQgbm90IGNhdXNlIHRoZSBwcm9ibGVtIHdlIGFyZSBz
ZWVpbmcsIHNvIGl0IG1pZ2h0IGhhdmUKZXhwb3NlZCBhIG9sZGVyIGJ1ZyBpbiB0aGUgY29kZSwg
YnV0IG5vYm9keSBsb29rZWQgY2xvc2VyIHlldCB0byBjaGVjayI/Ck9yIHNvbWV0aGluZyBlbHNl
PwoKQ2lhbywgVGhvcnN0ZW4gKHdlYXJpbmcgaGlzICd0aGUgTGludXgga2VybmVsJ3MgcmVncmVz
c2lvbiB0cmFja2VyJyBoYXQpCi0tCkV2ZXJ5dGhpbmcgeW91IHdhbm5hIGtub3cgYWJvdXQgTGlu
dXgga2VybmVsIHJlZ3Jlc3Npb24gdHJhY2tpbmc6Cmh0dHBzOi8vbGludXgtcmVndHJhY2tpbmcu
bGVlbWh1aXMuaW5mby9hYm91dC8jdGxkcgpJZiBJIGRpZCBzb21ldGhpbmcgc3R1cGlkLCBwbGVh
c2UgdGVsbCBtZSwgYXMgZXhwbGFpbmVkIG9uIHRoYXQgcGFnZS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
