Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DE67EF49E
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 15:35:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 049FAC6DD72;
	Fri, 17 Nov 2023 14:35:34 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA4EDC6B47B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 08:44:19 +0000 (UTC)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: andrzej.p)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 723766607383;
 Fri, 17 Nov 2023 08:44:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700210659;
 bh=7oMl9w52a+QB6ng2YsEmlurqeNPbyrAq7NcFSX0AaGg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=blqnPVJVM1ijAH1uLvVQcHlzHxsHtMNYmWcqpT4FYUVTCMhB+8mQ7aSTo/s6hwU9y
 +W9ySZMfe9yjZ180w1K6qeUc745ZefIqs82y166DEAnurQNlUQ/UHh59ROEd0nud2L
 0RsNbbhSk45lqbEQdI0EQ53sIrrPLXQHVjiox+XjdTbmWoDnfvRXzo3khK9Drjb5++
 Oscg/TfaSknQavekv3bl01hR3PQVgxYshQgll9ykmFItRbGvt7PQDwkaZ00N59biZv
 neoMSaReFr5HhpbRP4g+WwT8prAmQVYQCO5AlRW3fXOBfpzbinncMuK3L980tOaPRV
 H6sSEgOiJiZzA==
Message-ID: <0b16a22f-9d23-41d4-a106-a5a20b3f52c5@collabora.com>
Date: Fri, 17 Nov 2023 09:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20231116154816.70959-1-andrzej.p@collabora.com>
 <20231116154816.70959-4-andrzej.p@collabora.com>
 <CAGXv+5GhaF94ZRwrZ_CWg3j6bVYyEqZru9LM7ABDB29-cPhqSQ@mail.gmail.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <CAGXv+5GhaF94ZRwrZ_CWg3j6bVYyEqZru9LM7ABDB29-cPhqSQ@mail.gmail.com>
X-Mailman-Approved-At: Fri, 17 Nov 2023 14:35:32 +0000
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [RFC 3/6] media: verisilicon: Improve constant's
	name
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

SGksCgpUaGFua3MgZm9yIGxvb2tpbmcgYXQgaXQuCgpXIGRuaXUgMTcuMTEuMjAyMyBvwqAwNzox
MSwgQ2hlbi1ZdSBUc2FpIHBpc3plOgo+IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDExOjQ44oCv
UE0gQW5kcnplaiBQaWV0cmFzaWV3aWN6Cj4gPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiB3cm90
ZToKPj4KPj4gRm9yIFZQOCBCSVQoMTgpIG9mIHRoaXMgcmVnaXN0ZXIgaXMgZm9yIGVuYWJsaW5n
IHRoZSBib29sZWFuIGVuY29kZXIuCj4gCj4gWWVzLCBidXQgZm9yIEguMjY0IGl0IHNlbGVjdHMg
dGhlIGVudHJvcHkgY29kaW5nIG1vZGUsIDAgZm9yIENBVkxDCj4gYW5kIDEgZm9yIENBQkFDLiBZ
b3UgZXZlbiBhZGQgaXQgYmFjayBpbiB0aGUgbGFzdCBwYXRjaC4gSSdkIGRvIGl0Cj4gaGVyZSwg
c28geW91IGRpc2FtYmlndWF0ZSB0aGUgZGVmaW5pdGlvbiB3aXRoaW4gb25lIHBhdGNoLgo+IAoK
VGhlIHJhdGlvbmFsZSBiZWhpbmQgZG9pbmcgd2hhdCBJIGRpZCBpcyB0aGlzOgoKQXQgdGhpcyBt
b21lbnQgdGhlIEgxIEguMjY0IGVuY29kZXIgaXMgbm9uLWV4aXN0ZW50IGluIHRoZSBrZXJuZWws
CnNvIHdoeSB3b3VsZCB3ZSBrZWVwIEguMjY0LXJlbGF0ZWQgZGVmaW5pdGlvbnM/IEkgcmUtaW50
cm9kdWNlIGl0CndoZW4gdGhlIGVuY29kZXIgYXBwZWFycy4KClRoYXQgc2FpZCwgb3RoZXIgSC4y
NjQtc3BlY2lmaWMgY29uc3RhbnRzIGRvIGV4aXN0IGF0IHRoaXMgbW9tZW50IGFueXdheS4KU28g
SSdtIGZpbmUgd2l0aCBlaXRoZXIgYXBwcm9hY2guCgpBbmRyemVqCgo+IENoZW5ZdQo+IAo+IAo+
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJv
cmEuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hh
bnRyb19oMV9yZWdzLmggICAgfCAyICstCj4+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJp
c2lsaWNvbi9oYW50cm9faDFfdnA4X2VuYy5jIHwgMiArLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faDFfcmVncy5oIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faDFfcmVncy5oCj4+IGluZGV4IDc3NTJk
MTI5MWMwZS4uYzFjNjZjOTM0YTI0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL3ZlcmlzaWxpY29uL2hhbnRyb19oMV9yZWdzLmgKPj4gKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faDFfcmVncy5oCj4+IEBAIC03MCw3ICs3MCw3IEBA
Cj4+ICAgI2RlZmluZSAgICBIMV9SRUdfRU5DX0NUUkwyX0RJU0FCTEVfUVVBUlRFUl9QSVhNViAg
ICAgIEJJVCgyMikKPj4gICAjZGVmaW5lICAgIEgxX1JFR19FTkNfQ1RSTDJfVFJBTlM4WDhfTU9E
RV9FTiAgICAgICAgICAgQklUKDIxKQo+PiAgICNkZWZpbmUgICAgSDFfUkVHX0VOQ19DVFJMMl9D
QUJBQ19JTklUX0lEQyh4KSAgICAgICAgICAoKHgpIDw8IDE5KQo+PiAtI2RlZmluZSAgICBIMV9S
RUdfRU5DX0NUUkwyX0VOVFJPUFlfQ09ESU5HX01PREUgICAgICAgICAgICAgICAgQklUKDE4KQo+
PiArI2RlZmluZSAgICBIMV9SRUdfRU5DX0NUUkwyX1ZQOF9CT09MRU5DX0VOQUJMRSAgICAgICAg
IEJJVCgxOCkKPj4gICAjZGVmaW5lICAgIEgxX1JFR19FTkNfQ1RSTDJfSDI2NF9JTlRFUjRYNF9N
T0RFICAgICAgICAgQklUKDE3KQo+PiAgICNkZWZpbmUgICAgSDFfUkVHX0VOQ19DVFJMMl9IMjY0
X1NUUkVBTV9NT0RFICAgICAgICAgICBCSVQoMTYpCj4+ICAgI2RlZmluZSAgICBIMV9SRUdfRU5D
X0NUUkwyX0lOVFJBMTZYMTZfTU9ERSh4KSAgICAgICAgICgoeCkpCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19oMV92cDhfZW5jLmMgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19oMV92cDhfZW5jLmMKPj4g
aW5kZXggMDVhYTBkZDljMDljLi4wOGM1MDc5ZmJmZDAgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2gxX3ZwOF9lbmMuYwo+PiArKysgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19oMV92cDhfZW5jLmMKPj4g
QEAgLTEyMjYsNyArMTIyNiw3IEBAIHN0YXRpYyB2b2lkIGhhbnRyb19oMV92cDhfZW5jX3NldF9w
YXJhbXMoc3RydWN0IGhhbnRyb19kZXYgKnZwdSwgc3RydWN0IGhhbnRyb19jCj4+ICAgICAgICAg
IHJlZyA9IDA7Cj4+ICAgICAgICAgIGlmIChtYl93aWR0aCAqIG1iX2hlaWdodCA+IE1BWF9NQl9D
T1VOVF9UT19ESVNBQkxFX1FVQVJURVJfUElYRUxfTVYpCj4+ICAgICAgICAgICAgICAgICAgcmVn
ID0gSDFfUkVHX0VOQ19DVFJMMl9ESVNBQkxFX1FVQVJURVJfUElYTVY7Cj4+IC0gICAgICAgcmVn
IHw9IEgxX1JFR19FTkNfQ1RSTDJfRU5UUk9QWV9DT0RJTkdfTU9ERTsKPj4gKyAgICAgICByZWcg
fD0gSDFfUkVHX0VOQ19DVFJMMl9WUDhfQk9PTEVOQ19FTkFCTEU7Cj4+Cj4+ICAgICAgICAgIGlu
dGVyX2Zhdm9yID0gMTI4IC0gY3R4LT52cDhfZW5jLnByb2JfaW50cmE7Cj4+ICAgICAgICAgIGlm
IChpbnRlcl9mYXZvciA+PSAwKQo+PiAtLQo+PiAyLjI1LjEKPj4KPj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEtlcm5lbCBtYWlsaW5nIGxpc3Qg
LS0ga2VybmVsQG1haWxtYW4uY29sbGFib3JhLmNvbQo+IFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4g
ZW1haWwgdG8ga2VybmVsLWxlYXZlQG1haWxtYW4uY29sbGFib3JhLmNvbQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
