Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4937155EBDE
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 20:05:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5DDDC5F1EF;
	Tue, 28 Jun 2022 18:05:56 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D466C5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 18:05:56 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id d129so12911427pgc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pTcGgtfSu6n7KkCWKQ4ciWe5XeKK5S4riO8KfNVW7Ig=;
 b=F/CZTCTDOlhkWqZ+vOzW0DaoZ/EZ1dOhoCSSJ2RrwBNwuY7CCyvEtaLLk8DO+FYVI8
 oY1bh2Rw2NH/e7uwuajkABgxQQynq/vb9wDrQT1ziurYSmeBDoqa9s9XGmGLyXXXVu1m
 Ptj/OKkdrLcBprdD9gQ9RffSNU26yKh9HCJiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pTcGgtfSu6n7KkCWKQ4ciWe5XeKK5S4riO8KfNVW7Ig=;
 b=ftzTpaBxgzhU0NPYHEa1PVEoE4DhyA1XdrtJeWGi+u3xFJrPz5NoK9LSX+zWVa0oCw
 LZKANa7uPoa6LISmHd+UGvyc4fRYl1TL4S6qDcki6eoMVhWvpgRkqZFj5+7E7/XyaCvQ
 hM+l/qHpWePqP3j4+UrSPauDaWb0ncU3G5LTPdlxbj8TdhAyZDXM4yVOgkhVEgekP94A
 OTdFRLGWgfLhEJDN8WDLnDOVMP3VcTEh9Z//9pIZO+LFSB/dAKW7GcEDhjoXjujZ3B8G
 hPEfGQ3JHDLISlPis5+0QsUD3u75eZXWGCLpHJMywt5z7Kdyo6nMZ1jASZbQAkvPO4Dc
 9YrA==
X-Gm-Message-State: AJIora8FYopb7HxxxoCsBYrik9InNj+BxDoI9tWkDA83PwMPHnNzQdKT
 yvWFigFVS0EPO1I6+4Fxpde/bw==
X-Google-Smtp-Source: AGRyM1v6cdnwBfGpeB2JnkCbahQ14YUYaqjRd3VUKbR8YPBigZjfWVkzlvmFIFzfbBj+r2XqbA+86w==
X-Received: by 2002:a63:7412:0:b0:40c:fa27:9d07 with SMTP id
 p18-20020a637412000000b0040cfa279d07mr18441815pgc.27.1656439554674; 
 Tue, 28 Jun 2022 11:05:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a170902cf0300b0016a0ac06424sm9669985plg.51.2022.06.28.11.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 11:05:54 -0700 (PDT)
Date: Tue, 28 Jun 2022 11:05:53 -0700
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <202206281104.7CC3935@keescook>
References: <20220627180432.GA136081@embeddedor>
 <CAMuHMdU27TG_rpd=WTRPRcY22A4j4aN-6d_8OmK2aNpX06G3ig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdU27TG_rpd=WTRPRcY22A4j4aN-6d_8OmK2aNpX06G3ig@mail.gmail.com>
Cc: nvdimm@lists.linux.dev,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, KVM list <kvm@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 dm-devel@redhat.com, target-devel <target-devel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-hardening@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-s390 <linux-s390@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, lvs-devel@vger.kernel.org,
 coreteam@netfilter.org, V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-can@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 virtualization@lists.linux-foundation.org, io-uring@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, linux-sctp@vger.kernel.org,
 NetFilter <netfilter-devel@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH][next] treewide: uapi: Replace zero-length
 arrays with flexible-array members
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

T24gVHVlLCBKdW4gMjgsIDIwMjIgYXQgMDk6Mjc6MjFBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIEd1c3Rhdm8sCj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+IAo+
IE9uIE1vbiwgSnVuIDI3LCAyMDIyIGF0IDg6MDQgUE0gR3VzdGF2byBBLiBSLiBTaWx2YQo+IDxn
dXN0YXZvYXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gVGhlcmUgaXMgYSByZWd1bGFyIG5lZWQg
aW4gdGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRvIGRlY2xhcmUKPiA+IGhhdmluZyBhIGR5
bmFtaWNhbGx5IHNpemVkIHNldCBvZiB0cmFpbGluZyBlbGVtZW50cyBpbiBhIHN0cnVjdHVyZS4K
PiA+IEtlcm5lbCBjb2RlIHNob3VsZCBhbHdheXMgdXNlIOKAnGZsZXhpYmxlIGFycmF5IG1lbWJl
cnPigJ1bMV0gZm9yIHRoZXNlCj4gPiBjYXNlcy4gVGhlIG9sZGVyIHN0eWxlIG9mIG9uZS1lbGVt
ZW50IG9yIHplcm8tbGVuZ3RoIGFycmF5cyBzaG91bGQKPiA+IG5vIGxvbmdlciBiZSB1c2VkWzJd
Lgo+IAo+IFRoZXNlIHJ1bGVzIGFwcGx5IHRvIHRoZSBrZXJuZWwsIGJ1dCB1YXBpIGlzIG5vdCBj
b25zaWRlcmVkIHBhcnQgb2YgdGhlCj4ga2VybmVsLCBzbyBkaWZmZXJlbnQgcnVsZXMgYXBwbHku
ICBVYXBpIGhlYWRlciBmaWxlcyBzaG91bGQgd29yayB3aXRoCj4gd2hhdGV2ZXIgY29tcGlsZXIg
dGhhdCBjYW4gYmUgdXNlZCBmb3IgY29tcGlsaW5nIHVzZXJzcGFjZS4KClJpZ2h0LCB1c2Vyc3Bh
Y2UgaXNuJ3QgYm91bmQgYnkgdGhlc2UgcnVsZXMsIGJ1dCB0aGUga2VybmVsIGVuZHMgdXAKY29u
c3VtaW5nIHRoZXNlIHN0cnVjdHVyZXMsIHNvIHdlIG5lZWQgdG8gZml4IHRoZW0uIFRoZSBbMF0g
LT4gW10KY2hhbmdlcyAod2hlbiB0aGV5IGFyZSBub3QgZXJyb25lb3VzbHkgYmVpbmcgdXNlZCB3
aXRoaW4gb3RoZXIKc3RydWN0dXJlcykgaXMgdmFsaWQgZm9yIGFsbCBjb21waWxlcnMuIEZsZXhp
YmxlIGFycmF5cyBhcmUgQzk5OyBpdCdzCmJlZW4gMjMgeWVhcnMuIDopCgpCdXQsIHllcywgd2hl
cmUgd2UgRE8gYnJlYWsgc3R1ZmYgd2UgbmVlZCB0byB3b3JrYXJvdW5kIGl0LCBldGMuCgotLSAK
S2VlcyBDb29rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
