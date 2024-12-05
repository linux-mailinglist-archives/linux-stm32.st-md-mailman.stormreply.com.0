Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A82229E67B2
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 08:15:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 591C5C71280;
	Fri,  6 Dec 2024 07:15:44 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14355C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 16:07:32 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-29e644b3f6fso387362fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2024 08:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cornersoftsolutions.com; s=google; t=1733414851; x=1734019651;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KOckcNe8W3RQKx65UzBFy6XStXAxVc8nCNjDX8cXNw0=;
 b=TGAqkTYEXZ1k09Lr6pB+bQlK7pz0Khk94Q2lleeAEBE5+rjhikYLXVADoGIBAzzmYw
 mYbt8Fo8itzrvHh+1Wv98qPjW4oovrivsjHlaAIusG9fXPlOzYdXS8++jn2MlzFx/BTn
 TdMtu0VjfQjg8to7Hl4Ei/ljpIFFX6o45oJ8XoBiBcmDxGQt4Uji4KB00X+kpVuhsCK/
 +UIRoQ0oUz/l1HuMtV4vYXLsMQE4DtIH/bxrr7W2V1x6RSYxhcXuI/mPl0kRslGm8E8H
 hI/N2PaZyYJAMEuDhT1aCd7TQC3ZwEJEXPhtKPPT8WSayXGAVNHuCx3eve31nmbcJijx
 PQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733414851; x=1734019651;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KOckcNe8W3RQKx65UzBFy6XStXAxVc8nCNjDX8cXNw0=;
 b=o0MZmZHCHLX57hWIZxQXScSsZ70bzryIBDYIMphx9yWjzcpYoY+sfLbWVU6gWWKevz
 zGjH7FS67OnSWQ/M7QJRRnoos2Hv0NBUuQI+1aYWubEqjhIDUXwohKSLvAj78ie0jTvL
 Hv2XOeP4fx0fY62MCj83Zo/FvSNaSiwnpVVbkN9VopxrkFcyRF2pjaml+2RK22DK9656
 6fKY9/DbFzkM3enB9yAApXWsloF2pfnbjIR4XCz7pBlrAg6E/yiKyQ29xr7fWv4z+tkd
 yBXpjAw47l454Wv5f3+7d4wsqTiHPU6KaZYLDhEIAETxV4lWwHOxUOqdX2cMuTGsDkdO
 Jy7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnQXZPVz+uRNykvEh/7NeSuWiyvGqcnJl3knmTKyeWZMFai9XBd4z8jO97IvQIVpJU8YHl6aD1GyQCdw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzeKZ9mr0oPQqmko4fCQESlo+LYMTlbcxgDDhutjaArNu/IH5pK
 ObPKi8OJwFP4D8TyUcznqAuIUS1dk9P5ClKSUt7XNGXLZ31WmPut4wuMjmCt9MXUSXqgzxatfw4
 96G9Uz8tdZP1ymmZ+FMpMKwQdC4IE3Qgkoe8sBQ==
X-Gm-Gg: ASbGncs+Dnyl3PoK66lJE6/Fz6nECRrUl3ZPqHuI+/uTwSNMVADN+zHkliTti96iTSs
 1dt/DZHVBkV3sWGuKNcGZlensz3ab9KGO
X-Google-Smtp-Source: AGHT+IFc4uqMYZT0SxPqLKcDtYnZCPI05fbA21AsNVCAy81bsUwRL7Rs+7Wfd6hN5qQc+lT4SQo91gDOIfd4QY1CTs0=
X-Received: by 2002:a05:6871:4b83:b0:29d:c832:840d with SMTP id
 586e51a60fabf-29e8890d522mr10222701fac.35.1733414850886; Thu, 05 Dec 2024
 08:07:30 -0800 (PST)
MIME-Version: 1.0
References: <CADRqkYAaCYvo3ybGdKO1F_y9jFEcwTBxZzRN-Av-adq_4fVu6g@mail.gmail.com>
 <d53538ea-f846-4a6a-bc14-22ec7ee57e53@kernel.org>
In-Reply-To: <d53538ea-f846-4a6a-bc14-22ec7ee57e53@kernel.org>
From: Ken Sloat <ksloat@cornersoftsolutions.com>
Date: Thu, 5 Dec 2024 11:07:20 -0500
Message-ID: <CADRqkYDnDNL_H2CzxjsPOdM++iYp-9Ak3PVFBw2qcjR_M=GeBA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Approved-At: Fri, 06 Dec 2024 07:15:43 +0000
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 dmaengine@vger.kernel.org, krzk+dt@kernel.org,
 Ken Sloat <ksloat@cornersoftsolutions.com>,
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

SGkgS3J6eXN6dG9mLAoKVGhhbmtzIGZvciByZXZpZXdpbmcKCk9uIFRodSwgRGVjIDUsIDIwMjQg
YXQgMTA6NTnigK9BTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Cj4gT24gMDUvMTIvMjAyNCAxNjozMiwgS2VuIFNsb2F0IHdyb3RlOgo+ID4gVGhlIGRtYS1j
ZWxsIHZhbHVlcyBmb3IgdGhlIHN0bTMyLWRtYW11eCBhcmUgdXNlZCB0byBjcmFmdCB0aGUgRE1B
IHNwZWMKPiA+IGZvciB0aGUgYWN0dWFsIGNvbnRyb2xsZXIuIFRoZXNlIHZhbHVlcyBhcmUgY3Vy
cmVudGx5IHVuZG9jdW1lbnRlZAo+ID4gbGVhdmluZyB0aGUgdXNlciB0byByZXZlcnNlIGVuZ2lu
ZWVyIHRoZSBkcml2ZXIgaW4gb3JkZXIgdG8gZGV0ZXJtaW5lCj4gPiB0aGVpciBtZWFuaW5nLiBB
ZGQgYSBiYXNpYyBkZXNjcmlwdGlvbiwgd2hpbGUgYXZvaWRpbmcgZHVwbGljYXRpbmcKPiA+IGlu
Zm9ybWF0aW9uIGJ5IHBvaW50aW5nIHRoZSB1c2VyIHRvIHRoZSBhc3NvY2lhdGVkIERNQSBkb2Nz
IHRoYXQKPiA+IGRlc2NyaWJlIHRoZSBmaWVsZHMgaW4gZGVwdGguCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogS2VuIFNsb2F0IDxrc2xvYXRAY29ybmVyc29mdHNvbHV0aW9ucy5jb20+Cj4gPiAtLS0K
PiA+IC4uLi9iaW5kaW5ncy9kbWEvc3RtMzIvc3Qsc3RtMzItZG1hbXV4LnlhbWwgfCAxMSArKysr
KysrKysrKwo+ID4gMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9zdG0zMi9zdCxz
dG0zMi1kbWFtdXgueWFtbAo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZG1hL3N0bTMyL3N0LHN0bTMyLWRtYW11eC55YW1sCj4gPiBpbmRleCBmMjZjOTE0YTNhOWEuLmFh
MmU1MjAyN2VlNiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kbWEvc3RtMzIvc3Qsc3RtMzItZG1hbXV4LnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvc3RtMzIvc3Qsc3RtMzItZG1hbXV4LnlhbWwKPiA+
IEBAIC0xNSw2ICsxNSwxNyBAQCBhbGxPZjoKPiA+IHByb3BlcnRpZXM6Cj4gPiAiI2RtYS1jZWxs
cyI6Cj4gPiBjb25zdDogMwo+Cj4gWW91ciBwYXRjaCBpcyBjb3JydXB0ZWQuIFBsZWFzZSB1c2Ug
Z2l0IHNlbmQtZW1haWwgb3IgYjQgb3IgYjQrcmVsYXkuCgpTb3JyeSBhYm91dCB0aGF0LCBJIHdp
bGwgZG8gdGhhdC4gSSB3aWxsIHdhaXQgZm9yIGFueSBhZGRpdGlvbmFsCmNvbW1lbnRzIGFuZCB0
aGVuIHJlLXN1Ym1pdC4KCj4KPiA+ICsgZGVzY3JpcHRpb246IHwKPiA+ICsgU2hvdWxkIGJlIHNl
dCB0byA8Mz4gd2l0aCBlYWNoIGNlbGwgcmVwcmVzZW50aW5nIHRoZSBmb2xsb3dpbmc6Cj4KPiBE
cm9wIHRoaXMgcGFydCwgY29uc3Qgc2F5cyB0aGlzLgoKT2sKCj4KPiA+ICsgMS4gVGhlIG11eCBp
bnB1dCBudW1iZXIvbGluZSBmb3IgdGhlIHJlcXVlc3QKPiA+ICsgMi4gQml0ZmllbGQgcmVwcmVz
ZW50aW5nIERNQSBjaGFubmVsIGNvbmZpZ3VyYXRpb24gdGhhdCBpcyBwYXNzZWQKPiA+ICsgdG8g
dGhlIHJlYWwgRE1BIGNvbnRyb2xsZXIKPiA+ICsgMy4gQml0ZmllbGQgcmVwcmVzZW50aW5nIGRl
dmljZSBkZXBlbmRlbnQgRE1BIGZlYXR1cmVzIHBhc3NlZCB0bwo+ID4gKyB0aGUgcmVhbCBETUEg
Y29udHJvbGxlcgo+ID4gKwo+ID4gKyBGb3IgYml0ZmllbGQgZGVmaW5pdGlvbnMgb2YgY2VsbHMg
MiBhbmQgMywgc2VlIHRoZSBhc3NvY2lhdGVkCj4gPiArIGJpbmRpbmdzIGRvYyBmb3IgdGhlIGFj
dHVhbCBETUEgY29udHJvbGxlciB0aGUgbXV4IGlzIGNvbm5lY3RlZAo+Cj4gVGhpcyBkb2VzIG5v
dCBzb3VuZCByaWdodC4gVGhpcyBpcyB0aGUgYmluZGluZyBmb3IgRE1BIGNvbnRyb2xsZXIsIHNv
Cj4geW91IGFyZSBzYXlpbmcgInBsZWFzZSBsb29rIGF0IGl0c2VsZiIuIEkgc3VnZ2VzdCB0byBk
cm9wIHRoaXMgYXMgd2VsbC4KPgoKV2hpbGUgbG9naWNhbGx5IGl0IGlzIHRoZSBETUEgY29udHJv
bGxlciwgdGhpcyBkb2MgaXMgc3BlY2lmaWNhbGx5IGZvcgp0aGUgbXV4IC0gdGhlIERNQSBjb250
cm9sbGVyIGhhcyBpdHMgb3duIGRyaXZlciBhbmQgYmluZGluZyBkb2NzIGluCkRvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvc3RtMzIvc3Qsc3RtMzItZG1hLnlhbWwKCkkgY2Fu
IHJlZmVyZW5jZSBzdCxzdG0zMi1kbWEueWFtbCBkaXJlY3RseSwgYnV0IEkgd2FzIHVuc3VyZSBp
ZiB0aGlzCm11eCBJUCB3YXMgdXNlZCB3aXRoIGFub3RoZXIgRE1BIGNvbnRyb2xsZXIgZnJvbSBT
VCBvbiBhIGRpZmZlcmVudApTb0MuCgpXaGF0IGRvIHlvdSBzdWdnZXN0IGhlcmU/Cgo+Cj4gQmVz
dCByZWdhcmRzLAo+IEtyenlzenRvZgoKLS0gClNpbmNlcmVseSwKS2VuIFNsb2F0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
