Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C9C81B812
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 14:39:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EB76C6B477;
	Thu, 21 Dec 2023 13:39:02 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5477AC6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 13:39:00 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-28bd31683a6so682964a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 05:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703165939; x=1703770739;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LVUFSbN3qi21K+lCGgFuXM1K02jusWBDY0oqKAcbjUE=;
 b=EcqauKEqL3guyFaAAGlvZWlXyxAFldoNVJu5Hg4x33vvHp1qIwjbxQr4e/0eFJMgcn
 UFRPeGPQg16xZXCitcovhMVARekwZ0q7m4NHDqH4YrmKqOoyorIDkaqJa4WPtVKMn2SR
 YMQ1jJT8fGZu0X2vymkTg4Eoe3JpB1Tf1sELJ48TLJayhI+bY0RUJxuSUwbZabo9Rbs/
 qYzLsfxOK00OBziIad7vbvmxwHQ7buZbvaJ+F/dcchiT4/Rh7tdwO2ONi1wFUjujdBKG
 gkTIl9csUR7fnIV4tHaeNYdVOiYKYBR54THTv3dlDgopO6AfJINrPWC/nB62EBxMSjAy
 Uh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703165939; x=1703770739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LVUFSbN3qi21K+lCGgFuXM1K02jusWBDY0oqKAcbjUE=;
 b=C83DmaIb8oZS63byzLCYp25l3t/hzKYVYoGjpWHUkhYHcls1JQWt7sUYseIncf/J9M
 G6ZJOPom3eVZXKnoTToMuYtv/NW6gBJWsVmBpB6OpaVDD40DznlkZn7BeZriCNyPsuXD
 fhQd1fyiHoAAzWn9sW4Z1B7tLfBi5iUwZgf8mvVc07f9OYaRaK4XyXk/Dg0Ts92udaV/
 atyVor49j3f+8/Z5my5mvW7/dZkUochDM0QrgGpIu50mKpIlHPDpRObFBr+F4+NSp3Rz
 Uoj0jEimhyj/jb/DGrjRuW77QGzPwESxe/krkMWJArCZGB4bj6QV8tRHAHijQ0Ib8msZ
 kN4A==
X-Gm-Message-State: AOJu0Yx3YBR44qZMwbm7zA5yAUbrzrSVw9f/ejcZCMwtXY8jnKzb7GHP
 nryogqLPszdSgzA5kv9Gcd3tfy0LKZgwOnccvKCEyaebkto=
X-Google-Smtp-Source: AGHT+IFlh/Oi4Rh9z2yexbUVp+/+hBYRZSKMbmJvkm1t1WKRzufF4OUG2BbIe7r4iun30lTocKIp+8mlYzXxvdOnkuE=
X-Received: by 2002:a17:90b:3648:b0:28b:6aa5:34a3 with SMTP id
 nh8-20020a17090b364800b0028b6aa534a3mr5032677pjb.60.1703165938655; Thu, 21
 Dec 2023 05:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20231221084723.2152034-1-hugues.fruchet@foss.st.com>
 <769a1510-f8d2-4095-9879-42f413141dee@gmail.com>
 <a240d2ac-db0e-481b-8d13-3ae76cfd2fe7@foss.st.com>
 <e5ba1e14-4bbf-43e3-933a-fee6d4b90641@gmail.com>
In-Reply-To: <e5ba1e14-4bbf-43e3-933a-fee6d4b90641@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 21 Dec 2023 07:38:47 -0600
Message-ID: <CAHCN7xJ3Ktn+TnoOYdnNvKTddGCfLp4OQ+gM0WonWj-aqnsGuA@mail.gmail.com>
To: Alex Bee <knaerzche@gmail.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgNzozMeKAr0FNIEFsZXggQmVlIDxrbmFlcnpjaGVAZ21h
aWwuY29tPiB3cm90ZToKPgo+IEhpIEh1Z3VlcywKPgo+IEFtIDIxLjEyLjIzIHVtIDE0OjA4IHNj
aHJpZWIgSHVndWVzIEZSVUNIRVQ6Cj4gPiBIaSBBbGV4LAo+ID4KPiA+IFRoaXMgaXMgYmVjYXVz
ZSBWREVDIGFuZCBWRU5DIGFyZSB0d28gc2VwYXJhdGVkIElQcyB3aXRoIHRoZWlyIG93bgo+ID4g
aGFyZHdhcmUgcmVzb3VyY2VzIGFuZCBubyBsaW5rcyBiZXR3ZWVuIGJvdGguCj4gPiBPbiBmdXR1
cmUgU29DcywgVkRFQyBjYW4gc2hpcCBvbiBpdHMgb3duLCBzYW1lIGZvciBWRU5DLgo+ID4KPiBJ
IHRoaW5rIHRoYXQncyB3aGF0IHRoZSBkcml2ZXIgaXMvd2FzIGRlc2lnbmVkIGZvciA6KQo+Cj4g
SSBkb24ndCAgdGhpbmsgdGhlcmUgX2hhc18gdG8gYmUgYSBsaW5rIGJldHdlZW4gdmFyaWFudHMg
aW4gdGhlIHNhbWUgZmlsZS4KPiBGb3IgUm9ja2NoaXAgd2Ugb25seSBoYWQgdGhlIGlzc3VlIHRo
YXQgdGhlcmUgX2lzXyBhIGxpbmsgKHNoYXJlZAo+IHJlc291cmNlcykgYmV0d2VlbiBlbmNvZGVy
IGFuZCBkZWNvZGVyIGFuZCB0aGV5IGhhZCAoZm9yIHRoYXQgcmVhc29uKSB0byBiZQo+IGRlZmlu
ZWQgaGFzIGEgX3NpbmdsZV8gdmFyaWFudC4gQW5kIHRoZXJlIGlzIG5vIHJlYXNvbiB5b3UgY2Fu
IHNoaXAgZGVjb2Rlcgo+IGFuZCBlbmNvZGVyIHNlcGVyYXRlZCB3aGVuIHlvdSBoYXZlIHR3byB2
YXJpYW50cyAod2l0aCBkaWZmZXJlbnQKPiBjb21wYXRpYmxlcykuCj4gRm9yIFJvY2tjaGlwIGFu
ZCBpTVggdGhvc2UgZmlsZXMgYXJlIGV2ZW4gY29udGFpbmluZyB2YXJpYW50cyBmb3IgY29tcGxl
dGx5Cj4gZGlmZmVyZW50IGdlbmVyYXRpb25zIC8gZGlmZmVyZW50IFNvQ3MuIEkgaGFkIHRvIGNs
ZWFudXAgdGhpcyBtZXNzIGZvcgoKVGhlIGkuTVg4TSBNaW5pIGFuZCBQbHVzIGhhdmUgZGlmZmVy
ZW50IHBvd2VyIGRvbWFpbnMgZm9yIGVuY29kZXIgYW5kCmRlY29kZXJzIGFzIHdlbGwgYXMgZGlm
ZmVyZW50IGNsb2Nrcy4gIEtlZXBpbmcgdGhlbSBzZXBhcmF0ZSB3b3VsZAphbG1vc3QgYmUgbmVj
ZXNzYXJ5LgoKYWRhbQoKPiBSb2NrY2hpcCBvbmNlIC0gYW5kIGl0IHdhcyBubyBmdW4gOikgQW55
d2F5czogSXQncyB1cCB0byB0aGUgbWFpbnRhaW5lcnMgSQo+IGd1ZXNzIC0gSSBqdXN0IHdhbnRl
ZCB0byBhc2sgaWYgSSBtaXNzdW5kZXJzdGFuZCBzb21ldGhpbmcgaGVyZS4KPgo+IEdyZWV0aW5n
cywKPgo+IEFsZXgKPgo+ID4gSG9waW5nIHRoYXQgdGhpcyBjbGFyaWZ5Lgo+ID4KPiA+IEJlc3Qg
cmVnYXJkcywKPiA+IEh1Z3Vlcy4KPiA+Cj4gPiBPbiAxMi8yMS8yMyAxMzo0MCwgQWxleCBCZWUg
d3JvdGU6Cj4gPj4gSGkgSHVndWVzLCBIaSBOaWNvbGFzLAo+ID4+Cj4gPj4gaXMgdGhlcmUgYW55
IHNwZWNpZmljIHJlYXNvbiBJJ20gbm90IHVuZGVyc3RhbmRpbmcgLyBzZWVpbmcgd2h5IHRoaXMK
PiA+PiBpcyBhZGRlZCBpbiB0d28gc2VwZXJhdGUgdmRlYyogLyB2ZW5jKiBmaWxlcyBhbmQgbm90
IGEgc2luZ2xlIHZwdSoKPiA+PiBmaWxlPyBJcyBpdCBvbmx5IGZvciB0aGUgc2VwZXJhdGUgY2xv
Y2tzICgtbmFtZXMpIC8gaXJxcyAoLW5hbWVzKSAvCj4gPj4gY2FsbGJhY2tzPyBUaG9zZSBhcmUg
ZGVmaW5lZCBwZXIgdmFyaWFudCBhbmQgcGVyZmVjdGx5IGZpdCBpbiBhCj4gPj4gc2luZ2xlIGZp
bGUgaG9sZGluZyBvbmUgdmRlYyBhbmQgb25lIHZlbmMgdmFyaWFudC4KPiA+Pgo+ID4+IEFsZXgK
PiA+Pgo+ID4+IEFtIDIxLjEyLjIzIHVtIDA5OjQ3IHNjaHJpZWIgSHVndWVzIEZydWNoZXQ6Cj4g
Pj4+IFRoaXMgcGF0Y2hzZXQgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBWREVDIHZpZGVvIGhhcmR3
YXJlIGRlY29kZXIKPiA+Pj4gYW5kIFZFTkMgdmlkZW8gaGFyZHdhcmUgZW5jb2RlciBvZiBTVE1p
Y3JvZWxlY3Ryb25pY3MgU1RNMzJNUDI1Cj4gPj4+IFNvQyBzZXJpZXMuCj4gPj4+Cj4gPj4+IFRo
aXMgaW5pdGlhbCBzdXBwb3J0IGltcGxlbWVudHMgSDI2NCBkZWNvZGluZywgVlA4IGRlY29kaW5n
IGFuZAo+ID4+PiBKUEVHIGVuY29kaW5nLgo+ID4+Pgo+ID4+PiBUaGlzIGhhcyBiZWVuIHRlc3Rl
ZCBvbiBTVE0zMk1QMjU3Ri1FVjEgZXZhbHVhdGlvbiBib2FyZC4KPiA+Pj4KPiA+Pj4gPT09PT09
PT09PT0KPiA+Pj4gPSBoaXN0b3J5ID0KPiA+Pj4gPT09PT09PT09PT0KPiA+Pj4gdmVyc2lvbiA1
Ogo+ID4+PiAgICAgLSBQcmVjaXNlIHRoYXQgdmlkZW8gZGVjb2RpbmcgYXMgYmVlbiBzdWNjZXNz
ZnVsbHkgdGVzdGVkIHVwIHRvCj4gPj4+IGZ1bGwgSEQKPiA+Pj4gICAgIC0gQWRkIE5pY29sYXMg
RHVmcmVzbmUgcmV2aWV3ZWQtYnkKPiA+Pj4KPiA+Pj4gdmVyc2lvbiA0Ogo+ID4+PiAgICAgLSBG
aXggY29tbWVudHMgZnJvbSBOaWNvbGFzIGFib3V0IGRyb3BwaW5nIGVuY29kZXIgcmF3IHN0ZXBz
Cj4gPj4+Cj4gPj4+IHZlcnNpb24gMzoKPiA+Pj4gICAgIC0gRml4IHJlbWFya3MgZnJvbSBLcnp5
c3p0b2YgS296bG93c2tpOgo+ID4+PiAgICAgIC0gZHJvcCAiaXRlbXMiLCB3ZSBrZWVwIHNpbXBs
ZSBlbnVtIGluIHN1Y2ggY2FzZQo+ID4+PiAgICAgIC0gZHJvcCBzZWNvbmQgZXhhbXBsZSAtIGl0
IGlzIHRoZSBzYW1lIGFzIHRoZSBmaXJzdAo+ID4+PiAgICAgLSBEcm9wIHVudXNlZCBub2RlIGxh
YmVscyBhcyBzdWdnZXN0ZWQgYnkgQ29ub3IgRG9vbGV5Cj4gPj4+ICAgICAtIFJldmlzaXQgbWlu
L21heCByZXNvbHV0aW9ucyBhcyBzdWdnZXN0ZWQgYnkgTmljb2xhcyBEdWZyZXNuZQo+ID4+Pgo+
ID4+PiB2ZXJzaW9uIDI6Cj4gPj4+ICAgICAtIEZpeCByZW1hcmtzIGZyb20gS3J6eXN6dG9mIEtv
emxvd3NraSBvbiB2MToKPiA+Pj4gICAgICAtIHNpbmdsZSB2aWRlby1jb2RlYyBiaW5kaW5nIGZv
ciBib3RoIFZERUMvVkVOQwo+ID4+PiAgICAgIC0gZ2V0IHJpZCBvZiAiLW5hbWVzIgo+ID4+PiAg
ICAgIC0gdXNlIG9mIGdlbmVyaWMgbm9kZSBuYW1lICJ2aWRlby1jb2RlYyIKPiA+Pj4KPiA+Pj4g
dmVyc2lvbiAxOgo+ID4+PiAgICAtIEluaXRpYWwgc3VibWlzc2lvbgo+ID4+Pgo+ID4+PiBIdWd1
ZXMgRnJ1Y2hldCAoNSk6Cj4gPj4+ICAgIGR0LWJpbmRpbmdzOiBtZWRpYTogRG9jdW1lbnQgU1RN
MzJNUDI1IFZERUMgJiBWRU5DIHZpZGVvIGNvZGVjcwo+ID4+PiAgICBtZWRpYTogaGFudHJvOiBh
ZGQgc3VwcG9ydCBmb3IgU1RNMzJNUDI1IFZERUMKPiA+Pj4gICAgbWVkaWE6IGhhbnRybzogYWRk
IHN1cHBvcnQgZm9yIFNUTTMyTVAyNSBWRU5DCj4gPj4+ICAgIGFybTY0OiBkdHM6IHN0OiBhZGQg
dmlkZW8gZGVjb2RlciBzdXBwb3J0IHRvIHN0bTMybXAyNTUKPiA+Pj4gICAgYXJtNjQ6IGR0czog
c3Q6IGFkZCB2aWRlbyBlbmNvZGVyIHN1cHBvcnQgdG8gc3RtMzJtcDI1NQo+ID4+Pgo+ID4+PiAg
IC4uLi9tZWRpYS9zdCxzdG0zMm1wMjUtdmlkZW8tY29kZWMueWFtbCAgICAgICB8ICA1MCArKysr
KysrKwo+ID4+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpICAgICAg
ICB8ICAxMiArKwo+ID4+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1NS5kdHNp
ICAgICAgICB8ICAxNyArKysKPiA+Pj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxp
Y29uL0tjb25maWcgICAgfCAgMTQgKystCj4gPj4+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92
ZXJpc2lsaWNvbi9NYWtlZmlsZSAgIHwgICA0ICsKPiA+Pj4gICAuLi4vbWVkaWEvcGxhdGZvcm0v
dmVyaXNpbGljb24vaGFudHJvX2Rydi5jICAgfCAgIDQgKwo+ID4+PiAgIC4uLi9tZWRpYS9wbGF0
Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faHcuaCAgICB8ICAgMiArCj4gPj4+ICAgLi4uL3BsYXRm
b3JtL3ZlcmlzaWxpY29uL3N0bTMybXAyNV92ZGVjX2h3LmMgIHwgIDkyICsrKysrKysrKysrKysr
Cj4gPj4+ICAgLi4uL3BsYXRmb3JtL3ZlcmlzaWxpY29uL3N0bTMybXAyNV92ZW5jX2h3LmMgIHwg
MTE1Cj4gPj4+ICsrKysrKysrKysrKysrKysrKwo+ID4+PiAgIDkgZmlsZXMgY2hhbmdlZCwgMzA3
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
Cj4gPj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMm1w
MjUtdmlkZW8tY29kZWMueWFtbAo+ID4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4+PiBkcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL3N0bTMybXAyNV92ZGVjX2h3LmMKPiA+Pj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+Pj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2ls
aWNvbi9zdG0zMm1wMjVfdmVuY19ody5jCj4gPj4+Cj4gPj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
