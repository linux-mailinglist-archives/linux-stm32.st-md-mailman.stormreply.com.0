Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC848C4527
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 18:37:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 857E3C6A61D;
	Mon, 13 May 2024 16:37:02 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6777C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 16:37:01 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-792b8d989e4so403049185a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 09:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1715618220; x=1716223020;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UhNPxyDIoyt90UWgtYorTleVUvtJf0Skch2qUWjrKUo=;
 b=Es+NBPn6WmccEsh1Gsi1L470k2hAUidWP5gTtJeedE5ASOyUg8xKy4FtY7mMFNnWYy
 wM/ilfHIcKrzYmz5JW+wElG2hpbjep1ys2QRuFYqi4paLfCdqk2cysM/hx2VTGM85wS4
 x6Hw5fTzcNNDBQJBISZRg5rbQ96eK0a8GOzR0g8e870Zj2VOCw6thMMCRyBTnJPv9IkE
 Ir7KBEeRGGhY3svkberqwJN41LMX6duRksplaps6DM8uEu0wry8CcO7FlLxZ96d845+f
 OyO9DTxwk67i/H+EE2lpd1Baj0YHa8oRiWBpfITRcdKcfNvMUSBDdq2BokhnVMPSFwBc
 YwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715618220; x=1716223020;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UhNPxyDIoyt90UWgtYorTleVUvtJf0Skch2qUWjrKUo=;
 b=e9HFaM8EDerV8UxL8BbIjfWiXve9g8K/yKRmmwzY3PRSBFecm3AC9+T49kaCX+R1CA
 cIO9K3UblWx/tpow0XWLEGNH20B5cuT0KrUugfL3UYDMsGyEtU4W9TuHYvopTFj98/nH
 xA/UEXZURdnE7IrrFktDZUs+ZjxEqmw3ieNYKZVqCE6mdCQCGKmh2W9Obct577WV4sXU
 E2gimicUSMf5StB5iOlOhzuAXMrESm5kQUWvuS3OFh6iQ+R9dkq2T4rS0Bat0LBqsJVX
 tJ9iKAeCKAAX79IDORKC5u6VWGGTP73SEPr1P/z5SGz8jTYZM+s+Tb8EyPwtqQy0JoN2
 vRqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxVIs4AdDfn4dTHYtwRo42Yw29hyfLTfl00x5BEEYrHdYUSnSVj77BWff7WzJqDXyJDbNM28LYPxU4PI24iV7dP242cZ1Afc9EbJDsWveq4oqhqxCPciIh
X-Gm-Message-State: AOJu0YxD0o9eFn/j3lDGCnQnLnc17OFAkNobMlV0woz4+RaNiqhdET4/
 W5c51YfCeP13akNeqVyLSOZwbUhTAKSXe88277UTpfUvfReNOo5cK3TU3Z1BXws=
X-Google-Smtp-Source: AGHT+IHR+PMA8mzP/ODUs2ari2ZHO3kfobx2t3yRaJYmectZkzl57AVHabUnpaYuaTgcCtztbZ6HWg==
X-Received: by 2002:a05:6214:319c:b0:6a0:81b4:9871 with SMTP id
 6a1803df08f44-6a16815f5a4mr84632286d6.15.1715618220631; 
 Mon, 13 May 2024 09:37:00 -0700 (PDT)
Received: from dell-precision-5540 ([50.212.55.90])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1d6f30sm44727336d6.110.2024.05.13.09.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 09:37:00 -0700 (PDT)
Date: Mon, 13 May 2024 12:36:57 -0400
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>
Message-ID: <ZkJBqSbJakye6BBc@dell-precision-5540>
References: <20240424135237.1329001-2-ben.wolsieffer@hefring.com>
 <39033ed7-3e57-4339-80b4-fc8919e26aa7@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39033ed7-3e57-4339-80b4-fc8919e26aa7@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: enable controller before
	asserting CS
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

T24gTW9uLCBNYXkgMTMsIDIwMjQgYXQgMTA6Mjk6NDlBTSArMDIwMCwgTGVvbmFyZCBHw7ZocnMg
d3JvdGU6Cj4gSGksCj4gCj4gSSBhbSBpbiB0aGUgcHJvY2VzcyBvZiB1cGRhdGluZyBhbiBTVE0z
Mk1QMTU3IGJhc2VkIGRldmljZSBmcm9tIDYuOCB0byA2LjkKPiBhbmQgaGF2ZSBub3RpY2VkIFNQ
SSByZWxhdGVkIGlzc3VlcyB0aGF0IG1heSBiZSBjYXVzZWQgYnkgdGhpcyBjaGFuZ2UuCj4gCj4g
SSBhbSB0ZXN0aW5nIG9uIGFuIExYQSBUQUMgR2VuZXJhdGlvbiAyIChhcmNoL2FybS9ib290L2R0
cy9zdC9zdG0zMm1wMTU3Yy1seGEtdGFjLWdlbjIuZHRzKQo+IGFuZCB0aGUgaXNzdWVzIEkgc2Vl
IGFyZSBTUEkgdHJhbnNmZXIgdGltZW91dHM6Cj4gCj4gICBbICAgMTMuNTY1MDgxXSBwYW5lbC1t
aXBpLWRiaS1zcGkgc3BpMi4wOiBTUEkgdHJhbnNmZXIgdGltZWQgb3V0Cj4gICBbICAgMTMuNTY1
MTMxXSBzcGlfbWFzdGVyIHNwaTI6IGZhaWxlZCB0byB0cmFuc2ZlciBvbmUgbWVzc2FnZSBmcm9t
IHF1ZXVlCj4gICBbICAgMTMuNTY1MTM0XSBzcGlfc3RtMzIgNDQwMDUwMDAuc3BpOiBzcHVyaW91
cyBJVCAoc3I9MHgwMDAxMDAwMiwgaWVyPTB4MDAwMDAwMDApCj4gICBbICAgMTMuNTY1MTQ1XSBz
cGlfbWFzdGVyIHNwaTI6IG5vcXVldWUgdHJhbnNmZXIgZmFpbGVkCj4gICBbICAgMTMuNTY1MTgz
XSBwYW5lbC1taXBpLWRiaS1zcGkgc3BpMi4wOiBlcnJvciAtMTEwIHdoZW4gc2VuZGluZyBjb21t
YW5kIDB4MmEKPiAgIFsgICAxMy43NjkxMTNdIHBhbmVsLW1pcGktZGJpLXNwaSBzcGkyLjA6IFNQ
SSB0cmFuc2ZlciB0aW1lZCBvdXQKPiAgIFsgICAxMy43NjkxNjNdIHNwaV9tYXN0ZXIgc3BpMjog
ZmFpbGVkIHRvIHRyYW5zZmVyIG9uZSBtZXNzYWdlIGZyb20gcXVldWUKPiAgIFsgICAxMy43Njkx
NjRdIHNwaV9zdG0zMiA0NDAwNTAwMC5zcGk6IHNwdXJpb3VzIElUIChzcj0weDAwMDEwMDAyLCBp
ZXI9MHgwMDAwMDAwMCkKPiAgIFsgICAxMy43NjkxNzddIHNwaV9tYXN0ZXIgc3BpMjogbm9xdWV1
ZSB0cmFuc2ZlciBmYWlsZWQKPiAgIFsgICAxMy43NjkyMTBdIHBhbmVsLW1pcGktZGJpLXNwaSBz
cGkyLjA6IGVycm9yIC0xMTAgd2hlbiBzZW5kaW5nIGNvbW1hbmQgMHgyYgo+ICAgWyAgIDEzLjk3
NzAyOF0gcGFuZWwtbWlwaS1kYmktc3BpIHNwaTIuMDogU1BJIHRyYW5zZmVyIHRpbWVkIG91dAo+
ICAgWyAgIDEzLjk3NzA4Ml0gc3BpX21hc3RlciBzcGkyOiBmYWlsZWQgdG8gdHJhbnNmZXIgb25l
IG1lc3NhZ2UgZnJvbSBxdWV1ZQo+ICAgWyAgIDEzLjk3NzA5NV0gc3BpX21hc3RlciBzcGkyOiBu
b3F1ZXVlIHRyYW5zZmVyIGZhaWxlZAo+ICAgWyAgIDE0LjQ2MDkyNF0gcGFuZWwtbWlwaS1kYmkt
c3BpIHNwaTIuMDogU1BJIHRyYW5zZmVyIHRpbWVkIG91dAo+IAo+IEZvbGxvd2VkIGJ5IHdvcmtx
dWV1ZSBsb2NrdXBzIGFuZCB0aGUgZGV2aWNlIGJlY29taW5nIHVucmVzcG9uc2l2ZSBsYXRlcgo+
IGluIHRoZSBib290LCBwcmV2ZW50aW5nIG1lIGZyb20gbG9nZ2luZyBpbiBhbmQgaW52ZXN0aWdh
dGluZyBmdXJ0aGVyIHRoYXQgd2F5Ogo+IAo+ICAgWyAgIDE3LjAyNjI2M10gc3BpX21hc3RlciBz
cGkyOiBub3F1ZXVlIHRyYW5zZmVyIGZhaWxlZAo+IAo+ICAgVEFDIE9TIC0gVGhlIExYQSBUQUMg
b3BlcmF0aW5nIHN5c3RlbSAyNC4wNCtkZXYgbHhhdGFjLTAwMDExIHR0eVNUTTAKPiAKPiAgIGx4
YXRhYy0wMDAxMSBsb2dpbjogcm9vdAo+ICAgWyAgIDYyLjQzNDMyNl0gQlVHOiB3b3JrcXVldWUg
bG9ja3VwIC0gcG9vbCBjcHVzPTAgbm9kZT0wIGZsYWdzPTB4MCBuaWNlPTAgc3R1Y2sgZm9yIDQ0
cyEKPiAgIFsgICA2Mi40NDEzMjFdIEJVRzogd29ya3F1ZXVlIGxvY2t1cCAtIHBvb2wgY3B1cz0w
IG5vZGU9MCBmbGFncz0weDAgbmljZT0tMjAgc3R1Y2sgZm9yIDQ0cyEKPiAgIOKApgo+IAo+IFJl
dmVydGluZyB0aGlzIGNvbW1pdCBmaXhlcyB0aGUgaXNzdWUgZm9yIG1lLiBJdCBtYXkgYmUgc29t
ZSB0aW1lIGJlZm9yZQo+IEkgZ2V0IGFyb3VuZCB0byBpbnZlc3RpZ2F0aW5nIHRoZSBpc3N1ZSBp
biBkZXRhaWwsIHNvIEkgdGhvdWdodCBJIHNob3VsZAo+IGFzayBpZiBhbnlvbmUgZWxzZSBoYXMg
YWxyZWFkeSBub3RpY2VkIHRoaXMgYXMgd2VsbC4KPiAKPiBXZSBhcmUgY3VycmVudGx5IGluIHRo
ZSBwcm9jZXNzIG9mIGFkZGluZyB0aGUgZGV2aWNlIGluIHF1ZXN0aW9uIHRvCj4gS2VybmVsQ0kg
WzFdLCB3aGljaCBtYXkgaGVscCBpbiBjYXRjaGluZyBzdWNoIHByb2JsZW1zIGVhcmxpZXIuCj4g
Cj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20va2VybmVsY2kva2VybmVsY2ktY29yZS9wdWxsLzI1
NDIKPiAKClNvcnJ5IGFib3V0IHRoYXQ7IGl0IGxvb2tzIGxpa2UgdGhlIFNUTTMySDcvTVAgcGxh
dGZvcm1zIHJlcXVpcmUgdGhlCmNvbnRyb2xsZXIgdG8gYmUgZW5hYmxlZCBsYXRlci4gSSBhZ3Jl
ZSB0aGF0IGl0IHNob3VsZCBiZSByZXZlcnRlZCBhbmQKSSdsbCB0cnkgdG8gdGhpbmsgb2YgYW5v
dGhlciBhcHByb2FjaC4KClRoZSBTVE0zMkg3L01QIGRldmljZXMgYXJlIHNpZ25pZmljYW50bHkg
ZGlmZmVyZW50IGZyb20gdGhlIEY0LzcKZGV2aWNlcywgd2hpY2ggbWFrZXMgaXQgZGlmZmljdWx0
IHRvIGNoYW5nZSBzaGFyZWQgY29kZSB3aXRob3V0IGNhdXNpbmcKcHJvYmxlbXMgbGlrZSB0aGlz
LiBJIHdvbmRlciBpZiBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gc3BsaXQgdGhlIEY0LzcKc3VwcG9y
dCBpbnRvIGEgc2VwYXJhdGUgZHJpdmVyLiBUaGlzIHdvdWxkIGR1cGxpY2F0ZSBhIGJpdCBvZiBj
b2RlLApuYW1lbHkgdGhlIGluaXRpYWxpemF0aW9uIGluIHByb2JlLCB0aGUgYmF1ZCByYXRlIGRp
dmlkZXIgY2FsY3VsYXRpb24KYW5kIHRoZSBTUEkgbW9kZSBjb25maWcsIGJ1dCB3b3VsZCBtYWtl
IHRlc3RpbmcgZWFzaWVyIGFuZCBnZXQgcmlkIG9mCnRoZSBpbmRpcmVjdGlvbiB0aGF0IGhhbmRs
ZXMgdGhlIGRpZmZlcmVudCByZWdpc3RlciBvZmZzZXRzIGFuZCBmaWVsZAptYXNrcyBvbiBlYWNo
IHBsYXRmb3JtLiBUaGUgY29kZSBmb3IgYWN0dWFsbHkgdHJhbnNjaWV2aW5nIGRhdGEgYW5kCmhh
bmRsaW5nIElSUXMgaXMgYWxyZWFkeSBwbGF0Zm9ybSBzcGVjaWZpYy4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
