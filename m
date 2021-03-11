Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E273337C72
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 19:23:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C26CC5718B;
	Thu, 11 Mar 2021 18:23:54 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 212BBC56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 18:23:53 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id n23so2323732otq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 10:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X2TrxazCY9UP4CB1vU4flOfkXW+UhcWuBfdkGL2i0ls=;
 b=BUtq+4jn2klGMKpxl2wR35WkkEZRdFysShY3uG2jaEHooE5HIc95GqTSX4danc4zMU
 qsBYqW1K22GAI3c7WPdEgjeMPgAgvQG7CpPSIoEUSlU6Vey/U1rdMc2BPpBORnyvio+R
 bzArVzZ7NRpCjhrOFVEtVqpfcqt+5cNUYqiBCHOT4t/+WzA9sPQKpHHQhRdlRzU0stjR
 crVK1HfaLduy6I8LXQQ0HfVmDcthoqFZUVjUNPVewAan2cLH0K7GEP8uHV7yu8A9zyJo
 ovg6OFKRr8pJVDCahIGNKzStPzIqfaEcHe4Np8JG09s0eVFtMwRbMdOpOajM9+ewvYrg
 z4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X2TrxazCY9UP4CB1vU4flOfkXW+UhcWuBfdkGL2i0ls=;
 b=LX6MuVlJvHaTj4xDL8IgY3r07rGb/JxM37NAljgMAcXPb2oxbkD876yNutXh6Vllcv
 ICVQ+dLyFQgSCujoZXQuoopVwCOpsVkl3ILQgo6N9DVbdLAaY0UUGZNmaFrMqrIuzSZg
 ko29ozGModsfqS1zuiCZmQqZy+Uv1zb1KbQC2ZQIqA+puQ0z8uRqb9fFmvcvYLXpyNjA
 a0dxdQRj63a8vIlqJY8+G1ZYg8mcWRAcYT4DpWExS6dkGGqCEDtLhicFnv8Zae8mExLw
 uDWQJJ4hmMDo7fvtVB/RGB3pWWFZj69snn9amzw3kEhUa3k2/qv2ZpEMoaEbuH6o9A8t
 XThQ==
X-Gm-Message-State: AOAM533b0Of+czRIUHDlfXHcuVjJKasG4VY0/enKZurqtN0FgEZeYj7z
 t59h3h1lCU7NiFzIyjQ2d+c=
X-Google-Smtp-Source: ABdhPJwfReDNY3UNDzP/Lron5+DB+qEb1RaV1nW4bRx4prAzn7c5QIcnORnFi7XILA1BRkgwA9hCAA==
X-Received: by 2002:a9d:480d:: with SMTP id c13mr155104otf.149.1615487031747; 
 Thu, 11 Mar 2021 10:23:51 -0800 (PST)
Received: from nuclearis2-1.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id m11sm691670oih.34.2021.03.11.10.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 10:23:51 -0800 (PST)
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Marek Vasut <marex@denx.de>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 Gabriel FERNANDEZ - foss <gabriel.fernandez@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Etienne CARRIERE <etienne.carriere@st.com>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <2e04f814-b694-119d-fe8a-13e6df129536@gmail.com>
 <AS8PR10MB4712C27260707345FA99ED5AEE909@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
 <c57775fe-41ef-07f5-56a2-04b8f70797c1@denx.de>
 <463dafed-ec60-cd9a-33d2-ba118a6af629@foss.st.com>
 <c1c9c89b-8794-9b91-b626-d743cd8ff31e@pengutronix.de>
 <b87a2b24-678a-724d-e5df-1eabf5969ad2@denx.de>
 <a23933fa-0c94-1e22-6100-d5b1a50826dd@foss.st.com>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <6c470715-0042-622b-d53d-59445cab8ed1@gmail.com>
Date: Thu, 11 Mar 2021 12:23:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a23933fa-0c94-1e22-6100-d5b1a50826dd@foss.st.com>
Content-Language: en-US
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/14] Introduce STM32MP1 RCC in
 secured mode
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

CgpPbiAzLzExLzIxIDEyOjEwIFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IEhpIEd1eXMK
PiAKPiBPbiAzLzExLzIxIDU6MTEgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiAzLzExLzIx
IDM6NDEgUE0sIEFobWFkIEZhdG91bSB3cm90ZToKPj4+IEhlbGxvLAo+Pgo+PiBIaSwKPj4KPj4+
IE9uIDExLjAzLjIxIDE1OjAyLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+Pj4+IE9uIDMvMTEv
MjEgMTI6NDMgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4+PiBPbiAzLzExLzIxIDk6MDggQU0s
IEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4+Pj4+PiAxLSBCcmVhayB0aGUgY3VycmVudCBBQkk6
IGFzIHNvb24gYXMgdGhvc2UgcGF0Y2hlcyBhcmUgbWVyZ2VkLCAKPj4+Pj4+IHN0bTMybXAxNTdj
LWRrMi5kdGIgd2lsbCBpbXBvc2UgdG8gdXNlCj4+Pj4+PiBBIHRmLWEgZm9yIHNjbWkgY2xvY2tz
LiBGb3IgcGVvcGxlIHVzaW5nIHUtYm9vdCBzcGwsIHRoZSB3aWxsIGhhdmUgCj4+Pj4+PiB0byBj
cmVhdGUgdGhlaXIgb3duICJuby1zZWN1cmUiIGRldmljZXRyZWUuCj4+Pj4+Cj4+Pj4+IE5BSywg
dGhpcyBicmVha3MgZXhpc3RpbmcgYm9hcmRzIGFuZCBleGlzdGluZyBzZXR1cHMsIGUuZy4gREsy
IHRoYXQgCj4+Pj4+IGRvZXMgbm90IHVzZSBBVEYuCj4+Pj4+Cj4+Pj4+PiAyLUFzIHlvdSBzdWdn
ZXN0LCBjcmVhdGUgYSBuZXcgInNlY3VyZSIgZHRiIHBlciBib2FyZHMgKE5vdCBteSAKPj4+Pj4+
IHdpc2ggZm9yIG1haW50ZW5hbmNlIHBlcnNwZWN0aXZlcykuCj4+Pj4+Cj4+Pj4+IEkgYWdyZWUg
d2l0aCBBbGV4IChHKSB0aGF0IHRoZSAic2VjdXJlIiBvcHRpb24gc2hvdWxkIGJlIG9wdC1pbi4K
Pj4+Pj4gVGhhdCB3YXkgZXhpc3Rpbmcgc2V0dXBzIHJlbWFpbiB3b3JraW5nIGFuZCBubyBleHRy
YSByZXF1aXJlbWVudHMgCj4+Pj4+IGFyZSBpbXBvc2VkIG9uIE1QMSB1c2Vycy4gRXNwLiBzaW5j
ZSBhcyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoaXMsIAo+Pj4+PiB0aGUgInNlY3VyZSIgcGFydCBp
c24ndCByZWFsbHkgYWJvdXQgc2VjdXJpdHksIGJ1dCByYXRoZXIgYWJvdXQgCj4+Pj4+IG1vdmlu
ZyBjbG9jayBjb25maWd1cmF0aW9uIGZyb20gTGludXggdG8gc29tZSBmaXJtd2FyZSBibG9iLgo+
Pj4+Pgo+Pj4+Pj4gMy0gS2VlcCBrZXJuZWwgZGV2aWNlIHRyZWUgYXMgdGhleSBhcmUgYW5kIGFw
cGxpZWQgdGhpcyBzZWN1cmUgCj4+Pj4+PiBsYXllciAoc2NtaSBjbG9ja3MgcGhhbmRsZSkgdGhh
bmtzIHRvIGR0Ym8gaW4KPj4+Pj4+IFUtYm9vdC4KPj4+Pj4KPj4+Pj4gSXMgdGhpcyByZWFsbHkg
YmV0dGVyIHRoYW4KPj4+Pj4gI2luY2x1ZGUgInN0bTMybXAxNXh4LWVuYWJsZS1zZWN1cmUtc3R1
ZmYuZHRzaSIKPj4+Pj4gaW4gYSBib2FyZCBEVCA/IEJlY2F1c2UgdGhhdCBpcyBob3cgSSBpbWFn
aW5lIHRoZSBvcHQtaW4gInNlY3VyZSIgCj4+Pj4+IG9wdGlvbiBjb3VsZCB3b3JrLgo+Pj4+Pgo+
Pj4+Cj4+Pj4gRGlzY3Vzc2luZyB3aXRoIFBhdHJpY2sgYWJvdXQgdS1ib290LCB3ZSBjb3VsZCB1
c2UgZHRibyBhcHBsaWNhdGlvbiAKPj4+PiB0aGFua3MgdG8gZXh0bGludXguY29uZi4gQlVUIGl0
IGl0IHdpbGwgbm90IHByZXZlbnQgb3RoZXIgY2FzZSAoaS5lLiAKPj4+PiBURi1BIHdoaWNoIGp1
bXAgZGlyZWN0bHkgaW4ga2VybmVsQCkuIFNvIHRoZSAibGVhc3Qgd29yc3QiIHNvbHV0aW9uIAo+
Pj4+IGlzIHRvIGNyZWF0ZSBhIG5ldyAic3RtMzJtcDEyNTdjLXNjbWktZGsyIGJvYXJkIHdoaWNo
IHdpbGwgb3ZlcmxvYWQgCj4+Pj4gY2xvY2sgZW50cmllcyB3aXRoIGEgc2NtaSBwaGFuZGxlIChh
cyBwcm9wb3NlZCBieSBBbGV4KS4KPj4+Cj4+PiBJIHJhaXNlZCB0aGlzIGlzc3VlIGJlZm9yZSB3
aXRoIHlvdXIgY29sbGVhZ3Vlcy4gSSBzdGlsbCBiZWxpZXZlIHRoZSAKPj4+IGNvcnJlY3Qgd2F5
Cj4+PiB3b3VsZCBiZSBmb3IgdGhlIFRGLUEgdG8gcGFzcyBkb3duIGVpdGhlciBhIGRldmljZSB0
cmVlIG9yIGFuIG92ZXJsYXkgCj4+PiB3aXRoIHRoZQo+Pj4gYWN0dWFsIHNldHRpbmdzIGluIHVz
ZSwgZS5nLjoKPj4+Cj4+PiDCoMKgIC0gQ2xvY2tzL1Jlc2V0cyBkb25lIHZpYSBTQ01JCj4+PiDC
oMKgIC0gUmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMKPj4+Cj4+PiBJZiBURi1BIGRpcmVjdGx5IGJv
b3RzIExpbnV4LCBpdCBjYW4gYXBwbHkgdGhlIG92ZXJsYXkgaXRzZWxmLCAKPj4+IG90aGVyd2lz
ZSBpdCdzCj4+PiBwYXNzZWQgZG93biB0byBTU0JMIHRoYXQgYXBwbGllcyBpdCBiZWZvcmUgYm9v
dGluZyBMaW51eC4KPj4KPj4gVGhhdCBzb3VuZHMgZ29vZCBhbmQgaXQgaXMgc29tZXRoaW5nIGUu
Zy4gUi1DYXIgYWxyZWFkeSBkb2VzLCBpdCAKPj4gbWVyZ2VzIERUIGZyYWdtZW50IGZyb20gcHJp
b3Igc3RhZ2VzIGF0IFUtQm9vdCBsZXZlbCBhbmQgdGhlbiBwYXNzZXMgCj4+IHRoZSByZXN1bHQg
dG8gTGludXguCj4+Cj4+IFNvIG9uIFNUIGhhcmR3YXJlLCB0aGUgc2FtZSBjb3VsZCB2ZXJ5IHdl
bGwgaGFwcGVuIGFuZCBpdCB3b3VsZCB3b3JrIAo+PiBmb3IgYm90aCBub24tQVRGIC8gQVRGIC8g
QVRGK1RFRSBvcHRpb25zLgo+IAo+IEV2ZW4gdGhpcyBzb2x1dGlvbiBzb3VuZHMgZ29vZCBidXQg
d2UgYXJlIGN1cnJlbnRseSBub3QgYWJsZSB0byBkbyBpdCBpbiAKPiBvdXIgVEYtQS91LWJvb3Qg
c28gbm90IGZlYXNpYmxlIGZvciB0aGUgbW9tZW50LiBTbyB3ZSBoYXZlIHRvIGZpbmQgYSAKPiBz
b2x1dGlvbiBmb3Igbm93LiBDcmVhdGUgYSBuZXcgZHRiIGNhbiBiZSB0aGlzIHNvbHV0aW9uLiBP
dXIgaW50ZXJuYWwgCj4gc3RyYXRlZ3kgaXMgdG8gdXNlIHNjbWkgb24gb3VyIG9mZmljaWFsIFNU
IGJvYXJkLiBJdCB3aWxsIGJlIGEgcmVhbGx5IAo+IGRyYXdiYWNrIHRvIGluY2x1ZGUgYSAibm8t
c2NtaS5kdHNpIiBpbiBESCBib2FyZHMgKGZvciBleGFtcGxlKSBhbmQgdG8gCj4gY3JlYXRlIGEg
c3RtMzJtcDE1N2Mtbm9zY21pLWRrMi5kdHMgPwoKSXQgY291bGQgd29yaywgYXMgbG9uZyBhcyBh
bGwgdXNlcnMgYXJlIHJlbWluZGVkIHRvIGNoYW5nZSB0aGVpciBidWlsZCAKc2NyaXB0cyB0byBw
aWNrIHVwIGEgIi1ub3NjbWkuZHRiIi4gSSBzdXNwZWN0IHRoYXQgaWYgdGhpcyB3ZXJlIHRoZSBj
YXNlIAp3ZSdsbCBzZWUgcXVpdGUgYSBmZXcgYnVnIHJlcG9ydHMgc2F5aW5nICJzdG0zMm1wMSBu
byBsb25nZXIgYm9vdHMgd2l0aCAKa2VybmVsIHY1LjEzIi4KCkkgZGlkbid0IHRoaW5rIG9mIHRo
aXMgb3JpZ2luYWxseSwgdGhvdWdoIHUtYm9vdCBhbHJlYWR5IGRvZXMgdGhlIERUQiAKcGF0Y2hp
bmcgZm9yIE9QVEVFIHJlc2VydmVkIG1lbW9yeSByZWdpb25zLiBJdCdzIG5vdCB0b28gaGFyZCB0
byBhbHNvIApwYXRjaCBpbiB0aGUgU0NNSSBjbG9ja3MgYXQgYm9vdC4gSW4gdS1ib290J3MgY2Fz
ZSwgcnVudGltZSBkZXRlY3Rpb24gCm1pZ2h0IGV2ZW4gYmUgZmVhc2libGUuCgpBbGV4Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
