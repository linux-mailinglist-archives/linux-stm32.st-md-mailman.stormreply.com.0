Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5F36B251C
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 14:19:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EC72C6A60C;
	Thu,  9 Mar 2023 13:19:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B472FC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 13:19:28 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D29391BF203;
 Thu,  9 Mar 2023 13:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1678367968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCS0grjDle8LqIHXYUqxgW9dQGLLuD8q9UNKbRuhYbk=;
 b=Xwei8LaM7A3PtmP2nNF4x28yyM+iJOS9s9PrMxCrGzZC58KjSVM8cHaBeXrAZI/NtfH/9j
 r01nhfdqw3Y5E4seWycsQrKTDFGGLW5n7wwD+gr+9XPRGo17l49ulVlJXO+zEXIj6W/wVp
 xHnGPGBF0BnN6CjB6Mu7s0CWOOvq/3wpWShvMBXpv9A0NVrQOjh4c49bXdwQz2Qj8hWt33
 zxizmlPdNsdJMSab2n/Xqmakf0DwsfvgnyFw9d/JVszhf957LuH1cfuu0MN5C7gxIvLwp6
 eigmkj5aTAo76n4kZiDx68XnLa0GLX9JeCOa/Bk5Ds7ImdmzV7EC+0ot+vZz3Q==
Date: Thu, 9 Mar 2023 14:19:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <20230309141920.1d3f774e@xps-13>
In-Reply-To: <e845b38c-d0eb-716c-dc51-b89582750f07@gmail.com>
References: <20230309112028.19215-1-zajec5@gmail.com>
 <20230309123513.43b7134f@xps-13>
 <e845b38c-d0eb-716c-dc51-b89582750f07@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Evgeniy Polyakov <zbr@ioremap.net>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Richard Weinberger <richard@nod.at>, Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Vincent Shih <vincent.sunplus@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Walle <michael@walle.cc>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH V3] nvmem: add explicit config option to
 read OF fixed cells
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDkgTWFyIDIwMjMgMTM6
MDE6MTkgKzAxMDA6Cgo+IE9uIDkuMDMuMjAyMyAxMjozNSwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oIGIvaW5jbHVk
ZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4gPj4gaW5kZXggMDI2MmI4NjE5NGViLi5iM2MxNGNl
ODdhNjUgMTAwNjQ0Cj4gPj4gLS0tIGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4g
Pj4gKysrIGIvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4gPj4gQEAgLTczLDYgKzcz
LDcgQEAgc3RydWN0IG52bWVtX2NlbGxfaW5mbyB7Cj4gPj4gICAgKiBAb3duZXI6CVBvaW50ZXIg
dG8gZXhwb3J0ZXIgbW9kdWxlLiBVc2VkIGZvciByZWZjb3VudGluZy4KPiA+PiAgICAqIEBjZWxs
czoJT3B0aW9uYWwgYXJyYXkgb2YgcHJlLWRlZmluZWQgTlZNRU0gY2VsbHMuCj4gPj4gICAgKiBA
bmNlbGxzOglOdW1iZXIgb2YgZWxlbWVudHMgaW4gY2VsbHMuCj4gPj4gKyAqIEB1c2VfZml4ZWRf
b2ZfY2VsbHM6CVJlYWQgZml4ZWQgTlZNRU0gY2VsbHMgZnJvbSBPRi4gIAo+ID4gCj4gPiBJJ20g
c3RpbGwgdW5oYXBweSB3aXRoIHRoZSBuYW1pbmcsIGVzcGVjaWFsbHkgc2luY2UgeW91IGV4cGxh
aW5lZCBpbgo+ID4gbW9yZSBkZXRhaWxzIHRoZSB3aG9sZSBwbGFuIHdoaWNoIGludm9sdmVzIHVz
aW5nIGEgY29udGFpbmVyIHRvIHB1dAo+ID4gdGhlc2UgZml4ZWQgY2VsbHMgZnJvbSBub3cgb24u
IEluIGJvdGggY2FzZXMgeW91IGV4dHJhY3QgY2VsbHMgZnJvbQo+ID4gZml4ZWQgT0Ygbm9kZXMg
YnV0IHRoaXMgYm9vbGVhbiBuZWVkcyB0byBiZSBzZXQgdG8gdHJ1ZSBpbiBvbmUKPiA+IGNhc2Us
IGFuZCBmYWxzZSBpbiB0aGUgb3RoZXIsIHdoaWNoIHdvdWxkIG5vdCBtYWtlIHNlbnNlLgo+ID4g
Cj4gPiBBbHNvLCByZWdhcmRpbmcgdGhlIGJpbmRpbmdzIGNoYW5nZXMsIEknbSBmYWlybHkgaGFw
cHkgd2l0aCB0aGUgaWRlYSwKPiA+IGJ1dCBpZiB3ZSBnbyB0aGlzIHdheSBJIHdvdWxkIHByZWZl
ciBhIGZ1bGwgc2VyaWVzIGluc3RlYWQgb2YKPiA+IGluZGl2aWR1YWwgY2hhbmdlcyB3aXRoOgo+
ID4gCj4gPiAtIHRoZSBib29sZWFuIHlvdSBpbnRyb2R1Y2UgaGVyZSAocmVuYW1lZCwgYXQgdGhl
IHZlcnkgbGVhc3QpCj4gPiAtIHRoZSBuZXcgYmluZGluZ3MgIAo+IAo+IEkgYXNzdW1lIHlvdSBt
ZWFuIGZpeGVkLWxheW91dC55YW1sPwoKWWVzIQoKPiA+IC0gdGhlIHVwZGF0ZSBvZiB0aGUgY3Vy
cmVudCBwcm92aWRlciBiaW5kaW5ncyB0byB0YWtlIHRoZSBuZXcgYmluZGluZ3MKPiA+ICAgIGlu
dG8gYWNjb3VudCBhbmQgZGVwcmVjYXRlIHRoZSBvbGQgb25lcyBvZmZpY2lhbGx5ICAKPiAKPiBX
aGF0IGhhcyB0byBiZSB1cGRhdGVkIGluIGN1cnJlbnQgcHJvY2Vkcz8gSXQgc2VlbXMgdG8gbWUg
dGhhdDoKPiAxLiBDdXJyZW50IE5WTUVNIHByb3ZpZGVycyByZWZlcmVuY2UgbnZtZW0ueWFtbAo+
IDIuIG52bWVtLnlhbWwgcmVmZXJlbmNlcyBudm1lbS1sYXlvdXQueWFtbAo+IDMuIG52bWVtLWxh
eW91dC55YW1sIHJlZmVyZW5jZXMgZml4ZWQtbGF5b3V0LnlhbWwKPiAKPiB3aGF0IGVsc2UgaXMg
bWlzc2luZz8KClRoYXQncyB0aGUgdGhlb3J5LCBidXQgdGhlbiBwcm92aWRlciBiaW5kaW5ncyBz
aG91bGQgcmVmbGVjdCB0aGUKY2hhbmdlcyBhcyB3ZWxsIGluIHRoZWlyIG93biBiaW5kaW5nIGRv
Y3VtZW50cy4KCklPVywgdGhpcyBvbmUgKGFuZCBhbGwgaXRzIGNvdXNpbnMpIGJlY29tZXMgbGVn
YWN5IGFuZCBtdXN0IGJlIHVwZGF0ZWQ6CgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC9sYXRlc3Qvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9p
bXgtb2NvdHAueWFtbCNMOTIKCihhbmQgdGhlcmUgYXJlIG1hbnkgZmlsZXMgdG8gdXBkYXRlIHRo
ZW4pCgo+IAo+IAo+ID4gLSBzdXBwb3J0IGZvciB0aGUgbmV3IGJpbmRpbmdzIGluIHRoZSBjb3Jl
ICAKPiAKPiBQbGVhc2UsIGRvbid0IGdldCBtZSB3cm9uZywgYnV0IEknbSBub3QgZ29pbmcgdG8g
c3BlbmQgbW9yZSBob3VycyBvbgo+IGFjdHVhbCBjb2Rpbmcgd2l0aG91dCBhcHByb3ZhbCBvZiBj
aG9zZW4gcGF0aC4KCldlbGwsIHlvdSB3YW50IHRvIG1ha2UgdGhlIGJpbmRpbmdzIGV2b2x2ZS4g
SnVzdCB1cGRhdGluZyBhIHNpbmdsZQpiaW5kaW5nIGZpbGUgaXMgbm90IGVub3VnaCwgSSBiZWxp
ZXZlIHdlIHNob3VsZCBhdCBsZWFzdCBwcm92aWRlIGZ1bGwKc3VwcG9ydCBmb3IgdGhlIG5ldyBk
ZXNjcmlwdGlvbi4gQnV0IG9mIGNvdXJzZSBJJ20gZmluZSBkaXNjdXNzaW5nIHdoYXQKZGVzY3Jp
cHRpb24gd2Ugd2FudCBmaXJzdC4KCj4gSSdsbCBuZWVkIHRvIGhhdmUKPiBbUEFUQ0ggVjJdIGR0
LWJpbmRpbmdzOiBudm1lbTogbGF5b3V0czogYWRkIGZpeGVkLWxheW91dAo+IHJldmlld2VkL2Fj
a2VkIGZpcnN0LiBJZiB5b3UgY2FuIGRvIHRoYXQgdGhhdCdzIGdyZWF0Lgo+IAo+IAo+ID4+ICAg
ICogQGtlZXBvdXQ6CU9wdGlvbmFsIGFycmF5IG9mIGtlZXBvdXQgcmFuZ2VzIChzb3J0ZWQgYXNj
ZW5kaW5nIGJ5IHN0YXJ0KS4KPiA+PiAgICAqIEBua2VlcG91dDoJTnVtYmVyIG9mIGVsZW1lbnRz
IGluIHRoZSBrZWVwb3V0IGFycmF5Lgo+ID4+ICAgICogQHR5cGU6CVR5cGUgb2YgdGhlIG52bWVt
IHN0b3JhZ2UKPiA+PiBAQCAtMTAzLDYgKzEwNCw3IEBAIHN0cnVjdCBudm1lbV9jb25maWcgewo+
ID4+ICAgCXN0cnVjdCBtb2R1bGUJCSpvd25lcjsKPiA+PiAgIAljb25zdCBzdHJ1Y3QgbnZtZW1f
Y2VsbF9pbmZvCSpjZWxsczsKPiA+PiAgIAlpbnQJCQluY2VsbHM7Cj4gPj4gKwlib29sCQkJdXNl
X2ZpeGVkX29mX2NlbGxzOwo+ID4+ICAgCWNvbnN0IHN0cnVjdCBudm1lbV9rZWVwb3V0ICprZWVw
b3V0Owo+ID4+ICAgCXVuc2lnbmVkIGludAkJbmtlZXBvdXQ7Cj4gPj4gICAJZW51bSBudm1lbV90
eXBlCQl0eXBlOyAgCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwgIAo+IAoKClRoYW5rcywK
TWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
