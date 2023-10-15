Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C19C7C9B05
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Oct 2023 21:34:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9955BC6B457;
	Sun, 15 Oct 2023 19:34:11 +0000 (UTC)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 143E9C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Oct 2023 19:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 840C6622F589;
 Sun, 15 Oct 2023 21:34:09 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Lylr3PuAgrRB; Sun, 15 Oct 2023 21:34:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6CF8062348B3;
 Sun, 15 Oct 2023 21:34:08 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id l11TOmD_pnae; Sun, 15 Oct 2023 21:34:08 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 32CA0622F589;
 Sun, 15 Oct 2023 21:34:08 +0200 (CEST)
Date: Sun, 15 Oct 2023 21:34:08 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Message-ID: <935504729.4822.1697398448017.JavaMail.zimbra@nod.at>
In-Reply-To: <ee01780b-f5ef-26c8-f632-3bc56cd46b96@huawei.com>
References: <20230828063845.3142561-1-chengzhihao1@huawei.com>
 <ee01780b-f5ef-26c8-f632-3bc56cd46b96@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: fastmap: Fix a series of wear leveling problems
Thread-Index: ppJEmSkjOitdzNt7LeKwxHqbtGToow==
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/12] ubi: fastmap: Fix a series of
 wear leveling problems
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Piwg
Ik1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgIlZpZ25lc2ggUmFn
aGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LAo+ICJtY29xdWVsaW4gc3RtMzIiIDxtY29xdWVs
aW4uc3RtMzJAZ21haWwuY29tPiwgImFsZXhhbmRyZSB0b3JndWUiIDxhbGV4YW5kcmUudG9yZ3Vl
QGZvc3Muc3QuY29tPgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVh
ZC5vcmc+LCAibGludXgtc3RtMzIiIDxsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tPiwKPiAibGludXgtYXJtLWtlcm5lbCIgPGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZz4sICJCYWdhcyBTYW5qYXlhIiA8YmFnYXNkb3RtZUBnbWFpbC5jb20+Cj4gR2Vz
ZW5kZXQ6IERvbm5lcnN0YWcsIDEyLiBPa3RvYmVyIDIwMjMgMDQ6NTc6NTIKPiBCZXRyZWZmOiBS
ZTogW1BBVENIIHYyIDAwLzEyXSB1Ymk6IGZhc3RtYXA6IEZpeCBhIHNlcmllcyBvZiB3ZWFyIGxl
dmVsaW5nIHByb2JsZW1zCgo+IOWcqCAyMDIzLzgvMjggMTQ6MzgsIFpoaWhhbyBDaGVuZyDlhpnp
gZM6Cj4+IFRoaXMgc2VyaWVzIG9mIHBhdGNoZXMgZml4IHRocmVlIHByb2JsZW1zOgo+PiAxLiBJ
bmNvbnNpc3RlbnQgZXJhc2UgY291bnRlciBmcm9tIHdsIGVudHJ5IGFuZCBkaXNrLCBmb3IgcGF0
Y2hlcyAxfjQuCj4+IDIuIFNhbWUgUEVCIGlzIGFsd2F5cyByZXN1ZWQgZm9yIGZhc3RtYXAgZGF0
YSwgZm9yIHBhdGNoZXMgNX45Lgo+PiAzLiBGaXJzdCA2NCBQRUJzIGhhdmUgbGFyZ2UgZXJhc2Ug
Y291bnRlciB0aGFuIG90aGVycywgZm9yIHBhdGNoZXMgMTB+MTIuCj4+IAo+PiBCZXNpZGVzLCBw
YXRjaGVzIDQvNSBicmluZyBhbiBpbXByb3ZlbWVudCBvZiB0aGUgVUJJIHNlcnZpY2UgbGlmZS4K
Pj4gCj4+IFJlZ3Jlc3Npb24gdGVzdHMgYXJlIGluIFtMaW5rXS4KPj4gCj4+IExpbms6IGh0dHBz
Oi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE3Nzg3Lgo+PiAKPj4gdjEt
PnYyOgo+PiAgICBQYXRjaCA2OiBDaGFuZ2Ugd2FpdCBjb25kaXRpb24gaW4gd2FpdF9mcmVlX3Bl
YnNfZm9yX3Bvb2woKSwgdGhlcmUgYXJlCj4+IAkgICB0d28gc2l0dWF0aW9ucyB0aGF0IGNhdXNl
IHdhaXRpbmcgaW5maW5hdGVseToKPj4gCSAgIDEuIF9fZXJhc2Vfd29ya2VyIHNjaGVkdWxlcyBp
dHNlbGYgaWYgLUVCVVNZIHJldHVybmVkIHdoZW4KPj4gCSAgICAgIHNodXR0aW5nIGRvd24gc3lz
dGVtLgo+PiAJICAgMi4gVGhlICdtaW5fZXhwZWN0X2ZyZWUnIGNhbm5vdCBiZSBzYXRpc2ZpZWQg
d2hlbiBiYWQgYmxvY2sKPj4gCSAgICAgIG9jY3VycyBhbmQgdWJpIGJlY29tZXMgcm8oVGhlIGVy
YXNlZCBQRUIgc2hvdWxkIGJlIHRoZQo+PiAgICAgICAgICAgICAgICBsYXN0IG9uZSBvZiAnbWlu
X2V4cGVjdF9mcmVlJywgYnV0IGl0IGJlY29tZXMgYmFkIGluCj4+IAkgICAgICBfX2VyYXNlX3dv
cmtlcikuCj4+ICAgUFM6IEFmdGVyIHJlLXRlc3RpbmcsIHRoZSB0ZXN0aW5nIHJlc3VsdHMgaW4g
W0xpbmtdIGlzIG5vdCBhZmZlY3RlZC4KPj4gCj4gCj4gSGksIFJpY2hhcmQuIEkgaG9wZSB5b3Ug
Y2FuIHRha2Ugc29tZSB0aW1lKHdoZW4geW91IGhhdmUgZnJlZSB0aW1lKSB0bwo+IGhhdmUgYSBn
bGFuY2Ugb2YgdGhpcyBzZXJpZXMgb2YgcGF0Y2hlcywgSSBoYXZlIG1hZGUgc29tZSB0ZXN0cyBv
bgo+IHZpcnR1YWwgbWFjaGluZSBmb3IgMisgbW9udGhzKGFuZCBoYWxmIG1vbnRoIGZvciBwaHlz
aWNhbCBuYW5kIGZsYXNoKSwKPiBzbyBmYXIgdWJpIHdvcmtzIGZpbmUgd2l0aCBwYXRjaGVzIGFw
cGxpZWQuCgpJIGRpZG4ndCBmb3JnZXQuIDotKQoKVGhhbmtzLAovL3JpY2hhcmQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
