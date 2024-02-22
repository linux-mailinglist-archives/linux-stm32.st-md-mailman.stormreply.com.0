Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58881860342
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 20:53:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11103C69063;
	Thu, 22 Feb 2024 19:53:30 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4203C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 19:53:29 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-4c0375d438eso38822e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 11:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708631608; x=1709236408;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3kozEGOJC/7xLH6aBy/2SvD0c9oKy8kT6TL2kXc3Klg=;
 b=OWEkXtKV0QYvO8Be88dk23CnSuGwx3fK7l7TQfE9yfyPOUQF8krDx/pL3pZBVdGMRO
 E7uwcGU0sAi2U/PKodn4lQXj2FckoOsbdm8ggVUlsjb1YHDACD3/wqz6ev6ZvJN5bns8
 2Vbp1SuD8Pow73zsFYsexlbI+u5Mq0/9grvuenPNsqyIVpvkMoq+RZLFEBXyWha/0RGn
 tMPQPQCOrSKiYpYw1sU22FG2BB/ZgGuMaNIXlJMXMRIsl+x6KAr5UdJHFJXP1DKSg2Wa
 45lZ10ADig1iPoMtrxaPdeXEeaMyB25YZSbRQiOe3RiLHFISReoSNcK6auMV7gRSToPj
 C4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708631608; x=1709236408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3kozEGOJC/7xLH6aBy/2SvD0c9oKy8kT6TL2kXc3Klg=;
 b=AuegDZ2ABinLHbG+KO1a8nLl+gI033k7AJq2sSVy/QYysWiOpxhT1wwGPwrW9zS0B/
 5jKohwHBY4x9abA7aJNGo0YBKaLDv+XEfdANrMAGd0QpieHtND0WrpdfyWaiQkjVvw6Q
 VKRqV9tsnmpEIxgV/GxPG9xGvkBVfSqTFSkSIgV75xEF5q6laQ075dI7lCfGm7XMub9l
 reAhqKgNMuXP67lIE5YpGO02eRYaHertHbwZry30ID9ilIrk+tWlZQxcA3pglNEjrsU0
 kABvi7bJtMC6TlMkFt+eVVPUfkAyBZQj2W44u0W6zngEa9t8h0uImopSq37xO+erhOBM
 s1jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpIGOqDNZz+63dMz4meoI7VXTTH1K/4XCUHdrlfFnUzp1Sv5h4UQ6XNXJmo+OTSMDzs1UaMgV9L9wZoJ8trnA/G98BqR6XaHNa7ODB2l+tR2uuqvrBTqSa
X-Gm-Message-State: AOJu0Yxn+s2gnI8AxB5wX1zow+9Akwnw01x0RRR+Rf/QyXGQDjphAnrP
 GqOPL2sYWjtCX8O19sf1Vg49DFEMbUQkEdJaunNJKa6o69sQVSY6YVmJXF7VyvqGl3DGiN+rTaP
 +y6krtGf387hE1Rcv4cDlwPHVK6GimlPSBd75
X-Google-Smtp-Source: AGHT+IHd1fOHDrami1l/FXC8S9WReyWr/r16zMqJ++U2IMGyqdRRRkXy54yvZV6zhDuC7vRCY24PZbj2//w/q+ZxR8M=
X-Received: by 2002:a1f:e782:0:b0:4cd:1430:7834 with SMTP id
 e124-20020a1fe782000000b004cd14307834mr42201vkh.7.1708631608338; Thu, 22 Feb
 2024 11:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20240222-stmmac_xdp-v1-1-e8d2d2b79ff0@linutronix.de>
In-Reply-To: <20240222-stmmac_xdp-v1-1-e8d2d2b79ff0@linutronix.de>
From: Stanislav Fomichev <sdf@google.com>
Date: Thu, 22 Feb 2024 11:53:14 -0800
Message-ID: <CAKH8qBsCrYuT+18CsydQ5TeauRzu0Hdz7mZQ2c0W7er0KrJnkg@mail.gmail.com>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Complete meta data only
	when enabled
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

T24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgMTo0NeKAr0FNIEt1cnQgS2FuemVuYmFjaCA8a3VydEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IEN1cnJlbnRseSB1c2luZyBYRFAvWkMgc29ja2V0cyBv
biBzdG1tYWMgcmVzdWx0cyBpbiBhIGtlcm5lbCBjcmFzaDoKPgo+IHxbICAyNTUuODIyNTg0XSBV
bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVh
bCBhZGRyZXNzIDAwMDAwMDAwMDAwMDAwMDAKPiB8Wy4uLl0KPiB8WyAgMjU1LjgyMjc2NF0gQ2Fs
bCB0cmFjZToKPiB8WyAgMjU1LjgyMjc2Nl0gIHN0bW1hY190eF9jbGVhbi5jb25zdHByb3AuMCsw
eDg0OC8weGMzOAo+Cj4gVGhlIHByb2dyYW0gY291bnRlciBpbmRpY2F0ZXMgeHNrX3R4X21ldGFk
YXRhX2NvbXBsZXRlKCkuIEhvd2V2ZXIsIHRoaXMKPiBmdW5jdGlvbiBzaG91bGRuJ3QgYmUgY2Fs
bGVkIHVubGVzcyBtZXRhZGF0YSBpcyBhY3R1YWxseSBlbmFibGVkLgo+Cj4gVGVzdGVkIG9uIGlt
eDkzIHdpdGhvdXQgWERQLCB3aXRoIFhEUCBhbmQgd2l0aCBYRFAvWkMuCj4KPiBGaXhlczogMTM0
N2I0MTkzMThkICgibmV0OiBzdG1tYWM6IEFkZCBUeCBIV1RTIHN1cHBvcnQgdG8gWERQIFpDIikK
PiBTdWdnZXN0ZWQtYnk6IFNlcmdlIFNlbWluIDxmYW5jZXIubGFuY2VyQGdtYWlsLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBLdXJ0IEthbnplbmJhY2ggPGt1cnRAbGludXRyb25peC5kZT4KPiBUZXN0
ZWQtYnk6IFNlcmdlIFNlbWluIDxmYW5jZXIubGFuY2VyQGdtYWlsLmNvbT4KPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvODdyMGg3d2c4dS5mc2ZAa3VydC5rdXJ0LmhvbWUv
CgpBY2tlZC1ieTogU3RhbmlzbGF2IEZvbWljaGV2IDxzZGZAZ29vZ2xlLmNvbT4KCkxHVE0sIHRo
YW5rcyEKCj4gLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19tYWluLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L3N0bW1hY19tYWluLmMKPiBpbmRleCBlODBkNzdiZDlmMWYuLjhiNzdjMDk1MjA3MSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5j
Cj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4u
Ywo+IEBAIC0yNjcyLDcgKzI2NzIsOCBAQCBzdGF0aWMgaW50IHN0bW1hY190eF9jbGVhbihzdHJ1
Y3Qgc3RtbWFjX3ByaXYgKnByaXYsIGludCBidWRnZXQsIHUzMiBxdWV1ZSwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNrYikgewo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RtbWFjX2dldF90eF9od3RzdGFtcChwcml2
LCBwLCBza2IpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgfSBlbHNlIGlmICh0eF9xLT54c2tfcG9vbCAmJgo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgeHBfdHhfbWV0YWRhdGFfZW5hYmxlZCh0eF9xLT54c2tf
cG9vbCkpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzdG1tYWNf
eHNrX3R4X2NvbXBsZXRlIHR4X2NvbXBsID0gewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAucHJpdiA9IHByaXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC5kZXNjID0gcCwKPgo+IC0tLQo+IGJhc2UtY29tbWl0OiA2MDNlYWQ5NjU4
MmQ4NTkwM2JhZWMyZDU1ZjAyMWI4ZGFjNWMyNWQyCj4gY2hhbmdlLWlkOiAyMDI0MDIyMi1zdG1t
YWNfeGRwLTU4NWViZjE2ODBiMwo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gS3VydCBLYW56ZW5i
YWNoIDxrdXJ0QGxpbnV0cm9uaXguZGU+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
