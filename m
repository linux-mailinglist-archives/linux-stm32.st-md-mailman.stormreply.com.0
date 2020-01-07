Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BDD13246B
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 12:04:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABF5BC36B0B;
	Tue,  7 Jan 2020 11:04:05 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 813C5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 11:04:03 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id t17so50029521eds.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2020 03:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ptBtaLfSefXKIlF4+ATcVDfD9CqQtKSIYDSRdZx4Dts=;
 b=XUEDaHr9XTGlG8A0UiunXQ8DwXSj2xxzlriIJ2IvI8lFlzULlU1PlLurR0NodAtDLC
 Wq4dUFmbAu6+ggNi8KsZsQJ3GQLWLZ1lsWyMMOui9ERcl9Q2WPWHLzNE0lGCg7kDqzII
 h0NFJeIllpDwsK6uPp/JQSwcyCA1CmgeM6DNRZaT+dk68GyqTkd/gprM0riV51I26vAT
 9Sbzy3RMov6hC5AhZRgoKJBaIBg5JBAKN5pJw0eFxCKo70VrdJImkcU0Iljt825ceeYE
 NlPcACjA4cP+MfDy66FzmAy1oKTozfKArMVmhWZiWrjE43FneptuUze/Om9uHd4CY4kL
 GdKg==
X-Gm-Message-State: APjAAAWIwhMqd+yWM+GlsW5KuAAYhtC7bB/CkX7af7L+VFwJDufe3mFN
 58LLmds59hEB9FktkmXTfwc=
X-Google-Smtp-Source: APXvYqzKoAnAzDFoVmt8WsrTLEo61oVGbLtxhYn9w1G9R8M+n/U0qKkIJnksdqHSF0YmF+wOzkLZyQ==
X-Received: by 2002:a17:906:c4d:: with SMTP id
 t13mr112159727ejf.198.1578395042449; 
 Tue, 07 Jan 2020 03:04:02 -0800 (PST)
Received: from pi3 ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id x8sm7492342eds.88.2020.01.07.03.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 03:04:01 -0800 (PST)
Date: Tue, 7 Jan 2020 12:03:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20200107110359.GA32423@pi3>
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
 <20200107072645.ko247bwhh3ibdu73@pengutronix.de>
 <20200107082539.GA31827@pi3>
 <20200107104234.wq74fska3szrg4ii@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107104234.wq74fska3szrg4ii@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] pwm: Enable compile testing for some
	of drivers
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

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMTE6NDI6MzRBTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gPiBJIGd1ZXNzIG90aGVyIHNvbHV0aW9uIHdvdWxkIGJlIHRvIGFkZCBzdHVi
cyBmb3IgZmV3IGNsayBmdW5jdGlvbnMuLi4KPiA+IAo+ID4gPiBBbHNvIEhBU19JT01FTSBpcyBh
IHR5cGljYWwgcmVxdWlyZW1lbnQsIGJ1dCBJIHRlc3RlZCB3aXRoIGFuIEFSQ0g9dW0KPiA+ID4g
Y29uZmlnICh3aGljaCBkb2VzJ3QgaGF2ZSBIQVNfSU9NRU0pIGFuZCB0aGV5IGFsbCBjb21waWxl
IGZpbmUuCj4gPiAKPiA+IEJlY2F1c2Ugb2YgIUhBU19JT01FTSwgc2luY2Ugc29tZSB0aW1lIEFS
Q0g9dW0gZG9lcyBub3Qgc3VwcG9ydAo+ID4gQ09NUElMRV9URVNULiBUaGVyZWZvcmUgSEFTX0lP
TUVNIGRlcGVuZGVuY3kgaXMgbm90IG5lZWRlZCBmb3IgY29tcGlsZQo+ID4gdGVzdGluZyAoYW5k
IGZvciByZWd1bGFyIGJ1aWxkIGl0IGlzIHNlbGVjdGVkIGJ5IEFSQ0gpLgo+IAo+IEhlaGUsIEkg
ZGlkbid0IG5vdGljZSBiZWNhdXNlIGZvciB0ZXN0aW5nIEkganVzdCBkcm9wcGVkIHRoZSAiZGVw
ZW5kcyBvbgo+IC4uLiIgbGluZXMgaW4gS2NvbmZpZyBpbnN0ZWFkIG9mIGFkZGluZyAifHwgQ09N
UElMRV9URVNUIiA6LSkgU3RpbGwgdGhleQo+IGNvbXBpbGUgZmluZSBvbiBVTUwuCj4gCj4gQWgs
IHNpbmNlIGJjMDgzYTY0YjZjMCAoImluaXQvS2NvbmZpZzogbWFrZSBDT01QSUxFX1RFU1QgZGVw
ZW5kIG9uCj4gIVVNTCIpID09IHY0LjgtcmMxfjUyXjJ+ODMgQ09NUElMRV9URVNUIGNhbm5vdCBi
ZSBlbmFibGVkIG9uIFVNTCwgYnV0Cj4gbGF0ZXIgMWJjYmZiZmRlYjAwICgidW06IGFkZCBkdW1t
eSBpb3JlbWFwIGFuZCBpb3VubWFwIGZ1bmN0aW9ucyIpCj4gPT0gdjQuMTMtcmMxfjheMn42IFVN
IGdvdCBhIGR1bW15IGltcGxlbWVudGF0aW9uLiBTbyBtYXliZSB3ZSBjb3VsZAo+IHJldmVydCBi
YzA4M2E2NGI2YzAgdG9kYXk/IChBbmQgaWYgbm90LCBhIGNvbW1lbnQgYWJvdXQgd2h5IG5lYXIg
dGhlCj4gImRlcGVuZHMgb24gIVVNTCIgaW4gaW5pdC9LY29uZmlnIHdvdWxkIGJlIGdyZWF0LikK
PiAKPiBPcnRob2dvbmFsIHRvIHRoYXQsIEkgd29uZGVyIGlmIGRlcGVuZGluZyBvbiBIQVNfSU9N
RU0gaXMgcmlnaHQgZXZlbgo+IHRob3VnaCB0aGUgY29tcGlsZSB0ZXN0ZXJzIHdvbid0IG5vdGlj
ZSBpdCBtaXNzaW5nLiBPciBzaG91bGQgSEFTX0lPTUVNCj4gYmUgZHJvcHBlZD8KCkkgdGhpbmsg
eWVzLCBpdCBjYW4gYmUgZHJvcHBlZCwgYnV0IHRoaXMgd291bGQgcmVxdWlyZToKMS4gRml4aW5n
IGFueSBkZXBlbmRlbmNpZXMgb24gSEFTX0lPTUVNLCBlLmcuOgogICAgV0FSTklORzogdW5tZXQg
ZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgTUZEX1NZU0NPTgogICAgICBEZXBlbmRz
IG9uIFtuXTogSEFTX0lPTUVNIFs9bl0KICAgICAgU2VsZWN0ZWQgYnkgW3ldOgogICAgICAtIFBI
WV9EQThYWF9VU0IgWz15XSAmJiAoQVJDSF9EQVZJTkNJX0RBOFhYIHx8IENPTVBJTEVfVEVTVCBb
PXldKQoKMi4gQ2hlY2tpbmcgaWYgYWxsIG9mIHN0dWJzIGFyZSBpbXBsZW1lbnRlZCAobm90IG9u
bHkgSU9NRU0gYnV0IG1heWJlCiAgIERNQSBhcyB3ZWxsKS4gQWxzbyAxYmNiZmJmZGViMDAgYnJv
dWdodCBvbmx5IGZldyBzdHVicy4gU3RpbGwgd2UKICAgbmVlZCBkZXZtX2lvcmVtYXBfcmVzb3Vy
Y2UoKSBhbmQgb3RoZXJzLgoKUXVpY2sgdGVzdCBzaG93cyBtZW50aW9uZWQgInVubWV0IGRpcmVj
dCBkZXBlbmRlbmNpZXMiIGFuZDoKICAgIHBoeS1weGEtdXNiLmM6KC50ZXh0KzB4MmY1KTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgZGV2bV9pb3JlbWFwX3Jlc291cmNlJwogICAgZG1hLWlvbW11
LmM6KC50ZXh0KzB4MTc5KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZG1hX3BncHJvdCcKCj4g
Cj4gPiA+ID4gQEAgLTMxOCw3ICszMTksNyBAQCBjb25maWcgUFdNX01FRElBVEVLCj4gPiA+ID4g
IAo+ID4gPiA+ICBjb25maWcgUFdNX01YUwo+ID4gPiA+ICAJdHJpc3RhdGUgIkZyZWVzY2FsZSBN
WFMgUFdNIHN1cHBvcnQiCj4gPiA+ID4gLQlkZXBlbmRzIG9uIEFSQ0hfTVhTICYmIE9GCj4gPiA+
ID4gKwlkZXBlbmRzIG9uIChBUkNIX01YUyAmJiBPRikgfHwgQ09NUElMRV9URVNUCj4gPiA+ID4g
IAlzZWxlY3QgU1RNUF9ERVZJQ0UKPiA+ID4gPiAgCWhlbHAKPiA+ID4gPiAgCSAgR2VuZXJpYyBQ
V00gZnJhbWV3b3JrIGRyaXZlciBmb3IgRnJlZXNjYWxlIE1YUy4KPiA+ID4gPiBAQCAtMzI4LDcg
KzMyOSw4IEBAIGNvbmZpZyBQV01fTVhTCj4gPiA+ID4gIAo+ID4gPiA+ICBjb25maWcgUFdNX09N
QVBfRE1USU1FUgo+ID4gPiA+ICAJdHJpc3RhdGUgIk9NQVAgRHVhbC1Nb2RlIFRpbWVyIFBXTSBz
dXBwb3J0Igo+ID4gPiA+IC0JZGVwZW5kcyBvbiBPRiAmJiBBUkNIX09NQVAgJiYgT01BUF9ETV9U
SU1FUgo+ID4gPiA+ICsJZGVwZW5kcyBvbiAoQVJDSF9PTUFQICYmIE9NQVBfRE1fVElNRVIpIHx8
IENPTVBJTEVfVEVTVAo+ID4gPiA+ICsJZGVwZW5kcyBvbiBPRgo+ID4gPiAKPiA+ID4gSSdtIHN1
cnByaXNlZCB0aGF0IE9GIGlzbid0IHJlcXVpcmVkIGZvciBQV01fTVhTIGJ1dCBpcyBpcyBmb3IK
PiA+ID4gUFdNX09NQVBfRE1USU1FUi4gcHdtLW14cyBjb21waWxlcyB3aXRob3V0IENPTkZJR19P
RiwgZGlkbid0IHRlc3QKPiA+ID4gcHdtLW9tYXAtZG10aW1lci4KPiA+IAo+ID4gU2luY2Ugc29t
ZSB0aW1lICFPRiBoYXMgYWxsIG5lY2Vzc2FyeSBzdHVicyBzbyBPRiBpcyBhY3R1YWxseSBuZWVk
ZWQKPiA+IG9ubHkgZm9yIGJpbmRpbmcsIG5vdCBjb21waWxpbmcuCj4gCj4gVGhhdCBkb2Vzbid0
IGV4cGxhaW4gd2h5IHlvdSBoYW5kbGUgUFdNX01YUyBhbmQgUFdNX09NQVBfRE1USU1FUgo+IGRp
ZmZlcmVudGx5IHRob3VnaC4KCllvdSdyZSByaWdodCwgSSBtaXNzZWQgdGhpcy4gTm9uZSBvZiB0
aGVtIHJlcXVpcmUgT0YgZm9yIGJ1aWxkaW5nIHNvCnNlcGFyYXRlICJkZXBlbmRzIG9uIE9GIiBt
YWtlcyBzZW5zZSBvbmx5IGZvciByZWFkYWJpbGl0eSBvZiB0aGlzLiAgTGV0Cm1lIHNlbmQgdjIg
dG8gbWFrZSBpdCBzaW1pbGFyIHRvIFBXTV9NWFMuCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
