Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C397AC41AA
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 16:42:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18DF1C36B0E;
	Mon, 26 May 2025 14:42:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DC87C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 14:42:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01A2F439AC;
 Mon, 26 May 2025 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748270565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mbr5t4PGFq3eJGZHk+DUNUJrzlxkWy9snikx9mhwYS0=;
 b=BELkQeUY7THmMuVRkP+N4HdC1Lr5zPHIYYHtrR0qFZLRS8sz5Y13t9DjJqM4NG36gR9kQI
 hCPQ5ualzVOFms+l8O2joDdvzoKzbAyGqrOpi1vPmgQF7/FfHfOVoD3L5F9SLMZoVvOrnz
 zTSf/qZAuqbFXMm1ydNIwOPZaqFrcmhQO30IZCcve/hH8klVakvpqsQ3ItKUYaEbe63WYy
 lHNeo3ru3Bpqmk9Bc0Pug8tuoZiEU9BJZEDnUbhq19eD2XAGjGhb7KC3fJH7wTB5lLI0tK
 3zJwjfkiw0l6JLk+vLi12Xhb9stwbw5+HJi0V5vp0C5EC9/o9p1sfTwkHsG4IQ==
Mime-Version: 1.0
Date: Mon, 26 May 2025 16:42:42 +0200
Message-Id: <DA666WVCP2OB.300LVHEGH5V4Y@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Yanteng Si" <si.yanteng@linux.dev>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Jose Abreu" <joabreu@synopsys.com>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Richard Cochran"
 <richardcochran@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250523-stmmac_tstamp_div-v1-1-bca8a5a3a477@bootlin.com>
 <8f1928e5-472e-4140-875c-6b5743be8fd3@linux.dev>
In-Reply-To: <8f1928e5-472e-4140-875c-6b5743be8fd3@linux.dev>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeejleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvvefofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedugfevhfevueeggedutefhgfevhfeltefgieejjeeijeejveegtdehgeefkefhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehsihdrhigrnhhtvghngheslhhinhhugidruggvvhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehjohgrsghrvghusehshihnohhpshihshdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehlu
 hhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: add explicit check and error
 on invalid PTP clock rate
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

T24gTW9uIE1heSAyNiwgMjAyNSBhdCA0OjIyIEFNIENFU1QsIFlhbnRlbmcgU2kgd3JvdGU6Cj4g
5ZyoIDUvMjMvMjUgNzo0NiBQTSwgQWxleGlzIExvdGhvcsODwqkg5YaZ6YGTOgo+PiBXaGlsZSBz
b21lIHBsYXRmb3JtcyBpbXBsZW1lbnRpbmcgZHdtYWMgb3Blbi1jb2RlIHRoZSBjbGtfcHRwX3Jh
dGUKPj4gdmFsdWUsIHNvbWUgb3RoZXJzIGR5bmFtaWNhbGx5IHJldHJpZXZlIHRoZSB2YWx1ZSBh
dCBydW50aW1lLiBJZiB0aGUKPj4gcmV0cmlldmVkIHZhbHVlIGhhcHBlbnMgdG8gYmUgMCBmb3Ig
YW55IHJlYXNvbiwgaXQgd2lsbCBldmVudHVhbGx5Cj4+IHByb3BhZ2F0ZSB1cCB0byBQVFAgaW5p
dGlhbGl6YXRpb24gd2hlbiBicmluZ2luZyB1cCB0aGUgaW50ZXJmYWNlLAo+PiBsZWFkaW5nIHRv
IGEgZGl2aWRlIGJ5IDA6CgpbLi4uXQoKPiAgRnJvbSB5b3VyIGRlc2NyaXB0aW9uLCBJIGNhbm5v
dCBkZXRlcm1pbmUgdGhlIHNjb3BlCj4gb2YgInNvbWUgcGxhdGZvcm1zIi4gTXkgcG9pbnQgaXM6
IGlmIHRoZXJlIGFyZSBvbmx5Cj4gYSBmZXcgcGxhdGZvcm1zLCBjYW4gd2UgZmluZCBhIHdheSB0
byBoYW5kbGUgdGhpcyBpbgo+IHRoZSBkaXJlY3Rvcnkgb2YgdGhlIGNvcnJlc3BvbmRpbmcgcGxh
dGZvcm0/CgpGcm9tIHdoYXQgSSBjYW4gc2VlLCBpdCBjYW4gYWZmZWN0IGFueSBwbGF0Zm9ybSB1
c2luZyB0aGUgc3RtbWFjIGRyaXZlciBhcwp0aGUgcGxhdGZvcm0gZHJpdmVyIChleGNlcHQgbWF5
YmUgZHdtYWMtcWNvbS1ldGhxb3MuYywgd2hpY2ggZW5mb3JjZXMgYW4Kb3Blbi1jb2RlZCBjbGtf
cHRwX3JhdGUgYWZ0ZXIgdGhlIHN0bW1hY19wcm9iZV9jb25maWdfZHQgY2FsbCB0aGF0IHNldHMK
dGhlIGNsa19wdHBfcmF0ZSksIGlmIHRoZSBwbGF0Zm9ybSBkZWNsYXJlcyBhIGRlZGljYXRlZCBj
bGtfcHRwX3JlZiBjbG9jay4KU28gSSB3b3VsZCByYXRoZXIgc2F5IHRoYXQgaXQgY2FuIGFmZmVj
dCBtb3N0IG9mIHRoZSBwbGF0Zm9ybXMuCgpJbiBteSBjYXNlLCBJIGhhdmUgb2JzZXJ2ZWQgdGhl
IGlzc3VlIHdpdGggdGhlIGR3bWFjLXN0bTMyLmMgZHJpdmVyLCBvbiBhbgpTVE0zMk1QMTU3YS1k
azEgcGxhdGZvcm0uCgo+IEFuZCB0aGVyZSBuZWVkIGEgRml4ZXMgdGFnLgoKT2ssIEknbGwgYWRk
IGEgcmVsZXZhbnQgRml4ZXMgdGFnLgoKQWxleGlzCgo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMg
TG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+PiAtLS0KPj4gICBkcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIHwgNSArKysrKwo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+PiBpbmRleCA5MThkN2Yy
ZThiYTk5MjIwOGQ3ZDY1MjFhMWU5ZGJhMDEwODYwNThmLi5mNjhlM2VjZTkxOWNjODhkMGJmMTk5
YTM5NGJjN2U0NGI1ZGVlMDk1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPj4gQEAgLTgzNSw2ICs4MzUsMTEgQEAgaW50
IHN0bW1hY19pbml0X3RzdGFtcF9jb3VudGVyKHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiwgdTMy
IHN5c3RpbWVfZmxhZ3MpCj4+ICAgCWlmICghKHByaXYtPmRtYV9jYXAudGltZV9zdGFtcCB8fCBw
cml2LT5kbWFfY2FwLmF0aW1lX3N0YW1wKSkKPj4gICAJCXJldHVybiAtRU9QTk9UU1VQUDsKPj4g
ICAKPj4gKwlpZiAoIXByaXYtPnBsYXQtPmNsa19wdHBfcmF0ZSkgewo+PiArCQluZXRkZXZfZXJy
KHByaXYtPmRldiwgIkludmFsaWQgUFRQIGNsb2NrIHJhdGUiKTsKPj4gKwkJcmV0dXJuIC1FSU5W
QUw7Cj4+ICsJfQo+PiArCj4+ICAgCXN0bW1hY19jb25maWdfaHdfdHN0YW1waW5nKHByaXYsIHBy
aXYtPnB0cGFkZHIsIHN5c3RpbWVfZmxhZ3MpOwo+PiAgIAlwcml2LT5zeXN0aW1lX2ZsYWdzID0g
c3lzdGltZV9mbGFnczsKPj4gICAKPj4gCj4+IC0tLQo+PiBiYXNlLWNvbW1pdDogZTBlMmY3ODI0
MzM4NWU3MTg4YTU3ZmNmY2ViNmExOWY3MjNmMWRmZgo+PiBjaGFuZ2UtaWQ6IDIwMjUwNTIyLXN0
bW1hY190c3RhbXBfZGl2LWY1NTExMmYwNjAyOQo+PiAKPj4gQmVzdCByZWdhcmRzLAoKCgoKLS0g
CkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
