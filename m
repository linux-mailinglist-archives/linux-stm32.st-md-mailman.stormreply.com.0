Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 971139486C6
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 02:57:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27208C71290;
	Tue,  6 Aug 2024 00:57:03 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC1CEC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 00:56:55 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2cb56c2c30eso4394911a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Aug 2024 17:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722905814; x=1723510614;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwZE/zSStAB+5qTNzY+sgOE4dLh2iH+ZCrAOz5MqluM=;
 b=VqwhImO08ufCnFNVvymwkuFWcorfadUmq5IBm6TrhnmanAGQlIcuONWeYHrjobkPDg
 fej+X8VC7qrXc4MrKc5dGEtT7XNmf5SX9/dAKE1YJ3l2j7j8vlFrWgl+xPKwi4yj1261
 yNvfrIBkkr5QskYSmP0YwNmu6PAiAA34xWL/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722905814; x=1723510614;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cwZE/zSStAB+5qTNzY+sgOE4dLh2iH+ZCrAOz5MqluM=;
 b=Ah1t7CAuMDPmwxWc/AMqBrL+3pghiHsO4lx3u/X4ZSPGd42fusy2S0iS9L7ngt+qlt
 N2jyJecv53oRhT7ObbytJge9A2T7b1dee1U+1ApmC+in7LwKkTP4Ye2a2khr4/csyOSu
 EgA8BwCsm+GXoKY7t6qqa2SGRGKsiDGsuRjX5SK/N1zO79st1XaJCB6U2cGkzbUfuGPy
 20cIHLgABqODNNJa3FOCN/B4kAxsmANhn3BqRQWzqJ2lCh/I5lE3k5SfO8HArBZATNpR
 XMscoIu3OQkLgROTNKrvATsg9r9zhzA6NOVHUlyKCGJan0wxFUhgz6j47oSLaX6s5rL8
 9Kcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg9pm8DJcW32qzBMUXmA1Zn0r+1aw89cUF0W3tl57hTDAIzgU/+5QyGdfPiY6TCaHLM2oK9Yt0g0mF2w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz2mUobSvkVO4wGA/xHj9TlWwc0I1cEsTzfYKhtL93CJ9I6GNK4
 9eFeXz2J5wsOsUUytlT7RxEI8pZE6YLrB6frim5iEoW+BDdq4am1mkVZ6+pz5w0DlwGH+U7mOFc
 lWRtWePGFzowmPmK2DtrKdLSsrEjH6MUX9y97
X-Google-Smtp-Source: AGHT+IGZVfnAL4deG58bXtCU7sw5xKt90hQmxfCrSSa168DCHBbwU9Bq+DV2ARTPO9PPCNOlMLXxjgCi5lM49HFN9Vc=
X-Received: by 2002:a17:90b:4a8b:b0:2c7:49b4:7e3a with SMTP id
 98e67ed59e1d1-2cff09346a1mr22627395a91.7.1722905814228; Mon, 05 Aug 2024
 17:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-4-jitendra.vegiraju@broadcom.com>
 <c2e2f11a-89d8-42fa-a655-972a4ab372da@lunn.ch>
In-Reply-To: <c2e2f11a-89d8-42fa-a655-972a4ab372da@lunn.ch>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Mon, 5 Aug 2024 17:56:43 -0700
Message-ID: <CAMdnO-JBznFpExduwCAm929N73Z_p4S4_nzRaowL9SzseqC6LA@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: hawk@kernel.org, daniel@iogearbox.net, linux@armlinux.org.uk,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Add PCI
	driver support for BCM8958x
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

T24gRnJpLCBBdWcgMiwgMjAyNCBhdCA0OjA44oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+ID4gTWFuYWdlbWVudCBvZiBpbnRlZ3JhdGVkIGV0aGVybmV0IHN3aXRj
aCBvbiB0aGlzIFNvQyBpcyBub3QgaGFuZGxlZCBieQo+ID4gdGhlIFBDSWUgaW50ZXJmYWNlLgo+
Cj4gTURJTz8gU1BJPyBJMkM/Cj4KVGhlIGRldmljZSB1c2VzIFNQSSBpbnRlcmZhY2UuIFRoZSBz
d2l0Y2ggaGFzIGludGVybmFsIEFSTSBNNyBmb3IKY29udHJvbGxlciBmaXJtd2FyZS4KCj4gPiAr
I2RlZmluZSBYR01BQ19QQ0lFX01JU0NfTUlJX0NUUkwgICAgICAgICAgICAgICAgICAgICAweDQK
PiA+ICsjZGVmaW5lIFhHTUFDX1BDSUVfTUlTQ19NSUlfQ1RSTF9WQUxVRSAgICAgICAgICAgICAg
ICAgICAgICAgMHg3Cj4KPiBDb3VsZCB5b3UgcmVwbGFjZSB0aGVzZSBtYWdpYyB2YWx1ZXMgd2l0
aCBhY3R1YWwgZGVmaW5pdGlvbnMuIFdoYXQKPiBkb2VzIDcgbWVhbj8KPgpUaGFua3MsIEkgd2ls
bCBmaXggdGhlIG1hY3Jvcy4KCj4gPiArI2RlZmluZSBYR01BQ19QQ0lFX01JU0NfUENJRVNTX0NU
UkwgICAgICAgICAgICAgICAgICAweDgKPiA+ICsjZGVmaW5lIFhHTUFDX1BDSUVfTUlTQ19QQ0lF
U1NfQ1RSTF9WQUxVRSAgICAgICAgICAgIDB4MjAwCj4KPiA+ICtzdGF0aWMgaW50IG51bV9pbnN0
YW5jZXM7Cj4KPiA+ICsgICAgIC8qIFRoaXMgZGV2aWNlIGlzIGRpcmVjdGx5IGF0dGFjaGVkIHRv
IHRoZSBzd2l0Y2ggY2hpcCBpbnRlcm5hbCB0byB0aGUKPiA+ICsgICAgICAqIFNvQyB1c2luZyBY
R01JSSBpbnRlcmZhY2UuIFNpbmNlIG5vIE1ESU8gaXMgcHJlc2VudCwgcmVnaXN0ZXIKPiA+ICsg
ICAgICAqIGZpeGVkLWxpbmsgc29mdHdhcmVfbm9kZSB0byBjcmVhdGUgcGh5bGluay4KPiA+ICsg
ICAgICAqLwo+ID4gKyAgICAgaWYgKG51bV9pbnN0YW5jZXMgPT0gMCkgewo+ID4gKyAgICAgICAg
ICAgICByZXQgPSBzb2Z0d2FyZV9ub2RlX3JlZ2lzdGVyX25vZGVfZ3JvdXAoZml4ZWRfbGlua19u
b2RlX2dyb3VwKTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICIlczogZmFpbGVkIHRvIHJlZ2lzdGVyIHNvZnR3YXJlIG5vZGVcbiIsCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXyk7Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKyAgICAgfQo+ID4gKyAg
ICAgbnVtX2luc3RhbmNlcysrOwo+Cj4gU28gYWxsIHRoZSBpbnN0YW5jZXMgb2YgdGhlIE1BQyBz
aGFyZSBvbmUgZml4ZWQgbGluaz8gVGhhdCBpcyBwcmV0dHkKPiB1bnVzdWFsLiBJbiBEVCwgZWFj
aCB3b3VsZCBoYXZlIGl0cyBvd24uIEhhdmUgeW91IHJldmlld2VkIHRoZQo+IGltcGxpY2F0aW9u
cyBvZiB0aGlzPwo+Ck91ciB0aGlua2luZyB3YXMgdGhhdCBzaW5jZSB0aGUgc29mdHdhcmUgbm9k
ZSBpcyBvbmx5IHVzZWQgZm9yIHN0YXRpYwpub2RlIGRhdGEgdG8gcG9wdWxhdGUgcGh5bGluayBj
b25maWcsIGEgcGVyIGRldmljZSBub2RlIGlzIG5vdApyZXF1aXJlZC4KV2UgdGVzdGVkIHdpdGgg
bXVsdGlwbGUgZGV2aWNlcyBhbmQgcmVwZWF0ZWQgUENJIHJlbW92ZS9yZXNjYW4gb3BlcmF0aW9u
cy4KSG93ZXZlciwgSXQgZG9lcyBtYWtlIHNlbnNlIHRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUg
RFQgdXNhZ2UgbW9kZWwuCldlIHdpbGwgYWRkIHRoZSBwZXIgZGV2aWNlIG5vZGUgZW50cnkgaW4g
dGhlIG5leHQgcGF0Y2ggdXBkYXRlLgo+ICAgICAgICAgQW5kcmV3Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
