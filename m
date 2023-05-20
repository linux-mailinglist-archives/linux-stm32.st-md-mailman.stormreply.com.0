Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D42370A50E
	for <lists+linux-stm32@lfdr.de>; Sat, 20 May 2023 06:04:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E05A7C6B44E;
	Sat, 20 May 2023 04:04:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E269C6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 May 2023 04:04:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0ABB361881;
 Sat, 20 May 2023 04:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB6DC433D2;
 Sat, 20 May 2023 04:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684555481;
 bh=fnCGmrlOBLhvjGa9MX2iGqRuD5qwQrNA9llxmcNiWZc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BhrPR3KrvQdQnMKffMFNgQhQ27pfjXggtfsY+d9Ade5exLY+0dUgwY+pE39sRisyS
 qgKsQeShHclHx2qV+K5hAwLUpMd03ZsZTu/WANBWrLCS6WzaJRb/QFzbsNRs6NpiNF
 FbBy8sgzlC3AMCE6cGYesoVAP+QGgUOrBIfAMJEcfex0ROUoxIFDCtnLvkh5A/TQIK
 5zsY8gQpOv/9F+sMQ2Gszv7sshkP3BhJi3mDK0VevxHB0GTIn9Vxy2FHKZMGEPyE1X
 46VG2Swu+SNm53LYbipi7/zBHDbClK+SVCBHwXSGnEXIsQ97oztBIx/Ps0wIkDkF/7
 2zDbZkTzrD1bg==
Date: Fri, 19 May 2023 21:04:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Min-Hua Chen <minhuadotchen@gmail.com>
Message-ID: <20230519210439.4a3bb326@kernel.org>
In-Reply-To: <20230520015527.215952-1-minhuadotchen@gmail.com>
References: <20230519152715.7d1c3a49@kernel.org>
 <20230520015527.215952-1-minhuadotchen@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, simon.horman@corigine.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: compare p->des0 and
 p->des1 with __le32 type values
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

T24gU2F0LCAyMCBNYXkgMjAyMyAwOTo1NToyNyArMDgwMCBNaW4tSHVhIENoZW4gd3JvdGU6Cj4g
PkNhbiB5b3UgdHJ5IHRvIGZpeCB0aGUgc3BhcnNlIHRvb2wgaW5zdGVhZD8gSSBiZWxpZXZlIGl0
IGFscmVhZHkKPiA+aWdub3JlcyBzdWNoIGVycm9ycyBmb3IgdGhlIGNvbnN0YW50IG9mIDAsIG1h
eWJlIGl0IGNhbiBiZSB0YXVnaHQgCj4gPnRvIGlnbm9yZSBhbGwgImlzb21vcnBoaWMiIHZhbHVl
cz8KPiA+ICAKPiAKPiBJIGRvd25sb2FkZWQgdGhlIHNvdXJjZSBjb2RlIG9mIHNwYXJzZSBhbmQg
SSdtIGFmcmFpZCB0aGF0IEkgY2Fubm90IG1ha2UKPiAweEZGRkZGRkZGIGlnbm9yZWQgZWFzaWx5
LiBJJ3ZlIHRyaWVkIH4wIGluc3RlYWQgb2YgMHhGRkZGRkYsCj4gYnV0IGl0IGRpZCBub3Qgd29y
ayB3aXRoIGN1cnJlbnQgc3BhcnNlLgo+IAo+IDAgaXMgYSBzcGVjaWFsIGNhc2UgbWVudGlvbmVk
IGluIFsxXS4KPiAKPiAiIiIKPiBPbmUgc21hbGwgbm90ZTogdGhlIGNvbnN0YW50IGludGVnZXIg
4oCcMOKAnSBpcyBzcGVjaWFsLiAKPiBZb3UgY2FuIHVzZSBhIGNvbnN0YW50IHplcm8gYXMgYSBi
aXR3aXNlIGludGVnZXIgdHlwZSB3aXRob3V0Cj4gc3BhcnNlIGV2ZXIgY29tcGxhaW5pbmcuIFRo
aXMgaXMgYmVjYXVzZSDigJxiaXR3aXNl4oCdIChhcyB0aGUgbmFtZQo+IGltcGxpZXMpIHdhcyBk
ZXNpZ25lZCBmb3IgbWFraW5nIHN1cmUgdGhhdCBiaXR3aXNlIHR5cGVzIGRvbuKAmXQKPiBnZXQg
bWl4ZWQgdXAgKGxpdHRsZS1lbmRpYW4gdnMgYmlnLWVuZGlhbiB2cyBjcHUtZW5kaWFuIHZzIHdo
YXRldmVyKSwKPiBhbmQgdGhlcmUgdGhlIGNvbnN0YW50IOKAnDDigJ0gcmVhbGx5IF9pc18gc3Bl
Y2lhbC4KPiAiIiIKPiAKPiBGb3IgMHhGRkZGRkZGRiwgaXQgbWF5IGxvb2sgbGlrZSBhIGZhbHNl
IGFsYXJtLCBidXQgd2UgY2FuIHNpbGVuY2UgdGhlCj4gc3BhcnNlIHdhcm5pbmcgYnkgdGFraW5n
IGEgZml4IGxpa2UgbWluZSBhbmQgcGVvcGxlIGNhbiBrZWVwIHdvcmtpbmcgb24KPiBvdGhlciBz
cGFyc2Ugd2FybmluZ3MgZWFzaWVyLgoKV2UgY2FuIG1ha2Ugd29ya2luZyB3aXRoIHNwYXJzZSBl
YXNpZXIgYnkgbWFraW5nIHN1cmUgaXQgZG9lc24ndApnZW5lcmF0ZSBmYWxzZSBwb3NpdGl2ZSB3
YXJuaW5ncyA6XAoKPiAoVGhlcmUgYXJlIGFyb3VuZCA3MDAwIHNwYXJzZSB3YXJuaW5nIGluIEFS
Q0g9YXJtNjQgZGVmY29uZmlnIGJ1aWxkIGFuZAo+IHNvbWV0aW1lcyBpdCBpcyBoYXJkIHRvIHJl
bWVtYmVyIGFsbCB0aGUgZmFsc2UgYWxhcm0gY2FzZXMpCj4gCj4gQ291bGQgeW91IGNvbnNpZGVy
IHRha2luZyB0aGlzIHBhdGNoLCBwbGVhc2U/CgpOby4gV2UgZG9uJ3QgdGFrZSBwYXRjaGVzIHRv
IGFkZHJlc3MgZmFsc2UgcG9zaXRpdmUgc3RhdGljIApjaGVja2VyIHdhcm5pbmdzLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
