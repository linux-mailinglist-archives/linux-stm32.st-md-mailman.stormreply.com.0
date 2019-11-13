Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9483FAC77
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2019 10:00:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2F75C36B0C;
	Wed, 13 Nov 2019 09:00:04 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 346A1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 09:00:01 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m16so1025065qki.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 01:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zriSzR1A7PY8VkXg8BzENfmEpX+OltCL/F/xWpeuul4=;
 b=my0U+qCLomIt6E1rAcdLE1Id6S8BuETSIIYtZIcmh2johk6LY+sQR3OjPubPjNOZQ8
 6NQNnX9pWKlZ9SNfJx5VIdEc09EjWpcwRbHBiPDehzm8+sJMUnGQ74CAgqKMhdkC/VH4
 b1XyxWzrZDwZ3bRb95XyDevdiw+hY/azHEjwrCyWCCuwB1vT2kWfJyP39J6X9zDbTJ+s
 CYquB2V7jcS3H3bMbcuOynmxubakIWY2jmDQ+nt1XaAS4CB5W/aCDQFC1jMbCliAN/ZG
 07AFzKV3bl6HOxccM/iSQ8WklrCXO932AMgXydPNhtOyLKIA29nq16WU2NALw4A/rO+I
 ck+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zriSzR1A7PY8VkXg8BzENfmEpX+OltCL/F/xWpeuul4=;
 b=l64uDRclUmO+bW+eTNVZVLqoO4BzB968At4lINtcyH98IBwiFg/z/0mWAg7FVdKDn8
 1r/M9Yt50zjA+ug/THWYM+8EUnOoQUJfWVQTLhwEHGLJLA4Lr1w1bKt3vnmewHBVrh9e
 tRaG4AR4eZB2/ndDH2z+2KiGuV+6dZn2erfjfc0TtjxRRwaFwyZcjBN8cyioaWyZK6tx
 wqZUAmkC5nH1QHxNCGl73fek37ACaYjStGEEghmsTNX3299tfm12aoGbuW/9B9TTK8W6
 buiSUvriP0GA60lUtQTL10oBvqFk/erO1MP4M+ltKmk+ovJlyDObidEPBxsZLjMlJjOW
 nVbw==
X-Gm-Message-State: APjAAAVt2fwTF/5vswSFU7ytyDSuUXXaKmU5t9ffhqFiihC2MjDgN0Bz
 NELaJ9UGvfRalSSyQZkdCBkmeZ0xqe/vx5/DBBq1Vw==
X-Google-Smtp-Source: APXvYqwsCmN6s9RnJjvaofrXiIJk06TaVDlS+MgGGZe8uV9Y2XokAVivNi+UmgCV28MIMFtKMGxwIn9ktjfr5qd7u6s=
X-Received: by 2002:ae9:e885:: with SMTP id a127mr1321564qkg.427.1573635599889; 
 Wed, 13 Nov 2019 00:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20191017124159.13869-1-benjamin.gaignard@st.com>
 <63f96a2f-78c0-21ae-781b-e52068f57103@st.com>
 <6597f899-f049-02dc-de59-07a0f23a88b8@st.com>
 <d0c1af15-a647-8d80-81c9-fc07b926856c@roeck-us.net>
In-Reply-To: <d0c1af15-a647-8d80-81c9-fc07b926856c@roeck-us.net>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Wed, 13 Nov 2019 09:59:48 +0100
Message-ID: <CA+M3ks633VNnc9UPDVq9w68pc3EPcff69UxvsggfUvtRCUJwVw@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: watchdog: Convert stm32
	watchdog bindings to json-schema
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

TGUgamV1LiAxNyBvY3QuIDIwMTkgw6AgMTU6MzEsIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNr
LXVzLm5ldD4gYSDDqWNyaXQgOgo+Cj4gT24gMTAvMTcvMTkgNjoxNyBBTSwgQmVuamFtaW4gR0FJ
R05BUkQgd3JvdGU6Cj4gPgo+ID4gT24gMTAvMTcvMTkgMzowNiBQTSwgQWxleGFuZHJlIFRvcmd1
ZSB3cm90ZToKPiA+PiBIaSBCZW5qYW1pbgo+ID4+Cj4gPj4gT24gMTAvMTcvMTkgMjo0MSBQTSwg
QmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cj4gPj4+IENvbnZlcnQgdGhlIFNUTTMyIHdhdGNoZG9n
IGJpbmRpbmcgdG8gRFQgc2NoZW1hIGZvcm1hdCB1c2luZyBqc29uLXNjaGVtYQo+ID4+Pgo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3Qu
Y29tPgo+ID4+PiAtLS0KPiA+Pj4gICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cv
c3Qsc3RtMzItaXdkZy50eHQgfCAyNiAtLS0tLS0tLS0tLQo+ID4+PiAgICAuLi4vYmluZGluZ3Mv
d2F0Y2hkb2cvc3Qsc3RtMzItaXdkZy55YW1sICAgICAgICAgICB8IDU0Cj4gPj4+ICsrKysrKysr
KysrKysrKysrKysrKysKPiA+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCsp
LCAyNiBkZWxldGlvbnMoLSkKPiA+Pj4gICAgZGVsZXRlIG1vZGUgMTAwNjQ0Cj4gPj4+IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9zdCxzdG0zMi1pd2RnLnR4dAo+
ID4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3dhdGNoZG9nL3N0LHN0bTMyLWl3ZGcueWFtbAo+ID4+Pgo+ID4+PiBkaWZmIC0t
Z2l0Cj4gPj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL3N0
LHN0bTMyLWl3ZGcudHh0Cj4gPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3dhdGNoZG9nL3N0LHN0bTMyLWl3ZGcudHh0Cj4gPj4+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAo+ID4+PiBpbmRleCBkOGY0NDMwYjBhMTMuLjAwMDAwMDAwMDAwMAo+ID4+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvc3Qsc3RtMzItaXdkZy50eHQK
PiA+Pj4gKysrIC9kZXYvbnVsbAo+ID4+PiBAQCAtMSwyNiArMCwwIEBACj4gPj4+IC1TVE0zMiBJ
bmRlcGVuZGVudCBXYXRjaERvRyAoSVdERykKPiA+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ID4+PiAtCj4gPj4+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4+PiAtLSBj
b21wYXRpYmxlOiBTaG91bGQgYmUgZWl0aGVyOgo+ID4+PiAtICAtICJzdCxzdG0zMi1pd2RnIgo+
ID4+PiAtICAtICJzdCxzdG0zMm1wMS1pd2RnIgo+ID4+PiAtLSByZWc6IFBoeXNpY2FsIGJhc2Ug
YWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSByZWdpc3RlcnMgc2V0IGZvciB0aGUKPiA+Pj4gZGV2
aWNlCj4gPj4+IC0tIGNsb2NrczogUmVmZXJlbmNlIHRvIHRoZSBjbG9jayBlbnRyeSBsc2kuIEFk
ZGl0aW9uYWwgcGNsayBjbG9jayBlbnRyeQo+ID4+PiAtICBpcyByZXF1aXJlZCBvbmx5IGZvciBz
dCxzdG0zMm1wMS1pd2RnLgo+ID4+PiAtLSBjbG9jay1uYW1lczogTmFtZSBvZiB0aGUgY2xvY2tz
IHVzZWQuCj4gPj4+IC0gICJsc2kiIGZvciBzdCxzdG0zMi1pd2RnCj4gPj4+IC0gICJsc2kiLCAi
cGNsayIgZm9yIHN0LHN0bTMybXAxLWl3ZGcKPiA+Pj4gLQo+ID4+PiAtT3B0aW9uYWwgUHJvcGVy
dGllczoKPiA+Pj4gLS0gdGltZW91dC1zZWM6IFdhdGNoZG9nIHRpbWVvdXQgdmFsdWUgaW4gc2Vj
b25kcy4KPiA+Pj4gLQo+ID4+PiAtRXhhbXBsZToKPiA+Pj4gLQo+ID4+PiAtaXdkZzogd2F0Y2hk
b2dANDAwMDMwMDAgewo+ID4+PiAtICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzItaXdkZyI7Cj4g
Pj4+IC0gICAgcmVnID0gPDB4NDAwMDMwMDAgMHg0MDA+Owo+ID4+PiAtICAgIGNsb2NrcyA9IDwm
Y2xrX2xzaT47Cj4gPj4+IC0gICAgY2xvY2stbmFtZXMgPSAibHNpIjsKPiA+Pj4gLSAgICB0aW1l
b3V0LXNlYyA9IDwzMj47Cj4gPj4+IC19Owo+ID4+PiBkaWZmIC0tZ2l0Cj4gPj4+IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL3N0LHN0bTMyLWl3ZGcueWFtbAo+
ID4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9zdCxzdG0z
Mi1pd2RnLnlhbWwKPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+Pj4gaW5kZXggMDAwMDAw
MDAwMDAwLi5lZGVjOTZkNTNlNmIKPiA+Pj4gLS0tIC9kZXYvbnVsbAo+ID4+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvc3Qsc3RtMzItaXdkZy55YW1s
Cj4gPj4+IEBAIC0wLDAgKzEsNTQgQEAKPiA+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4+PiArJVlBTUwgMS4yCj4gPj4+ICst
LS0KPiA+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvd2F0Y2hkb2cvc3Qs
c3RtMzItaXdkZy55YW1sIwo+ID4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPj4+ICsKPiA+Pj4gK3RpdGxlOiBTVE1pY3JvZWxlY3Ry
b25pY3MgU1RNMzIgSW5kZXBlbmRlbnQgV2F0Y2hEb0cgKElXREcpIGJpbmRpbmdzCj4gPj4+ICsK
PiA+Pj4gK21haW50YWluZXJzOgo+ID4+PiArICAtIFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZl
cnRyZUBzdC5jb20+Cj4gPj4KPiA+PiBZYW5uaWNrIGlzIHN0aWxsIHdvcmtpbmcgb24gdGhpcyBk
cml2ZXIgPwo+ID4KPiA+IFRoYXQgaXMgYSBnb29kIHF1ZXN0aW9uLgo+ID4KPiA+IFJvYiwgY2Fu
IHdlIHVzZSB0aGUgU1RNMzIgZGVkaWNhdGVkIG1haWxpbmcgbGlzdCBhZGRyZXNzIGZvciB0aGlz
Cj4gPiBtYWludGVuZXJzIGZpZWxkID8KPiA+Cj4gPiBtYWludGFpbmVyczoKPiA+Cj4gPiAtIGxp
bnV4IFNUTTMyIDxsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tPgo+ID4K
Pgo+Cj4gSSdkIHJhdGhlciB3b25kZXIgd2hvIGlzIGdvaW5nIHRvIG1haW50YWluIHRoaXMgc2Vj
b25kYXJ5IGRpc3RyaWJ1dGVkCj4gbWFpbnRhaW5lcnMgbGlzdCwgYnV0IEkgZ3Vlc3MgdGhhdCBp
cyBhIGRpZmZlcmVudCBxdWVzdGlvbi4KPgoKR2VudGxlIHBpbmcgdG8gcmV2aWV3ZXJzIG9uIHRo
aXMgcGF0Y2guCgpUaGFua3MsCkJlbmphbWluCgo+IEd1ZW50ZXIKPgo+ID4gUmVnYXJkcywKPiA+
Cj4gPiBCZW5qYW1pbgo+ID4KPiA+Pgo+ID4+PiArCj4gPj4+ICthbGxPZjoKPiA+Pj4gKyAgLSAk
cmVmOiAid2F0Y2hkb2cueWFtbCMiCj4gPj4+ICsKPiA+Pj4gK3Byb3BlcnRpZXM6Cj4gPj4+ICsg
IGNvbXBhdGlibGU6Cj4gPj4+ICsgICAgZW51bToKPiA+Pj4gKyAgICAgIC0gc3Qsc3RtMzItaXdk
Zwo+ID4+PiArICAgICAgLSBzdCxzdG0zMm1wMS1pd2RnCj4gPj4+ICsKPiA+Pj4gKyAgcmVnOgo+
ID4+PiArICAgIG1heEl0ZW1zOiAxCj4gPj4+ICsKPiA+Pj4gKyAgY2xvY2tzOgo+ID4+PiArICAg
IGl0ZW1zOgo+ID4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogTG93IHNwZWVkIGNsb2NrCj4gPj4+
ICsgICAgICAtIGRlc2NyaXB0aW9uOiBPcHRpb25hbCBwZXJpcGhlcmFsIGNsb2NrCj4gPj4+ICsg
ICAgbWluSXRlbXM6IDEKPiA+Pj4gKyAgICBtYXhJdGVtczogMgo+ID4+PiArCj4gPj4+ICsgIGNs
b2NrLW5hbWVzOgo+ID4+PiArICAgIGl0ZW1zOgo+ID4+PiArICAgICAgZW51bXM6IFsgbHNpLCBw
Y2xrIF0KPiA+Pj4gKyAgICBtaW5JdGVtczogMQo+ID4+PiArICAgIG1heEl0ZW1zOiAyCj4gPj4+
ICsKPiA+Pj4gK3JlcXVpcmVkOgo+ID4+PiArICAtIGNvbXBhdGlibGUKPiA+Pj4gKyAgLSByZWcK
PiA+Pj4gKyAgLSBjbG9ja3MKPiA+Pj4gKyAgLSBjbG9jay1uYW1lcwo+ID4+PiArCj4gPj4+ICtl
eGFtcGxlczoKPiA+Pj4gKyAgLSB8Cj4gPj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Ns
b2NrL3N0bTMybXAxLWNsa3MuaD4KPiA+Pj4gKyAgICB3YXRjaGRvZ0A1YTAwMjAwMCB7Cj4gPj4+
ICsgICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMybXAxLWl3ZGciOwo+ID4+PiArICAgICAgcmVn
ID0gPDB4NWEwMDIwMDAgMHg0MDA+Owo+ID4+PiArICAgICAgY2xvY2tzID0gPCZyY2MgSVdERzI+
LCA8JnJjYyBDS19MU0k+Owo+ID4+PiArICAgICAgY2xvY2stbmFtZXMgPSAicGNsayIsICJsc2ki
Owo+ID4+PiArICAgICAgdGltZW91dC1zZWMgPSA8MzI+Owo+ID4+PiArICAgIH07Cj4gPj4+ICsK
PiA+Pj4gKy4uLgo+ID4+ID4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
