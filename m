Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A671CF31
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 20:39:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FBAEC35E02
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 18:39:05 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59FB2C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 18:39:04 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id w37so331021edw.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 11:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=zbQPQaaby+KlyxId7O5QJocsqofQF1fdS7ooQBqTlW8=;
 b=CCj6ARw9oyqJuC5ug0nu+zWpYTTdWJ6wJMtW9rF0/8KKRyAKJ2CYcWp1lYtf/nbIdZ
 iXFtrn9BO5wDu4sDeyyWkyrktH0y9kNNBMgXPcSiWMC7yRPjXQF6rSx/MrNgFlVGWOaw
 /zMU2CM/l7YHa1oSzX8g198XzkUmC2+xA4PMcJJ9yDkXeE/R1ZVCU9O2k3Bn51Hdr73D
 valCo0p7kxQjsJ3FgAReWUp16OnJmpN6y4gO3VHnpAqXTxnbHUgZVjpXC3sNn12b36mc
 yKr25r1yXucKTSm/IuCFKHuwNrUI6Bw01Bp91kfYI+FalBk9vUnivZWuVuylm/eyeJCO
 hMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=zbQPQaaby+KlyxId7O5QJocsqofQF1fdS7ooQBqTlW8=;
 b=r7C8dlqLsLfTM8keAz1HfLekLT3T1VJFKhPbR/5Savg4wtzW7qi5lS5clqNTfPKUvS
 sjhHd/3bf7/9Um2zthAtLtCVhAobeBRsz6+LtFVTp1W+tRt+pNzbab6gYZ4Mv/aF1+K9
 bY0JoiaoV831WuC3b0DZ8hunwv4rrpJK86xDDZZqZEeDM5OAnT/NpfF/uTvjPCcW+qly
 7oubqgEb4690n1G7N2QhbfWQf7+aUdHG+7yA9gxSsVQjqUW1sVFahyAkIx9pPUyYxbKv
 EHPOiWKektdoEF8xCTvPbFZSE59KioI5/9kXeCvDNmjx2u0n9Q8scfOjN0ozsV+G2n/0
 SbzA==
X-Gm-Message-State: APjAAAXvOaQwByYNjKvOfIkIx3lSv1BX9jwoubBT+drNhTb/DxiPm1pZ
 wwdsmx4L7Ljzrmuxjxzm/x8=
X-Google-Smtp-Source: APXvYqy0qvzGEjq1y48Okv+3jHOz8HFzZ2WmeJBsHys55evhDE3EUT9InoSURjcnwGMUN9OwBSov7Q==
X-Received: by 2002:a50:fd0a:: with SMTP id i10mr37752734eds.117.1557859143820; 
 Tue, 14 May 2019 11:39:03 -0700 (PDT)
Received: from archlinux-i9 ([2a01:4f9:2b:2b84::2])
 by smtp.gmail.com with ESMTPSA id p52sm4738334eda.79.2019.05.14.11.39.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 14 May 2019 11:39:02 -0700 (PDT)
Date: Tue, 14 May 2019 11:39:00 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20190514183900.GA7559@archlinux-i9>
References: <20190511012301.2661-1-natechancellor@gmail.com>
 <20190513073059.GH4319@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513073059.GH4319@dell>
User-Agent: Mutt/1.11.4 (2019-03-13)
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

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDg6MzA6NTlBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIEZyaSwgMTAgTWF5IDIwMTksIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+IAo+ID4g
Q2xhbmcgd2FybnM6Cj4gPiAKPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL21mZC9z
dG1meC5jOjEzOgo+ID4gaW5jbHVkZS9saW51eC9tZmQvc3RtZnguaDo3Ojk6IHdhcm5pbmc6ICdN
RkRfU1RNRlhfSCcgaXMgdXNlZCBhcyBhCj4gPiBoZWFkZXIgZ3VhcmQgaGVyZSwgZm9sbG93ZWQg
YnkgI2RlZmluZSBvZiBhIGRpZmZlcmVudCBtYWNybwo+ID4gWy1XaGVhZGVyLWd1YXJkXQo+ID4g
Cj4gPiBGaXhlczogMDYyNTJhZGU5MTU2ICgibWZkOiBBZGQgU1QgTXVsdGktRnVuY3Rpb24gZVhw
YW5kZXIgKFNUTUZYKSBjb3JlIGRyaXZlciIpCj4gPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20v
Q2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy80NzUKPiA+IFNpZ25lZC1vZmYtYnk6IE5hdGhh
biBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBpbmNs
dWRlL2xpbnV4L21mZC9zdG1meC5oIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IEFwcGxpZWQsIHRoYW5rcy4KPiAKPiAtLSAKPiBM
ZWUgSm9uZXMgW+adjueQvOaWr10KPiBMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKPiBM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKPiBGb2xsb3cg
TGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpIaSBMZWUsCgpUaGFua3MgZm9yIHBp
Y2tpbmcgaXQgdXAuIEl0IHNlZW1zIHRoaXMgZGlkbid0IG1ha2UgaXQgaW50byB5b3VyIE1GRApw
dWxsIHJlcXVlc3QgZm9yIDUuMiwgd2FzIHRoYXQgaW50ZW50aW9uYWw/IEl0IHdvdWxkIGJlIG5p
Y2UgdG8gYXZvaWQKdGhpcyB3YXJuaW5nLgoKVGhhbmtzLApOYXRoYW4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
