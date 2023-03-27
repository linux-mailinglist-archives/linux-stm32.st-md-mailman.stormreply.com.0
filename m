Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E146CA197
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 12:43:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DFD8C6905A;
	Mon, 27 Mar 2023 10:43:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 835A4C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 10:43:15 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E91B5E0009;
 Mon, 27 Mar 2023 10:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1679913795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mq3au7tx9bpvb0kny92KW5V+FEUINAGvXJjvAKrCa6I=;
 b=pTSYk9flkxtggRnAAMuEA+CmCNzdRs8EdTgeg4n2cRjlHnYujmuFf0cMFpysnMlfKNL/5P
 CJTVUYuxQyDbwPy/FZoZy1cHHy2vGBtlnQ4ziqRpfiNIoXFBsQLtKLSMPozE9xyd93sI9e
 KV1UXAlY8RBj4pM4+emy03nOjnikD30pWAegnE87XXhROq1SxdBHVyQ2hf1ov9wixB7Wuf
 pi/7hcEBFGDY7f9yDlLLTAKOwTRouaPoE8wUY51e3fKAqSS+Kev97yy5gTVlxrKeUfWoT3
 2N2N5wjc3tLFMO2lbt7pW1Eq4Yhh+i/Rjurr7WLZ2tjw1h73hKJfK+hSYEUUwA==
Date: Mon, 27 Mar 2023 12:43:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Message-ID: <20230327124313.1ccd3d66@xps-13>
In-Reply-To: <75dcd205-5432-7103-370c-d65d792631ea@linaro.org>
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
 <20230327094742.38856-3-christophe.kerello@foss.st.com>
 <75dcd205-5432-7103-370c-d65d792631ea@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/2] mtd: rawnand: stm32_fmc2: use
 timings.mode instead of checking tRC_min
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAyNyBNYXIg
MjAyMyAxMTozMDo1MSArMDEwMDoKCj4gT24gMy8yNy8yMyAxMDo0NywgQ2hyaXN0b3BoZSBLZXJl
bGxvIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBpcyB1c2luZyB0aW1pbmdzLm1vZGUgdmFsdWUgaW5z
dGVhZCBvZiBjaGVja2luZyB0UkNfbWluIHRpbWluZwo+ID4gZm9yIEVETyBtb2RlIHN1cHBvcnQu
Cj4gPiAgIAo+IAo+IEZpeGVzIGFuZCBDYyB0byBzdGFibGUgaGVyZSB0b28sIGFzIHlvdSdkIGxp
a2UgdG8gaGF2ZSB0aGlzIGJhY2twb3J0ZWQKPiBhcyB3ZWxsLCBkb24ndCB5b3U/CgpBY3R1YWxs
eSB0aGUgcmVhc29uIHdoeSBDaHJpc3RvcGhlIHNwbGl0IHRoaXMgaW50byB0d28gcGF0Y2hlcyBp
cwpiZWNhdXNlIHRpbWluZ3MubW9kZSB3YXMgaW50cm9kdWNlZCByYXRoZXIgbGF0ZWx5LCBoZSB3
YW50ZWQgdGhlIHNhbWUKcGF0Y2ggdG8gYXBwbHkgb24gYWxsIHN0YWJsZSBrZXJuZWxzLCBoZSBh
Y3R1YWxseSBhc2tlZCBmb3IgdGhhdCBzcGxpdAphbmQgSSBhZ3JlZWQgKGFub3RoZXIgc29sdXRp
b24gd291bGQgaGF2ZSBiZWVuIHRvIHNlbmQgdGhpcyBjdXJyZW50CnBhdGNoIHRvIExpbnVzIGFu
ZCBoYXZlIHRoZSBvdGhlciB2ZXJzaW9uIHNlbnQgdG8gc3RhYmxlLCBidXQgaXQKcmVxdWlyZXMg
YSBiaXQgb2Ygc2NoZWR1bGluZyBvbiBib3RoIGVuZHMpLgoKTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbXRkLzIwMjMwMzI3MTAxMTU2LjBlYzI4MTZhQHhwcy0xMy9ULyN0Cgo+
IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVs
bG9AZm9zcy5zdC5jb20+ICAKPiAKPiBSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3Iu
YW1iYXJ1c0BsaW5hcm8ub3JnPgo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3RtMzJfZm1jMl9uYW5kLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJf
bmFuZC5jCj4gPiBpbmRleCAzYWJiNjNkMDBhMGIuLjllNzRiY2Q5MGFhYSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gPiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ID4gQEAgLTE1MzEsNyArMTUzMSw3
IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9uZmNfc2V0dXBfaW50ZXJmYWNlKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsIGludCBjaGlwbnIsCj4gPiAgCWlmIChJU19FUlIoc2RydCkpCj4gPiAgCQly
ZXR1cm4gUFRSX0VSUihzZHJ0KTsKPiA+ICAKPiA+IC0JaWYgKHNkcnQtPnRSQ19taW4gPCAzMDAw
MCkKPiA+ICsJaWYgKGNvbmYtPnRpbWluZ3MubW9kZSA+IDMpCj4gPiAgCQlyZXR1cm4gLUVPUE5P
VFNVUFA7Cj4gPiAgCj4gPiAgCWlmIChjaGlwbnIgPT0gTkFORF9EQVRBX0lGQUNFX0NIRUNLX09O
TFkpICAKCgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
