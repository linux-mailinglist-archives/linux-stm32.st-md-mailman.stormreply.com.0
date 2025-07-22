Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C4EB0E6E1
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 01:05:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93F7AC36B0C;
	Tue, 22 Jul 2025 23:05:06 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DB32C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 23:05:05 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3e2c44be5abso8875745ab.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 16:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753225504; x=1753830304;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7EJqvbx78jyg/AF+HgULO5h7plKJg0CprdQbemfJYI=;
 b=LZ6Gnqa+t3DrOznbOxycDIhzJudYCFDzf2CnsQjQYPULwVGBkrhqHYtVYlgVAqxHoy
 52wpWyr5abQ9ks2BXLCuBALVbKC1K5GDUI5tc3frpxtXX8ymFgqaaGmX6O5gYQ9pGho8
 0YLY5w2IWxLD2TBqsb5mF/JGZhQDG50ZS0EV28/R1zGXxmOVYDyTTTkQxwGF1rFtwQz4
 UbsBwZu9HP/RkNVROWLCxrg+6N+u2HbXJ1SfhuZAFx9csbXNATPQfvJgfjAHTN22bLm7
 1CtcosuPJ6ECwd0qaVPF4tQHHwU5JJsuNkEIZplF8n2nWgezdLawpc9ZiZT52J6ZPZTv
 nPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753225504; x=1753830304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o7EJqvbx78jyg/AF+HgULO5h7plKJg0CprdQbemfJYI=;
 b=ZvIbbml45u0JFiuXFPxDql5f9L/SJpCF6UTr/5UF3cXYqeX6exkawJWqQnTvnpNjc8
 HD4+sCHYD/KdnaqR3Aqmq/9lU0xOwQJadQIkUMEXW4h3M+Q7OccL5uaYWnDT5aMyiF8h
 ufpknjCs9bUacMM8QdH9gcQ+AB5qUtsRBuPE0icM5zXoDbORRXRCaWa58pA0SwETcFxa
 j9wDqSfRYYl+7tNLTgze5eLb+rWpsbb1A5w8OFwFg1h8ATk2nmTLxwsG0Cs3zm3CXmkN
 wO0sLKiUzQdioJxE7WZL0MOUa86fheHt3guvKbH6BBH2mkjwQBBbaMnnkH2e9G7yQp/q
 yPlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF9KFnbcWGHulejgg2gDSoLTHAyv7zDmqeBY967TQYBZPKiey2vxEFoPsO21zURTUaJsHZyvgub7hqSw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyIIBU5ZYePO6EB8s3TF2UAyvkS93VtVjpcZ56xnzWETGZD6/cY
 /DrdGn4SV293OaWcoHJHYGx0BNYtbmvL9uUFdDexflIoKZk5HA3lGd1E2hdQQoy5A5/0QoMTym9
 YVDeB98jTNEB97OhNifdgFlg28ILyV4IKfN6C+O8=
X-Gm-Gg: ASbGnctzT5ah34xSHNOG5tk9M3Xvtp5B6z4CuCSXp1WyX6bPYDhi/6n8Qv6T27MpMEq
 sWcq6CkVKapeK2wnsH95ibhCHZkUyaz86zt9eALury4GJRBLIiELKpFP2PUyey8mErZsx34A1Mb
 YGMoHAIQgk4pZOASGOZyus3a610BHiKjkBHvas6gBOI4yOTOIgPZ5e5w1Yr3Qs5saGMfyP2PuAi
 /e1JYk=
X-Google-Smtp-Source: AGHT+IGM9UuN6Ixs1sIL8NACSug2SQUUVxyblxGzqYvFhlPX7uYT59jMr39yoO6RCwIf1f0wFOILXKZ+Lj8MuW7dEg8=
X-Received: by 2002:a05:6e02:3c8a:b0:3df:49fa:7af5 with SMTP id
 e9e14a558f8ab-3e3354b36d0mr17914325ab.21.1753225503835; Tue, 22 Jul 2025
 16:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
 <20250721083343.16482-2-kerneljasonxing@gmail.com>
 <8c9e97e4-3590-49a8-940b-717deac0078d@molgen.mpg.de>
 <CAL+tcoAP7Zk7A4pzK-za+_NMoX11SGR3ubtY6R+aaywoEq_H+g@mail.gmail.com>
 <687f9d4cf0b14_2aa7cc29443@willemb.c.googlers.com.notmuch>
 <CAL+tcoC5KnTuWKxKcUqFGh-nBSF+X+RWzr=RkkK86+jY1Q20Kw@mail.gmail.com>
 <687fca7852e84_2cbf622949d@willemb.c.googlers.com.notmuch>
In-Reply-To: <687fca7852e84_2cbf622949d@willemb.c.googlers.com.notmuch>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Wed, 23 Jul 2025 07:04:27 +0800
X-Gm-Features: Ac12FXxlIdpCobXEpYuKgIInC5aDftS0FkSg-5UHsYyoMLW8D0PgDpjZEO7FH-U
Message-ID: <CAL+tcoA7W=3m2+=EGicrAkiwc2HUGTn3js=0r_gm9=z0BKR3ag@mail.gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 Jason Xing <kernelxing@tencent.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
 maciej.fijalkowski@intel.com, hawk@kernel.org, ast@kernel.org,
 magnus.karlsson@intel.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 bjorn@kernel.org, mcoquelin.stm32@gmail.com, jonathan.lemon@gmail.com,
 bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [Intel-wired-lan] [PATCH net-next 1/2] stmmac:
 xsk: fix underflow of budget in zerocopy mode
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

T24gV2VkLCBKdWwgMjMsIDIwMjUgYXQgMToyOeKAr0FNIFdpbGxlbSBkZSBCcnVpam4KPHdpbGxl
bWRlYnJ1aWpuLmtlcm5lbEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSmFzb24gWGluZyB3cm90ZToK
PiA+IE9uIFR1ZSwgSnVsIDIyLCAyMDI1IGF0IDEwOjE24oCvUE0gV2lsbGVtIGRlIEJydWlqbgo+
ID4gPHdpbGxlbWRlYnJ1aWpuLmtlcm5lbEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBK
YXNvbiBYaW5nIHdyb3RlOgo+ID4gPiA+IEhpIFBhdWwsCj4gPiA+ID4KPiA+ID4gPiBPbiBNb24s
IEp1bCAyMSwgMjAyNSBhdCA0OjU24oCvUE0gUGF1bCBNZW56ZWwgPHBtZW56ZWxAbW9sZ2VuLm1w
Zy5kZT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gRGVhciBKYXNvbiwKPiA+ID4gPiA+Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLgo+ID4gPiA+Cj4gPiA+
ID4gVGhhbmtzIGZvciB5b3VyIHF1aWNrIHJlc3BvbnNlIGFuZCByZXZpZXcgOikKPiA+ID4gPgo+
ID4gPiA+ID4KPiA+ID4gPiA+IEFtIDIxLjA3LjI1IHVtIDEwOjMzIHNjaHJpZWIgSmFzb24gWGlu
ZzoKPiA+ID4gPiA+ID4gRnJvbTogSmFzb24gWGluZyA8a2VybmVseGluZ0B0ZW5jZW50LmNvbT4K
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhlIGlzc3VlIGNhbiBoYXBwZW4gd2hlbiB0aGUgYnVk
Z2V0IG51bWJlciBvZiBkZXNjcyBhcmUgY29uc3VtZWQuIEFzCj4gPiA+ID4gPgo+ID4gPiA+ID4g
SW5zdGVhZCBvZiDigJxUaGUgaXNzdWXigJ0sIEnigJlkIHVzZSDigJxBbiB1bmRlcmZsb3cg4oCm
4oCdLgo+ID4gPiA+Cj4gPiA+ID4gV2lsbCBjaGFuZ2UgaXQuCj4gPiA+ID4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IGxvbmcgYXMgdGhlIGJ1ZGdldCBpcyBkZWNyZWFzZWQgdG8gemVybywgaXQgd2ls
bCBhZ2FpbiBnbyBpbnRvCj4gPiA+ID4gPiA+IHdoaWxlIChidWRnZXQtLSA+IDApIHN0YXRlbWVu
dCBhbmQgZ2V0IGRlY3JlYXNlZCBieSBvbmUsIHNvIHRoZQo+ID4gPiA+ID4gPiB1bmRlcmZsb3cg
aXNzdWUgY2FuIGhhcHBlbi4gSXQgd2lsbCBsZWFkIHRvIHJldHVybmluZyB0cnVlIHdoZXJlYXMg
dGhlCj4gPiA+ID4gPiA+IGV4cGVjdGVkIHZhbHVlIHNob3VsZCBiZSBmYWxzZS4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBXaGF0IGlzIOKAnGl04oCdPwo+ID4gPiA+Cj4gPiA+ID4gSXQgbWVhbnMgJ3Vu
ZGVyZmxvdyBvZiBidWRnZXQnIGJlaGF2aW9yLgo+ID4gPgo+ID4gPiBBIHRlY2huaWNhbGl0eSwg
YnV0IHRoaXMgaXMgKG5lZ2F0aXZlKSBvdmVyZmxvdy4KPiA+ID4KPiA+ID4gVW5kZXJmbG93IGlz
IGEgY29tcHV0YXRpb24gdGhhdCByZXN1bHRzIGluIGEgdmFsdWUgdGhhdCBpcyB0b28gc21hbGwK
PiA+ID4gdG8gYmUgcmVwcmVzZW50ZWQgYnkgdGhlIGdpdmVuIHR5cGUuCj4gPgo+ID4gSW50ZXJl
c3RpbmcuIFRoYW5rcyBmb3Igc2hhcmluZyB0aGlzIHdpdGggbWU6KQo+ID4KPiA+IEkganVzdCBj
aGVja2VkIHRoZSB3aWtpcGVkaWFbMV0gdGhhdCBzYXlzICIgVW5kZXJmbG93IGNhbiBpbiBwYXJ0
IGJlCj4gPiByZWdhcmRlZCBhcyBuZWdhdGl2ZSBvdmVyZmxvdyBvZiB0aGUgZXhwb25lbnQgb2Yg
dGhlIGZsb2F0aW5nLXBvaW50Cj4gPiB2YWx1ZS4iLiBJIGFzc3VtZSB0aGlzIHJ1bGUgY2FuIGFs
c28gYmUgYXBwbGllZCBpbiB0aGlzIGNhc2U/IEknbQo+ID4gaGVzaXRhbnQgdG8gc2VuZCB0aGUg
djMgcGF0Y2ggdG9tb3Jyb3cgd2l0aCB0aGlzICduZWdhdGl2ZSBvdmVyZmxvdycKPiA+IHRlcm0g
aW5jbHVkZWQuCj4KPiBNeSBwb2ludCBpcyB2ZXJ5IHBlZGFudGljLiBJIHRoaW5rIHRoZXNlIGNh
c2VzIGFyZSBub3QgdW5kZXJmbG93Lgo+Cj4gQnV0IGl0IGlzIG9mdGVuIGNhbGxlZCB0aGF0LCB1
bmRlcnN0YW5kYWJseS4gU28gY2hvb3NlIGFzIHlvdSBzZWUgZml0LgoKSSBzZWUuIFRoYW5rcyBm
b3IgcG9pbnRpbmcgdGhhdCBvdXQuIEkgd2lsbCBjaGFuZ2UgaXQgOikKClRoYW5rcywKSmFzb24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
