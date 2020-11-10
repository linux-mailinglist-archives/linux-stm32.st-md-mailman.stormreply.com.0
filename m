Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7272AD728
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Nov 2020 14:12:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7553C35E2B;
	Tue, 10 Nov 2020 13:12:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F293EC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Nov 2020 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605013952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2V11rFQ3FKVTN+koXAVvig/bkOvKVZoOl9jWSSiZ8Ik=;
 b=Di+p8tHpuaV5rtMlatp24D6j8+WKmCUBtqz8yv0zCEdrS6sGXtBKp/ajiNQKnRgk1iVbBf
 EPgPhQ0oDcmNLweqKLA2uf1G287zKEdUoDcJ+SAJtNZ7ElvnOQlZ77m+OxtwtGg6hoPAvK
 H8JUZjK8UjW7EnlIU91t9XZBpHRi/X8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-Ww27K4oNOL65z0da95CrZQ-1; Tue, 10 Nov 2020 08:12:30 -0500
X-MC-Unique: Ww27K4oNOL65z0da95CrZQ-1
Received: by mail-qk1-f200.google.com with SMTP id s128so8670704qke.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Nov 2020 05:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2V11rFQ3FKVTN+koXAVvig/bkOvKVZoOl9jWSSiZ8Ik=;
 b=tD8aAuEP0cjXoIUcfZOGtB84ATdFhuKr1MK4f3B9acAD8oPNIO53ItgpZYm3stygMH
 XI+KRJ3gftswczZ/iGC3IZhEnVwsY1n6UzEBq2KhTFpMBHzLT+u7/pPDMiTp/noLN+Rl
 15LUjttUp/0iG9NhsK2QM2wN3Tc3qWnMQ18r8DR6xPHVDBBEWdQAeq45wYlpgXgqhXMp
 QW+VY7sLV0R4Ch5pSrgY6oB/j3eI8rmmoCP/EKIKR7gZ1xsRzQp1fjcSjT2n5R9HBsfp
 7Se32nvh6cQLmDazxym3VtnVYJtuXjjERftCBet8HPhP+SepoLKtlGBB/J2+S+7mnccA
 CoMg==
X-Gm-Message-State: AOAM533S0S9LnDLPbGdr/5NlyZ8JV9wyA4QyYGAavjVyIXPa+kRpknzv
 piUEoI8Q5Yq/y9vDt+7IaD4ETpEaR6r+12aNnqLiqyi0jRNdGvt9pT15bN8PCYgvTFbgGLojTv2
 kSJRZSINNgj3ceSax1b6fzkK1+nQiCJuOyIFGgCP9
X-Received: by 2002:ac8:3621:: with SMTP id m30mr8787091qtb.168.1605013950430; 
 Tue, 10 Nov 2020 05:12:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRnI1rUF5eW2rST1vImtIogpOlMRBum2fO0dVCe+zUlRqVIaRBqmVo31rjlhOk2kmW2Hr8dQ==
X-Received: by 2002:ac8:3621:: with SMTP id m30mr8787064qtb.168.1605013950178; 
 Tue, 10 Nov 2020 05:12:30 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id e8sm7658678qti.28.2020.11.10.05.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 05:12:29 -0800 (PST)
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, cocci <cocci@systeme.lip6.fr>
References: <20201027164255.1573301-1-trix@redhat.com>
 <3c39c363690d0b46069afddc3ad09213011e5cd4.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <cc512954-2e1d-a165-f1f1-2c489fd6d3a9@redhat.com>
Date: Tue, 10 Nov 2020 05:12:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3c39c363690d0b46069afddc3ad09213011e5cd4.camel@perches.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, qat-linux@intel.com, amd-gfx@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] Subject: [RFC] clang tooling cleanups
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

Ck9uIDExLzkvMjAgNjo1MiBQTSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gVHVlLCAyMDIwLTEw
LTI3IGF0IDA5OjQyIC0wNzAwLCB0cml4QHJlZGhhdC5jb20gd3JvdGU6Cj4+IFRoaXMgcmZjIHdp
bGwgZGVzY3JpYmUKPj4gQW4gdXBjb21pbmcgdHJlZXdpZGUgY2xlYW51cC4KPj4gSG93IGNsYW5n
IHRvb2xpbmcgd2FzIHVzZWQgdG8gcHJvZ3JhbWF0aWNhbGx5IGRvIHRoZSBjbGVhbiB1cC4KPj4g
U29saWNpdCBvcGluaW9ucyBvbiBob3cgdG8gZ2VuZXJhbGx5IHVzZSBjbGFuZyB0b29saW5nLgo+
Pgo+PiBUaGUgY2xhbmcgd2FybmluZyAtV2V4dHJhLXNlbWktc3RtdCBwcm9kdWNlcyBhYm91dCAx
MGsgd2FybmluZ3MuCj4+IFJldmlld2luZyB0aGVzZSwgYSBzdWJzZXQgb2Ygc2VtaWNvbG9uIGFm
dGVyIGEgc3dpdGNoIGxvb2tzIHNhZmUgdG8KPj4gZml4IGFsbCB0aGUgdGltZS4gIEFuIGV4YW1w
bGUgcHJvYmxlbQo+Pgo+PiB2b2lkIGZvbyhpbnQgYSkgewo+PiDCoMKgwqDCoMKgc3dpdGNoKGEp
IHsKPj4gwqDCoMKgwqDCoAkgICAgICAgY2FzZSAxOgo+PiAJICAgICAgIC4uLgo+PiDCoMKgwqDC
oMKgfTsgPC0tLSBleHRyYSBzZW1pY29sb24KPj4gfQo+Pgo+PiBUcmVld2lkZSwgdGhlcmUgYXJl
IGFib3V0IDEwMCBwcm9ibGVtcyBpbiA1MCBmaWxlcyBmb3IgeDg2XzY0IGFsbHllc2NvbmZpZy4K
Pj4gVGhlc2UgZml4ZXMgd2lsbCBiZSB0aGUgdXBjb21pbmcgY2xlYW51cC4KPiBjb2NjaW5lbGxl
IGFscmVhZHkgZG9lcyBzb21lIG9mIHRoZXNlLgo+Cj4gRm9yIGluc3RhbmNlOiBzY3JpcHRzL2Nv
Y2NpbmVsbGUvbWlzYy9zZW1pY29sb24uY29jY2kKPgo+IFBlcmhhcHMgc29tZSB0b29sIGNvb3Jk
aW5hdGlvbiBjYW4gYmUgZG9uZSBoZXJlIGFzCj4gY29jY2luZWxsZS9jaGVja3BhdGNoL2NsYW5n
L0xpbmRlbnQgY2FsbCBhbGwgYmUgdXNlZAo+IHRvIGRvIHNvbWUgZmFjZXQgb3IgYW5vdGhlciBv
ZiB0aGVzZSBjbGVhbnVwIGlzc3Vlcy4KClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuCgpJ
IHdpbGwgdGFrZSBhIGxvb2sgYXQgaXQuCgpUb20KCj4KPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
