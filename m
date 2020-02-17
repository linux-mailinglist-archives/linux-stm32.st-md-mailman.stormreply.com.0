Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EC9160A2C
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2020 06:57:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6F9DC36B0B;
	Mon, 17 Feb 2020 05:57:41 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90572C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2020 05:57:40 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s10so15846547wmh.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 21:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZXuMKcZyj/idpOZmGXYQMfUcYkxlliPEMPEeNplqlRo=;
 b=jgvk7ken0jTTqqtTNtyefWsUXW4+4AkbkUxler3NbAYhbYQEw06uZfZ+o0P/Qx74NW
 eWx0lLZOQrFNzNlaVcxoVzNIjFdBWKL3h/bq8/DeM9OmdSrRfFIA/oj/DnSSxWio70Xs
 UUd74XVKYM463TiTXCtv2Y9LCPcLVgoQSgIX4fl+5dXzIWDV8AEFN3MTqzBwvG+83X4I
 bg23iGsdVN32JhgL1jXnAQnMdaRpy/nqE+If/bXn2zyyZ5VqQeizgiJnQLr/M4Bij6bq
 IsNhPgOvH2Moend9O5ivriLrjm6DsxtLkNSHsvAcfSrrtQjx653WJENd4yyKiOBdqx8j
 AMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZXuMKcZyj/idpOZmGXYQMfUcYkxlliPEMPEeNplqlRo=;
 b=efVnhRqXqEtokcLMxSVnTJs4Dlv/DbRtz3x4aiOjZ0N9dshOqeVpEQGuWEJyso+pO+
 /AzVvmUbm/fpwcWuhRDtE4VaEi1BRnahZwoVOpiVQO5BaX/hvznPN8/zdT+Jn8Wmj2D0
 xM2kTS0clA3pj0SMRlYHv7LZRWkCcZoO+vqVHfwjUmOdaXWDc97Ylw/lQ77GIIaFAUUx
 qAP8nh60vSh5dDqYKB3ypV6nS3eJQpD9Y2xvZhTJS+5+xX0bsu9RhD0ziYeFt9VTuw3K
 CngQxMoLbBuWG3zpQq4cL2AfIKHHvMy7MC7nltN8z+3/HTx09cll2Mrt01CXLwA/EZbz
 QYFQ==
X-Gm-Message-State: APjAAAUJh60lLMt9v9S/PFn668CXx3bS3+8HomY9SDyaMOGqdOKpw/3u
 BpzR7rBxJe2bSdDVHhaUQMYyLQ==
X-Google-Smtp-Source: APXvYqy4DcCMx4ZQzKPPXY+K/mHB0y/EkYkOwcFNUZ1+4YuKE84Oq5iaB6C9hx1gKGozChYFngBdJw==
X-Received: by 2002:a1c:740a:: with SMTP id p10mr20128249wmc.65.1581919059979; 
 Sun, 16 Feb 2020 21:57:39 -0800 (PST)
Received: from apalos.home (ppp-2-87-54-32.home.otenet.gr. [2.87.54.32])
 by smtp.gmail.com with ESMTPSA id v22sm18366526wml.11.2020.02.16.21.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 21:57:39 -0800 (PST)
Date: Mon, 17 Feb 2020 07:57:36 +0200
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: David Miller <davem@davemloft.net>
Message-ID: <20200217055736.GA15371@apalos.home>
References: <20200216094056.8078-1-ilias.apalodimas@linaro.org>
 <20200216.195300.260413184133485319.davem@davemloft.net>
 <20200216.195957.2300038427552527679.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216.195957.2300038427552527679.davem@davemloft.net>
Cc: mcoquelin.stm32@gmail.com, kuba@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, john.fastabend@gmail.com, ast@kernel.org,
 linux-kernel@vger.kernel.org, jaswinder.singh@linaro.org, joabreu@synopsys.com,
 thomas.petazzoni@bootlin.com, jonathan.lemon@gmail.com, peppe.cavallaro@st.com,
 bpf@vger.kernel.org, lorenzo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 hawk@kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: page_pool: API cleanup and
	comments
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

T24gU3VuLCBGZWIgMTYsIDIwMjAgYXQgMDc6NTk6NTdQTSAtMDgwMCwgRGF2aWQgTWlsbGVyIHdy
b3RlOgo+IEZyb206IERhdmlkIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KPiBEYXRlOiBT
dW4sIDE2IEZlYiAyMDIwIDE5OjUzOjAwIC0wODAwIChQU1QpCj4gCj4gPiBGcm9tOiBJbGlhcyBB
cGFsb2RpbWFzIDxpbGlhcy5hcGFsb2RpbWFzQGxpbmFyby5vcmc+Cj4gPiBEYXRlOiBTdW4sIDE2
IEZlYiAyMDIwIDExOjQwOjU1ICswMjAwCj4gPiAKPiA+PiBGdW5jdGlvbnMgc3RhcnRpbmcgd2l0
aCBfXyB1c3VhbGx5IGluZGljYXRlIHRob3NlIHdoaWNoIGFyZSBleHBvcnRlZCwKPiA+PiBidXQg
c2hvdWxkIG5vdCBiZSBjYWxsZWQgZGlyZWN0bHkuIFVwZGF0ZSBzb21lIG9mIHRob3NlIGRlY2xh
cmVkIGluIHRoZQo+ID4+IEFQSSBhbmQgbWFrZSBpdCBtb3JlIHJlYWRhYmxlLgo+ID4+IAo+ID4+
IHBhZ2VfcG9vbF91bm1hcF9wYWdlKCkgYW5kIHBhZ2VfcG9vbF9yZWxlYXNlX3BhZ2UoKSB3ZXJl
IGRvaW5nCj4gPj4gZXhhY3RseSB0aGUgc2FtZSB0aGluZy4gS2VlcCB0aGUgcGFnZV9wb29sX3Jl
bGVhc2VfcGFnZSgpIHZhcmlhbnQKPiA+PiBhbmQgZXhwb3J0IGl0IGluIG9yZGVyIHRvIHNob3cg
dXAgb24gcGVyZiBsb2dzLgo+ID4+IEZpbmFsbHkgcmVuYW1lIF9fcGFnZV9wb29sX3B1dF9wYWdl
KCkgdG8gcGFnZV9wb29sX3B1dF9wYWdlKCkgc2luY2Ugd2UKPiA+PiBjYW4gbm93IGRpcmVjdGx5
IGNhbGwgaXQgZnJvbSBkcml2ZXJzIGFuZCByZW5hbWUgdGhlIGV4aXN0aW5nCj4gPj4gcGFnZV9w
b29sX3B1dF9wYWdlKCkgdG8gcGFnZV9wb29sX3B1dF9mdWxsX3BhZ2UoKSBzaW5jZSB0aGV5IGRv
IHRoZSBzYW1lCj4gPj4gdGhpbmcgYnV0IHRoZSBsYXR0ZXIgaXMgdHJ5aW5nIHRvIHN5bmMgdGhl
IGZ1bGwgRE1BIGFyZWEuCj4gPj4gCj4gPj4gQWxzbyB1cGRhdGUgbmV0c2VjLCBtdm5ldGEgYW5k
IHN0bW1hYyBkcml2ZXJzIHdoaWNoIHVzZSB0aG9zZSBmdW5jdGlvbnMuCj4gPj4gCj4gPj4gU3Vn
Z2VzdGVkLWJ5OiBKb25hdGhhbiBMZW1vbiA8am9uYXRoYW4ubGVtb25AZ21haWwuY29tPgo+ID4+
IFNpZ25lZC1vZmYtYnk6IElsaWFzIEFwYWxvZGltYXMgPGlsaWFzLmFwYWxvZGltYXNAbGluYXJv
Lm9yZz4KPiA+IAo+ID4gQXBwbGllZCB0byBuZXQtbmV4dCwgdGhhbmtzLgo+IAo+IEFjdHVhbGx5
IHRoaXMgZG9lc24ndCBjb21waWxlLCBwbGVhc2UgcmVzcGluOgoKT29vcHMgOigKSSB3YXMgY29t
cGlsaW5nIGZvciBhcm12Nywgc3RtbWFjIGFuZCBtdm5ldGEgYXJlIGluY2x1ZGVkIGJ1dCBuZXRz
ZWMgaXNuJ3QuIApTb3JyeSBmb3IgdGhlIG5vaXNlLCBpJ2xsIHNlbmQgYSB2MgoKPiAKPiBkcml2
ZXJzL25ldC9ldGhlcm5ldC9zb2Npb25leHQvbmV0c2VjLmM6IEluIGZ1bmN0aW9uIOKAmG5ldHNl
Y191bmluaXRfcGt0X2RyaW5n4oCZOgo+IGRyaXZlcnMvbmV0L2V0aGVybmV0L3NvY2lvbmV4dC9u
ZXRzZWMuYzoxMjAxOjQ6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0byBmdW5jdGlvbiDigJhw
YWdlX3Bvb2xfcHV0X3BhZ2XigJkKPiAgICAgcGFnZV9wb29sX3B1dF9wYWdlKGRyaW5nLT5wYWdl
X3Bvb2wsIHBhZ2UsIGZhbHNlKTsKPiAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Cj4gSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIGRyaXZlcnMvbmV0L2V0aGVybmV0L3NvY2lvbmV4dC9uZXRzZWMuYzoxNzoK
PiAuL2luY2x1ZGUvbmV0L3BhZ2VfcG9vbC5oOjE3Mjo2OiBub3RlOiBkZWNsYXJlZCBoZXJlCj4g
IHZvaWQgcGFnZV9wb29sX3B1dF9wYWdlKHN0cnVjdCBwYWdlX3Bvb2wgKnBvb2wsIHN0cnVjdCBw
YWdlICpwYWdlLAo+ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgoKVGhhbmtzCi9JbGlhcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
