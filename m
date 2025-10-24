Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B503C054D9
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 11:21:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE2F5C5F1C2;
	Fri, 24 Oct 2025 09:21:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02131C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 09:21:27 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47495477241so15098055e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761297687; x=1761902487;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NY5PIARKbpIdf6CoFhX2UEn3hHI/O9Hdjy4EAS5mHE4=;
 b=UoDj3yAumRdyrBUWrkMqfKF/E5cxzIFhi43q1ssWT78m0YizNpLyGlNOXnenpVK9cA
 z2Rewg3Ev13xUIQLBu1mxHdWyJ6xP7pECCPieko6k0sMM+588xBvuKhlkyuRFzpdOfyg
 aUNxeGsUNv6qP8d7shf1PORHbdUaA4XDsRS9E8EhGQG4zDHRBN2usbR8W7JWfNFeKcsC
 WyokCVLqlm8v9ARPkopcXtidDkt+BdKfyAuaEDcBhdlx5hypyMnUufjgN2pUwD+Z6Mm/
 /x6rZrPp7D5xIx2C0TG1JSxKMnKGznHl6Xzs08mYF2rhRsal6mOxasVYzVErfrED8NHv
 PDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761297687; x=1761902487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NY5PIARKbpIdf6CoFhX2UEn3hHI/O9Hdjy4EAS5mHE4=;
 b=Ky7L0ToaUdsSQ19+UW66Isc+yfThCQHISaiGWTFTv31vT5QVxWm5t23AHzm8J3WwGd
 JBivhYoWraR5WA2nhojDMdAT5JWrTsWOeejnGPxBm/OAj+xb3L1k7cs8RH3ktajEJxji
 EVAlY1Zbde674MqjsGnzpW9Fr2nZeMQKy8IF/2tJjn2Zug3dv2Y/gWF1pE6X2JczWFIy
 qp1jl78FT4YluDbwZfuRmizU4ENGCDMUZ6Ai9E+nE5QJ1s3dG8+5ryjFDCoD+Da5Yj0k
 QR34nJIFijWP32VSm6Kzh7G7liiSEX8PHe9zGgxZai//5qBQRqmPIFn/9/W6AqEoSaBI
 FHrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXubKghGbaXcHMq4GKMzevIi6hpp6qD0LmohZE9MdPJTnhObdpOWkxMk5OqKi3co9Yim3hvVIhfIC7e4Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxQgt6RkohEhUpaV/QXQMlo/sOshNLZS3CjpzF80YyOtozWi7On
 OJVyDnoEh5Ny0yA0vkiQt4LfoSJN7TkSJi361qT8x1aE+4X7Gq/mqGKJ
X-Gm-Gg: ASbGncvzzyhQJsA97QJCvQpUHKiPYEExI1Uewlh4RT7RTUVn5uxWDrK+kfuM1Hk/5JB
 b+wxDR+STqtcRh5x0hzyAVrwpo0SdajGGFznAVHGhdf+Ha/lX7CpXbtj+vUyFP+0Pu3X4ld2/VH
 W3B11K/Wd9a63802/+ZeBtfehg0+YXs9j3U8IHrbcIq4yX4a0tPtHT3jKIgddNgmlABsOAk+osl
 vXToCIksRTV0ifD7CLTSK2R5epntDwLkQpoVFpWMBE/b/Eytf7Z4PO4uSE+POBQKYZwDxFAsqRe
 xaP8lw2MvLTVD806lW3vFvBLmz7bkMCXa/6S1enq2c53DkQB5e58c/3AL2YzBms4gzThooTCqil
 0iY58SHEwC/Kbx8gkxwUujzI3yJfrPZVVlE5MAbIs+obB+y/ioMQwa4fV61+8v812sYJr/fx6DF
 U9wPSCIh2FnjzXQXAgbdDd0ajP+gf9m++yDdl51tLLMaRxp18z/f8eWsZVBo0ubLAA4spQGgLzl
 1pc4zTkrOpeOVFdJP2BgNyJTchBiX0xlAr9F9kaQACA
X-Google-Smtp-Source: AGHT+IFN2t4M6Qoj3pIFSsEj3r77vKyY565/HfDPakReHx4yAtJAuSEBAgmRyjYHNwXMg0iJVqrMIw==
X-Received: by 2002:a05:600c:4f08:b0:46c:e3df:529e with SMTP id
 5b1f17b1804b1-475cb03021dmr42329985e9.19.1761297687076; 
 Fri, 24 Oct 2025 02:21:27 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7132:30ef:ba02:7a36:289:dc72?
 (2a02-8440-7132-30ef-ba02-7a36-0289-dc72.rev.sfr.net.
 [2a02:8440:7132:30ef:ba02:7a36:289:dc72])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47494b02475sm81213955e9.4.2025.10.24.02.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 02:21:26 -0700 (PDT)
Message-ID: <b3accac0-d02a-4b92-848c-ada62377e440@gmail.com>
Date: Fri, 24 Oct 2025 11:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
 <20250930-b4-ddr-bindings-v8-2-fe4d8c015a50@gmail.com>
 <1877f731-1599-414d-a40e-38aec05a33c0@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <1877f731-1599-414d-a40e-38aec05a33c0@kernel.org>
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v8 2/7] dt-bindings: memory: introduce DDR4
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

T24gMTAvMjMvMjUgMTU6MjEsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gMzAvMDkv
MjAyNSAxMDo0NiwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3RlOgo+PiBGcm9tOiBDbMOpbWVudCBM
ZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4+Cj4+IEludHJvZHVjZSBK
RURFQyBjb21wbGlhbnQgRERSIGJpbmRpbmdzLCB0aGF0IHVzZSBuZXcgbWVtb3J5LXByb3BzIGJp
bmRpbmcuCj4gCj4gCj4gSWYgdGhlcmUgaXMgZ29pbmcgdG8gYmUgcmVzZW5kLCB0aGVuIHBsZWFz
ZSByZXBlYXQgaGVyZSBhcHBsaWNhYmxlIHBhcnQKPiBvZiBjb21wYXRpYmxlIGZvcm1hdCwgZS5n
LiB3aHkgaXQncyBsaWtlIHRoYXQuCgpIaSBLcnp5c3p0b2YsIG9rCgo+IAo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBn
bWFpbC5jb20+Cj4+IC0tLQo+PiAgIC4uLi9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGRk
cjQueWFtbCAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0Lnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJz
L2Rkci9qZWRlYyxkZHI0LnlhbWwKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAw
MDAwMDAwMDAwLi5hMmViNmY2M2MwY2UKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxk
ZHI0LnlhbWwKPj4gQEAgLTAsMCArMSwzNCBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+ICslWUFNTCAxLjIKPj4gKy0tLQo+
PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZW1vcnktY29udHJvbGxlcnMv
ZGRyL2plZGVjLGRkcjQueWFtbCMKPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICt0aXRsZTogRERSNCBTRFJBTSBjb21wbGlh
bnQgdG8gSkVERUMgSkVTRDc5LTRECj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIEtyenlz
enRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPj4gKwo+PiArYWxsT2Y6Cj4+ICsgIC0g
JHJlZjogamVkZWMsc2RyYW0tcHJvcHMueWFtbCMKPj4gKwo+PiArcHJvcGVydGllczoKPj4gKyAg
Y29tcGF0aWJsZToKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gcGF0dGVybjogIl5kZHI0LVsw
LTlhLWZdezR9LFthLXpdezEsMjB9LFswLTlhLWZdezJ9JCIKPiAKPiBXaHkgZG91YmxlICcsJz8g
SSB3b3VsZCBpbWFnaW5lIGxhc3QgJywnIHRvIGJlICctJzoKPiBkZHJYLVlZWVksQUFBQS4uLi1a
Wgo+IAo+IFNvcnJ5IGlmIHdlIGRpc2N1c3MgdGhhdCBhbHJlYWR5LCBidXQgdGhlbiBwbGVhc2Ug
cmVtaW5kIG1lIGFuZCB0aGlzCj4gd291bGQgbmVlZCBhZGRyZXNzaW5nIGluIGNvbW1pdCBtc2cu
CgpJIGRvIG5vdCBzZWUgYW55dGhpbmcgYWdhaW5zdCB0aGF0LgpJJ2xsIHdhaXQgSnVsaXVzJ3Mg
cmV2aWV3LCBpZiBhbnksIGFuZCBJIHdpbGwgc2VuZCB0aGUgbmV4dCB2ZXJzaW9uIHdpdGggCnRo
aXMgY2hhbmdlcy4KCj4gCj4+ICsgICAgICAtIGNvbnN0OiBqZWRlYyxkZHI0Cj4gCj4gCj4gQmVz
dCByZWdhcmRzLAo+IEtyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
