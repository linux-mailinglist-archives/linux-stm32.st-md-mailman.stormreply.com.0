Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1A34BBA06
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Feb 2022 14:22:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D123C60474;
	Fri, 18 Feb 2022 13:22:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8905C6046E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Feb 2022 13:22:45 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3FC0120005;
 Fri, 18 Feb 2022 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645190565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJEWhVniuoP8Wv8IPEKZ0mxt7FVUl58XIp244xy2duY=;
 b=LzULFzHXsRRMF/aaeUa6mektFIhZ/f4dORt1x78hcfXZk8QMj48BuH8gh7qoyc6wfcHThY
 zhrt5FC4FAdBUMV3YeI9NOiNpSXdyoWP2+MPZ8TcIosg1qGrBg7UOYgDgQ+qg4yvRYpBth
 v+8+KxvTRGdZLKZYke3qEFEeqdJwnss38RIEmQDMkmPltaoPB6hegkO0F3oynxVYfL8OOX
 yHnsv9FKWxmRQLWLJwBMH/z8ewDRHmiRRyICIAikcrZLlGFK9bR4ZtIHZhqUdAHGOE6wgI
 Dquwt5s2PGZTUWEYb3u3Wuggoi3NK9KEHevrLyJG5F1cByqvFwD2YNNtRkbxOQ==
Date: Fri, 18 Feb 2022 14:22:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <20220218142241.7a86aebb@xps13>
In-Reply-To: <20220217144755.270679-5-christophe.kerello@foss.st.com>
References: <20220217144755.270679-1-christophe.kerello@foss.st.com>
 <20220217144755.270679-5-christophe.kerello@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, linux-mtd@lists.infradead.org, p.yadav@ti.com,
 chenshumin86@sina.com
Subject: Re: [Linux-stm32] [PATCH v3 4/4] mtd: core: Fix a conflict between
 MTD and NVMEM on wp-gpios property
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

SGkgU3Jpbml2YXMsCgpjaHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20gd3JvdGUgb24gVGh1
LCAxNyBGZWIgMjAyMiAxNTo0Nzo1NSArMDEwMDoKCj4gV3AtZ3Bpb3MgcHJvcGVydHkgY2FuIGJl
IHVzZWQgb24gTlZNRU0gbm9kZXMgYW5kIHRoZSBzYW1lIHByb3BlcnR5IGNhbgo+IGJlIGFsc28g
dXNlZCBvbiBNVEQgTkFORCBub2Rlcy4gSW4gY2FzZSBvZiB0aGUgd3AtZ3Bpb3MgcHJvcGVydHkg
aXMKPiBkZWZpbmVkIGF0IE5BTkQgbGV2ZWwgbm9kZSwgdGhlIEdQSU8gbWFuYWdlbWVudCBpcyBk
b25lIGF0IE5BTkQgZHJpdmVyCj4gbGV2ZWwuIFdyaXRlIHByb3RlY3QgaXMgZGlzYWJsZWQgd2hl
biB0aGUgZHJpdmVyIGlzIHByb2JlZCBvciByZXN1bWVkCj4gYW5kIGlzIGVuYWJsZWQgd2hlbiB0
aGUgZHJpdmVyIGlzIHJlbGVhc2VkIG9yIHN1c3BlbmRlZC4KPiAKPiBXaGVuIG5vIHBhcnRpdGlv
bnMgYXJlIGRlZmluZWQgaW4gdGhlIE5BTkQgRFQgbm9kZSwgdGhlbiB0aGUgTkFORCBEVCBub2Rl
Cj4gd2lsbCBiZSBwYXNzZWQgdG8gTlZNRU0gZnJhbWV3b3JrLiBJZiB3cC1ncGlvcyBwcm9wZXJ0
eSBpcyBkZWZpbmVkIGluCj4gdGhpcyBub2RlLCB0aGUgR1BJTyByZXNvdXJjZSBpcyB0YWtlbiB0
d2ljZSBhbmQgdGhlIE5BTkQgY29udHJvbGxlcgo+IGRyaXZlciBmYWlscyB0byBwcm9iZS4KPiAK
PiBBIG5ldyBCb29sZWFuIGZsYWcgbmFtZWQgaWdub3JlX3dwIGhhcyBiZWVuIGFkZGVkIGluIG52
bWVtX2NvbmZpZy4KPiBJbiBjYXNlIGlnbm9yZV93cCBpcyBzZXQsIGl0IG1lYW5zIHRoYXQgdGhl
IEdQSU8gaXMgaGFuZGxlZCBieSB0aGUKPiBwcm92aWRlci4gTGV0cyBzZXQgdGhpcyBmbGFnIGlu
IE1URCBsYXllciB0byBhdm9pZCB0aGUgY29uZmxpY3Qgb24KPiB3cF9ncGlvcyBwcm9wZXJ0eS4K
PiAKPiBGaXhlczogMmExMjdkYTQ2MWE5ICgibnZtZW06IGFkZCBzdXBwb3J0IGZvciB0aGUgd3Jp
dGUtcHJvdGVjdCBwaW4iKQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hy
aXN0b3BoZS5rZXJlbGxvQGZvc3Muc3QuY29tPgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
CgpZb3UgY2FuIHRha2UgcGF0Y2hlcyAzIGFuZCA0IHRocm91Z2ggdGhlIG52bWVtIHRyZWUuCgpB
Y2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5r
cywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
