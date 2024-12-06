Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7CA9E6C6B
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 11:40:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E158CC6DD9A;
	Fri,  6 Dec 2024 10:40:36 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE951C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 10:40:28 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-29e5aedbebdso986385fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2024 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cornersoftsolutions.com; s=google; t=1733481627; x=1734086427;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5dpoHhnnSqF1AlwYKD5E4gHGT3XutAgIPGhaNKW/0HU=;
 b=o/BxzjlIiSgjjvTkRkk5lbalaxWASSMnagbOmC1huMnq1ofxKK0pitwVYre2e8ffgN
 y/L8KHNddltb8dDXzI2ZoW+2aZ8hOjgIYuVQdVrQIeMUs42Aq3N1nn5uYkUAt4wiWKrz
 Cxp5Sar8ayaAGlbx0GeBcYMcEzmReOPQrnX7c2/xyizRxQP1gMPkUSI53cwz4S8FfdPX
 uoJJxB8UpcViJvNVy0W6ZPh2+Dothozf8kj+SC9XJYZsOhVgb0fTAycNBbtTGwTSXBC2
 K4stEVB0a+HUNfS3yOUqlTDEhkf/WfikCAra56mMi/TEJtacT4VNWtpue/UYKZ/VuIii
 RxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733481627; x=1734086427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5dpoHhnnSqF1AlwYKD5E4gHGT3XutAgIPGhaNKW/0HU=;
 b=Y827s7bQ1Kh4SmZK4YEB51H4e5g56ia8ATwHXfPtjWVNMs+p/9m0KmqaPAIHiEj70A
 Ym1RbULIZZmU3WiJEl/AvrWrLWBQ3zNyAYwfq1ClSB/iLPyNiz0LpgVClqCt7zkNH6J/
 WuhmrFmFSmnezD9u3IxExdIlDCmMSW6pnCOCFsHZZg9O0ytYG10VisWVX2N9WDR3knmv
 aEjaRsStvr2QQOkvHsTdae8WDRdFK23TTMf3x6P9uw1wnNkRSn3aDvFD4WC2T9uX3HFj
 hdN9Uzl9gJihYn7OQs3wkMAgKk3OI621ZrfXbwhVAk1EE6c9rjfVQ9a3QXP2ztZ/Z08A
 grBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2nIuOJF0mEiVCuBcG/i+D8FIWZ6KPx2SsjUUGz6yNsc2rqDFbEWdAk5FCSDNnwIdF9JihW40f/6nWKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzbk0bC/dGAIFTo0a07Nn5+qbHlM8yd931o95pj4zwLR814byXZ
 1TBjQAg4B19GQG/VDPNOGTWoQn0FUQoYgCzMI0get1KXJH6Uy+1BjAd2aNEZ5UjbB1SrIzazVUO
 vTeSIO0Mb7hJrGQz/wDOabuB3t+Dt/lv670AxYQ==
X-Gm-Gg: ASbGnctUeSJ39ZMcNxezsBA8obSV1aFTAgwmopcxwxkmJ47HGhh+LglDDtad4mA0zmP
 6xquBj6eBnYZc1cyf4iseq7cdKMVujvWP
X-Google-Smtp-Source: AGHT+IEEgtCpiEfKyepoSM+/D8HoOWbGc7v8g0uhiFB/aNLSdUw6Ym7nLZpksS0y4DeVwr2P94N5ssZLKnJh8nBacmA=
X-Received: by 2002:a05:6870:c69a:b0:29d:c832:7ef6 with SMTP id
 586e51a60fabf-29f735d53damr1234503fac.39.1733481627713; Fri, 06 Dec 2024
 02:40:27 -0800 (PST)
MIME-Version: 1.0
References: <CADRqkYAaCYvo3ybGdKO1F_y9jFEcwTBxZzRN-Av-adq_4fVu6g@mail.gmail.com>
 <d53538ea-f846-4a6a-bc14-22ec7ee57e53@kernel.org>
 <CADRqkYDnDNL_H2CzxjsPOdM++iYp-9Ak3PVFBw2qcjR_M=GeBA@mail.gmail.com>
 <28d1bb46-ab18-42da-9ca2-ff498c888d66@kernel.org>
 <bdfeceb6-962a-4f20-b76c-4fe5e5ff80c3@foss.st.com>
In-Reply-To: <bdfeceb6-962a-4f20-b76c-4fe5e5ff80c3@foss.st.com>
From: Ken Sloat <ksloat@cornersoftsolutions.com>
Date: Fri, 6 Dec 2024 05:40:16 -0500
Message-ID: <CADRqkYAg5k3xM81-qBBiiLsvVdJCGdCVyAJgEexMw4s-1PeQkQ@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 vkoul@kernel.org, mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org,
 krzk+dt@kernel.org, Ken Sloat <ksloat@cornersoftsolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] dt-bindings: dma: st-stm32-dmamux: Add
 description for dma-cell values
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

SGkgQW1lbGllLAoKVGhhbmtzIGZvciByZXZpZXdpbmcKCk9uIFRodSwgRGVjIDUsIDIwMjQgYXQg
MTowNuKAr1BNIEFtZWxpZSBEZWxhdW5heQo8YW1lbGllLmRlbGF1bmF5QGZvc3Muc3QuY29tPiB3
cm90ZToKPgo+Cj4gT24gMTIvNS8yNCAxNzowOSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToK
PiA+IE9uIDA1LzEyLzIwMjQgMTc6MDcsIEtlbiBTbG9hdCB3cm90ZToKPiA+Pj4+ICsgMS4gVGhl
IG11eCBpbnB1dCBudW1iZXIvbGluZSBmb3IgdGhlIHJlcXVlc3QKPiA+Pj4+ICsgMi4gQml0Zmll
bGQgcmVwcmVzZW50aW5nIERNQSBjaGFubmVsIGNvbmZpZ3VyYXRpb24gdGhhdCBpcyBwYXNzZWQK
PiA+Pj4+ICsgdG8gdGhlIHJlYWwgRE1BIGNvbnRyb2xsZXIKPiA+Pj4+ICsgMy4gQml0ZmllbGQg
cmVwcmVzZW50aW5nIGRldmljZSBkZXBlbmRlbnQgRE1BIGZlYXR1cmVzIHBhc3NlZCB0bwo+ID4+
Pj4gKyB0aGUgcmVhbCBETUEgY29udHJvbGxlcgo+ID4+Pj4gKwo+ID4+Pj4gKyBGb3IgYml0Zmll
bGQgZGVmaW5pdGlvbnMgb2YgY2VsbHMgMiBhbmQgMywgc2VlIHRoZSBhc3NvY2lhdGVkCj4gPj4+
PiArIGJpbmRpbmdzIGRvYyBmb3IgdGhlIGFjdHVhbCBETUEgY29udHJvbGxlciB0aGUgbXV4IGlz
IGNvbm5lY3RlZAo+ID4+Pgo+ID4+PiBUaGlzIGRvZXMgbm90IHNvdW5kIHJpZ2h0LiBUaGlzIGlz
IHRoZSBiaW5kaW5nIGZvciBETUEgY29udHJvbGxlciwgc28KPiA+Pj4geW91IGFyZSBzYXlpbmcg
InBsZWFzZSBsb29rIGF0IGl0c2VsZiIuIEkgc3VnZ2VzdCB0byBkcm9wIHRoaXMgYXMgd2VsbC4K
PiA+Pj4KPiA+Pgo+ID4+IFdoaWxlIGxvZ2ljYWxseSBpdCBpcyB0aGUgRE1BIGNvbnRyb2xsZXIs
IHRoaXMgZG9jIGlzIHNwZWNpZmljYWxseSBmb3IKPiA+PiB0aGUgbXV4IC0gdGhlIERNQSBjb250
cm9sbGVyIGhhcyBpdHMgb3duIGRyaXZlciBhbmQgYmluZGluZyBkb2NzIGluCj4gPj4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9zdG0zMi9zdCxzdG0zMi1kbWEueWFtbAo+
ID4+Cj4gPj4gSSBjYW4gcmVmZXJlbmNlIHN0LHN0bTMyLWRtYS55YW1sIGRpcmVjdGx5LCBidXQg
SSB3YXMgdW5zdXJlIGlmIHRoaXMKPiA+PiBtdXggSVAgd2FzIHVzZWQgd2l0aCBhbm90aGVyIERN
QSBjb250cm9sbGVyIGZyb20gU1Qgb24gYSBkaWZmZXJlbnQKPiA+PiBTb0MuCj4gPj4KPiA+PiBX
aGF0IGRvIHlvdSBzdWdnZXN0IGhlcmU/Cj4gPgo+ID4gVGhhbmtzIGZvciBleHBsYW5hdGlvbiwg
SSB0aGluayBpdCBpcyBmaW5lLgo+ID4KPiA+IEJlc3QgcmVnYXJkcywKPiA+IEtyenlzenRvZgo+
Cj4gVGhpcyBkZXNjcmlwdGlvbiB3YXMgbG9zdCB3aGVuIFNUTTMyIERNQU1VWCBiaW5kaW5nIHR4
dCBmaWxlIHdhcwo+IGNvbnZlcnRlZCB0byB5YW1sOgo+IDBiN2M0NDZmYTlmNyAoImR0LWJpbmRp
bmdzOiBkbWE6IENvbnZlcnQgc3RtMzIgRE1BTVVYIGJpbmRpbmdzIHRvCj4ganNvbi1zY2hlbWEi
KQo+Cj4gLS0gI2RtYS1jZWxsczogIFNob3VsZCBiZSBzZXQgdG8gPDM+Lgo+IC0gICAgICAgICAg
ICAgICBGaXJzdCBwYXJhbWV0ZXIgaXMgcmVxdWVzdCBsaW5lIG51bWJlci4KPiAtICAgICAgICAg
ICAgICAgU2Vjb25kIGlzIERNQSBjaGFubmVsIGNvbmZpZ3VyYXRpb24KPiAtICAgICAgICAgICAg
ICAgVGhpcmQgaXMgRmlmbyB0aHJlc2hvbGQKClRoYW5rcyBmb3IgdGhlIGluZm8sIHRoaXMgYWxp
Z25zIHdpdGggd2hhdCBJIGhhdmUKCj4gLSAgICAgICAgICAgICAgIEZvciBtb3JlIGRldGFpbHMg
YWJvdXQgdGhlIHRocmVlIGNlbGxzLCBwbGVhc2Ugc2VlCj4gLSAgICAgICAgICAgICAgIHN0bTMy
LWRtYS50eHQgZG9jdW1lbnRhdGlvbiBiaW5kaW5nIGZpbGUKPgo+Cj4gc3RtMzItZG1hbXV4IGV4
Y2x1c2l2ZWx5IG11eGVzIHN0bTMyLWRtYSBjaGFubmVscy4gSXQgaXMgbm90IHVzZWQgd2l0aAo+
IG90aGVyIFNUIERNQSBjb250cm9sbGVycyAoU1RNMzIgTURNQSwgU1RNMzIgRE1BMykuCj4KPiBT
byBpdCBpcyBmaW5lIHRvIHJlZmVyIHRvIHN0LHN0bTMyLWRtYS55YW1sLgoKT2ssIEkgY2FuIGFk
ZCB0aGF0IG9uIHYyCgo+Cj4gUmVnYXJkcywKPiBBbWVsaWUKCi0tIApTaW5jZXJlbHksCktlbiBT
bG9hdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
