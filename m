Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEBB4B1BE
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 07:58:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A932BCC2418
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 05:58:20 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E7CACC2417
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 05:58:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x4so1884666wrt.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 22:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=v4Lzw69YqCGNT6d2yGg/IWB5HqmTYETWg/4G3e5GhcM=;
 b=E6zaAPAk1Z4K4tmdwrtkSOWC8nlnur95mxOoftmD56qCT5EXSvT6ycZbg/68lt02Db
 ANOwmUrYS8w8CEoIGQyyTc12+p7JBLChyKkAGMBvUm8921rg/86HOIoKnjA/G/R8389n
 OoRBu8SGvOjLJEhFA5uz6sPHwF/dhWNcH3R0aTlwJJfsHcOcmikrhYmCu1usEJe4lyTZ
 xN3ITGXrDBQodz+8qRz101FS4z+SouBbcBG9U+21yiSi6xIqsHcDAxzY3T1rlTCMg0y8
 ZGVDqtC6xipnmbNjTRJy0KVXGSMHUadcSXGoWZ7EkPIigPG06rZDh1hvsXAdJMmzfXJ2
 CxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=v4Lzw69YqCGNT6d2yGg/IWB5HqmTYETWg/4G3e5GhcM=;
 b=l7fLRszQpNwLMP+9FmWd85sJWZK84AUx0ilLBFSzEVYzq48MV0g6A5eq5RKnhTYRkR
 xvpKw5n/X6dNqWHf+2lgLyrzzueNy08yXwSXjSH3cFkRy4G7sV+3aqTphlZgoI/wYrGT
 FTFja3N3e0Ef/C2t+3z0g/++ryk4L+KVfe95I2Zc/rOACMuh5JFkgvWIm+7XomgiqmVV
 f+oe9PZ6+YjxyjR9HOlX0YfqlH74Kdm/Bi4axGMEtwH9my8gii2ZgesP7esELbW3LnbW
 gy7ed2vIsD0Xpi8YnXXaCLPOg8ATtGfJJVpv1KKpxgPummE16W+404iK1ij/R8+pUamF
 99uQ==
X-Gm-Message-State: APjAAAU0jgbRMn+9yMBodyn40G1l1+K8z5W0quozSdCZi3ucgHo0YlFr
 C+NC0xc7bLoYh0uDiXflBg4iUg==
X-Google-Smtp-Source: APXvYqwCLJB9gv/cQEHgS6YpUkbFLxhQLp+LQAxMubEfU+V09+07SkfNFDSXxJ+QjUIfsER9MWzsng==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr39947594wrs.136.1560923898554; 
 Tue, 18 Jun 2019 22:58:18 -0700 (PDT)
Received: from dell ([2.27.35.243])
 by smtp.gmail.com with ESMTPSA id o126sm592028wmo.1.2019.06.18.22.58.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Jun 2019 22:58:18 -0700 (PDT)
Date: Wed, 19 Jun 2019 06:58:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190619055816.GF18371@dell>
References: <CAHk-=wgTL5sYCGxX8+xQqyBRWRUE05GAdL58+UTG8bYwjFxMkw@mail.gmail.com>
 <20190617190605.GA21332@mwanda> <20190618081645.GM16364@dell>
 <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Amelie Delaunay <amelie.delaunay@st.com>, kernel-janitors@vger.kernel.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Fix an endian bug in
	stmfx_irq_handler()
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

T24gVHVlLCAxOCBKdW4gMjAxOSwgTGludXMgVG9ydmFsZHMgd3JvdGU6Cgo+IE9uIFR1ZSwgSnVu
IDE4LCAyMDE5IGF0IDE6MTYgQU0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3Jv
dGU6Cj4gPgo+ID4gPiBSZXBvcnRlZC1ieTogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4
LWZvdW5kYXRpb24ub3JnPgo+ID4KPiA+IElkZWFsbHkgd2UgY2FuIGdldCBhIHJldmlldyB0b28u
Cj4gCj4gTG9va3MgZmluZSB0byBtZSwgYnV0IG9idmlvdXNseSBzb21lYm9keSBzaG91bGQgYWN0
dWFsbHkgX3Rlc3RfIGl0IHRvby4KCkFtZWxpZSwgd291bGQgeW91IGJlIHNvIGtpbmQ/CgotLSAK
TGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5h
cm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFy
bzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
