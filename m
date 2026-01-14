Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80940D1CBDC
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 07:54:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47592C8F26F;
	Wed, 14 Jan 2026 06:54:13 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08604C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 06:54:11 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-657464a9010so2977343eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 22:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768373650; x=1768978450;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09+Za/fvs9ACcRouCmvdjIQsUYyJ1cWO4IFmVOeFocw=;
 b=VxT10YMcqTO56lN6ol/ODGruIG0DmpnbVUq0NVMf/OLZc0bpugOMj3LjoMJGS5UmRY
 fEPIVgqsbYG1Nh9wvMV+B9qNIW8G2XkuWZejE6hQS9u0f/sWe45Q3OrQOyF7+ETQaWSk
 nurwjnWn4oFaIIi2YJ8hJBPmBbZ3+VrJzpGi1+XSRwbWGmv9On8GkZT3L+cAEOyj5VDN
 NFWawZNLQkZnVyled9898/H8dWe+WBapTok1Cu3YureICezZCuWD2mD9WnDEltcxkXVy
 ZAcDJUJQ+5fPBnYXqZpHUlZySYz47bCOtpgyE6J5H+Hd/E/WQ6r8hyC5onyOra5pSxRc
 C0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768373650; x=1768978450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=09+Za/fvs9ACcRouCmvdjIQsUYyJ1cWO4IFmVOeFocw=;
 b=rxG571Wxjhg1H0o+awG3rcn8qAYgy+UVI1ya5H81XZ0t061bado1bb6j+DvYuZitce
 8NqoFoRF2uj2Rmqp3vQUOEUeahYS++bbCSv3uPFZnt6Jhl9//e4wlb/0FgvfZSx4EvG2
 3+76Lg+9np+/BkC8YAF4Lq+TuoCrFyHLzeq8s+OPfa5OGg9p8wr2MvvdwRpLA67Ogpa5
 +W1S/44kpKrxYQoowFOPaZbPpwJs1WSte25D1VzpisyzDct6OuqXWat2bAfxuyO/dtb3
 yNJDTxyxV1IuHuJ+/UqYJcSa8Bw7lqC0SNZOr3MUi1upbGzdVHz3zApwHrnBL1PZaN0R
 ILlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVjcSZCSv4gYuyYyxndI1oV4dO3ImafdpUpw34m75ndBynO+MUtiK7c0WG/HFDYK3XAtJtGR/LD5z4/g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxUt1zU6pN2P8f5GpnJTBGTOLNNd3HzxHa9YqXGSsg3uRcEZMHp
 4wMR+TSrvTzLXCvb54otd5qLB4NlPBzhz/r5gDoif3vGcj1QOkDMxhTjD4O0G0Vjboihqa7DAZG
 A9UgORqT/5JRRLvRV5FHykyc91V2pE52dNxg1rvpsqw==
X-Gm-Gg: AY/fxX54ZIJrz0bKjgIVKq25o8gITxcMk8+Aaqn2ZebAfCwj0BYRH9d5O6sDcmCpquL
 hdxt7IxwhI4XJsRcA254fDyAUTLFFOCpXpCh/rwFn/FVHWCCBVIQSxK9SfbVB0L6ScuDQrIBSNC
 7uxgz1PaHir6erPCmwFplPp12wYo09teCJnFQQPLBxeRhQb3zTnROcQ5xoLfd4EqEBcBkXRoRqK
 huzB90hd4Wsqn4/jV3OSPUj/6dvvPCFmClqsjho8NRIp+PhpI5/1qYW92z3iPLDfk1qpDvoBNr8
 Vsu0vVT77hNmmGWHkXJygFf4cX8UGhWNsIRx
X-Received: by 2002:a05:6820:668c:b0:65f:2902:4fa4 with SMTP id
 006d021491bc7-66102df2e32mr770769eaf.65.1768373650571; Tue, 13 Jan 2026
 22:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
 <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com>
 <CAHUa44Gc+q0qJ0XJ8Y-OMT2t9o0W_WeDMHg_S0HPC5i2Zmxhiw@mail.gmail.com>
 <8b3b6cb6-31d0-425e-9894-bf33f2ea3dda@foss.st.com>
In-Reply-To: <8b3b6cb6-31d0-425e-9894-bf33f2ea3dda@foss.st.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 14 Jan 2026 07:53:59 +0100
X-Gm-Features: AZwV_QjQvehCkstZ603G-yGEHjndP2wcqmxShTV0eKq96xdT4eINMWBA-NAc2Vg
Message-ID: <CAHUa44ERuPKeNHoU9UpLWTxZrSvR15RbiuOPXqi2SBYnBfg44w@mail.gmail.com>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-gpio@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 05/11] drivers: bus: add the stm32 debug
	bus driver
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

T24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgNTowOeKAr1BNIEdhdGllbiBDSEVWQUxMSUVSCjxnYXRp
ZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMS8xMy8yNiAxNTo0
NSwgSmVucyBXaWtsYW5kZXIgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiBGcmksIEphbiA5LCAy
MDI2IGF0IDExOjU34oCvQU0gR2F0aWVuIENoZXZhbGxpZXIKPiA+IDxnYXRpZW4uY2hldmFsbGll
ckBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBBZGQgdGhlIHN0bTMyIGRlYnVnIGJ1cyBk
cml2ZXIgdGhhdCBpcyByZXNwb25zaWJsZSBvZiBjaGVja2luZyB0aGUKPiA+PiBkZWJ1ZyBzdWJz
eXN0ZW0gYWNjZXNzaWJpbGl0eSBiZWZvcmUgcHJvYmluZyB0aGUgcmVsYXRlZCBwZXJpcGhlcmFs
Cj4gPj4gZHJpdmVycy4KPiA+Pgo+ID4+IFRoaXMgZHJpdmVyIGlzIE9QLVRFRSBkZXBlbmRlbnQg
YW5kIHJlbGllcyBvbiB0aGUgU1RNMzIgZGVidWcgYWNjZXNzCj4gPj4gUFRBLgo+ID4+Cj4gPj4g
U2lnbmVkLW9mZi1ieTogR2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2YWxsaWVyQGZvc3Mu
c3QuY29tPgo+ID4+IC0tLQo+ID4+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgIHwgICAx
ICsKPiA+PiAgIGRyaXZlcnMvYnVzL0tjb25maWcgICAgICAgICB8ICAxMCArKwo+ID4+ICAgZHJp
dmVycy9idXMvTWFrZWZpbGUgICAgICAgIHwgICAxICsKPiA+PiAgIGRyaXZlcnMvYnVzL3N0bTMy
X2RiZ19idXMuYyB8IDI4NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ID4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyOTcgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPgo+
ID4gW3NuaXBdCj4gPgo+ID4+ICsKPiA+PiArc3RhdGljIGNvbnN0IHN0cnVjdCB0ZWVfY2xpZW50
X2RldmljZV9pZCBvcHRlZV9kYmdfYnVzX2lkX3RhYmxlW10gPSB7Cj4gPj4gKyAgICAgICB7VVVJ
RF9JTklUKDB4ZGQwNWJjOGIsIDB4OWYzYiwgMHg0OWYwLAo+ID4+ICsgICAgICAgICAgICAgICAg
ICAweGI2LCAweDQ5LCAweDAxLCAweGFhLCAweDEwLCAweGMxLCAweGMyLCAweDEwKX0sCj4gPj4g
KyAgICAgICB7fQo+ID4+ICt9Owo+ID4+ICsKPiA+PiArc3RhdGljIHN0cnVjdCB0ZWVfY2xpZW50
X2RyaXZlciBzdG0zMl9vcHRlZV9kYmdfYnVzX2RyaXZlciA9IHsKPiA+PiArICAgICAgIC5pZF90
YWJsZSA9IG9wdGVlX2RiZ19idXNfaWRfdGFibGUsCj4gPj4gKyAgICAgICAuZHJpdmVyID0gewo+
ID4+ICsgICAgICAgICAgICAgICAubmFtZSA9ICJvcHRlZV9kYmdfYnVzIiwKPiA+PiArICAgICAg
ICAgICAgICAgLmJ1cyA9ICZ0ZWVfYnVzX3R5cGUsCj4gPj4gKyAgICAgICAgICAgICAgIC5wcm9i
ZSA9IHN0bTMyX2RiZ19idXNfcHJvYmUsCj4gPj4gKyAgICAgICAgICAgICAgIC5yZW1vdmUgPSBz
dG0zMl9kYmdfYnVzX3JlbW92ZSwKPiA+PiArICAgICAgIH0sCj4gPj4gK307Cj4gPgo+ID4gSnVz
dCBhIGhlYWRzIHVwLiBXaXRoCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vcC10ZWUvY292
ZXIuMTc2NTc5MTQ2My5naXQudS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbS8KPiA+IHdlJ3Jl
IHN3aXRjaGluZyB0byB1c2UgYnVzIG1ldGhvZHMgaW5zdGVhZCBvZiBkZXZpY2VfZHJpdmVyIGNh
bGxiYWNrcy4KPiA+IFRoYXQgcGxhbiBpcyB0byBtZXJnZSB0aGF0IHBhdGNoIHNldCBpbiB0aGUg
bmV4dCBtZXJnZSB3aW5kb3cuCj4gPgo+ID4gQ2hlZXJzLAo+ID4gSmVucwo+ID4KPgo+IEhlbGxv
IEplbnMsCj4KPiBUaGFuayB5b3UgZm9yIHRoZSBsaW5rIQo+IElzIGl0IGZpbmUgaWYgSSBwdXNo
IG9uIHRvcCBvbiB5b3VyICJuZXh0IiBicmFuY2ggZm9yIHRoZSByZXZpZXcgYWxvbmcKPiB3aXRo
IHRoZSBhcHByb3ByaWF0ZSBjaGFuZ2VzPyBJJ20gb3BlbiB0byBzdWdnZXN0aW9ucy4KClBsZWFz
ZSBiYXNlIGl0IG9uIHRoZSB0ZWVfYnVzX2NhbGxiYWNrX2Zvcl82LjIwIGJyYW5jaCBpbnN0ZWFk
LgoKQ2hlZXJzLApKZW5zCgo+Cj4gVGhhbmtzLAo+IEdhdGllbgo+Cj4gPj4gKwo+ID4+ICtzdGF0
aWMgaW50IF9faW5pdCBvcHRlZV9kYmdfYnVzX21vZF9pbml0KHZvaWQpCj4gPj4gK3sKPiA+PiAr
ICAgICAgIGludCByZXQ7Cj4gPj4gKwo+ID4+ICsgICAgICAgcmV0ID0gZHJpdmVyX3JlZ2lzdGVy
KCZzdG0zMl9vcHRlZV9kYmdfYnVzX2RyaXZlci5kcml2ZXIpOwo+ID4+ICsgICAgICAgaWYgKHJl
dCkKPiA+PiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+PiArCj4gPj4gKyAgICAgICBy
ZXQgPSBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIoJnN0bTMyX2RiZ19idXNfZHJpdmVyKTsKPiA+
PiArICAgICAgIGlmIChyZXQpCj4gPj4gKyAgICAgICAgICAgICAgIGRyaXZlcl91bnJlZ2lzdGVy
KCZzdG0zMl9vcHRlZV9kYmdfYnVzX2RyaXZlci5kcml2ZXIpOwo+ID4+ICsKPiA+PiArICAgICAg
IHJldHVybiByZXQ7Cj4gPj4gK30KPiA+PiArCj4gPj4gK3N0YXRpYyB2b2lkIF9fZXhpdCBvcHRl
ZV9kYmdfYnVzX21vZF9leGl0KHZvaWQpCj4gPj4gK3sKPiA+PiArICAgICAgIHBsYXRmb3JtX2Ry
aXZlcl91bnJlZ2lzdGVyKCZzdG0zMl9kYmdfYnVzX2RyaXZlcik7Cj4gPj4gKyAgICAgICBkcml2
ZXJfdW5yZWdpc3Rlcigmc3RtMzJfb3B0ZWVfZGJnX2J1c19kcml2ZXIuZHJpdmVyKTsKPiA+PiAr
fQo+ID4+ICsKPiA+PiArbW9kdWxlX2luaXQob3B0ZWVfZGJnX2J1c19tb2RfaW5pdCk7Cj4gPj4g
K21vZHVsZV9leGl0KG9wdGVlX2RiZ19idXNfbW9kX2V4aXQpOwo+ID4+ICsKPiA+PiArTU9EVUxF
X0xJQ0VOU0UoIkdQTCIpOwo+ID4+ICtNT0RVTEVfQVVUSE9SKCJHYXRpZW4gQ2hldmFsbGllciA8
Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+Iik7Cj4gPj4gK01PRFVMRV9ERVNDUklQVElP
TigiT1AtVEVFIGJhc2VkIFNUTTMyIGRlYnVnIGFjY2VzcyBidXMgZHJpdmVyIik7Cj4gPj4KPiA+
PiAtLQo+ID4+IDIuNDMuMAo+ID4+Cj4gPj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
