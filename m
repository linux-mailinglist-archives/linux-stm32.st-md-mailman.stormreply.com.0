Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E52ACEF68C
	for <lists+linux-stm32@lfdr.de>; Fri, 02 Jan 2026 23:17:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D90A4C8F280;
	Fri,  2 Jan 2026 22:17:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55ADAC8F27D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jan 2026 22:17:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ECE2D43684
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jan 2026 22:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF877C116C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jan 2026 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767392259;
 bh=/64Co2q0kgEgA6DPpVmvrLqtt4+bKlfMdoKNXVNCcsQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ge2fF73iJ8fd9je/5EvWRvXS4+eNAXKRDPzkWl71vlZSnTL/QfKna/aIUVBrNzqh5
 mDsdGxhIVjOAF5DgyQXjyPdkWInWTLYyR9nBQBjvEYKXdK4AlCDsxA4DRs7FKwJd55
 qbNGH1+8COzIcaBwqUZtXwBOXEyk4P7MwVgy80b4xpW7IdeVJUU16yVWcdTMFVs1VE
 a/shbiUuWL8wYX6p4iaLWpnQh2+AczJFAcfhA1YoN3SzJA9UdLIX7SN1jvxiC3iOfj
 7D4GSVWzrtB2v8A78o2IxK2poTFA4PCSHN/pB4Gh1eYAhTxFCE8mUEEVm572e5YK5f
 d5bdHvqxa8TAA==
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so2381460066b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jan 2026 14:17:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWNgt8YEuQVX4r5Zh5cqvzlNNxNpnwb8dFAJYdP7Uo0HlTvb5jx4oaGbR/xZmsRWKF63Hjjt7l/BgBxsw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2Oo5Tn4d0ZmYsxcUEnOLV7viQZzVMCuRCyc4D/Z3WGsk0qHZh
 s/2n8sfciT9TrdG9vF/ze48JzAtZAPrpwxTbXYJlki3CpSaY8xZrMipBShg0+mOHtviqWYgVjQs
 zluiWlmfIm/VQna8Y8Dh9HPBqL6HJXQ==
X-Google-Smtp-Source: AGHT+IGcdjYMdq8WHlapJ12+Pohp79IeQ6Qp00t62ofYPur0Xu5Cyh0Zdwx3rcPrWR7fro3HFhzV7izpL+ysUdN6FT8=
X-Received: by 2002:a17:907:da17:b0:b83:3770:a0e4 with SMTP id
 a640c23a62f3a-b833770a15emr2280910966b.34.1767392258434; Fri, 02 Jan 2026
 14:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org>
 <aVOzHWmlJ-eneS-2@sumit-xelite>
In-Reply-To: <aVOzHWmlJ-eneS-2@sumit-xelite>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 Jan 2026 16:17:27 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
X-Gm-Features: AQt7F2qSpJIFr1cZ7Ak2PMJj_kJpZOMaYqr6WPt7b6SXNB2GqwyfYzNGk02nLo4
Message-ID: <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v20 1/6] dt-bindings: firmware: Add TEE
	remoteproc service binding
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

T24gVHVlLCBEZWMgMzAsIDIwMjUgYXQgNToxMOKAr0FNIFN1bWl0IEdhcmcgPHN1bWl0LmdhcmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIERlYyAyOSwgMjAyNSBhdCAwNToyNTozMFBN
IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IE9uIFdlZCwgRGVjIDE3LCAyMDI1IGF0IDA0
OjM5OjEyUE0gKzAxMDAsIEFybmF1ZCBQb3VsaXF1ZW4gd3JvdGU6Cj4gPiA+IEFkZCBhIGRldmlj
ZSB0cmVlIGJpbmRpbmcgZm9yIHRoZSBURUUtYmFzZWQgcmVtb3RlIHByb2Nlc3NvciBjb250cm9s
Cj4gPiA+IHNlcnZpY2UgaW1wbGVtZW50ZWQgYXMgYW4gT1AtVEVFIFRydXN0ZWQgQXBwbGljYXRp
b24gaWRlbnRpZmllZCBieQo+ID4gPiBVVUlEIDgwYTRjMjc1LTBhNDctNDkwNS04Mjg1LTE0ODZh
OTc3MWEwOC4KPiA+ID4KPiA+ID4gVGhlIFRFRSBzZXJ2aWNlIG5vZGUgaXMgYSBjaGlsZCBvZiB0
aGUgImxpbmFybyxvcHRlZS10eiIgZmlybXdhcmUgbm9kZSBhbmQKPiA+ID4gYWN0cyBhcyBhIGNv
bnRhaW5lciBmb3IgcmVtb3RlcHJvYyBkZXZpY2VzIHRoYXQgYXJlIGNvbnRyb2xsZWQgdmlhIFRF
RS4KPiA+Cj4gPiBJcyB0aGlzIGdlbmVyaWMgZm9yIGFueSByZW1vdGVwcm9jIGRldmljZSBvciBq
dXN0IFNUJ3MgcmVtb3RlcHJvYy4gTG9va3MKPiA+IGxpa2UgdGhlIGxhdHRlciB0byBtZS4KPgo+
IFRoYXQncyB0cnVlLCB0aGUgRFQgZGVzY3JpcHRpb24gb2YgdGhlIHJlbW90ZXByb2Mgc3Vibm9k
ZSBpcyB2ZXJ5Cj4gc3BlY2lmaWMgdG8gdGhlIHZlbmRvciB3aGljaCBpbiB0aGlzIGNhc2UgaXMg
U1QuCj4KPiA+Cj4gPiA+IEluIGFkZGl0aW9uLCB0aGUgImxpbmFybyxvcHRlZS10eiIgYmluZGlu
ZyBpcyB1cGRhdGVkIHRvIHNwZWNpZnkgdGhlCj4gPiA+ICcjYWRkcmVzcy1jZWxscycgYW5kICcj
c2l6ZS1jZWxscycgdmFsdWVzIHVzZWQgZm9yIGNoaWxkIFRFRSBzZXJ2aWNlCj4gPiA+IG5vZGVz
Lgo+ID4KPiA+IEknbSBwcmV0dHkgc3VyZSBJIGFscmVhZHkgcmVqZWN0ZWQgcGVyIHNlcnZpY2Uv
YXBwIGNoaWxkIG5vZGVzIGZvcgo+ID4gT1AtVEVFIHdoZW4gaXRzIGJpbmRpbmcgd2FzIHN1Ym1p
dHRlZC4KPgo+IFRoYXQgd2FzIHRoZSByZWFzb24gdG8gaGF2ZSBkaXNjb3ZlcmFibGUgVEVFIGJ1
cyBpbiBmaXJzdCBwbGFjZSBhbmQgSQo+IGhhdmUgYmVlbiBtb3RpdmF0aW5nIHBlb3BsZSB0byBk
eW5hbWljYWxseSBkaXNjb3ZlciBmaXJtd2FyZSBwcm9wZXJ0aWVzCj4gcmF0aGVyIHRoYW4gaGFy
ZGNvZGluZyBpbiB0aGUgRFQuCj4KPiA+IElmIHdlIGRvIG5lZWQgc29tZXRoaW5nIGluIERUCj4g
PiB0byBkZWZpbmUgc29tZSByZXNvdXJjZXMsIHRoZW4gY2FuJ3Qgd2UgaGF2ZSBzb21lIHNvcnQg
b2YKPiA+IHN0YW5kYXJkL2NvbW1vbiBjb21tdW5pY2F0aW9ucyBjaGFubmVsPyBJIGRvbid0IGNh
cmUgdG8gc2VlIHNvbWUgc29ydCBvZgo+ID4gZnJlZS1mb3ItYWxsIHdoZXJlIHdlIGhhdmUgZXZl
cnkgdmVuZG9yIGRvaW5nIHRoZWlyIG93biB0aGluZy4gT1AtVEVFCj4gPiBuZWVkcyB0byBzdGFu
ZGFyaXplIHRoaXMuCj4KPiBJIHN1cHBvc2UgdGhpcyByZXF1aXJlcyBhIHdpZGVyIHNjb3BlIHdv
cmsgYXMgeW91IGNhbiBzZWUgdGhlIERUIHJlc291cmNlCj4gZGVwZW5kZW5jZSBmcm9tIGhlcmUg
WzFdLiBCeSBzdGFuZGFyZGl6ZSBjb21tdW5pY2F0aW9uIGNoYW5uZWwsIGRvIHlvdQo+IG1lYW4g
dG8gc2F5IGlmIGFkZGluZyBhbiBhbHRlcm5hdGl2ZSBiYWNrZW5kIHRvIGZ3bm9kZSBmb3IgVEVF
IGluCj4gcGFyYWxsZWwgdG8gRFQsIEFDUEkgb3Igc3dub2RlIGlzIHRoZSB3YXkgdG8gZ28gZm9y
IGRpc2NvdmVyaW5nIGZ3Cj4gcHJvcGVydGllcz8KCk5vLCBub3QgYXQgYWxsLgoKPiBPciBkbyB5
b3UgaGF2ZSBhbnkgb3RoZXIgc3VnZ2VzdGlvbiBoZXJlPwoKV2hhdCBJIG1lYW4gaXMgd2h5IGRv
ZXNuJ3QgdGhlIFRFRSBkZWZpbmUgdGhlIGNvbW11bmljYXRpb24gY2hhbm5lbAoobWFpbGJveCtz
aG1lbSBhbmQgbm90aWZpY2F0aW9uIGludGVycnVwdCkgcmF0aGVyIHRoYW4gZWFjaCBURUUgYXBw
PwoKTW9yZSBnZW5lcmFsbHksIGlzIGhhdmluZyBURUUgYXBwcyBkZXBlbmRpbmcgb24gcmFuZG9t
IERUIHJlc291cmNlcwpyZWFsbHkgYSBib3ggd2Ugd2FudCB0byBvcGVuPyBJcyB0aGUgbmV4dCB0
aGluZyBnb2luZyB0byBiZSBhIFRFRQpjbG9jay9yZXNldC9ncGlvL3Bvd2VyIHByb3ZpZGVyPyBX
aGVyZSBkbyB3ZSBkcmF3IHRoZSBsaW5lPwoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
