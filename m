Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 144BFAEA8A8
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jun 2025 23:19:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 956B3C36B3C;
	Thu, 26 Jun 2025 21:19:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CEA6C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 21:19:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BCD7344F07;
 Thu, 26 Jun 2025 21:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9E8C4CEEB;
 Thu, 26 Jun 2025 21:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750972756;
 bh=28uNc/vEFpqvghgBWV99ylJqmaORBokqPOIAZlT5Edg=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=bbF9XJlul92CmEGz3T4uQ+yndC/DlJOuuo42kGpnawZlzPRbvVNUAo6S1NnSvvvqJ
 mGLgTWTcyPGSpu74VJjKbv8HrO3lcGcLqj1eTACiGW7PwR8fKbklDtULObkihl1Ue7
 PPi/EI5Dw3ZMUccOKbL5/fISnsfHPTQxB5cUEivQV8vItuLr6JxecvCBNO1YEENwqQ
 qcc0e6LguLIwq34dOxDixADb2i9t8PlGSiIgwYXD8AGhrgiVvX1JWn+6kQnV80QWcf
 9L6Yh0PXMyH5ilHF58rjqvrbzb3ZepOM25v3iGmIcC2smqNXGYYbswVPhcDu5IrXtG
 6c47qfe4l0hgQ==
Date: Thu, 26 Jun 2025 16:19:15 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250626-ddr-bindings-v1-2-cae30933c54c@foss.st.com>
References: <20250626-ddr-bindings-v1-0-cae30933c54c@foss.st.com>
 <20250626-ddr-bindings-v1-2-cae30933c54c@foss.st.com>
Message-Id: <175097275573.957711.15313846796838099778.robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 2/2] dt-bindings: perf: stm32:
 introduce DDRPERFM dt-bindings
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

Ck9uIFRodSwgMjYgSnVuIDIwMjUgMjE6NDg6MzUgKzAyMDAsIENsw6ltZW50IExlIEdvZmZpYyB3
cm90ZToKPiBERFJQRVJGTSBpcyB0aGUgRERSIFBlcmZvcm1hbmNlIE1vbml0b3IgZW1iZWRkZWQg
aW4gU1RNMzJNUFUgU29DLgo+IEl0IGFsbG93cyB0byBtb25pdG9yIEREUiBldmVudHMgdGhhdCBj
b21lIGZyb20gdGhlIEREUiBDb250cm9sbGVyCj4gc3VjaCBhcyByZWFkIG9yIHdyaXRlIGV2ZW50
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2Zm
aWNAZm9zcy5zdC5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qs
c3RtMzItZGRyLXBtdS55YW1sIHwgOTAgKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgOTAgaW5zZXJ0aW9ucygrKQo+IAoKTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5n
ICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6Cgp5YW1sbGludCB3YXJuaW5n
cy9lcnJvcnM6CgpkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOgovYnVpbGRzL3JvYmhlcnJp
bmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
ZXJmL3N0LHN0bTMyLWRkci1wbXUueWFtbDogaWdub3JpbmcsIGVycm9yIGluIHNjaGVtYTogcHJv
cGVydGllczogY29tcGF0aWJsZTogb25lT2YKL2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy1j
aS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVyZi9zdCxzdG0zMi1k
ZHItcG11LnlhbWw6IHByb3BlcnRpZXM6Y29tcGF0aWJsZTpvbmVPZjogeydlbnVtJzogWydzdCxz
dG0zMm1wMTMxLWRkci1wbXUnLCAnc3Qsc3RtMzJtcDE1MS1kZHItcG11J10sICdjb25zdCc6ICdz
dCxzdG0zMm1wMjUxLWRkci1wbXUnfSBpcyBub3Qgb2YgdHlwZSAnYXJyYXknCglmcm9tIHNjaGVt
YSAkaWQ6IGh0dHA6Ly9qc29uLXNjaGVtYS5vcmcvZHJhZnQtMDcvc2NoZW1hIwovYnVpbGRzL3Jv
YmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wZXJmL3N0LHN0bTMyLWRkci1wbXUueWFtbDogcHJvcGVydGllczpjb21wYXRpYmxlOm9u
ZU9mOiB7J2VudW0nOiBbJ3N0LHN0bTMybXAxMzEtZGRyLXBtdScsICdzdCxzdG0zMm1wMTUxLWRk
ci1wbXUnXSwgJ2NvbnN0JzogJ3N0LHN0bTMybXAyNTEtZGRyLXBtdSd9IHNob3VsZCBub3QgYmUg
dmFsaWQgdW5kZXIgeydpdGVtcyc6IHsncHJvcGVydHlOYW1lcyc6IHsnY29uc3QnOiAnY29uc3Qn
fSwgJ3JlcXVpcmVkJzogWydjb25zdCddfX0KCWhpbnQ6IFVzZSAnZW51bScgcmF0aGVyIHRoYW4g
J29uZU9mJyArICdjb25zdCcgZW50cmllcwoJZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2tleXdvcmRzLnlhbWwjCi9idWlsZHMvcm9iaGVycmluZy9k
dC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYv
c3Qsc3RtMzItZGRyLXBtdS55YW1sOiBwcm9wZXJ0aWVzOmNvbXBhdGlibGU6b25lT2Y6IHsnZW51
bSc6IFsnc3Qsc3RtMzJtcDEzMS1kZHItcG11JywgJ3N0LHN0bTMybXAxNTEtZGRyLXBtdSddLCAn
Y29uc3QnOiAnc3Qsc3RtMzJtcDI1MS1kZHItcG11J30gaXMgbm90IG9mIHR5cGUgJ2FycmF5JwoJ
ZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL3N0cmlu
Zy1hcnJheS55YW1sIwpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVyZi9zdCxz
dG0zMi1kZHItcG11LmV4YW1wbGUuZHRzOjQ0LjM3LTQ3LjExOiBXYXJuaW5nICh1bml0X2FkZHJl
c3NfdnNfcmVnKTogL2V4YW1wbGUtMS9kZHI0LWNoYW5uZWxAMDogbm9kZSBoYXMgYSB1bml0IG5h
bWUsIGJ1dCBubyByZWcgb3IgcmFuZ2VzIHByb3BlcnR5CkRvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wZXJmL3N0LHN0bTMyLWRkci1wbXUuZXhhbXBsZS5kdGI6IC9leGFtcGxlLTAv
cGVyZkA1YTAwNzAwMDogZmFpbGVkIHRvIG1hdGNoIGFueSBzY2hlbWEgd2l0aCBjb21wYXRpYmxl
OiBbJ3N0LHN0bTMybXAxNTEtZGRyLXBtdSddCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wZXJmL3N0LHN0bTMyLWRkci1wbXUuZXhhbXBsZS5kdGI6IC9leGFtcGxlLTEvcGVyZkA0
ODA0MTAwMDogZmFpbGVkIHRvIG1hdGNoIGFueSBzY2hlbWEgd2l0aCBjb21wYXRpYmxlOiBbJ3N0
LHN0bTMybXAyNTEtZGRyLXBtdSddCgpkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZjaGVj
a2RvY3MpOgoKU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0
cmVlLWJpbmRpbmdzL3BhdGNoLzIwMjUwNjI2LWRkci1iaW5kaW5ncy12MS0yLWNhZTMwOTMzYzU0
Y0Bmb3NzLnN0LmNvbQoKVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBs
YXRlc3QgcmMxLiBBIGRpZmZlcmVudCBkZXBlbmRlbmN5CnNob3VsZCBiZSBub3RlZCBpbiAqdGhp
cyogcGF0Y2guCgpJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5k
IGRpZG4ndCBzZWUgdGhlIGFib3ZlCmVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQn
IGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvCmRhdGU6CgpwaXAzIGluc3RhbGwg
ZHRzY2hlbWEgLS11cGdyYWRlCgpQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBydW5u
aW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3RlCnRoYXQgRFRfU0NIRU1BX0ZJTEVT
IGNhbiBiZSBzZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0byBzcGVlZCB1cCBjaGVja2luZwp5b3Vy
IHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3
aXRoIHlvdXIgc2NoZW1hLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
