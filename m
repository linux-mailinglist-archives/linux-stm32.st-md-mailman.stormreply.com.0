Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8122349C87F
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 12:19:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ED07C5F1D5;
	Wed, 26 Jan 2022 11:19:51 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93E2CC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 11:19:50 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DC356100002;
 Wed, 26 Jan 2022 11:19:48 +0000 (UTC)
Date: Wed, 26 Jan 2022 12:19:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <20220126121947.79890a47@xps13>
In-Reply-To: <9662651a-12d9-4893-95c2-aa1a3a10302d@foss.st.com>
References: <20220105135734.271313-1-christophe.kerello@foss.st.com>
 <20220105135734.271313-4-christophe.kerello@foss.st.com>
 <3f9a9731-c096-bc9b-63df-bd1dff032737@linaro.org>
 <9662651a-12d9-4893-95c2-aa1a3a10302d@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 chenshumin86@sina.com
Subject: Re: [Linux-stm32] [PATCH 3/3] nvmem: core: Fix a conflict between
 MTD and NVMEM on wp-gpios property
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBX
ZWQsIDI2IEphbiAyMDIyIDEyOjA4OjM4ICswMTAwOgoKPiBIaSBTcmluaXZhcywgTWlxdWVsLAo+
IAo+IE9uIDEvMjUvMjIgMTE6NDQsIFNyaW5pdmFzIEthbmRhZ2F0bGEgd3JvdGU6Cj4gPiAKPiA+
IAo+ID4gT24gMDUvMDEvMjAyMiAxMzo1NywgQ2hyaXN0b3BoZSBLZXJlbGxvIHdyb3RlOiAgCj4g
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vY29yZS5jIGIvZHJpdmVycy9udm1lbS9jb3Jl
LmMKPiA+PiBpbmRleCBlNzY1ZDNkMDU0MmUuLmUxMWM3NGRiNjRmOSAxMDA2NDQKPiA+PiAtLS0g
YS9kcml2ZXJzL252bWVtL2NvcmUuYwo+ID4+ICsrKyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCj4g
Pj4gQEAgLTc2OSw3ICs3NjksNyBAQCBzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbV9yZWdpc3Rl
cihjb25zdCBzdHJ1Y3QgPj4gbnZtZW1fY29uZmlnICpjb25maWcpCj4gPj4gwqDCoMKgwqDCoCBp
ZiAoY29uZmlnLT53cF9ncGlvKQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCBudm1lbS0+d3BfZ3Bp
byA9IGNvbmZpZy0+d3BfZ3BpbzsKPiA+PiAtwqDCoMKgIGVsc2UKPiA+PiArwqDCoMKgIGVsc2Ug
aWYgKGNvbmZpZy0+cmVnX3dyaXRlKSAgCj4gPiBUaGlzIGlzIGNsZWFybHkgbm90IGdvaW5nIHRv
IHdvcmsgZm9yIGV2ZXJ5b25lLgo+ID4gCj4gPiBBIGZsYWcgaW4gbnZtZW1fY29uZmlnIHRvIGlu
ZGljYXRlIHRoYXQgd3AgZ3BpbyBpcyBtYW5hZ2VkIGJ5IHByb3ZpZGVyID4gZHJpdmVyIHdvdWxk
IGJlIHRoZSByaWdodCB0aGluZyB0byBkbyBoZXJlLiAgCj4gCj4gQmFzZWQgb24geW91ciBpbnB1
dHMsIEkgd2lsbCBhZGQgYSBuZXcgYm9vbGVhbiBmbGFnIGluIG52bWVuX2NvbmZpZyAocHJvcG9z
YWwgbmFtZTogc2tpcF93cF9ncGlvKSBhbmQgSSB3aWxsIHNldCBpdCB0byB0cnVlIGluIG10ZGNv
cmUuYyB3aGVuIG52bWVuX2NvbmZpZyBzdHJ1Y3R1cmUgaXMgaW5pdGlhbGl6ZWQuIEl0IHdpbGwg
YmUgcGFydCBvZiB0aGUgVjIuCgpGaW5lIGJ5IG1lLiBUaGFua3MgZm9yIHlvdXIgd29yayBvbiB0
aGlzLgoKPiAKPiBSZWdhcmRzLAo+IENocmlzdG9waGUgS2VyZWxsby4KPiAKPiA+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgbnZtZW0tPndwX2dwaW8gPSBncGlvZF9nZXRfb3B0aW9uYWwoY29uZmlnLT5k
ZXYsICJ3cCIsCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBHUElPRF9PVVRfSElHSCk7ICAKPiA+IAo+ID4gLS1zcmluaQo+ID4g
ICAKCkNoZWVycywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
