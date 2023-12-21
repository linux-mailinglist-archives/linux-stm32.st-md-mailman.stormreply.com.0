Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B95081B7CB
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 14:31:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0CF9C6B477;
	Thu, 21 Dec 2023 13:31:47 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53310C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 13:31:46 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a268dd99597so93666166b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 05:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703165506; x=1703770306;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4clTO1fofY2eNwbdO7CCLGOSVGvP1DX7gqJc9G4CyF8=;
 b=UPOJhuOT8GNe1VXBkK/53XJS2TfAO+hOjQB/PV6sUwcadySfOjTkrpnzOJovXHVY8J
 ytln14FFbG+C9FJXJO9uwdvEXM27851pVNkeIGfa4VnFSGr5C159HyJJqd7vaFDhxHLO
 iA8UsGDLC+/YUsAoDH07GLE5qDB6uNUubN0ZHDWZHiHOsu3g3n605iDC1bYU2nMSHuJS
 FLO8KlJcO+Qn7BD4n7JlWEANTuXtqZ2JkXVUc1j+r57tQKxV2Au086MjDLLbNWTo9V2N
 Lpqc4npAMooOzI5hR3IPAAaVMNpp8f7y+dnxJs1w+t8MrevJVjVAoabDP67NePizAGie
 iLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703165506; x=1703770306;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4clTO1fofY2eNwbdO7CCLGOSVGvP1DX7gqJc9G4CyF8=;
 b=CyayPCR0Z2nIKYbGEidW55IQDPfKJALIpks4OoHtHn2j2W6cj7b53GIZqHjQAPcEwA
 /0NngV0d6plGDtFlRB1eovJQoKuZuhpAi35W0xAuwik2hpklhEdYXTYvLge1UyVULfhL
 Gu+8xoJZfr7B349sBLcegjHltB3rsx4ZCGOABidqC+2BBWguannI+ksn5oYcQy9bLjdW
 bs9s7k9LBlcZJWyUg6LIfujLT5Mr3VQijywElx9agLC8GD4OjfehALxyiIlKALIqEzCd
 G/21aCnvsFMYTygrcOEThEFaM1vnX0vKbTQuLAFSHZ04r+PdUeu+edr+gk4SnKQN9ORM
 P5bw==
X-Gm-Message-State: AOJu0YxKULUlnd3aqAoQpXeX8pK4tSziMpbcKiaqCX6g9BZAoPpTssN6
 WRYeoUexV22y1jMC7yfghA==
X-Google-Smtp-Source: AGHT+IF2Flfwdw+9Ew7PdPcxSqRYmVIgFYsU4nOcYmBTEXLMsfQ7N0ayOXW8rHLLhgaxT1AapyUWvw==
X-Received: by 2002:a17:906:6d58:b0:a23:4532:f168 with SMTP id
 a24-20020a1709066d5800b00a234532f168mr1881887ejt.227.1703165505503; 
 Thu, 21 Dec 2023 05:31:45 -0800 (PST)
Received: from ?IPV6:2a02:810b:f40:4300:1c49:5d1e:f6f3:77a0?
 ([2a02:810b:f40:4300:1c49:5d1e:f6f3:77a0])
 by smtp.gmail.com with ESMTPSA id
 hj13-20020a170906874d00b00a233515c391sm953856ejb.158.2023.12.21.05.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 05:31:45 -0800 (PST)
Message-ID: <e5ba1e14-4bbf-43e3-933a-fee6d4b90641@gmail.com>
Date: Thu, 21 Dec 2023 14:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20231221084723.2152034-1-hugues.fruchet@foss.st.com>
 <769a1510-f8d2-4095-9879-42f413141dee@gmail.com>
 <a240d2ac-db0e-481b-8d13-3ae76cfd2fe7@foss.st.com>
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <a240d2ac-db0e-481b-8d13-3ae76cfd2fe7@foss.st.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v5 0/5] Add support for video hardware
 codec of STMicroelectronics STM32 SoC series
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgSHVndWVzLAoKQW0gMjEuMTIuMjMgdW0gMTQ6MDggc2NocmllYiBIdWd1ZXMgRlJVQ0hFVDoK
PiBIaSBBbGV4LAo+Cj4gVGhpcyBpcyBiZWNhdXNlIFZERUMgYW5kIFZFTkMgYXJlIHR3byBzZXBh
cmF0ZWQgSVBzIHdpdGggdGhlaXIgb3duIAo+IGhhcmR3YXJlIHJlc291cmNlcyBhbmQgbm8gbGlu
a3MgYmV0d2VlbiBib3RoLgo+IE9uIGZ1dHVyZSBTb0NzLCBWREVDIGNhbiBzaGlwIG9uIGl0cyBv
d24sIHNhbWUgZm9yIFZFTkMuCj4KSSB0aGluayB0aGF0J3Mgd2hhdCB0aGUgZHJpdmVyIGlzL3dh
cyBkZXNpZ25lZCBmb3IgOikKCkkgZG9uJ3TCoCB0aGluayB0aGVyZSBfaGFzXyB0byBiZSBhIGxp
bmsgYmV0d2VlbiB2YXJpYW50cyBpbiB0aGUgc2FtZSBmaWxlLgpGb3IgUm9ja2NoaXAgd2Ugb25s
eSBoYWQgdGhlIGlzc3VlIHRoYXQgdGhlcmUgX2lzXyBhIGxpbmsgKHNoYXJlZApyZXNvdXJjZXMp
IGJldHdlZW4gZW5jb2RlciBhbmQgZGVjb2RlciBhbmQgdGhleSBoYWQgKGZvciB0aGF0IHJlYXNv
bikgdG8gYmUKZGVmaW5lZCBoYXMgYSBfc2luZ2xlXyB2YXJpYW50LiBBbmQgdGhlcmUgaXMgbm8g
cmVhc29uIHlvdSBjYW4gc2hpcCBkZWNvZGVyCmFuZCBlbmNvZGVyIHNlcGVyYXRlZCB3aGVuIHlv
dSBoYXZlIHR3byB2YXJpYW50cyAod2l0aCBkaWZmZXJlbnQKY29tcGF0aWJsZXMpLgpGb3IgUm9j
a2NoaXAgYW5kIGlNWCB0aG9zZSBmaWxlcyBhcmUgZXZlbiBjb250YWluaW5nIHZhcmlhbnRzIGZv
ciBjb21wbGV0bHkKZGlmZmVyZW50IGdlbmVyYXRpb25zIC8gZGlmZmVyZW50IFNvQ3MuIEkgaGFk
IHRvIGNsZWFudXAgdGhpcyBtZXNzIGZvcgpSb2NrY2hpcCBvbmNlIC0gYW5kIGl0IHdhcyBubyBm
dW4gOikgQW55d2F5czogSXQncyB1cCB0byB0aGUgbWFpbnRhaW5lcnMgSQpndWVzcyAtIEkganVz
dCB3YW50ZWQgdG8gYXNrIGlmIEkgbWlzc3VuZGVyc3RhbmQgc29tZXRoaW5nIGhlcmUuCgpHcmVl
dGluZ3MsCgpBbGV4Cgo+IEhvcGluZyB0aGF0IHRoaXMgY2xhcmlmeS4KPgo+IEJlc3QgcmVnYXJk
cywKPiBIdWd1ZXMuCj4KPiBPbiAxMi8yMS8yMyAxMzo0MCwgQWxleCBCZWUgd3JvdGU6Cj4+IEhp
IEh1Z3VlcywgSGkgTmljb2xhcywKPj4KPj4gaXMgdGhlcmUgYW55IHNwZWNpZmljIHJlYXNvbiBJ
J20gbm90IHVuZGVyc3RhbmRpbmcgLyBzZWVpbmcgd2h5IHRoaXMgCj4+IGlzIGFkZGVkIGluIHR3
byBzZXBlcmF0ZSB2ZGVjKiAvIHZlbmMqIGZpbGVzIGFuZCBub3QgYSBzaW5nbGUgdnB1KiAKPj4g
ZmlsZT8gSXMgaXQgb25seSBmb3IgdGhlIHNlcGVyYXRlIGNsb2NrcyAoLW5hbWVzKSAvIGlycXMg
KC1uYW1lcykgLyAKPj4gY2FsbGJhY2tzPyBUaG9zZSBhcmUgZGVmaW5lZCBwZXIgdmFyaWFudCBh
bmQgcGVyZmVjdGx5IGZpdCBpbiBhIAo+PiBzaW5nbGUgZmlsZSBob2xkaW5nIG9uZSB2ZGVjIGFu
ZCBvbmUgdmVuYyB2YXJpYW50Lgo+Pgo+PiBBbGV4Cj4+Cj4+IEFtIDIxLjEyLjIzIHVtIDA5OjQ3
IHNjaHJpZWIgSHVndWVzIEZydWNoZXQ6Cj4+PiBUaGlzIHBhdGNoc2V0IGludHJvZHVjZXMgc3Vw
cG9ydCBmb3IgVkRFQyB2aWRlbyBoYXJkd2FyZSBkZWNvZGVyCj4+PiBhbmQgVkVOQyB2aWRlbyBo
YXJkd2FyZSBlbmNvZGVyIG9mIFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMk1QMjUKPj4+IFNvQyBz
ZXJpZXMuCj4+Pgo+Pj4gVGhpcyBpbml0aWFsIHN1cHBvcnQgaW1wbGVtZW50cyBIMjY0IGRlY29k
aW5nLCBWUDggZGVjb2RpbmcgYW5kCj4+PiBKUEVHIGVuY29kaW5nLgo+Pj4KPj4+IFRoaXMgaGFz
IGJlZW4gdGVzdGVkIG9uIFNUTTMyTVAyNTdGLUVWMSBldmFsdWF0aW9uIGJvYXJkLgo+Pj4KPj4+
ID09PT09PT09PT09Cj4+PiA9IGhpc3RvcnkgPQo+Pj4gPT09PT09PT09PT0KPj4+IHZlcnNpb24g
NToKPj4+IMKgwqDCoCAtIFByZWNpc2UgdGhhdCB2aWRlbyBkZWNvZGluZyBhcyBiZWVuIHN1Y2Nl
c3NmdWxseSB0ZXN0ZWQgdXAgdG8gCj4+PiBmdWxsIEhECj4+PiDCoMKgwqAgLSBBZGQgTmljb2xh
cyBEdWZyZXNuZSByZXZpZXdlZC1ieQo+Pj4KPj4+IHZlcnNpb24gNDoKPj4+IMKgwqDCoCAtIEZp
eCBjb21tZW50cyBmcm9tIE5pY29sYXMgYWJvdXQgZHJvcHBpbmcgZW5jb2RlciByYXcgc3RlcHMK
Pj4+Cj4+PiB2ZXJzaW9uIDM6Cj4+PiDCoMKgwqAgLSBGaXggcmVtYXJrcyBmcm9tIEtyenlzenRv
ZiBLb3psb3dza2k6Cj4+PiDCoMKgwqDCoCAtIGRyb3AgIml0ZW1zIiwgd2Uga2VlcCBzaW1wbGUg
ZW51bSBpbiBzdWNoIGNhc2UKPj4+IMKgwqDCoMKgIC0gZHJvcCBzZWNvbmQgZXhhbXBsZSAtIGl0
IGlzIHRoZSBzYW1lIGFzIHRoZSBmaXJzdAo+Pj4gwqDCoMKgIC0gRHJvcCB1bnVzZWQgbm9kZSBs
YWJlbHMgYXMgc3VnZ2VzdGVkIGJ5IENvbm9yIERvb2xleQo+Pj4gwqDCoMKgIC0gUmV2aXNpdCBt
aW4vbWF4IHJlc29sdXRpb25zIGFzIHN1Z2dlc3RlZCBieSBOaWNvbGFzIER1ZnJlc25lCj4+Pgo+
Pj4gdmVyc2lvbiAyOgo+Pj4gwqDCoMKgIC0gRml4IHJlbWFya3MgZnJvbSBLcnp5c3p0b2YgS296
bG93c2tpIG9uIHYxOgo+Pj4gwqDCoMKgwqAgLSBzaW5nbGUgdmlkZW8tY29kZWMgYmluZGluZyBm
b3IgYm90aCBWREVDL1ZFTkMKPj4+IMKgwqDCoMKgIC0gZ2V0IHJpZCBvZiAiLW5hbWVzIgo+Pj4g
wqDCoMKgwqAgLSB1c2Ugb2YgZ2VuZXJpYyBub2RlIG5hbWUgInZpZGVvLWNvZGVjIgo+Pj4KPj4+
IHZlcnNpb24gMToKPj4+IMKgwqAgLSBJbml0aWFsIHN1Ym1pc3Npb24KPj4+Cj4+PiBIdWd1ZXMg
RnJ1Y2hldCAoNSk6Cj4+PiDCoMKgIGR0LWJpbmRpbmdzOiBtZWRpYTogRG9jdW1lbnQgU1RNMzJN
UDI1IFZERUMgJiBWRU5DIHZpZGVvIGNvZGVjcwo+Pj4gwqDCoCBtZWRpYTogaGFudHJvOiBhZGQg
c3VwcG9ydCBmb3IgU1RNMzJNUDI1IFZERUMKPj4+IMKgwqAgbWVkaWE6IGhhbnRybzogYWRkIHN1
cHBvcnQgZm9yIFNUTTMyTVAyNSBWRU5DCj4+PiDCoMKgIGFybTY0OiBkdHM6IHN0OiBhZGQgdmlk
ZW8gZGVjb2RlciBzdXBwb3J0IHRvIHN0bTMybXAyNTUKPj4+IMKgwqAgYXJtNjQ6IGR0czogc3Q6
IGFkZCB2aWRlbyBlbmNvZGVyIHN1cHBvcnQgdG8gc3RtMzJtcDI1NQo+Pj4KPj4+IMKgIC4uLi9t
ZWRpYS9zdCxzdG0zMm1wMjUtdmlkZW8tY29kZWMueWFtbMKgwqDCoMKgwqDCoCB8wqAgNTAgKysr
KysrKysKPj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpwqDCoMKg
wqDCoMKgwqAgfMKgIDEyICsrCj4+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAy
NTUuZHRzacKgwqDCoMKgwqDCoMKgIHzCoCAxNyArKysKPj4+IMKgIGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vdmVyaXNpbGljb24vS2NvbmZpZ8KgwqDCoCB8wqAgMTQgKystCj4+PiDCoCBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL01ha2VmaWxlwqDCoCB8wqDCoCA0ICsKPj4+IMKg
IC4uLi9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fZHJ2LmPCoMKgIHzCoMKgIDQg
Kwo+Pj4gwqAgLi4uL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19ody5owqDCoMKg
IHzCoMKgIDIgKwo+Pj4gwqAgLi4uL3BsYXRmb3JtL3ZlcmlzaWxpY29uL3N0bTMybXAyNV92ZGVj
X2h3LmPCoCB8wqAgOTIgKysrKysrKysrKysrKysKPj4+IMKgIC4uLi9wbGF0Zm9ybS92ZXJpc2ls
aWNvbi9zdG0zMm1wMjVfdmVuY19ody5jwqAgfCAxMTUgCj4+PiArKysrKysrKysrKysrKysrKysK
Pj4+IMKgIDkgZmlsZXMgY2hhbmdlZCwgMzA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgCj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvc3Qsc3RtMzJtcDI1LXZpZGVvLWNvZGVjLnlhbWwKPj4+IMKgIGNyZWF0
ZSBtb2RlIDEwMDY0NCAKPj4+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vc3Rt
MzJtcDI1X3ZkZWNfaHcuYwo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+Pj4gZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9zdG0zMm1wMjVfdmVuY19ody5jCj4+Pgo+PgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
