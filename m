Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8393A6CC1A3
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 16:01:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31305C6905A;
	Tue, 28 Mar 2023 14:01:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DB8FC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 14:01:38 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CB45B6001E;
 Tue, 28 Mar 2023 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680012098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajebor2cex6mpQmPcqQgjjD0LTwwf/mMcc5v184iISI=;
 b=ZAIpBrc0V73yhIwZQdNSHbg3F6MObzE0GnIXlzghrmbaIRbhy1VGnMsN5SSKJvjFuVfMMQ
 fTZQIvi+2hJ80IprvkwGAujDIJ34xGLjPMptRSAdXS3nYFaxw2FZBdcrRvRwqR820xv5bS
 bc7OwQfWMVRz2c1pemi7eKMJgDBJQRIuTsluK3uSUhMQp8EEWAtGhRNP8MxGEcJy2mDhli
 R81Y9TAl9tJBUqVNlXvEjpzqBwnOD0EEnJGANkjl+pzZJpdbXC0y3ip3WSlbrnFwFZy1pK
 sPG3TIOJDD+KpGETKaT2ZrRVy0Xk7iEdkbtMb7BbywcHKMIVwbQDlzLlZlCy+g==
Date: Tue, 28 Mar 2023 16:01:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <20230328160135.06ef6e50@xps-13>
In-Reply-To: <6759a843-409b-d9fe-8a00-ed6d69144aaf@foss.st.com>
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
 <20230327094742.38856-3-christophe.kerello@foss.st.com>
 <75dcd205-5432-7103-370c-d65d792631ea@linaro.org>
 <20230327124313.1ccd3d66@xps-13>
 <70d0a8b6-62c2-fa3e-df5c-f86ba75484d0@linaro.org>
 <6759a843-409b-d9fe-8a00-ed6d69144aaf@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBU
dWUsIDI4IE1hciAyMDIzIDA5OjI3OjU1ICswMjAwOgoKPiBIZWxsbyBNaXF1ZWwsCj4gCj4gT24g
My8yNy8yMyAxMzowNiwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAzLzI3
LzIzIDExOjQzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4gSGkgVHVkb3IsCj4gPj4KPiA+
PiB0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAyNyBNYXIgMjAyMyAxMToz
MDo1MSArMDEwMDoKPiA+PiAgCj4gPj4+IE9uIDMvMjcvMjMgMTA6NDcsIENocmlzdG9waGUgS2Vy
ZWxsbyB3cm90ZTogIAo+ID4+Pj4gVGhpcyBwYXRjaCBpcyB1c2luZyB0aW1pbmdzLm1vZGUgdmFs
dWUgaW5zdGVhZCBvZiBjaGVja2luZyB0UkNfbWluIHRpbWluZwo+ID4+Pj4gZm9yIEVETyBtb2Rl
IHN1cHBvcnQuICAKPiA+Pj4+ICAgID4+PiAgCj4gPj4+IEZpeGVzIGFuZCBDYyB0byBzdGFibGUg
aGVyZSB0b28sIGFzIHlvdSdkIGxpa2UgdG8gaGF2ZSB0aGlzIGJhY2twb3J0ZWQKPiA+Pj4gYXMg
d2VsbCwgZG9uJ3QgeW91PyAgCj4gPj4KPiA+PiBBY3R1YWxseSB0aGUgcmVhc29uIHdoeSBDaHJp
c3RvcGhlIHNwbGl0IHRoaXMgaW50byB0d28gcGF0Y2hlcyBpcwo+ID4+IGJlY2F1c2UgdGltaW5n
cy5tb2RlIHdhcyBpbnRyb2R1Y2VkIHJhdGhlciBsYXRlbHksIGhlIHdhbnRlZCB0aGUgc2FtZQo+
ID4+IHBhdGNoIHRvIGFwcGx5IG9uIGFsbCBzdGFibGUga2VybmVscywgaGUgYWN0dWFsbHkgYXNr
ZWQgZm9yIHRoYXQgc3BsaXQKPiA+PiBhbmQgSSBhZ3JlZWQgKGFub3RoZXIgc29sdXRpb24gd291
bGQgaGF2ZSBiZWVuIHRvIHNlbmQgdGhpcyBjdXJyZW50Cj4gPj4gcGF0Y2ggdG8gTGludXMgYW5k
IGhhdmUgdGhlIG90aGVyIHZlcnNpb24gc2VudCB0byBzdGFibGUsIGJ1dCBpdAo+ID4+IHJlcXVp
cmVzIGEgYml0IG9mIHNjaGVkdWxpbmcgb24gYm90aCBlbmRzKS4KPiA+Pgo+ID4+IExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIzMDMyNzEwMTE1Ni4wZWMyODE2YUB4
cHMtMTMvVC8jdCAgCj4gPiAKPiA+IFJpZ2h0LCBJIHVuZGVyc3Rvb2QgdGhhdCBmcm9tIHRoZSBi
ZWdpbm5pbmcuIElmIGl0IHdlcmUgdG8gbWUsIEkgd291bGQKPiA+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnICN2NS40KyBmb3IgdGhlIGZpcnN0IHBhdGNoIGFuZAo+ID4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcgI3Y1LjEwKyBmb3IgdGhlIHNlY29uZC4KPiA+IAo+ID4gU28gZmlyc3Qg
d291bGQgYmUgYWxvbmUganVzdCBpbiB2NS40LCBhbmQgc3RhcnRpbmcgd2l0aCB2NS4xMCB3ZSds
bCBoYXZlCj4gPiBib3RoIGFuZCB3ZSdsbCBtaW1pYyB3aGF0IHdlIGN1cnJlbnRseSBoYXZlIGlu
IHVwc3RyZWFtIG1haW5saW5lLgo+ID4gICAKPiAKPiBJIGNhbiBzZW5kIGEgVjMgd2l0aCBjYyB0
YWcgYWRkZWQgYXMgcGVyIFR1ZG9yJ3Mgc3VnZ2VzdGlvbi4KPiBPciBjYyB0YWcgd2lsbCBiZSBh
ZGRlZCB3aGVuIHRoZSBwYXRjaGVzIHdpbGwgYmUgYXBwbGllZD8KCkFjdHVhbGx5IEkgaGF2ZSBv
dGhlciBmaXhlcyB0byBxdWV1ZSBlYXJseSBuZXh0IHdlZWssIHNvIGNhbiB5b3UgcGxlYXNlCnNl
bmQgYSB2MyB3aXRoIHRoZSB0YWdzIGRpc2N1c3NlZCB3aXRoIFR1ZG9yPwoKVGhhbmtzLApNaXF1
w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
