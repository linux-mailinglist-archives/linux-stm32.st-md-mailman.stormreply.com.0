Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F92B73083A
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 21:29:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EEC9C6A61A;
	Wed, 14 Jun 2023 19:29:12 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77FD2C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 19:29:10 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-5556e2bddf9so893475eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 12:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686770949; x=1689362949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xQSBZnjVZwiGIBU0/Lf+Ki0HJUMiX71/NTUOVFIy1Y=;
 b=ppg6XoTrfWZDyErylcYF2DQzEl9q8X3WUNu3aHZamHu83/gpvfLmXHID3jmDMsuO/y
 tyHgW8eEjDxfspO0qrXImzWTEi1yibUyC604m6Z0mp7LmC5fTqk701cMNkdOmNbqbZ9U
 q5sFxJMY0kt26rAaXNV9uQ9baJhubGAEkbCAHzh4fWWhfmXCYrqUq7nXFvQZmSL0GKuv
 eiYLhH6XWBVuNLewxgQ9LDOuDukp8D+9Jbxo81+5v5nNwyerr9fkYWlzDNhpfPpZ9xT+
 UKnKw+KZpeA3E9y/vzXdRimv/nyAB+WpPJuaAfRH59mYntJr/0POSAAOzVmSa08mN+nL
 oHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686770949; x=1689362949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xQSBZnjVZwiGIBU0/Lf+Ki0HJUMiX71/NTUOVFIy1Y=;
 b=h1lO/x9TMhgDA9yk9tXVMcPwe6ers6IcmJRswUUHdwy0E2I3rbM3cgj7pn4tG/1K6O
 6UggX6powDDrCpzXVcqnMFpdGIrX1/dRT7aYaxGJhK8dg+38pG6HAQPK/05oWoMMF684
 uu1dXnEd+0Tdv/COXahIfzcPKo8tyFvHfiAhcLNNCjZCuibLnjdJNNgebqrji7wIFh5v
 MKHT6vAs/Un40XXw6XY54c5yqg5w4Svj5gtzpKJEi/jkVH+YK3C8PSX1UppQvZ+/se+u
 ShaJYlcPAN/A3vI1f/hJkhT5pA0khzHHvDXRVQ3CMKRRnQ6kfKHAdC1/OwufggTvPDWB
 Mc0A==
X-Gm-Message-State: AC+VfDydAl7igFTGnKek+jDgQwkdtLQsyzgIgNyWkioU4XgfWpYzCkkt
 NWczJB1eK991jOmEKUOBdfzrCtSBR6v6HUhPKQHOKw==
X-Google-Smtp-Source: ACHHUZ4BVse2Zid0AMkc46SM88xlc+RII83ocsbKNBNxR6RxK3hLxCLK/jVPbbsy2bJiyQhbwMfnqcY7uWiAEpvHq2I=
X-Received: by 2002:a05:6359:229:b0:12e:e48a:7e4f with SMTP id
 ej41-20020a056359022900b0012ee48a7e4fmr3366250rwb.9.1686770949138; Wed, 14
 Jun 2023 12:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
 <20230405-pl180-busydetect-fix-v3-10-cd3d5925ae64@linaro.org>
 <CAPDyKFqxvNxFqLdpj15Gz+zDNT04YzxEAh-svKvRuaM52dCV3g@mail.gmail.com>
 <CACRpkdbg5UXnU=WcQa2HoGH54UK-C8+vU8t+7iLChvd__iJiMg@mail.gmail.com>
 <CAPDyKFoMNPHs3td-UBnqDdEK4i7aHybWfsba796BEXPQC-bzUQ@mail.gmail.com>
 <CACRpkdbYNn0S7AXn_sbPb+o8L_DcffKat=tR0mLtNiBhgy7UEg@mail.gmail.com>
 <CAPDyKFqZsQ+wHdh1FYZwBxiar=9SeobiucaTVhPyQzHgAq-CWQ@mail.gmail.com>
 <CACRpkdYKif6LhLWEoid3vhuDmuSdR6eW9B=ZdGLtNnAzUb9W2w@mail.gmail.com>
In-Reply-To: <CACRpkdYKif6LhLWEoid3vhuDmuSdR6eW9B=ZdGLtNnAzUb9W2w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Jun 2023 21:28:58 +0200
Message-ID: <CACRpkdb_2bndukbO8zfNtWjMKvKX72DLRoJ+7RWYAz+UM3HN4g@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 10/10] mmc: mmci: Add busydetect timeout
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

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgOToyMuKAr1BNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gT24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMjoyMuKA
r1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiA+IE9uIFdl
ZCwgMTQgSnVuIDIwMjMgYXQgMTM6MTcsIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgSnVuIDE0LCAyMDIzIGF0IDEyOjA1
4oCvUE0gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPgo+
ID4gPiA+IEhvd2V2ZXIsIHdlIHVzZSB0aGUgc3Bpbl9sb2NrIHRvIHByb3RlY3Qgc29tZSBtZW1i
ZXJzIGluIHRoZSBzdHJ1Y3QKPiA+ID4gPiBtbWNpX2hvc3QuIEluIHRoaXMgY2FzZSwgdGhlIG1t
Y2lfY21kX2lycSgpIGlzIHVzaW5nICJob3N0LT5jbWQiIHRvCj4gPiA+ID4gdW5kZXJzdGFuZCB3
aGV0aGVyIHRoZXJlIGlzIGFuIGFjdGl2ZSBjb21tYW5kIHRvIG1hbmFnZS4gV2hlbiB0aGUKPiA+
ID4gPiBjb21tYW5kIGhhcyBiZWVuIGNvbXBsZXRlZCwgd2Ugc2V0IGhvc3QtPmNtZCB0byBOVUxM
Lgo+ID4gPgo+ID4gPiBIbSByaWdodC4uLgo+ID4gPgo+ID4gPiBJJ20gbGVhbmluZyB0b3dhcmQg
c29tZSBjYXRjaC1hbGwgbGlrZToKPiA+ID4KPiA+ID4gaWYgKCFob3N0LT5jbWQpCj4gPiA+ICAg
c3RhdGUgPSBNTUNJX0JVU1lfRE9ORTsKPiA+ID4KPiA+ID4gYXMgaWYgdGhlcmUgaXMgbm8gY29t
bWFuZCBnb2luZyBvbiB0aGVuIHN1cmVseSBub3RoaW5nIGlzIGJ1c3kgb24gdGhlCj4gPiA+IGhv
c3QgY29udHJvbGxlci4KPiA+Cj4gPiBSaWdodCwgc28gYXQgd2hhdCBwb2ludCBkbyB5b3Ugd2Fu
dCB0byBhZGQgdGhpcyBjaGVjaz8KPgo+IEkgaGF2ZSBwdXQgaXQgYmVmb3JlIHRoZSBjYWxscyB0
byB0aGUgYnVzeV9jb21wbGV0ZSgpIGNhbGxiYWNrLCBpbiB0aGUKPiBJUlEsIHdoZXJlIHdlIGFy
ZSBhbHJlYWR5IGluIGF0b21pYyBjb250ZXh0LiBJZiB3ZSBhcmUgbm90IHByb2Nlc3NpbmcKPiBh
IGNvbW1hbmQsIHdlIHNob3VsZCBub3QgZG8gYW55IGJ1c3kgZGV0ZWN0aW9uIGZvciBzdXJlLgoK
Tm8gdGhhdCdzIHdyb25nLiBUaGUgbW1jaV9jbWRfaXJxKCkgaXMgYWN0dWFsbHkgcGFzc2VkIHRo
ZSBjb21tYW5kIGFzCnBhcmFtZXRlciwgc28gSSBqdXN0IGF1Z21lbnQgdGhlIGJ1c3lfY29tcGxl
dGUoKSBwcm90b3R5cGUgdG8gcGFzcyB0aGlzCmFsb25nIGRvd24sIGNoZWNrIG91dCB0aGUgcGF0
Y2ggKEkgdGFsayB0byBtdWNoKS4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
