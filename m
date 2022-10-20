Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2137260608C
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Oct 2022 14:48:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C825BC64106;
	Thu, 20 Oct 2022 12:48:57 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 106BBC64101
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Oct 2022 12:48:56 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id i12so13421907qvs.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Oct 2022 05:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q1M+ZjygcTh+wQj/LaxDBpu7tJHisiKmS4wQI9QNJcE=;
 b=f70jO+rGeNbNXJzEkd45j6Ddwl2FJ+n3aWFgYESzO4HCa4/8nk+a1IpfagfnXXpfFS
 uAZ2YSiq6H4q7djpGDD+k+mZJQigOaOEGUBPc5N6ECV8WmJcYtZb8Ir2ocoNJOf24t7p
 I7NAMptGN6/CGe84jawcV62mxzbk3AFe1U0kSlOdnWllShr3cE83dRDn3mpaIRIwvvCR
 C6QiNQcZ00H9FGHVOkfj6L0KXjnTF0hqFFSbwsggf4pPKY19Mvi0sQ4+X95rVTOG2xpA
 xESOirAxOqMbK7lKhEFjTT+grQ8TY7roHA8p4OFWN6BJ4CMS1fUnsnHlpkA4mn4S5/eQ
 2OPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q1M+ZjygcTh+wQj/LaxDBpu7tJHisiKmS4wQI9QNJcE=;
 b=jvz4XTrItmEslU0VSNn3aMmyNVz2E+dT/KLjnAiSnQkHsPJyjJSTww5YA0p5I/wPLo
 +7XfYjn8BdU26jOIfSFCWT07jPGOImsKBorCKe2HwTN7gcRokPww+ih3aVGG696e+H9b
 YE2YrcWAG6vSH+zPx3MHIyq//CgKCmyveCdkOTZ2w5V8ktunFirOICT8k8IqMZN+t6I8
 z4GMl3FUP94XUZzDR2dGnqD1t/RfxcHse3nqS+MmpU79afZ4sSpom4MM+4wZjVpJPD3U
 swo5oTZBNFh2Oi3QQ4a7iJPwTq+EvdqShBclko43f51MU4UVrIPbT9NodNH1WThKCpQI
 YbAQ==
X-Gm-Message-State: ACrzQf11dBH89vxwdfVzXBPkCckn00CeABWrkwZvG3etMBwdGUNh3ivv
 x+W/wXHOAkf5rEVQU7LNMCIj1Q==
X-Google-Smtp-Source: AMsMyM7I9aV/f95bj7v+lreXR9VyQcLP8Abt+ZwUvcSxkF81/hwGk36S5tUn8jCXLGR9ascLThvvEg==
X-Received: by 2002:a0c:e1c6:0:b0:4af:aa3c:987c with SMTP id
 v6-20020a0ce1c6000000b004afaa3c987cmr11230613qvl.60.1666270134922; 
 Thu, 20 Oct 2022 05:48:54 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net.
 [72.83.177.149]) by smtp.gmail.com with ESMTPSA id
 dm10-20020a05620a1d4a00b006bb87c4833asm7232789qkb.109.2022.10.20.05.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 05:48:53 -0700 (PDT)
Message-ID: <730eec7e-deb2-2d04-6ba9-132a41ebed58@linaro.org>
Date: Thu, 20 Oct 2022 08:48:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
References: <20221014172324.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid>
 <7ada410d-8d13-b29a-869c-3f5d032528bf@linaro.org>
 <4d113cfd-4c22-780e-2a13-48ca0e2b28ab@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4d113cfd-4c22-780e-2a13-48ca0e2b28ab@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: add new stm32mp13
 compatible for stm32-romem
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

T24gMTkvMTAvMjAyMiAxMzoyMywgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBP
biAxMC8xOC8yMiAwMzo1NiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMTQvMTAv
MjAyMiAxMToyMywgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPj4+IEFkZCBhIG5ldyBjb21wYXRp
YmxlIGZvciBzdG0zMm1wMTMgc3VwcG9ydC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNr
IERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+Pj4gLS0tCj4+Pgo+Pj4g
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3RtMzItcm9tZW0u
eWFtbCB8IDEgKwo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3N0LHN0
bTMyLXJvbWVtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0v
c3Qsc3RtMzItcm9tZW0ueWFtbAo+Pj4gaW5kZXggNDQ4YTI2NzhkYzYyLi4xNmY0Y2FkMmZhNTUg
MTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0v
c3Qsc3RtMzItcm9tZW0ueWFtbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL252bWVtL3N0LHN0bTMyLXJvbWVtLnlhbWwKPj4+IEBAIC0yMiw2ICsyMiw3IEBAIHBy
b3BlcnRpZXM6Cj4+PiAgICAgY29tcGF0aWJsZToKPj4+ICAgICAgIGVudW06Cj4+PiAgICAgICAg
IC0gc3Qsc3RtMzJmNC1vdHAKPj4+ICsgICAgICAtIHN0LHN0bTMybXAxMy1ic2VjCj4+PiAgICAg
ICAgIC0gc3Qsc3RtMzJtcDE1LWJzZWMKPj4gQWNjb3JkaW5nIHRvIHVzYWdlIGluIERUUyAoc2Vw
YXJhdGUgcGF0Y2ggZm9yIHNvbWUgcmVhc29uKSwgdGhlIGRldmljZXMKPj4gYXJlIGNvbXBhdGli
bGUsIHNvIHBsZWFzZSBkZXNjcmliZSB0aGVtIGxpa2UgdGhhdC4KPiAKPiAKPiBJIHB1c2ggdGhl
IHNlcGFyYXRlIHBhdGNoICJBUk06IGR0czogc3RtMzJtcDEzOiBmaXggY29tcGF0aWJsZSBmb3Ig
QlNFQyIKPiAKPiBJdCBpcyBhIGFkdmljZSBvZiBteSBjb2xsZWFndWVzOiBzZW5kIGFuIHVwZGF0
ZSBvZiBkZXZpY2UgdHJlZQo+IAo+IG9ubHkgd2hlbiB0aGUgYmluZGluZyBtb2RpZmljYXRpb24g
aXMgYWNrZWQuCgpUaGF0J3Mgbm90IGNvcnJlY3QgYWR2aWNlIC0gb25seSBmb3IgZmV3IGNhc2Vz
IGl0J3MgdmFsaWQgKHdoZW4Kc3Vic3lzdGVtIG1haW50YWluZXIgd2FudHMgdG8gdGFrZSBlbnRp
cmUgcGF0Y2hzZXQsIHNvIHRoZXJlIHNob3VsZCBiZQpubyBEVFMgaW5zaWRlKS4gV2Ugd2FudCB0
byBzZWUgdGhlIGJpbmRpbmdzIGFuZCBpdHMgdXNhZ2UsIHNvIG9uZSBvZjoKMS4gdGhlIHNhbWUg
cGF0Y2hzZXQKMi4gaWYgdHdvIHBhdGNoc2V0cywgdGhlbiBjcm9zcyBsaW5rZWQgdG8gZWFjaCBv
dGhlciB3aXRoIFVSTHMgdG8KbG9yZS5rZXJuZWwub3JnLiBJIHNlZSBEVFMgaGFkIGxpbmsgYnV0
IG5vdCB0aGlzIG9uZS4KCkRyaXZlciBjaGFuZ2VzIGFsc28gbXVzdCBiZSBzZW50IHRvZ2V0aGVy
IHdpdGggdGhlIGJpbmRpbmdzLiBTaW5jZSB0aGVyZQphcmUgbm8gZHJpdmVyIGNoYW5nZXMgaGVy
ZSwgaXQgbWVhbnMgZm9yIHVzIHRoZSBkZXZpY2VzIGFyZSBjb21wYXRpYmxlCmZyb20gTGludXgg
cG9pbnQgb2Ygdmlldy4KCj4gCj4gCj4gU29ycnkgZm9yIGRpc3R1cmJhbmNlLCBJIGNhbiBzZW50
IGEgVjIgd2l0aCB0aGUgMiBwYXRjaGVzLgo+IAo+IAo+IFRoZSBTVE0zMk1QMTUgYW5kIFNUTTMy
TVAxMyBkb24ndCB1c2UgdGhlIHNhbWUgdmVyc2lvbiBvZiB0aGUgQlNFQyBkZXZpY2UsCj4gCj4g
YW5kIHRoZSBkcml2ZXIgbmVlZCB0byBoYW5kbGUgaXQuCj4gCj4gCj4gSW4gdGhlc2UgMiBwYXRj
aGVzOgo+IAo+IC0gW1BBVENIXSBkdC1iaW5kaW5nczogbnZtZW06IGFkZCBuZXcgc3RtMzJtcDEz
IGNvbXBhdGlibGUgZm9yIHN0bTMyLXJvbWVtCj4gCj4gLSBbUEFUQ0hdIEFSTTogZHRzOiBzdG0z
Mm1wMTM6IGZpeCBjb21wYXRpYmxlIGZvciBCU0VDCj4gCj4gCj4gSSBmaXggYSBlcnJvciBmb3Ig
QlNFQyBub2RlIGluIHRoZSBpbml0aWFsIHBhdGNoIHRvIHN1cHBvcnQgU1RNMzJNUDEzeCwKClRo
ZSBxdWVzdGlvbiBpcyB0aGVuIHdoZXRoZXIgZGV2aWNlIHdhcyB3b3JraW5nIGJlZm9yZSBvciBu
b3QuIElmIGl0IHdhcwp3b3JraW5nLCB5b3UgZml4IG9uZSBlcnJvciBidXQgYnJlYWsgRFRTIHVz
YWdlIG9uIGFueSBzeXN0ZW0gd2hpY2ggZG9lcwpub3QgaGF2ZSB1cGRhdGVkIGRyaXZlciAoc28g
QlNELCB1LWJvb3QsIG90aGVyIGZpcm13YXJlLCBvdGhlciBMaW51eAprZXJuZWwgdmVyc2lvbnMp
LgoKSWYgaXQgd2FzIG5vdCB3b3JraW5nLCB0aGVuIGl0J3Mgb2theSwgYnV0IHN1Y2ggY2FzZSB3
YXMgbm90IGV4cGxhaW5lZAppbiBEVFMgcGF0Y2gsIEkgdGhpbmsuCgo+IAo+IHRoZSBEVFMgInN0
bTMybXAxMzEuZHRzaSIgc2hvdWxkIG5vdCB1c2VkL2FjY2VwdGVkIHdpdGggdGhlIGEgQlNFQyBu
b2RlIAo+IHVzaW5nCj4gCj4gdGhlIGNvbXBhdGlibGUgInN0LHN0bTMybXAxNS1ic2VjIiBpbiBj
b21taXQgMWRhODc3OWMwMDI5ICgiQVJNOiBkdHM6IAo+IHN0bTMyOiBhZGQgU1RNMzJNUDEzIFNv
Q3Mgc3VwcG9ydCIpCj4gCj4gCj4gSXQgaXMgYSBwcmVsaW1pbmFyeSBzdGVwIHRvIGFkZCBzdXBw
b3J0IG9mIFNUTTMyTVAxM3ggaW4gU1RNMzIgUk9NRU0gZHJpdmVyLgo+IAo+IAo+IEkgZG9uJ3Qg
aW5kaWNhdGUgdGhlc2UgcGF0Y2hlcyBhcyAiRml4ZXM6IiB0byBhdm9pZCBhIGR0cyBjaGVjayBp
c3N1ZQo+IAo+IGlmIG9ubHkgdGhlIERUUyBwYXRjaCB3YXMgYmFja3BvcnRlZC4KPiAKPiAKPiBU
b2RheSBpdCBub3QgYmxvY2tpbmcgZm9yIFNUTTMyTVAxM3ggdXNlcnMgYmVjYXVzZSB0aGlzIFNv
QyBpcyBub3QgeWV0IAo+IGF2YWlsYWJsZSBmb3IgY3VzdG9tZXJzCj4gCj4gYW5kIGl0IGlzIG9u
bHkgdXNlZCBpbnRlcm5hbGx5IG9uIHRoZSBTVCBNaWNyb2VsZWN0cm9uaWNzIGJvYXJkIAo+IFNU
TTMyTVAxMzVGLURLLgoKRFRTIHBhdGNoIHNheXMgbm90aGluZyBhYm91dCBpdC4uLgoKPiAKPiAK
PiBOb2JvZHkgKGV4Y2VwdCBTVE1pY3JvZWxlY3Ryb25pY3MpIHVzZSB0aGlzIFNvQ8KgIFNUTTMy
TVAxM3ggd2l0aCB0aGUgCj4gY3VycmVudCBEVFMgLyBMaW51eCB2ZXJzaW9uLgo+IAo+IAo+IE1v
cmVvdmVyLCBieSBkZWZhdWx0LCB0aGUgU1RNMzIgUk9NRU0gZHJpdmVyIGluIG5vdCBhY3RpdmF0
ZWQgaW4gYW55IAo+IGRlZmNvbmZpZywKCkluZGVwZW5kZW50IGlzc3VlLgoKPiAKPiBJIHByZXBh
cmUgYSBvdGhlciBwYXRjaCB0byBhY3RpdmF0ZWQgaXQgYnkgZGVmYXVsdCBpbiBhcm1fbXVsdGl2
N19kZWZjb25maWcuCj4gCj4gYnV0IEkgYW0gd2FpdGluZyB0aGlzIERUUyBjb3JyZWN0aW9uIHRv
IGF2b2lkIHRvIHByb2JlIHRoZSBzdG0zMiByb21lbiAKPiBkcml2ZXIgd2l0aCBTVE0zMk1QMTUK
PiAKPiBjb25maWd1cmF0aW9uIG9uIFNUTTMyTVAxM3ggU29DLgo+IAo+IAo+IEkgdGhpbmsgaXMg
YSBnb29kIHRpbWUgdG8gdXBkYXRlIHRoaXMgRFRTIGVycm9yIGJlZm9yZSB0aGUgU29DIGF2YWls
YWJpbGl0eSwKPiAKPiBhZ3JlZWQgd2l0aCBTb0MgTWFpbnRhaW5lciwgQWxleGFuZHJlIFRvcmd1
ZSwgZXZlbiBpZiB0aGlzIHBhdGNoIGJyZWFrcyAKPiBzdXJyZW50IHVzZXJzCj4gCj4gb2YgU1RN
MzJNUDEzeCBEVFMgKGJ1dCBpdCBpcyBvbmx5IGludGVybmFscyB1c2VyIFNUTWljcm9lbGVjdHJv
bmljcyAKPiB1bnRpbCBub3cpLgo+IAo+IAo+IGJ1dCBwZXJoYXBzIHlvdSBwcmVmZXIgYSBvdGhl
ciBzb2x1dGlvbiA/CgpXaXRoIHRoYXQgZXhwbGFuYXRpb24gaXQgaXMgZmluZSwgYnV0IHRoZSBE
VFMgY29tbWl0IHdhcyBub3QgbWVudGlvbmluZwpleHBsYW5hdGlvbi4KCj4gCj4gYWRkIEZpeGVz
IGluIHRoZSBEVFMgcGF0Y2ggPwo+IAo+ICsgRml4ZXM6IDFkYTg3NzljMDAyOSAoIkFSTTogZHRz
OiBzdG0zMjogYWRkIFNUTTMyTVAxMyBTb0NzIHN1cHBvcnQiKQo+IAo+IG9yCj4gCj4gCj4gIMKg
wqDCoCDCoMKgwqAgYnNlYzogZWZ1c2VANWMwMDUwMDAgewo+ICDCoMKgwqAgwqDCoMKgIMKgwqDC
oCBjb21wYXRpYmxlID0gInN0LHN0bTMybXAxMy1ic2VjIiwgInN0LHN0bTMybXAxNS1ic2VjIjsK
CgpEZXBlbmRzIHdoZXRoZXIgZGV2aWNlcyBhcmUgY29tcGF0aWJsZSBvciBub3QuCgpCZXN0IHJl
Z2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
