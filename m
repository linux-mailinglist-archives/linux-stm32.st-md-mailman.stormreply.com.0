Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDE1827698
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 18:52:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 480C4C6DD66;
	Mon,  8 Jan 2024 17:52:58 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FEC4C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 17:52:57 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C2DC53200D00;
 Mon,  8 Jan 2024 12:52:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 08 Jan 2024 12:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1704736373;
 x=1704822773; bh=U5vHpLovxHw2jLbFSMwbVDfMhB5fX3K4zCUa0DIZn9Q=; b=
 QCuiJ8OTr3lnfrzIujxwe/TZfLN1UIxB9lhaB8yim94u+mOcHro7SQ0ObxmjGCj4
 Tb5u0npdf4GTBeVq7Cz2aFXmNa+QaEhiPOPcYSTHw5bxB+WNwzuSL0IBboyPK2jL
 RzROivW2MUr5bdEzhDn/fpTjaPkhuKq7Y2O2FlIsGTSQ9/BiKUju+JyX8yMRXGxy
 4JPkPMqkebAGZ6X5Oy2CJOJRzQ+gue9Cqa/+eZVCp0qB+sAUPlgY+jxbyGXJVYhe
 X8V375V1byyUcuQNDBOBnTK7GBHSMhaLYEUU1U0iaoBJMrNlJHxV6qxUG3wMq5B0
 uH7MPtSQ6xQmfd7oR7iFQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1704736373; x=
 1704822773; bh=U5vHpLovxHw2jLbFSMwbVDfMhB5fX3K4zCUa0DIZn9Q=; b=H
 W+5pS6p8StQO1iOCpRMUGETWwegLC/itEkr0WC7HcpACh+OG0OM0TAGa2hkvGwaP
 5qvYy2mXuiO0tnh4P2u0crfFK96diRxzgDdqyWzqT/FYexQukTZ6mnUCLxYEbIIM
 4VlhkzufmFARICF16ChUFz/yOoBP+iZekdv0UswKOkpjR6BNq5VapPZOg1q2qT/C
 5PveKLQu44B16jB0rftks3B649wadrnfVLj2ZAxOpu0DO54vzbm8rXKi4m1mMfQ9
 /eYc+hn5aySPRTAK8Hg9gCA/LLAcGWZE7njvQ556WjGBHBu6qQhslWNzlDUkyO8K
 iQsL/YuJcDENA1Msf1eVA==
X-ME-Sender: <xms:dDacZcuDTXN6lIEB8WcOO16Pq_Tb_ovk8QZo9ds7l0Lpb-hT7fKQlg>
 <xme:dDacZZebg42EFk_Dte7vA-bggeXbFkekpX81XBWPhF---MbikwU4NEQAq_cbaMZyt
 GDLFMocQhEF5-vUZA>
X-ME-Received: <xmr:dDacZXxBZ9cQLWYl6jdfdcpCufgtDH1LcuUb3pmhHdXoOlL94QlkfynIuxozVxZlTsp7KYObYheOxk2Q_1uOjqeGruABsR5zL19sbLc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdehjedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkefs
 tddttdejnecuhfhrohhmpeffrghnihgvlhcuighuuceougiguhesugiguhhuuhdrgiihii
 eqnecuggftrfgrthhtvghrnheptdfgueeuueekieekgfeiueekffelteekkeekgeegffev
 tddvjeeuheeuueelfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:dTacZfO1_6ZhFSPZ7zYR_vaSkrh9xyqkFLtjv5fayG8ZpCbkP8Qaxg>
 <xmx:dTacZc-OoIoBjtWs99QJ3JVhf7MeRx8huVlrpOGlzP4IbiCQjrWwAg>
 <xmx:dTacZXVkZfDjbk7VxlH_D6LS-Uq5m97mwmnDhWMv7x4tSBRugNGqbw>
 <xmx:dTacZcOHJTHi1jhIyuq6e13SVSM7x8VZNsMZkqqn0mrcGx9wqqEgzA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Jan 2024 12:52:51 -0500 (EST)
Date: Mon, 8 Jan 2024 10:52:49 -0700
From: Daniel Xu <dxu@dxuuu.xyz>
To: Lorenz Bauer <lorenz.bauer@isovalent.com>
Message-ID: <6t5bei3t2gwhuycu6ewftrgfuuyfhs26euymkysefqyfabgupa@3od5pe6ajybo>
References: <cover.1704565248.git.dxu@dxuuu.xyz>
 <CAN+4W8gPeQ2OjoYLKXsNPyhSVTB+vcSaS3Xzw=-M9Rf5MXfKPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAN+4W8gPeQ2OjoYLKXsNPyhSVTB+vcSaS3Xzw=-M9Rf5MXfKPg@mail.gmail.com>
Cc: fsverity@lists.linux.dev, alan.maguire@oracle.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com, memxor@gmail.com,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org, quentin@isovalent.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 cgroups@vger.kernel.org, bpf@vger.kernel.org, olsajiri@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v3 0/3] Annotate kfuncs in
	.BTF_ids section
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

SGkgTG9yZW56LAoKT24gTW9uLCBKYW4gMDgsIDIwMjQgYXQgMTA6MTU6NDVBTSArMDEwMCwgTG9y
ZW56IEJhdWVyIHdyb3RlOgo+IE9uIFNhdCwgSmFuIDYsIDIwMjQgYXQgNzoyNeKAr1BNIERhbmll
bCBYdSA8ZHh1QGR4dXV1Lnh5ej4gd3JvdGU6Cj4gPgo+ID4gPT09IERlc2NyaXB0aW9uID09PQo+
ID4KPiA+IFRoaXMgaXMgYSBicGYtdHJlZXdpZGUgY2hhbmdlIHRoYXQgYW5ub3RhdGVzIGFsbCBr
ZnVuY3MgYXMgc3VjaCBpbnNpZGUKPiA+IC5CVEZfaWRzLiBUaGlzIGFubm90YXRpb24gZXZlbnR1
YWxseSBhbGxvd3MgdXMgdG8gYXV0b21hdGljYWxseSBnZW5lcmF0ZQo+ID4ga2Z1bmMgcHJvdG90
eXBlcyBmcm9tIGJwZnRvb2wuCj4gPgo+ID4gV2Ugc3RvcmUgdGhpcyBtZXRhZGF0YSBpbnNpZGUg
YSB5ZXQtdW51c2VkIGZsYWdzIGZpZWxkIGluc2lkZSBzdHJ1Y3QKPiA+IGJ0Zl9pZF9zZXQ4ICh0
aGFua3MgS3VtYXIhKS4gcGFob2xlIHdpbGwgYmUgdGF1Z2h0IHdoZXJlIHRvIGxvb2suCj4gCj4g
VGhpcyBpcyBncmVhdCwgdGhhbmtzIGZvciB0YWNrbGluZyB0aGlzLiBXaXRoIHlvdXQgcGF0Y2hl
cyB3ZSBjYW4KPiBmaWd1cmUgb3V0IHRoZSBmdWxsIHNldCBvZiBrZnVuY3MuIElzIHRoZXJlIGEg
d2F5IHRvIGV4dGVuZCBpdCBzbyB0aGF0Cj4gd2UgY2FuIHRlbGwgd2hpY2ggcHJvZ3JhbSBjb250
ZXh0IGEga2Z1bmMgY2FuIGJlIGNhbGxlZCBmcm9tPwoKSSB0aGluayBhIHBvdGVudGlhbCBhcHBy
b2FjaCB3b3VsZCBiZSB0byBleHRlbmQgQlRGX0lEX0ZMQUdTKCkgd2l0aCBzb21lCm1vcmUgZmxh
Z3MgaWYgd2Ugd2FudCB0byBjb250aW51ZSB3aXRoIC5CVEZfaWRzIHBhcnNpbmcgdGVjaG5pcXVl
LiBCdXQKaXQgaGFzIHNvbWUgaXNzdWVzIHdpdGggcHJvZ3JhbS10eXBlLWxlc3MgaGVscGVycyB0
aGF0IGFyZSBhc3NvY2lhdGVkIHdpdGgKYXR0YWNocG9pbnRzIGFzIHdlbGwgYXMgc3RydWN0X29w
cyBoZWxwZXJzLgoKU2luY2UgaXQgbG9va3MgbGlrZSB3ZSdyZSBpbiByYXRoZXIgZWFybHkgc3Rh
Z2VzIG9mIHByb2dyYW0tdHlwZS1sZXNzCndvcmxkLCBtYXliZSBpdCdkIGJlIGdvb2QgdG8gZGVm
ZXIgc29sdmluZyB0aGlzIHByb2JsZW0gdW50aWwgbW9yZSB1c2UKY2FzZXMgYXJlIGVzdGFibGlz
aGVkIGFuZCB3ZSBjYW4gZmluZCBhIGdvb2QgY3V0IHBvaW50IHRvIGRlc2lnbiBhcm91bmQuCkV2
ZW4gd2l0aCB1YXBpIGhlbHBlcnMgdGhlcmUgd2FzIG5vIHdheSBiZWZvcmUuCgpUaGFua3MsCkRh
bmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
