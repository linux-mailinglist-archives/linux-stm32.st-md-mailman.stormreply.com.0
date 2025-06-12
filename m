Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE42AD6C1C
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 11:28:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 352DBC36B24;
	Thu, 12 Jun 2025 09:28:13 +0000 (UTC)
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9319C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 09:28:11 +0000 (UTC)
Message-ID: <64b98bdc-5375-478f-813d-b2209986c253@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1749720491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0kSSs5d+mURldhTGN/D4hGaJTvjJYpIqJefyMHl21BE=;
 b=xgTe/FN73ktwVsc7fUPBN23gcKu79EvC4q84/rbc5wcbqC6WqfHSo1lv323W47baMOF2mB
 RC0yT8A9xXPxkpNp65M9CTcCX8IFoYM5jp1zb72p4tY4jc1QAd84Xh6uEgkHIWlqg61HiB
 3DGyEfQL+HfP9i8bAMXbtAkoTpKimxE=
Date: Thu, 12 Jun 2025 17:27:40 +0800
MIME-Version: 1.0
To: Nikunj Kela <nikunj.kela@sima.ai>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
References: <20250610200411.3751943-1-nikunj.kela@sima.ai>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250610200411.3751943-1-nikunj.kela@sima.ai>
X-Migadu-Flow: FLOW_OUT
Cc: romain.gantois@bootlin.com, inochiama@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, netdev@vger.kernel.org, l.rubusch@gmail.com,
 quentin.schulz@cherry.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: extend use of snps,
 multicast-filter-bins property to xgmac
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

5ZyoIDYvMTEvMjUgNDowNCBBTSwgTmlrdW5qIEtlbGEg5YaZ6YGTOgo+IEhhc2ggYmFzZWQgbXVs
dGljYXN0IGZpbHRlcmluZyBpcyBhbiBvcHRpb25hbCBmZWF0dXJlLiBDdXJyZW50bHksCj4gZHJp
dmVyIG92ZXJyaWRlcyB0aGUgdmFsdWUgb2YgbXVsdGljYXN0X2ZpbHRlcl9iaW5zIGJhc2VkIG9u
IHRoZSBoYXNoCj4gdGFibGUgc2l6ZS4gSWYgdGhlIGZlYXR1cmUgaXMgbm90IHN1cHBvcnRlZCwg
aGFzaCB0YWJsZSBzaXplIHJlYWRzIDAKPiBob3dldmVyIHRoZSB2YWx1ZSBvZiBtdWx0aWNhc3Rf
ZmlsdGVyX2JpbnMgcmVtYWlucyBzZXQgdG8gZGVmYXVsdAo+IEhBU0hfVEFCTEVfU0laRSB3aGlj
aCBpcyBpbmNvcnJlY3QuIExldCdzIGV4dGVuZCB0aGUgdXNlIG9mIHRoZSBwcm9wZXJ0eQo+IHNu
cHMsbXVsdGljYXN0LWZpbHRlci1iaW5zIHRvIHhnbWFjIHNvIGl0IGNhbiBiZSBzZXQgdG8gMCB2
aWEgZGV2aWNldHJlZQo+IHRvIGluZGljYXRlIG11bHRpY2FzdCBmaWx0ZXJpbmcgaXMgbm90IHN1
cHBvcnRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaWt1bmogS2VsYSA8bmlrdW5qLmtlbGFAc2lt
YS5haT4KUmV2aWV3ZWQtYnk6IFlhbnRlbmcgU2kgPHNpLnlhbnRlbmdAbGludXguZGV2PgoKVGhh
bmtzLApZYW50ZW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
