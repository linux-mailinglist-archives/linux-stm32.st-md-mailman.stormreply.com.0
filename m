Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B64D79590EA
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 01:11:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56E54C6DD9A;
	Tue, 20 Aug 2024 23:11:01 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2418C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 23:10:53 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-7a264a24ea7so4454462a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 16:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724195452; x=1724800252;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5f2w4LZM4TRAbHrkXGO8wWfBGvh6M9E2Z4iDQZHMiQ=;
 b=eAZb3S/JBtRIpe51arCQZSQWMI5XiCE3cwdoeoJV9g9WF3qCQwUiD3RSG4I4Ig4FW5
 4zH/8Xppm6XKpFJxPVrskLj4CpcPLkQ+KogBwljHgjlzarOpiUoOdGH+Qy0GuDz42KoH
 8UMJPjSnwhBo463HvmyBJBK/WB3c5CANU0Sec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724195452; x=1724800252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z5f2w4LZM4TRAbHrkXGO8wWfBGvh6M9E2Z4iDQZHMiQ=;
 b=Fs7okcQCCY0KsKqGOS1WOq7LOHz1TPQHJIawwGqZbhJF+vNRKksP44jucedwZb/Xd9
 EyUsmHDHdcCi0HcyYpEygspy+UuA2XvB1pkAIm5BSQ7JeFzpgyfUg0CA/JUnEeKIotgo
 fAHqC7OduQnsr4XJ3uK5S+X8ZJNvRO4JKVsvBlMdAI4Od369rTpIuDPYoDt/U96VI+9U
 HmeVGsK70uBT1Qn96x0idQXjw0J1odN6ndRsCcVu3OzV6FQ3AFblmRP8PiKEju+m8wsj
 ex1vqQgTM8wRzm51qwnc4vwxmUHtO0s1E+zdvOh/fIiz8hoPVDkeicmgYEVLUEhj63Cz
 1CeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3YMyF6LU6MaSVRA9mMMTP0l0207vgJfsngK1I8ik6CY+OJu1a5OjAojrxAEJpaY7V2zobO1xfDYA3iw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzOj9CgVDmOWY97Gii0P4ZgY1UMEcVfGPXobBVcAcRsb5Ga1PPx
 fTt4etUADZafig6RdL5kg0khTeJXMTTqqt+mB+Gd9AYseVlUuV7pTb5Gjsa80eEcdcEgEI6kEAC
 eKGqG996wm6McJMgdeR/L+bQmmL+0kZBW5z5i
X-Google-Smtp-Source: AGHT+IFGNMXXmYcdXaQzr5Tz8USVmNU5xbNdMKeKaadN4lTbxlZnVc1egcdct5/lyGa8CAVi5X81ldwsfwop3kkiM1o=
X-Received: by 2002:a17:90b:23d3:b0:2c9:321:1bf1 with SMTP id
 98e67ed59e1d1-2d5e9ed08f1mr498981a91.39.1724195452084; Tue, 20 Aug 2024
 16:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
 <20240814221818.2612484-2-jitendra.vegiraju@broadcom.com>
 <2ad03012-8a10-49fc-9e80-3b91762b9cc3@quicinc.com>
In-Reply-To: <2ad03012-8a10-49fc-9e80-3b91762b9cc3@quicinc.com>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Tue, 20 Aug 2024 16:10:40 -0700
Message-ID: <CAMdnO-LH0xNeMO_Y+WhSmbyNrK33zb=AtVd9ZRTObQ-n8BWR6w@mail.gmail.com>
To: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, leong.ching.swee@intel.com,
 edumazet@google.com, Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, fancer.lancer@gmail.com,
 horms@kernel.org, mcoquelin.stm32@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next v4 1/5] net: stmmac: Add HDMA mapping
	for dw25gmac support
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

T24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgNDozMOKAr1BNIEFiaGlzaGVrIENoYXVoYW4gKEFCQykK
PHF1aWNfYWJjaGF1aGFAcXVpY2luYy5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDgvMTQvMjAyNCAz
OjE4IFBNLCBqaXRlbmRyYS52ZWdpcmFqdUBicm9hZGNvbS5jb20gd3JvdGU6Cj4gPiBGcm9tOiBK
aXRlbmRyYSBWZWdpcmFqdSA8aml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tPgo+ID4KPiA+
IEFkZCBoZG1hIGNvbmZpZ3VyYXRpb24gc3VwcG9ydCBpbiBpbmNsdWRlL2xpbnV4L3N0bW1hYy5o
IGZpbGUuCj4gPiBUaGUgaGRtYSBjb25maWd1cmF0aW9uIGluY2x1ZGVzIG1hcHBpbmcgb2Ygdmly
dHVhbCBETUFzIHRvIHBoeXNpY2FsIERNQXMuCj4gPiBEZWZpbmUgYSBuZXcgZGF0YSBzdHJ1Y3R1
cmUgc3RtbWFjX2hkbWFfY2ZnIHRvIHByb3ZpZGUgdGhlIG1hcHBpbmcuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogSml0ZW5kcmEgVmVnaXJhanUgPGppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNv
bT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvbGludXgvc3RtbWFjLmggfCA1MCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5z
ZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3N0bW1hYy5oIGIv
aW5jbHVkZS9saW51eC9zdG1tYWMuaAo+ID4gaW5kZXggMzM4OTkxYzA4ZjAwLi4xNzc1YmQyYjdj
MTQgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3N0bW1hYy5oCj4gPiArKysgYi9pbmNs
dWRlL2xpbnV4L3N0bW1hYy5oCj4gPiBAQCAtODksNiArODksNTUgQEAgc3RydWN0IHN0bW1hY19t
ZGlvX2J1c19kYXRhIHsKPiA+ICAgICAgIGJvb2wgbmVlZHNfcmVzZXQ7Cj4gPiAgfTsKPiA+Cj4g
PiArLyogRFcyNUdNQUMgSHlwZXItRE1BIE92ZXJ2aWV3Cj4gPiArICogSHlwZXItRE1BIGFsbG93
cyBzdXBwb3J0IGZvciBsYXJnZSBudW1iZXIgb2YgVmlydHVhbCBETUEoVkRNQSkKPiA+ICsgKiBj
aGFubmVscyB1c2luZyBhIHNtYWxsZXIgc2V0IG9mIHBoeXNpY2FsIERNQSBjaGFubmVscyhQRE1B
KS4KPiA+ICsgKiBUaGlzIGlzIHN1cHBvcnRlZCBieSB0aGUgIG1hcHBpbmcgb2YgVkRNQXMgdG8g
VHJhZmZpYyBDbGFzcyAoVEMpCj4gPiArICogYW5kIFBETUEgdG8gVEMgaW4gZWFjaCB0cmFmZmlj
IGRpcmVjdGlvbiBhcyBzaG93biBiZWxvdy4KPiA+ICsgKgo+ID4gKyAqICAgICAgICBWRE1BcyAg
ICAgICAgICAgIFRyYWZmaWMgQ2xhc3MgICAgICBQRE1BCj4gPiArICogICAgICAgKy0tLS0tLS0t
KyAgICAgICAgICArLS0tLS0tKyAgICAgICAgICstLS0tLS0tLS0tLSsKPiA+ICsgKiAgICAgICB8
VkRNQTAgICB8LS0tLS0tLS0tPnwgVEMwICB8LS0tLS0tLS0+fFBETUEwL1RYUTAgfAo+ID4gKyAq
VFggICAgICstLS0tLS0tLSsgICB8LS0tLS0+Ky0tLS0tLSsgICAgICAgICArLS0tLS0tLS0tLS0r
Cj4gPiArICpIb3N0PT4gKy0tLS0tLS0tKyAgIHwgICAgICArLS0tLS0tKyAgICAgICAgICstLS0t
LS0tLS0tLSsgPT4gTUFDCj4gPiArICpTVyAgICAgfFZETUExICAgfC0tLSsgICAgICB8IFRDMSAg
fCAgICArLS0tPnxQRE1BMS9UWFExIHwKPiA+ICsgKiAgICAgICArLS0tLS0tLS0rICAgICAgICAg
ICstLS0tLS0rICAgIHwgICAgKy0tLS0tLS0tLS0tKwo+ID4gKyAqICAgICAgICstLS0tLS0tLSsg
ICAgICAgICAgKy0tLS0tLSstLS0tKyAgICArLS0tLS0tLS0tLS0rCj4gPiArICogICAgICAgfFZE
TUEyICAgfC0tLS0tLS0tLT58IFRDMiAgfC0tLS0tLS0tPnxQRE1BMi9UWFExIHwKPiA+ICsgKiAg
ICAgICArLS0tLS0tLS0rICAgICAgICAgICstLS0tLS0rICAgICAgICAgKy0tLS0tLS0tLS0tKwo+
ID4gKyAqICAgICAgICAgICAgLiAgICAgICAgICAgICAgICAgLiAgICAgICAgICAgICAgICAgLgo+
ID4gKyAqICAgICAgICstLS0tLS0tLSsgICAgICAgICAgKy0tLS0tLSsgICAgICAgICArLS0tLS0t
LS0tLS0rCj4gPiArICogICAgICAgfFZETUFuLTEgfC0tLS0tLS0tLT58IFRDeC0xfC0tLS0tLS0t
PnxQRE1BbS9UWFFtIHwKPiA+ICsgKiAgICAgICArLS0tLS0tLS0rICAgICAgICAgICstLS0tLS0r
ICAgICAgICAgKy0tLS0tLS0tLS0tKwo+ID4gKyAqCj4gPiArICogICAgICAgKy0tLS0tLSsgICAg
ICAgICAgKy0tLS0tLSsgICAgICAgICArLS0tLS0tKwo+ID4gKyAqICAgICAgIHxQRE1BMCB8LS0t
LS0tLS0tPnwgVEMwICB8LS0tLS0tLS0+fFZETUEwIHwKPiA+ICsgKiAgICAgICArLS0tLS0tKyAg
IHwtLS0tLT4rLS0tLS0tKyAgICAgICAgICstLS0tLS0rCj4gPiArICpNQUMgPT4gKy0tLS0tLSsg
ICB8ICAgICAgKy0tLS0tLSsgICAgICAgICArLS0tLS0tKwo+ID4gKyAqUlhRcyAgIHxQRE1BMSB8
LS0tKyAgICAgIHwgVEMxICB8ICAgICstLS0+fFZETUExIHwgID0+IEhvc3QKPiA+ICsgKiAgICAg
ICArLS0tLS0tKyAgICAgICAgICArLS0tLS0tKyAgICB8ICAgICstLS0tLS0rCj4gPiArICogICAg
ICAgICAgICAuICAgICAgICAgICAgICAgICAuICAgICAgICAgICAgICAgICAuCj4gPiArICovCj4g
PiArCj4gPiArI2RlZmluZSBTVE1NQUNfRFcyNUdNQUNfTUFYX05VTV9UWF9WRE1BICAgICAgICAg
ICAgICAxMjgKPiA+ICsjZGVmaW5lIFNUTU1BQ19EVzI1R01BQ19NQVhfTlVNX1JYX1ZETUEgICAg
ICAgICAgICAgIDEyOAo+ID4gKwo+ID4gKyNkZWZpbmUgU1RNTUFDX0RXMjVHTUFDX01BWF9OVU1f
VFhfUERNQSAgICAgICAgICAgICAgOAo+ID4gKyNkZWZpbmUgU1RNTUFDX0RXMjVHTUFDX01BWF9O
VU1fUlhfUERNQSAgICAgICAgICAgICAgMTAKPiA+ICsKPiBJIGhhdmUgYSBxdWVyeSBoZXJlLgo+
Cj4gV2h5IGRvIHdlIG5lZWQgdG8gaGFyZGNvZGUgdGhlIG51bWJlciBvZiBUWCBQRE1BIGFuZCBS
WCBQRE1BIHRvIDggYW4gMTAuIE9uIHNvbWUgcGxhdGZvcm1zIHRoZSBudW1iZXIgb2Ygc3VwcG9y
dGVkIFRYUERNQSBhbmQgUlhQRE1BIGFyZSAxMSBhbmQgMTEgcmVzcGVjdGl2ZWx5ID8KPgo+IGhv
dyBkbyB3ZSBvdmVyY29tZSB0aGlzIHByb2JsZW0sIGRvIHdlIGluY3JlYXNlIHRoZSB2YWx1ZSBp
biBzdWNoIGNhc2U/Cj4KSGkgQWJoaXNoZWssCkFncmVlZCwgd2UgY2FuIG1ha2UgdGhlIG1hcHBp
bmcgdGFibGVzIG1vcmUgZ2VuZXJpYy4KV2Ugd2lsbCByZXBsYWNlIHN0YXRpYyBhcnJheXMgd2l0
aCBkeW5hbWljYWxseSBhbGxvY2F0ZWQgbWVtb3J5IGJ5CnJlYWRpbmcgdGhlIFRYUERNQSBhbmQg
UlhQRE1BIGNvdW50cyBmcm9tIGhhcmR3YXJlLgpUaGFua3MKPiA+ICsjZGVmaW5lIFNUTU1BQ19E
VzI1R01BQ19NQVhfVEMgICAgICAgICAgICAgICAgICAgICAgIDgKPiA+ICsKPiA+ICsvKiBIeXBl
ci1ETUEgbWFwcGluZyBjb25maWd1cmF0aW9uCj4gPiArICogVHJhZmZpYyBDbGFzcyBhc3NvY2lh
dGVkIHdpdGggZWFjaCBWRE1BL1BETUEgbWFwcGluZwo+ID4gKyAqIGlzIHN0b3JlZCBpbiBjb3Jy
ZXNwb25kaW5nIGFycmF5IGVudHJ5Lgo+ID4gKyAqLwo+ID4gK3N0cnVjdCBzdG1tYWNfaGRtYV9j
Zmcgewo+ID4gKyAgICAgdTggdHZkbWFfdGNbU1RNTUFDX0RXMjVHTUFDX01BWF9OVU1fVFhfVkRN
QV07Cj4gPiArICAgICB1OCBydmRtYV90Y1tTVE1NQUNfRFcyNUdNQUNfTUFYX05VTV9SWF9WRE1B
XTsKPiA+ICsgICAgIHU4IHRwZG1hX3RjW1NUTU1BQ19EVzI1R01BQ19NQVhfTlVNX1RYX1BETUFd
Owo+ID4gKyAgICAgdTggcnBkbWFfdGNbU1RNTUFDX0RXMjVHTUFDX01BWF9OVU1fUlhfUERNQV07
Cj4gPiArfTsKPiA+ICsKPiA+ICBzdHJ1Y3Qgc3RtbWFjX2RtYV9jZmcgewo+ID4gICAgICAgaW50
IHBibDsKPiA+ICAgICAgIGludCB0eHBibDsKPiA+IEBAIC0xMDEsNiArMTUwLDcgQEAgc3RydWN0
IHN0bW1hY19kbWFfY2ZnIHsKPiA+ICAgICAgIGJvb2wgbXVsdGlfbXNpX2VuOwo+ID4gICAgICAg
Ym9vbCBkY2hlOwo+ID4gICAgICAgYm9vbCBhdGRzOwo+ID4gKyAgICAgc3RydWN0IHN0bW1hY19o
ZG1hX2NmZyAqaGRtYV9jZmc7Cj4gPiAgfTsKPiA+Cj4gPiAgI2RlZmluZSBBWElfQkxFTiAgICAg
NwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
