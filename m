Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18820F862
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2020 17:32:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79BF1C36B11;
	Tue, 30 Jun 2020 15:32:55 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27C3FC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2020 15:32:53 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id o5so21394584iow.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2020 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fTZIk7o4I3v9sDO1ioQg65WFbAcbrwuzrZp6bqG2TZs=;
 b=SLNEacNnXUaOSknJvbz9ftmBYbhGROQqfmRN2jCu+oUjMlkNVC7L0DnsVQmrHBlaRI
 5t9+YaZ3fxK4ku6fb+GPJKRfCG+Gps1qplj+0digh8uJn+GB+1JCG9Wzyl02o25PGelP
 jjz8iA9Z0KkEkHWlrSiPsWZQGxioYTjb69FIRUrryO7BtD4wWSjN4SSDkRErIBuVuxNx
 0Er+SiLvwIuVSKl+6GUCUZEwRsO/ajwCcaiu8dXRPPfPul65ngxfwh8CITu5HLwJg6k5
 BnZwSlDfE/HqcS6lphCwBhiU+2Md/l2E9L4RXlcd7S2l5erQM1rZl/g1zIVhMlCkQRPN
 8Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fTZIk7o4I3v9sDO1ioQg65WFbAcbrwuzrZp6bqG2TZs=;
 b=puzya3y+T8I7qMzkLHXVqLrFZJX2B+hqxH3M57CnynBS2aeBbY4GFw2cPaFvfFgdCV
 HxUAqPrMdY4GggNFSf8iKj2BKaRge22JkFAQHap09+jzP5V+ydKUWeAV1Tz1p4OMpFAr
 EytD9ojGQc+LsGM6WunItVZ3mQQad86Bkopu0oR6wylcsBCWJQ124ToyhlVMKVLo/1hK
 5X8Z9jG9TkxsIxGoPogpXrZLaVSmQBXSWecg8T5g2k5ThrQohV7IwLQbohLp0LwmzP3B
 Gc1Bm9CG0yJaSWBkxX2N77IGmO9BYNiJIVY/2orP/Qedab7Qb2t9ZI9tTQjuSjj9U5EM
 O1cg==
X-Gm-Message-State: AOAM5321YOXYQQ4DByOgCrtzagmnMrLO6jMJsUI5p0ei3JDaMC+ZZ2nO
 HHPqJFcK4lGN/bEAF21ximPiS0faYu/2LRLT0Xg=
X-Google-Smtp-Source: ABdhPJwmeqxFiF/UYomtYzSa1zyensrGB2NlVyhR0lNiVAk/rpt8vIaIoeUrWdkkS5pkKyqbHpik7IWOHz0pvwB/6Z8=
X-Received: by 2002:a02:6d27:: with SMTP id m39mr24703937jac.10.1593531171771; 
 Tue, 30 Jun 2020 08:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
 <CAHp75VebSZa6mwAETnM0t42RQCp4iM6_SNjmy3TB48ixsGKV8g@mail.gmail.com>
 <CAL9mu0+jmcivC6zAXxK0-oXy3n44pAU1QGD7BDq=CT2D7twROQ@mail.gmail.com>
 <c085e8f5-f626-28a9-1d3f-a1c277ec5052@tronnes.org>
In-Reply-To: <c085e8f5-f626-28a9-1d3f-a1c277ec5052@tronnes.org>
From: dillon min <dillon.minfei@gmail.com>
Date: Tue, 30 Jun 2020 23:32:15 +0800
Message-ID: <CAL9mu0LPuqRn-tKWWzyUWnOE2h-w7F3-6HTYv15QcUYWBroXZw@mail.gmail.com>
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v5 6/8] drm/panel: Add ilitek ili9341
	panel driver
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

SGkgQW5keSwgTm9yYWxmLAoKZ2VudGxlIHBpbmcgZm9yIHRoaXMgcGF0Y2ggc2V0LApkbyB3ZSBo
YXZlIGFueSBuZXcgc3RydWN0dXJlLCBvciBpZGVhIHRvIHN1cHBvcnQgYm90aCBkcGkgYW5kIGRi
aQppbnRlcmZhY2UgYnkgb25lIGRybSBwYW5lbCBkcml2ZXI/CmZyb20gdGhpcyB0aHJlYWQKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMjAtTWF5LzI2
NzAzMS5odG1sCiwgaXQncyBzZWVtcwpkaXNjdXNzaW5nIHdhcyBzdG9wcGVkIGF0IG1heSAyNS4K
CmlmIHRoZXJlIGFyZSBhbnkgbmV3IGluZm9ybWF0aW9uIGFib3V0IHRoaXMgdG9waWMsIHBsZWFz
ZSBmZWVsIGZyZWUgdG8KbGV0IG1lIGtub3cuIGhvcGUgaSBjYW4gbWFrZSBzb21lCnByb2dyZXNz
IG9uIGl0LgoKdGhhbmtzLAoKRGlsbG9uLAoKYmVzdCByZWdhcmRzCgpPbiBUdWUsIE1heSAyNiwg
MjAyMCBhdCA2OjM4IFBNIE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPiB3cm90
ZToKPgo+Cj4KPiBEZW4gMjYuMDUuMjAyMCAxMS4wOCwgc2tyZXYgZGlsbG9uIG1pbjoKPiA+IEhp
IEFuZHksCj4gPgo+ID4gVGhhbmtzIGZvciBpbnB1dC4KPiA+Cj4gPiBPbiBUdWUsIE1heSAyNiwg
MjAyMCBhdCAzOjQ2IFBNIEFuZHkgU2hldmNoZW5rbwo+ID4gPGFuZHkuc2hldmNoZW5rb0BnbWFp
bC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gTW9uLCBNYXkgMjUsIDIwMjAgYXQgNjo0NiBBTSA8
ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+PiBGcm9tOiBkaWxsb24g
bWluIDxkaWxsb24ubWluZmVpQGdtYWlsLmNvbT4KPiA+Pj4KPiA+Pj4gICAgIFRoaXMgZHJpdmVy
IGNvbWJpbmUgdGlueS9pbGk5MzQxLmMgbWlwaV9kYmlfaW50ZXJmYWNlIGRyaXZlcgo+ID4+PiAg
ICAgd2l0aCBtaXBpX2RwaV9pbnRlcmZhY2UgZHJpdmVyLCBjYW4gc3VwcG9ydCBpbGk5MzQxIHdp
dGggc2VyaWFsCj4gPj4+ICAgICBtb2RlIG9yIHBhcmFsbGVsIHJnYiBpbnRlcmZhY2UgbW9kZSBi
eSByZWdpc3RlciBjb25maWd1cmF0aW9uLgo+ID4+Cj4gPj4gTm9yYWxmIHRvbGQgb25jZSB0aGF0
IHRoaXMgZHJpdmVyIHNob3VsZCBiZSB1bmlmaWVkIHdpdGggbWkwMjgzcXQuYy4KPiA+Pgo+ID4+
IFNvLCB3aGF0IHNob3VsZCB3ZSBkbyBoZXJlPwo+ID4+Cj4gPj4gLS0KPiA+PiBXaXRoIEJlc3Qg
UmVnYXJkcywKPiA+PiBBbmR5IFNoZXZjaGVua28KPiA+Cj4gPiBmcm9tIHNhbSdzIHN1Z2dlc3Rp
b24sIHdlIGNhbid0IHNldHVwIHR3byBkcml2ZXJzIHRvIHN1cHBvcnQgb25lIHBhbmVsCj4gPiBp
biB0aGUgdHJlZS4gc28sIGkgY29weSB0aGUgbWlwaSBkYmkgcGFydCBmcm9tIHRpbnkvaWxpOTM0
MS5jLiB0byB0aGlzIGRyaXZlcgo+ID4gZnJvbSByZWdpc3RlciBzZXR0aW5ncyBhbmQgZHRzIGJp
bmRpbmcgaXMga2VlcCB0aGUgc2FtZSB0byB0aW55L2lsaTkzNDEuYy4KPiA+Cj4gPiBzbywgaW4g
bXkgb3BpbmlvbiBpZiB0aW55L2lsaTkzNDEuYyBpcyB1bmlmaWVkIHdpdGggbWkwMjgzcXQuYywg
dGhpcwo+ID4gZHJpdmVyIHNob3VsZCBiZQo+ID4gdG9vLgo+ID4KPgo+IFRoZXJlJ3MgYSBkaXNj
dXNzaW9uIGFib3V0IE1JUEkgREJJIHBhbmVscyBoZXJlOgo+Cj4gTUlQSSBEU0ksIERCSSwgYW5k
IHRpbnlkcm0gZHJpdmVycwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVz
L2RyaS1kZXZlbC8yMDIwLU1heS8yNjcwMzEuaHRtbAo+Cj4gTm9yYWxmLgo+Cj4gPiB0aGFua3Mu
Cj4gPgo+ID4gYmVzdCByZWdhcmRzLAo+ID4KPiA+IERpbGxvbiwKPiA+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
