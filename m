Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB861CF70
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 20:54:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53BC8C35E02
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 18:54:08 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77357C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 18:54:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b18so10401001wrq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 11:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=VCAQGz8qjml6ASU2OK1LEnrW5ChvncfEkzJRDaJ9AfM=;
 b=tlYGPpceDt4GjqHqn8XvdeH7oSM4djD9WBPrOe1X0oZ0wDG5pryX0rfiv5SFEB76LU
 JF8LJ6bu8T4YJ78yelc8P/8CAQXBiiY4sQb5MN0t2afe+OrgCaooEL+PBudgmZk3lZLa
 Z0RZOdsq8VBwI8pemYXk/7gNDSyGmcPFvDhPdEQ/3xefc2UwmmiquzJ2SHSkDvz+Tz/T
 Yrwc9WSg1emsJwcguVZ/NnVSIeCVPmK5JFqaL8uiMElLtPsdYvUlCPN+1RvBJklEk4/w
 lJ9WBrUsU19nQ8Xb6Sgezkr3UWCPjyiVX9vc/+AjdkufhHjZ/QboyUGR//IqfzGnbQbX
 I7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VCAQGz8qjml6ASU2OK1LEnrW5ChvncfEkzJRDaJ9AfM=;
 b=kNdCwy8usCAUcCIhOCcuDJXmo4JyXMRjjQDPyHDjC7/WYtyjJhfVoFb6WitH+fkKHR
 ra7na++zkbeXTU/o07kuLEokkLz5zbxnKe6MqLeKkPUnAMTzdq9JV0Q4FVbYWPBd2YDD
 bxqmG2MH6wYJ0qfidc51G1ZQCNvDkEb6DmtdSc35TAg6kvL8x+j5the8ZkRaB2qrmrN+
 54JlkaPJB43uHvZLswUCjKJ7MdOBy2ugzQIbbWGKR+kteOrxkJBS0CvlwExtY4MvWO2m
 qBxoikUsntTSX9e0dbBOfWHtEg0+WfD2uGN/0Lf+LGWWIYmthlA9oK/LQlq/LUvyhePa
 XaFQ==
X-Gm-Message-State: APjAAAXayBKzw+mbIDcWHg2fuLFOK0Jg0OZNhGXX3ebe8HvlSqijT1Zo
 0YjTREH1nsNf+yysnOd4NLaMiw==
X-Google-Smtp-Source: APXvYqyXK6O0Aqh/1goILlJaZM+s8rUCdPYL1LSk9ZSGB1TPgYZuXHgOORUbKQn4wE9vtJIsBxrKSw==
X-Received: by 2002:a5d:4b07:: with SMTP id v7mr12420510wrq.106.1557860046921; 
 Tue, 14 May 2019 11:54:06 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id s22sm5469199wmh.45.2019.05.14.11.54.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 11:54:06 -0700 (PDT)
Date: Tue, 14 May 2019 19:54:04 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Message-ID: <20190514185404.GP4319@dell>
References: <20190511012301.2661-1-natechancellor@gmail.com>
 <20190513073059.GH4319@dell> <20190514183900.GA7559@archlinux-i9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514183900.GA7559@archlinux-i9>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Fix macro definition spelling
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

T24gVHVlLCAxNCBNYXkgMjAxOSwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cgo+IE9uIE1vbiwg
TWF5IDEzLCAyMDE5IGF0IDA4OjMwOjU5QU0gKzAxMDAsIExlZSBKb25lcyB3cm90ZToKPiA+IE9u
IEZyaSwgMTAgTWF5IDIwMTksIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+ID4gCj4gPiA+IENs
YW5nIHdhcm5zOgo+ID4gPiAKPiA+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvbWZk
L3N0bWZ4LmM6MTM6Cj4gPiA+IGluY2x1ZGUvbGludXgvbWZkL3N0bWZ4Lmg6Nzo5OiB3YXJuaW5n
OiAnTUZEX1NUTUZYX0gnIGlzIHVzZWQgYXMgYQo+ID4gPiBoZWFkZXIgZ3VhcmQgaGVyZSwgZm9s
bG93ZWQgYnkgI2RlZmluZSBvZiBhIGRpZmZlcmVudCBtYWNybwo+ID4gPiBbLVdoZWFkZXItZ3Vh
cmRdCj4gPiA+IAo+ID4gPiBGaXhlczogMDYyNTJhZGU5MTU2ICgibWZkOiBBZGQgU1QgTXVsdGkt
RnVuY3Rpb24gZVhwYW5kZXIgKFNUTUZYKSBjb3JlIGRyaXZlciIpCj4gPiA+IExpbms6IGh0dHBz
Oi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzQ3NQo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgo+
ID4gPiAtLS0KPiA+ID4gIGluY2x1ZGUvbGludXgvbWZkL3N0bWZ4LmggfCAyICstCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gQXBw
bGllZCwgdGhhbmtzLgo+ID4gCj4gCj4gSGkgTGVlLAo+IAo+IFRoYW5rcyBmb3IgcGlja2luZyBp
dCB1cC4gSXQgc2VlbXMgdGhpcyBkaWRuJ3QgbWFrZSBpdCBpbnRvIHlvdXIgTUZECj4gcHVsbCBy
ZXF1ZXN0IGZvciA1LjIsIHdhcyB0aGF0IGludGVudGlvbmFsPyBJdCB3b3VsZCBiZSBuaWNlIHRv
IGF2b2lkCj4gdGhpcyB3YXJuaW5nLgoKSG1tLi4uIG5vIGl0IHdhcyBub3QgaW50ZW50aW9uYWwu
ICBOb3Qgc3VyZSB3aGF0IGhhcHBlbmVkIHRoZXJlLgoKSSB3aWxsIHBpY2sgaXQgdXAgZm9yIHRo
ZSAtcmNzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5p
Y2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0Nz
CkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
