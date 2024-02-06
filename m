Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 859BF84B239
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 11:14:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25EC9C6907A;
	Tue,  6 Feb 2024 10:14:30 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C73A6C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 10:14:28 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6047e7d38easo3354377b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 02:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707214466; x=1707819266;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZtCCWZhu9Pe3rgXwf+V6JpR3qXWYyc8Tma3pMX6qmQI=;
 b=Jk6wLf5MQ8pQ5DRA6N0GZRKG4aeaiH2HQOLR0k3/NJIQB72Pe/auMwcI8r7TVlpy2V
 RE+p1KOQxfamivp5FaAiVEk4hiz1EY056kksXRR3lsWvSPS5r2zX9pA7do/a5FNB3dzS
 9Zpxznu1kFBDWBonqAKez8Lmb0oWIyOg8vg6uHmW7YuWBoOGUZGoKJIhBbYOLUQVc9NG
 jY7z22KDz26xibhgczYq0GTDhltYqvPZ+GFpoaUKtls4o0UiFOfKbfUrOKZQk44BV3DS
 oy9J04UytLyDei9UPlusewIOptQapc+xFxYcGR3cGbd2U0WvjoOfiPfGtiNjE61hC1Zq
 IjCw==
X-Gm-Message-State: AOJu0Yz2/4PMYdRQUXiCW/yeQOgRGH3QTXn4vlnerIk4vG3SZj/y/NAv
 SL6wTvfOgIq90iOQmQmrTIrKL34Fe89ZcFVwNfaCmNspHdLgJLSqRYd4Hb2IKP8=
X-Google-Smtp-Source: AGHT+IHn8PAxVJT380EtGLq1aH9YxVAoqIAtN4B4JBu8+xGpl3nfjvhS9odLaNZR9C7HU05GkBU+KQ==
X-Received: by 2002:a81:ae46:0:b0:5ef:fa4f:eec3 with SMTP id
 g6-20020a81ae46000000b005effa4feec3mr1283078ywk.25.1707214466209; 
 Tue, 06 Feb 2024 02:14:26 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUWoDJ5N/9/uEv9M9CmALYEnE3br+jbBJDstOrMkF5Rvclr1AZFdyBv0GBdcpLNGjwAwrG5Ox6uYRfsZcPGGkZsEu/CV7yVJ0xbNj0d63OrGWWvdtEvgAZb
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 o8-20020a0dcc08000000b006040f99d7c2sm423606ywd.71.2024.02.06.02.14.25
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 02:14:25 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6047e7d38easo3353927b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 02:14:25 -0800 (PST)
X-Received: by 2002:a81:e809:0:b0:5ff:b07b:fb0b with SMTP id
 a9-20020a81e809000000b005ffb07bfb0bmr1059881ywm.49.1707214464961; Tue, 06 Feb
 2024 02:14:24 -0800 (PST)
MIME-Version: 1.0
References: <20240206071314.8721-1-liubo03@inspur.com>
 <CAMuHMdU7fYCsNT9ditqJ-saUsRm9J2zLh=-q-zmExhBRJeE8NQ@mail.gmail.com>
 <ZcIE/RMTq34TgpQt@finisterre.sirena.org.uk>
In-Reply-To: <ZcIE/RMTq34TgpQt@finisterre.sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Feb 2024 11:14:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVj1bS9s69ASrd5xULc8oELoBbnb8HEX9MEmA43853_EQ@mail.gmail.com>
Message-ID: <CAMuHMdVj1bS9s69ASrd5xULc8oELoBbnb8HEX9MEmA43853_EQ@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: neil.armstrong@linaro.org, ckeepax@opensource.cirrus.com,
 support.opensource@diasemi.com, mazziesaccount@gmail.com,
 linux-kernel@vger.kernel.org, lee@kernel.org, rf@opensource.cirrus.com,
 linux-renesas-soc@vger.kernel.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, Bo Liu <liubo03@inspur.com>,
 patches@opensource.cirrus.com, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 marek.vasut+renesas@gmail.com
Subject: Re: [Linux-stm32] [PATCH 00/18] mfd: convert to use maple tree
	register cache
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

SGkgTWFyaywKCk9uIFR1ZSwgRmViIDYsIDIwMjQgYXQgMTE6MDnigK9BTSBNYXJrIEJyb3duIDxi
cm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFR1ZSwgRmViIDA2LCAyMDI0IGF0IDEwOjMz
OjIyQU0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IElmIGFsbCBvZiB0aGlz
IGlzIHRydWUsIGlzIHRoZXJlIGFueSByZWFzb24gdG8ga2VlcCBSRUdDQUNIRV9SQlRSRUUKPiA+
IGFyb3VuZD8gIElmIG5vdCwgcGVyaGFwcyBSRUdDQUNIRV9SQlRSRUUgc2hvdWxkIGJlIHRyZWF0
ZWQgYXMKPiA+IFJFR0NBQ0hFX01BUExFIGluIHRoZSByZWdtYXAgY29yZSBjb2RlIGZpcnN0LCBm
b2xsb3dlZCBieSBhIHNpbmdsZQo+ID4gdHJlZS13aWRlIHBhdGNoIHRvIHJlcGxhY2UgUkVHQ0FD
SEVfUkJUUkVFPwo+Cj4gVGhlcmUgaXMgYSB2ZXJ5IHNtYWxsIG5pY2hlIGZvciBkZXZpY2VzIHdo
ZXJlIGNhY2hlIHN5bmNzIGFyZSBhCj4gcGFydGljdWxhcmx5IGltcG9ydGFudCBwYXJ0IG9mIHRo
ZSB3b3JrbG9hZCB3aGVyZSByYnRyZWUncyBjaG9pY2VzIG1pZ2h0Cj4gZ2l2ZSBiZXR0ZXIgcGVy
Zm9ybWFuY2UsIGVzcGVjaWFsbHkgb24gc3lzdGVtcyB3aXRoIGxvdyBlbmQgQ1BVcy4KClRoZSBS
RUdDQUNIRV8qIHZhbHVlIGlzIHNwZWNpZmllZCBieSB0aGUgZGV2aWNlLCBub3QgYnkgdGhlIENQ
VT8KV2hpbGUgc29tZSBvZiB0aGVzZSBNRkQgZGV2aWNlcyBhcmUgb24tU29DLCBhbmQgdGh1cyB0
aGVyZSBpcyBzb21lCnJlbGF0aW9uIGJldHdlZW4gZGV2aWNlIGFuZCBDUFUsIHNldmVyYWwgb3Ro
ZXJzIChlLmcuIFBNSUNzKSBhcmUKZXh0ZXJuYWwsIGFuZCB0aHVzIG1pZ2h0IGJlIHByZXNlbnQg
b24gc3lzdGVtcyB3aXRoIGEgdmFyaWV0eSBvZiBDUFUKcGVyZm9ybWFuY2UuCgpQZXJoYXBzIHRo
ZSB2YWx1ZSBzaG91bGQgZGVwZW5kIG9uIHNvbWUgQ1BVIGhldXJpc3RpYyBpbnN0ZWFkPwoKR3J7
b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
