Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 825DA1142F4
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2019 15:49:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3517CC36B0B;
	Thu,  5 Dec 2019 14:49:03 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 170C6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2019 14:49:00 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id s18so1728479pfm.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2019 06:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=zerf2jeTJ9T1+KiLBXKGAOgo3NLhscKc1xofy5L3cP8=;
 b=tEjy3aWT847idRVE/j0aVnV+HovrelpV9vx0sXBsnUpcJaSTMtuUK9EonXSlEmpgl1
 C9VryYh2cCZrCnW8vu2GEUIhS1quctAlNiL9Goa66xRuo0oShIqxqmUSmNhGAeIJPKeY
 /A3gYs7IiEIeQA4LyulxkKV9s+CaUGdgFzH+NntG0IJb9eilyvi8inTVBpLPGMehSs4w
 lehgRMa8jyYGgcqGj5AaOkBlnGaKbs6EkfVa5PiGSw9yWeIiUj8f1Ys/bthnCuqbtMi6
 vVroLppUxdUsWEDqOJWh3TBslzixAHJdllVIo9pZnzHDN0pMjuA/LYn3EKuhbYS6pzSL
 T3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=zerf2jeTJ9T1+KiLBXKGAOgo3NLhscKc1xofy5L3cP8=;
 b=DnUaZkSyd417a8A6ue40HmfYM/ZxU7+4ARqbniPItnjkuYAmi+9HzDy0r1XBj6xUbn
 2TVWEuzSu3MzAqXktAEl/GXxCGM6h0TdANL4RrqaHyn0feBhJ1+pr3y7oSdBbsCqUQaM
 FYpNyBr/iXj510rgJzWbJdjSFTuQxzTt5F3C8eYMModOg74jqhvlLknRXTT+Rbtbe3ch
 UjtdCd5ffknPgtSu+TE+P2mEjz9w+zm8g8iPV+0yU0aM4+FbX4+FuD7RqB/Rt+B1Yw0b
 8/tQcsd6mjHhDcCjG4qtuIdHqWq1efjGvsfEh1wo68lXpUKgEA9TEM1e591bnByajrvB
 +Hdw==
X-Gm-Message-State: APjAAAU8rhf03ixEc1TXo3xs1dbmZUAIhNIEdS6L0ZvmWX9KZlB3CzL9
 i93OBTfB18Nuq+3kbltd9uo=
X-Google-Smtp-Source: APXvYqyoEwFvj/ecUcKGhOn5iUEfeT3IoooJMwY33IQjpCOk/nMjVc0JZT4J+N3pT6rDv4VDA3+2oQ==
X-Received: by 2002:aa7:98cd:: with SMTP id e13mr9039200pfm.56.1575557338720; 
 Thu, 05 Dec 2019 06:48:58 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id z130sm12175224pgz.6.2019.12.05.06.48.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 05 Dec 2019 06:48:58 -0800 (PST)
Date: Thu, 5 Dec 2019 20:18:48 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joe Perches <joe@perches.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20191205144844.GA2903@nishad>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
 <5b588fc885efca6efdc73869aa4b1eeeb3d6f6c5.1574871463.git.nishadkamdar@gmail.com>
 <c76290a7-b9bb-7f70-e750-04fe6fdbb7e1@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c76290a7-b9bb-7f70-e750-04fe6fdbb7e1@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] pinctrl: actions: Use the correct
 style for SPDX License Identifier
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

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTA6MDI6MDhQTSArMDEwMCwgQW5kcmVhcyBGw6RyYmVy
IHdyb3RlOgo+IEFtIDI3LjExLjE5IHVtIDE3OjQwIHNjaHJpZWIgTmlzaGFkIEthbWRhcjoKPiA+
IFRoaXMgcGF0Y2ggY29ycmVjdHMgdGhlIFNQRFggTGljZW5zZSBJZGVudGlmaWVyIHN0eWxlIGlu
Cj4gPiBoZWFkZXIgZmlsZSByZWxhdGVkIEFjdGlvbnMgU2VtaSBPV0wgcGluY3RybCBkcml2ZXIu
Cj4gCj4gT3dsCj4gCkkgdXNlZCB0aGUgc2FtZSBmb3JtYXQgbWVudGlvbmVkIGJlbG93LCB3aGlj
aCBhbHNvIHNheXMgT1dMLgpNZXliZSB3ZSBjYW4gY2hhbmdlIGJvdGggb2YgdGhlbSBpbiBhIHNl
cGFyYXRlIHBhdGNoLgoKPiA+IEZvciBDIGhlYWRlciBmaWxlcyBEb2N1bWVudGF0aW9uL3Byb2Nl
c3MvbGljZW5zZS1ydWxlcy5yc3QKPiA+IG1hbmRhdGVzIEMtbGlrZSBjb21tZW50cyAob3Bwb3Nl
ZCB0byBDIHNvdXJjZSBmaWxlcyB3aGVyZQo+ID4gQysrIHN0eWxlIHNob3VsZCBiZSB1c2VkKS4K
PiA+IAo+ID4gQ2hhbmdlcyBtYWRlIGJ5IHVzaW5nIGEgc2NyaXB0IHByb3ZpZGVkIGJ5IEpvZSBQ
ZXJjaGVzIGhlcmU6Cj4gPiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8yLzcvNDYuCj4gPiAK
PiA+IFN1Z2dlc3RlZC1ieTogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KPiA+IFNpZ25l
ZC1vZmYtYnk6IE5pc2hhZCBLYW1kYXIgPG5pc2hhZGthbWRhckBnbWFpbC5jb20+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL3BpbmN0cmwvYWN0aW9ucy9waW5jdHJsLW93bC5oIHwgMiArLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL2FjdGlvbnMvcGluY3RybC1vd2wuaCBiL2RyaXZlcnMv
cGluY3RybC9hY3Rpb25zL3BpbmN0cmwtb3dsLmgKPiA+IGluZGV4IGRhZTJlODM2M2ZkNS4uZmVl
ZTdhZDdlMjdlIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2FjdGlvbnMvcGluY3Ry
bC1vd2wuaAo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL2FjdGlvbnMvcGluY3RybC1vd2wuaAo+
ID4gQEAgLTEsNCArMSw0IEBACj4gPiAtLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjArCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArICovCj4gCj4gVGhp
cyBpcyBub3QgYSB1YXBpIG9yIGFzbSBoZWFkZXIsIHdoaWNoIHRoYXQgLyogKi8gcnVsZSB3YXMg
bGF0ZXIgYWRkZWQKPiBmb3IsIEkgdGhvdWdodD8KPgoKSSBtaWdodCBiZSB3cm9uZyBidXQgSSB0
aGluayBpdCBhcHBsaWVzIHRvIHRoaXMgZmlsZSB0b28gYXMgdGhlcmUgYXMgdGhlcmUgaXMgYSBT
UERYCmlkZW50aWZpZXIgaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4gIC8qCj4gPiAgICogT1dMIFNv
QydzIFBpbmN0cmwgZGVmaW5pdGlvbnMKPiA+ICAgKgo+IAo+IE5vdCBvYmplY3RpbmcsIGp1c3Qg
bWFraW5nIHN1cmUgd2UncmUgbm90IGJsaW5kbHkgcmVmYWN0b3JpbmcgY29kZS4KPiAKCkkgYW0g
bm90IHN1cmUgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBzYXkgaGVyZSwgYnV0IHRoZSBTUERYIGlk
ZW50aWZpZXIKcmVxdWlyZXMgYW4gaW5kZXBlbmRlbnQgYmxvY2sgY29tbWVudC4gSGVuY2UgcGxh
Y2VkIHRoZSBvYm92ZSBjb2RlIGluIGEKc2VwYXJhdGUgYmxvY2sgY29tbWVudC4gRXZlcnl0aGlu
ZyBlbHNlIGlzIGFzIGl0IGlzLgoKPiBJZiBkb2luZyB0aGlzLCBJIHN1Z2dlc3QgdXBkYXRpbmcg
dG8gR1BMLTIuMC1vci1sYXRlci4KPiAKCldlIGNhbiBkbyB0aGlzIGluIGEgc2VwYXJhdGUgcGF0
Y2ggYXMgdGhpcyBwYXRjaCBvbmx5IHRhbGtzIGFib3V0CnRoZSBzdHlsZS4KCj4gUmVnYXJkcywK
PiBBbmRyZWFzCj4gCj4gLS0gCj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
Cj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gR0Y6IEZlbGl4IElt
ZW5kw7ZyZmZlcgo+IEhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKQoKVGhhbmtzIHZlcnkgbXVjaCBm
b3IgeW91ciB0aW1lIGFuZCByZXZpZXcuCgpSZWdhcmRzLApOaXNoYWQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
