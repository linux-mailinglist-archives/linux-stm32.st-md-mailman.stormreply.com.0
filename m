Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E72AB3083
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 09:29:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C0FFC7A827;
	Mon, 12 May 2025 07:29:30 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38C07C7A821
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 12:23:28 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6f0c30a1ca3so11960186d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 May 2025 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746707007; x=1747311807;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYX8qqDD4JOYlfuvNPe4ZEMyg6c1lBo9WKWQB/eyoT0=;
 b=VEmXoEbiMUZZUKxjWBgLz8jCnUTY480zfHkzQWaJRbpJjvnFU3kYULnimQly4Ubwt/
 JPikkbNpuQKZxXSvVdFBTfVFMaghnTiOSdEDquHku4I9YNjJBCO9ebBBFYUmbAgZelZ0
 +tHehTm/iI56fM5DxDcFMPN/potkHO+SDLpXqvnI5Xawv2SKfu1ZzAQx0nDDRKYyA2kX
 ec6C3ZhQwcftYXcabK4JMuGNtG08K4/qZ2czmpdf/BylO/8bLhm0xbsIKIOcPEimR6mc
 hAMHFtQyg+gCAlxn1RZ7gfIs15M1ooRKYRsn1jOkfqtZbH4DpA+BJTOavMP/I5BeTZ6j
 0OrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746707007; x=1747311807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jYX8qqDD4JOYlfuvNPe4ZEMyg6c1lBo9WKWQB/eyoT0=;
 b=Jw9It3e/MU1T46Fi+lQaSYsyxs/XRbHfOUiSQq5AIz7TQbFvE5070bzZfhgiaeC9Ja
 WeePJVaps1vYKqtPVCk4v4vhuO8PWHW6heJdmdnM+yuvLjdeh58KFFs0dl/8usD9SJPt
 DgAVwjV2TP08ru9eZo/THRWjyXz2HgTtrVYw5i9SHjMYVDvVzcx4SlLIyvg8WFixUfpv
 UXcqh3rNeO+EtVZo2XJ7VkjGtOisuI/YtK0w1A2kS9yEeii4nJ3Zi0VBRS4cESlHVPNY
 fHWpzwwMq7M0h/WBGcQFhLrMWou5MuW2XA5uJNjlXW5C23oXcwkVyw0edwmH5vs5yje+
 qS7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg9k/ctk6tvJ4I7GHrLKCpC1ygrOLAPTRlSRU69+YkxuuaN0k/HZlizHfNFQOG+ZsWtHRGPI8E2jtCtA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz0ZcypfVLmzUQZgXWirgHPGU6KbA2tgFOmATOe6M+eWUDqWrAw
 usEBTo3v1fEpxPQYr+X/2tnFT+mOUDHXLPRLaAcc77cHTGBPhSK27fFqrink1SVj0kAQzSv96HS
 PDwPTJUzefqUpOO98es/ojhbgQwDY6dmAPs0=
X-Gm-Gg: ASbGnct23pbDBLZNUVRPBjrX3wZNE//Bf2nFfnMiEChiKJuuAErEvHibD4qtxt0t/BP
 Mx6yRxNj2axWrFoT2CO233QBUdnPP2htHm5F+dTYn+l4id3ZLtoGbo04YSICDFKbCBXGrcEAdmZ
 kaItrIEvc/XPRTxliwTlV0aw==
X-Google-Smtp-Source: AGHT+IE+uL01gV6BnaJuogyasEEOBXMdeInFnUaS5xfQn4hQfGn/seeOu61dluwOGAXIkgHX/HPbWChIzJK/4OO/xCI=
X-Received: by 2002:a05:6e02:12ef:b0:3d9:6cb5:3be4 with SMTP id
 e9e14a558f8ab-3da7392c8d3mr79276605ab.15.1746706996046; Thu, 08 May 2025
 05:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com>
 <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
 <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
 <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
In-Reply-To: <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 8 May 2025 20:22:39 +0800
X-Gm-Features: ATxdqUF7fr2w19MfngP-Su9tvfrXMs7O2uRtM2xM9K46rrKLvtXS-sBBlIBE5e0
Message-ID: <CAL+tcoBrB05QSTQjcCS7=W3GRTC5MeGoKv=inxtQHPvmYcmVyA@mail.gmail.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
X-Mailman-Approved-At: Mon, 12 May 2025 07:29:26 +0000
Cc: willemb@google.com, horms@kernel.org, irusskikh@marvell.com,
 netdev@vger.kernel.org, bharat@chelsio.com,
 linux-stm32@st-md-mailman.stormreply.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, edumazet@google.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 ayush.sawal@chelsio.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, sgoutham@marvell.com, Jason Xing <kernelxing@tencent.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 4/4] net: lan966x: generate
 software timestamp just before the doorbell
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

T24gVGh1LCBNYXkgOCwgMjAyNSBhdCA1OjQ04oCvUE0gSG9yYXRpdSBWdWx0dXIKPGhvcmF0aXUu
dnVsdHVyQG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gVGhlIDA1LzA4LzIwMjUgMTY6NDAsIEph
c29uIFhpbmcgd3JvdGU6Cj4gPiBIaSBIb3JhdGl1LAo+Cj4gSGkgSmFzb24sCj4KPiA+Cj4gPiBP
biBUaHUsIE1heSA4LCAyMDI1IGF0IDM6MDjigK9QTSBIb3JhdGl1IFZ1bHR1cgo+ID4gPGhvcmF0
aXUudnVsdHVyQG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBUaGUgMDUvMDgvMjAy
NSAxMTozMywgSmFzb24gWGluZyB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEZyb206IEphc29uIFhp
bmcgPGtlcm5lbHhpbmdAdGVuY2VudC5jb20+Cj4gPiA+ID4KPiA+ID4gPiBNYWtlIHN1cmUgdGhl
IGNhbGwgb2Ygc2tiX3R4X3RpbWVzdGFtcCBhcyBjbG9zZSB0byB0aGUgZG9vcmJlbGwuCj4gPiA+
ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBYaW5nIDxrZXJuZWx4aW5nQHRlbmNlbnQu
Y29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9taWNyb2NoaXAv
bGFuOTY2eC9sYW45NjZ4X2ZkbWEuYyB8IDIgKy0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvbWljcm9jaGlwL2xhbjk2NngvbGFuOTY2eF9mZG1hLmMgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9taWNyb2NoaXAvbGFuOTY2eC9sYW45NjZ4X2ZkbWEuYwo+ID4g
PiA+IGluZGV4IDUwMjY3MDcxODEwNC4uZTAzMGYyM2U1MTQ1IDEwMDY0NAo+ID4gPiA+IC0tLSBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L21pY3JvY2hpcC9sYW45NjZ4L2xhbjk2NnhfZmRtYS5jCj4g
PiA+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWljcm9jaGlwL2xhbjk2NngvbGFuOTY2
eF9mZG1hLmMKPiA+ID4gPiBAQCAtNzMwLDcgKzczMCw2IEBAIGludCBsYW45NjZ4X2ZkbWFfeG1p
dChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBfX2JlMzIgKmlmaCwgc3RydWN0IG5ldF9kZXZpY2UgKmRl
dikKPiA+ID4gPiAgICAgICAgICAgICAgICAgfQo+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+Cj4g
PiA+ID4gLSAgICAgICBza2JfdHhfdGltZXN0YW1wKHNrYik7Cj4gPiA+Cj4gPiA+IENoYW5naW5n
IHRoaXMgd2lsbCBicmVhayB0aGUgUEhZIHRpbWVzdGFtcGluZyBiZWNhdXNlIHRoZSBmcmFtZSBn
ZXRzCj4gPiA+IG1vZGlmaWVkIGluIHRoZSBuZXh0IGxpbmUsIG1lYW5pbmcgdGhhdCB0aGUgY2xh
c3NpZnkgZnVuY3Rpb24gd2lsbAo+ID4gPiBhbHdheXMgcmV0dXJuIFBUUF9DTEFTU19OT05FLgo+
ID4KPiA+IFNvcnJ5IHRoYXQgSSdtIG5vdCB0aGF0IGZhbWlsaWFyIHdpdGggdGhlIGRldGFpbHMu
IEkgd2lsbCByZW1vdmUgaXQKPiA+IGZyb20gdGhpcyBzZXJpZXMsIGJ1dCBzdGlsbCB0cnlpbmcg
dG8gZmlndXJlIG91dCB3aGF0IGNhc2VzIGNvdWxkIGJlLgo+ID4KPiA+IERvIHlvdSBtZWFuIGl0
IGNhbiBicmVhayB3aGVuIGJwZiBwcm9nIGlzIGxvYWRlZCBiZWNhdXNlCj4gPiAnc2tiX3B1c2go
c2tiLCBJRkhfTEVOX0JZVEVTKTsnIGV4cGFuZHMgdGhlIHNrYi0+ZGF0YSBhcmVhPwo+Cj4gV2Vs
bCwgdGhlIGJwZiBwcm9ncmFtIHdpbGwgY2hlY2sgaWYgaXQgaXMgYSBQVFAgZnJhbWUgdGhhdCBu
ZWVkcyB0byBiZQo+IHRpbWVzdGFtcCB3aGVuIGl0IHJ1bnMgcHRwX2NsYXNzaWZ5X3JhdywgYW5k
IGFzIHdlIHB1c2ggc29tZSBkYXRhIGluCj4gZnJvbnQgb2YgdGhlIGZyYW1lLCB0aGUgYnBmIHdp
bGwgcnVuIGZyb20gdGhhdCBwb2ludCBtZWFuaW5nIHRoYXQgaXQKPiB3b3VsZCBmYWlsZWQgdG8g
ZGV0ZWN0IHRoZSBQVFAgZnJhbWVzLgoKVGhhbmtzIGZvciB0aGUga2luZCByZXBseS4KCkl0IGxv
b2tzIGxpa2UgaG93IHRvIGRldGVjdCBkZXBlbmRzIG9uIGhvdyB0aGUgYnBmIHByb2cgaXMgd3Jp
dHRlbj8KTW9zdGx5IGRlcGVuZHMgb24gaG93IHRoZSB3cml0ZXIgaGFuZGxlcyB0aGlzIGRhdGEg
cGFydC4gRXZlbiB0aG91Z2gKd2UgZG9uJ3QgZ3VhcmFudGVlIG9uIGhvdyB0byBhc2sgdXNlcnMv
YWRtaW5zIHRvIHdyaXRlL2FkanVzdCB0aGVpcgpicGYgY29kZXMsIGl0J3Mgbm90IHRoYXQgY29u
dmVuaWVudCBmb3IgdGhlbSBpZiB0aGlzIHBhdGNoIGlzIGFwcGxpZWQsCnRvIGJlIGZyYW5rLiBJ
J20gbm90IHB1c2hpbmcgeW91IHRvIGFjY2VwdCB0aGlzIHBhdGNoLCBqdXN0IGN1cmlvdXMgb24K
ImhvdyBhbmQgd2h5Ii4gTm93IEkgY2FuIGd1ZXNzIHdoeSB5b3UncmUgb3Bwb3NlZCB0byBpdC4u
Li4KClRoYW5rcywKSmFzb24KCj4KPiA+IE1heSBJIGFzawo+ID4gaG93IHRoZSBtb2RpZmllZCBk
YXRhIG9mIHNrYiBicmVha3MgdGhlIFBIWSB0aW1lc3RhbXBpbmcgZmVhdHVyZT8KPgo+IElmIGl0
IGZhaWxzIHRvIGRldGVjdCB0aGF0IGl0IGlzIGEgUFRQIGZyYW1lLCB0aGVuIHRoZSBmcmFtZSB3
aWxsIG5vdCBiZQo+IHBhc3NlZCB0byB0aGUgUEhZIHVzaW5nIHRoZSBjYWxsYmFjayB0eHRzdGFt
cC4gU28gdGhlIFBIWSB3aWxsIHRpbWVzdGFtcCB0aGUKPiBmcmFtZSBidXQgaXQgZG9lc24ndCBo
YXZlIHRoZSBmcmFtZSB0byBhdHRhY2ggdGhlIHRpbWVzdGFtcC4KPgo+ID4KPiA+IFRoYW5rcywK
PiA+IEphc29uCj4gPgo+ID4gPgo+ID4gPiBOYWNrZWQtYnk6IEhvcmF0aXUgVnVsdHVyIDxob3Jh
dGl1LnZ1bHR1ckBtaWNyb2NoaXAuY29tPgo+ID4gPgo+ID4gPiA+ICAgICAgICAgc2tiX3B1c2go
c2tiLCBJRkhfTEVOX0JZVEVTKTsKPiA+ID4gPiAgICAgICAgIG1lbWNweShza2ItPmRhdGEsIGlm
aCwgSUZIX0xFTl9CWVRFUyk7Cj4gPiA+ID4gICAgICAgICBza2JfcHV0KHNrYiwgNCk7Cj4gPiA+
ID4gQEAgLTc2OCw2ICs3NjcsNyBAQCBpbnQgbGFuOTY2eF9mZG1hX3htaXQoc3RydWN0IHNrX2J1
ZmYgKnNrYiwgX19iZTMyICppZmgsIHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCj4gPiA+ID4gICAg
ICAgICAgICAgICAgIG5leHRfZGNiX2J1Zi0+cHRwID0gdHJ1ZTsKPiA+ID4gPgo+ID4gPiA+ICAg
ICAgICAgLyogU3RhcnQgdGhlIHRyYW5zbWlzc2lvbiAqLwo+ID4gPiA+ICsgICAgICAgc2tiX3R4
X3RpbWVzdGFtcChza2IpOwo+ID4gPiA+ICAgICAgICAgbGFuOTY2eF9mZG1hX3R4X3N0YXJ0KHR4
KTsKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgcmV0dXJuIE5FVERFVl9UWF9PSzsKPiA+ID4gPiAt
LQo+ID4gPiA+IDIuNDMuNQo+ID4gPiA+Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IC9Ib3JhdGl1Cj4K
PiAtLQo+IC9Ib3JhdGl1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
