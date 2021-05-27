Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 238723936C2
	for <lists+linux-stm32@lfdr.de>; Thu, 27 May 2021 21:59:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA335C5718D;
	Thu, 27 May 2021 19:59:46 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16A55C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 May 2021 19:59:46 +0000 (UTC)
Received: from [192.168.192.146] (port=36442 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1lmMAD-0006Ov-L5; Thu, 27 May 2021 21:59:29 +0200
Date: Thu, 27 May 2021 21:59:28 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
Message-ID: <YK/6IHCBdIU3UBqs@nx64de-df6d00>
References: <YHH9+Xrn5Quge4Jt@nx64de-df6d00>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHH9+Xrn5Quge4Jt@nx64de-df6d00>
Cc: devicetree@vger.kernel.org, Grzegorz Szymaszek <gszymaszek@short.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Marcin =?utf-8?Q?S=C5=82oniewski?= <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix stm32mp157c-odyssey
	card detect pin
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

T24gU2F0LCBBcHIgMTAsIDIwMjEgYXQgMDk6MzU6MjFQTSArMDIwMCwgR3J6ZWdvcnogU3p5bWFz
emVrIHdyb3RlOgo+IFRoZSBtaWNyb1NEIGNhcmQgZGV0ZWN0IHBpbiBpcyBwaHlzaWNhbGx5IGNv
bm5lY3RlZCB0byB0aGUgTVBVIHBpbiBQSTMuCj4gVGhlIERldmljZSBUcmVlIGNvbmZpZ3VyYXRp
b24gb2YgdGhlIGNhcmQgZGV0ZWN0IHBpbiB3YXMgd3JvbmfigJRpdCB3YXMKPiBzZXQgdG8gcGlu
IFBCNyBpbnN0ZWFkLiBJZiBzdWNoIGNvbmZpZ3VyYXRpb24gd2FzIHVzZWQsIHRoZSBrZXJuZWwg
d291bGQKPiBoYW5nIG9uIOKAnFdhaXRpbmcgZm9yIHJvb3QgZGV2aWNl4oCdIHdoZW4gYm9vdGlu
ZyBmcm9tIGEgbWljcm9TRCBjYXJkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdyemVnb3J6IFN6eW1h
c3playA8Z3N6eW1hc3pla0BzaG9ydC5wbD4KPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDE1N2Mtb2R5c3NleS5kdHMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTU3Yy1vZHlzc2V5LmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLW9k
eXNzZXkuZHRzCj4gaW5kZXggYTdmZmVjOGYxNTE2Li5iZTFkZDVlOWU3NDQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS5kdHMKPiArKysgYi9hcmNo
L2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LmR0cwo+IEBAIC02NCw3ICs2NCw3IEBA
ICZzZG1tYzEgewo+ICAJcGluY3RybC0wID0gPCZzZG1tYzFfYjRfcGluc19hPjsKPiAgCXBpbmN0
cmwtMSA9IDwmc2RtbWMxX2I0X29kX3BpbnNfYT47Cj4gIAlwaW5jdHJsLTIgPSA8JnNkbW1jMV9i
NF9zbGVlcF9waW5zX2E+Owo+IC0JY2QtZ3Bpb3MgPSA8JmdwaW9iIDcgKEdQSU9fQUNUSVZFX0xP
VyB8IEdQSU9fUFVMTF9VUCk+Owo+ICsJY2QtZ3Bpb3MgPSA8JmdwaW9pIDMgKEdQSU9fQUNUSVZF
X0xPVyB8IEdQSU9fUFVMTF9VUCk+Owo+ICAJZGlzYWJsZS13cDsKPiAgCXN0LG5lZy1lZGdlOwo+
ICAJYnVzLXdpZHRoID0gPDQ+Owo+IC0tIAo+IDIuMzAuMgo+IAoKQSBnZW50bGUgcGluZy4gRldJ
VywgdGhlcmUgd2FzIGFub3RoZXIgcGF0Y2ggdGhhdCB3b3VsZCBkZWFsIHdpdGggdGhlCnNhbWUg
aXNzdWU6CjxodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vcGlwZXJtYWlsL2xp
bnV4LXN0bTMyLzIwMjEtQXByaWwvMDExMTMyLmh0bWw+LApidXQgaXQgdG9vayB0aGUgbW9yZSBy
YWRpY2FsIGFwcHJvYWNoIG9mIG9mIHJlcGxhY2luZyBjZC1ncGlvcyB3aXRoCmJyb2tlbi1jZC4K
Ci0tIApHcnplZ29yegpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
