Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 501631C8B88
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 14:58:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 143DCC3F949;
	Thu,  7 May 2020 12:58:04 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA993C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 12:58:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49HtmT12g8z1rxbg;
 Thu,  7 May 2020 14:58:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49HtmT0JHtz1qtwC;
 Thu,  7 May 2020 14:58:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id O59GV7mkA03e; Thu,  7 May 2020 14:57:59 +0200 (CEST)
X-Auth-Info: 2eFNAvj3gqcF/NuZ7TI8cUcb7hVGFTld8y1L23hxGHM=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  7 May 2020 14:57:59 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200429163743.67854-1-marex@denx.de>
 <20200429163743.67854-10-marex@denx.de>
 <2c4b1332-7bde-8c7e-91d2-fee62b7299e6@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <b1e84edd-ec40-af64-b73e-6deb7ce7291b@denx.de>
Date: Thu, 7 May 2020 14:57:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2c4b1332-7bde-8c7e-91d2-fee62b7299e6@st.com>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 10/12] ARM: dts: stm32: Add bindings for
	SPI2 on AV96
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

T24gNS83LzIwIDI6NTMgUE0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4gSGkgTWFyZWsKPiAK
PiBPbiA0LzI5LzIwIDY6MzcgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBBZGQgU1BJMiBiaW5k
aW5ncyB0byBBVjk2IERULCB0aGUgU1BJMiBJT3MgYXJlIHByZXNlbnQgb24KPj4gbG93LXNwZWVk
IGV4cGFuc2lvbiBjb25uZWN0b3IgWDYuIFRoaXMgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdAo+PiBh
bmQgY2FuIGJlIGVuYWJsZWQgaWYgc29tZXRoaW5nIGlzIGNvbm5lY3RlZCB0aGVyZS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+IENjOiBBbGV4YW5k
cmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4KPj4gQ2M6IE1hbml2YW5uYW4gU2Fk
aGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+Cj4+IENjOiBNYXhpbWUg
Q29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4+IENjOiBQYXRyaWNlIENob3Rh
cmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+Cj4+IENjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRy
aWNrLmRlbGF1bmF5QHN0LmNvbT4KPj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KPj4gVG86IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
PiAtLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2EtYXZlbmdlcjk2LmR0cyB8
IDkgKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWF2ZW5nZXI5Ni5kdHMK
Pj4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1hdmVuZ2VyOTYuZHRzCj4+IGluZGV4
IDcyY2EyODI4OThlYi4uYTlmM2JhOWRhMTcwIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3YS1hdmVuZ2VyOTYuZHRzCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdhLWF2ZW5nZXI5Ni5kdHMKPj4gQEAgLTU1MSw2ICs1NTEsMTUgQEAgYnJjbWY6
IGJjcm1mQDEgewo+PiDCoMKgwqDCoMKgIH07Cj4+IMKgIH07Cj4+IMKgICsmc3BpMiB7Cj4+ICvC
oMKgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4gK8KgwqDCoCBwaW5jdHJsLTAgPSA8
JnNwaTJfcGluc19hPjsKPj4gK8KgwqDCoCBjcy1ncGlvcyA9IDwmZ3Bpb2kgMCAwPjsKPj4gK8Kg
wqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiArwqDCoMKgIC9kZWxldGUtcHJvcGVydHkvZG1h
czsKPj4gK8KgwqDCoCAvZGVsZXRlLXByb3BlcnR5L2RtYS1uYW1lczsKPj4gK307Cj4+ICsKPj4g
wqAgJnVhcnQ0IHsKPj4gwqDCoMKgwqDCoCAvKiBPbiBMb3cgc3BlZWQgZXhwYW5zaW9uIGhlYWRl
ciAqLwo+PiDCoMKgwqDCoMKgIGxhYmVsID0gIkxTLVVBUlQxIjsKPj4KPiAKPiBTb3JyeSBJIChh
Z2FpbikgbG9zdCB0aGUgY292ZXItbGV0dGVyIChJIG5lZWQgdG8gYmV0dGVyIGNvbmZpZ3VyZSBt
eQo+IG1haWxlcikgc28gSSByZXBvbmQgb24gdGhpcyBwYXRjaCBvbmx5Lgo+IAo+IEFzIGRpc2N1
c3NlZCwgcGF0Y2ggMSB0byAxMCBoYXZlIGJlZW4gYXBwbGllZCBvbiBzdG0zMi1uZXh0Lgo+IFBh
dGNoZXMgMTEvMTIgaGF2ZSBiZWVuIGRyb3BwZWQgd2FpdGluZyBmb3Igb24gdXBkYXRlLgoKVGhh
bmsgeW91IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
